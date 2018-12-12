/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.hadoop.hdfs.tools;

import java.io.IOException;
import java.io.PrintStream;
import java.net.InetSocketAddress;
import java.security.PrivilegedExceptionAction;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.HadoopIllegalArgumentException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.hdfs.DFSConfigKeys;
import org.apache.hadoop.hdfs.DFSUtil;
import org.apache.hadoop.hdfs.HdfsConfiguration;
import org.apache.hadoop.hdfs.DFSUtil.ConfiguredNNAddress;
import org.apache.hadoop.security.UserGroupInformation;
import org.apache.hadoop.util.StringUtils;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

/**
 * Tool for getting configuration information from a configuration file.
 * 
 * Adding more options:
 * <ul>
 * <li>
 * If adding a simple option to get a value corresponding to a key in the 
 * configuration, use regular {@link GetConf.CommandHandler}. 
 * See {@link GetConf.Command#EXCLUDE_FILE} example.
 * </li>
 * <li>
 * If adding an option that is does not return a value for a key, add
 * a subclass of {@link GetConf.CommandHandler} and set it up in 
 * {@link GetConf.Command}.
 * 
 * See {@link GetConf.Command#NAMENODE} for example.
 * 
 * Add for the new option added, a map entry with the corresponding
 * {@link GetConf.CommandHandler}.
 * </ul>
 */
public class GetConf extends Configured implements Tool {
    private static final String DESCRIPTION = "hdfs getconf is utility for "
        + "getting configuration information from the config file.\n";

    enum Command {
        NAMENODE("-namenodes", "gets list of namenodes in the cluster."),
        SECONDARY("-secondaryNameNodes", 
                "gets list of secondary namenodes in the cluster."),
        BACKUP("-backupNodes", "gets list of backup nodes in the cluster."),
        INCLUDE_FILE("-includeFile",
                "gets the include file path that defines the datanodes " +
                "that can join the cluster."),
        EXCLUDE_FILE("-excludeFile",
                "gets the exclude file path that defines the datanodes " +
                "that need to decommissioned."),
        NNRPCADDRESSES("-nnRpcAddresses", "gets the namenode rpc addresses"),
        CONFKEY("-confKey [key]", "gets a specific key from the configuration");

        /**
         *  MR의 map이 아님, hashmap을 의미, 검색 용도 
         */
        private static final Map<String, CommandHandler> map;
        static  {   // 객체 생성 한 번 처음에만 
            map = new HashMap<String, CommandHandler>();
            map.put(StringUtils.toLowerCase(NAMENODE.getName()),
                    new NameNodesCommandHandler());
            map.put(StringUtils.toLowerCase(SECONDARY.getName()),
                    new SecondaryNameNodesCommandHandler());
            map.put(StringUtils.toLowerCase(BACKUP.getName()),
                    new BackupNodesCommandHandler());
            map.put(StringUtils.toLowerCase(INCLUDE_FILE.getName()),
                    new CommandHandler(DFSConfigKeys.DFS_HOSTS));
            map.put(StringUtils.toLowerCase(EXCLUDE_FILE.getName()),
                    new CommandHandler(DFSConfigKeys.DFS_HOSTS_EXCLUDE));
            map.put(StringUtils.toLowerCase(NNRPCADDRESSES.getName()),
                    new NNRpcAddressesCommandHandler());
            map.put(StringUtils.toLowerCase(CONFKEY.getName()),
                    new PrintConfKeyCommandHandler());
        }

        private final String cmd;
        private final String description;

        Command(String cmd, String description) {
            this.cmd = cmd;
            this.description = description;
        }

        public String getName() {
            return cmd.split(" ")[0];
        }

        public String getUsage() {
            return cmd;
        }

        public String getDescription() {
            return description;
        }

        public static CommandHandler getHandler(String cmd) {
            /**
             *  namenode -. lowwer -> find in hashmap
             */
            System.out.println("kangdw: CommandHandler->getHandler, cmd: " + cmd);
            return map.get(StringUtils.toLowerCase(cmd));
        }
    }

    static final String USAGE;
    static {
        /*
         *    HdfsConfiguiration 쪽에서는 hdfs-site.xml , hdfs-default.xml 로딩, 
         *    Configuration Class에서 core-site.xml 등을 load. 
         *    왜 다르게 구성 했지? 다른 애들이 추가 적으로 클래스 생성해서 사용하나 ?? 
         */
        HdfsConfiguration.init();

        /* Initialize USAGE based on Command values */
        StringBuilder usage = new StringBuilder(DESCRIPTION);
        usage.append("\nhadoop getconf \n");
        for (Command cmd : Command.values()) {
            usage.append("\t[" + cmd.getUsage() + "]\t\t\t" + cmd.getDescription()
                    + "\n");
        }
        USAGE = usage.toString();
    }

    /** 
     * Handler to return value for key corresponding to the {@link Command}
     */
    static class CommandHandler {
        String key; // Configuration key to lookup

        CommandHandler() {
            this(null);
        }

        CommandHandler(String key) {
            this.key = key;
        }

        final int doWork(GetConf tool, String[] args) {
            System.out.println("kangdw: CommandHandler->doWork");
            try {
                checkArgs(args);

                System.out.println("kangdw: CommandHandler->doWorkInternal before");
                return doWorkInternal(tool, args);
            } catch (Exception e) {
                System.out.println("kangdw: CommandHandler->doWork Exception");
                tool.printError(e.getMessage());
            }
            return -1;
        }

        protected void checkArgs(String args[]) {

            System.out.println("kangdw: CommandHnadler->checkArgs, protected");
            if (args.length > 0) {
                throw new HadoopIllegalArgumentException(
                        "Did not expect argument: " + args[0]);
            }
        }


        /** Method to be overridden by sub classes for specific behavior */
        int doWorkInternal(GetConf tool, String[] args) throws Exception {
            System.out.println("kangdw: doWorkInternal");
            String value = tool.getConf().getTrimmed(key);
            if (value != null) {
                System.out.println("kangdw: maybe, Here");
                tool.printOut(value);
                System.out.println("kangdw: Here");
                return 0;
            }
            tool.printError("Configuration " + key + " is missing.");
            return -1;
        }
    }

    /**
     * Handler for {@link Command#NAMENODE}
     */
    static class NameNodesCommandHandler extends CommandHandler {
        @Override
        int doWorkInternal(GetConf tool, String []args) throws IOException {

            /**
             *
             public Configuration getConf() {
             return conf;
             }
             */
            System.out.println("kangdw: NameNodesCommandHandler->doWorkInternal");
            tool.printMap(DFSUtil.getNNServiceRpcAddressesForCluster(tool.getConf()));
            return 0;
        }
    }

    /**
     * Handler for {@link Command#BACKUP}
     */
    static class BackupNodesCommandHandler extends CommandHandler {
        @Override
        public int doWorkInternal(GetConf tool, String []args) throws IOException {
            tool.printMap(DFSUtil.getBackupNodeAddresses(tool.getConf()));
            return 0;
        }
    }

    /**
     * Handler for {@link Command#SECONDARY}
     */
    static class SecondaryNameNodesCommandHandler extends CommandHandler {
        @Override
        public int doWorkInternal(GetConf tool, String []args) throws IOException {
            tool.printMap(DFSUtil.getSecondaryNameNodeAddresses(tool.getConf()));
            return 0;
        }
    }

    /**
     * Handler for {@link Command#NNRPCADDRESSES}
     * If rpc addresses are defined in configuration, we return them. Otherwise, 
     * return empty string.
     */
    static class NNRpcAddressesCommandHandler extends CommandHandler {
        @Override
        public int doWorkInternal(GetConf tool, String []args) throws IOException {
            Configuration config = tool.getConf();
            List<ConfiguredNNAddress> cnnlist = DFSUtil.flattenAddressMap(
                    DFSUtil.getNNServiceRpcAddressesForCluster(config));
            if (!cnnlist.isEmpty()) {
                for (ConfiguredNNAddress cnn : cnnlist) {
                    InetSocketAddress rpc = cnn.getAddress();
                    tool.printOut(rpc.getHostName()+":"+rpc.getPort());
                }
                return 0;
            }
            tool.printError("Did not get namenode service rpc addresses.");
            return -1;
        }
    }

    static class PrintConfKeyCommandHandler extends CommandHandler {
        @Override
        protected void checkArgs(String[] args) {
            if (args.length != 1) {
                throw new HadoopIllegalArgumentException(
                        "usage: " + Command.CONFKEY.getUsage());
            }
        }

        @Override
        int doWorkInternal(GetConf tool, String[] args) throws Exception {
            this.key = args[0];
            System.out.println("kangdw: CommandHandler -> doWorkInternal");
            return super.doWorkInternal(tool, args);
        }
    }

    private final PrintStream out; // Stream for printing command output
    private final PrintStream err; // Stream for printing error

    GetConf(Configuration conf) {
        this(conf, System.out, System.err);
    }

    GetConf(Configuration conf, PrintStream out, PrintStream err) {
        super(conf);
        this.out = out;
        this.err = err;
    }

    void printError(String message) {
        err.println(message);
    }

    void printOut(String message) {
        out.println(message);
    }

    void printMap(Map<String, Map<String, InetSocketAddress>> map) {
        StringBuilder buffer = new StringBuilder();

        List<ConfiguredNNAddress> cnns = DFSUtil.flattenAddressMap(map);
        for (ConfiguredNNAddress cnn : cnns) {
            InetSocketAddress address = cnn.getAddress();
            if (buffer.length() > 0) {
                buffer.append(" ");
            }
            buffer.append(address.getHostName());
        }
        printOut(buffer.toString());
        System.out.println("kangdw: GetConf->printMap");
    }

    private void printUsage() {
        printError(USAGE);
    }

    /**
     * Main method that runs the tool for given arguments.
     * @param args arguments
     * @return return status of the command
     */
    private int doWork(String[] args) {
        System.out.println("kangdw: GetConf->doWork");
        if (args.length >= 1) {
            System.out.println("kangdw: args[0]: " + args[0]);
            CommandHandler handler = Command.getHandler(args[0]);
            if (handler != null) {
                return handler.doWork(this,
                        Arrays.copyOfRange(args, 1, args.length));
            }
        }
        printUsage();
        return -1;
    }

    @Override
    public int run(final String[] args) throws Exception {
        try {
            // UserGroupInformation.getCurrentUser().doAs 메소드 호출, 
            // 인자로는 PrivilegedExceptionAction <Integer>
            //      -> 이거는 doWork(args) 를 통해 만들어 짐. 
            //      https://code.i-harness.com/ko/q/a879e5
            //      PrivilegedExceptionAction 이 유저에 따른 권한 수행인건데 
            return UserGroupInformation.getCurrentUser().doAs(
                    new PrivilegedExceptionAction<Integer>() {
                        @Override
                        public Integer run() throws Exception {
                            return doWork(args);
                        }
                    });
        } catch (InterruptedException e) {
            throw new IOException(e);
        }
    }

    public static void main(String[] args) throws Exception {
        System.out.println("GetConf Class main start");
        if (DFSUtil.parseHelpArgument(args, USAGE, System.out, true)) {
            System.exit(0);
        }
        /**
         *
         *   args : -namenode 
         *   new HdfsConfiguration 은 확인 불가, 
         *      여기서 hdfs-site.xml, hdfs-default.xml 로딩 
         *   run -> doWork( args) 
         *   -> getHandler (args )
         *      -> handler.doWork 
         *          -> doWorkInternal
         *              -> GetConf(HdfsConf).getConf().getTrimmed(args)
         *              -> too..printOut(value) // 아마 여기서 namenode host 값이 나오는 것으로 예상 
         *      ->map.get( LowerCase( args ) ) 
         *          -> 
         */
        System.out.println("GetConf Class main");
        
        /*
         *  여기서는 new HdfsConfiguration 
         *      -> new Configuration 
         *          -> REGISTRY.put(Configuration)  으로 마무리 
         *  
         *  new GetConf
         *      -> GetConf(conf, System.out, System.err);
         *          ->  super(conf);
         *              -> public Configuration(Configuration other) 
         *                  일단 Configuration 객체로 부터 복붙 작업. 
         *                  지금의 경우, HdfsConfiguration 으로 생성된 객체겠지 
         *                  resource clone
         *                  sync{
         *                      properties.clone
         *                      overlay.clone
         *                      restrictSystemProps reference
         *                      updatingResource clone
         *                      finalParameters clone
         *                      }
         *                  sync{ REGISTRY.put }
         *                  classLoader set
         *                  loadDefaults set
         *                  setQuietMode
         *
         *          ->  this.out = out;
         *          ->  this.err = err;
         *
         * ToolRunner ( GetConf.getConf(), GetConf, args)
         *      -> ...
         *
         *      -> GetConf.run( String [] args )
         *
                protected Options buildGeneralOptions(Options opts) 를 통해 hadoop 에서 사용하는 option 들을 parsing
                p
                private void processGeneralOptions(CommandLine line) throws IOException {

                에서 mapreduce.framework.name, yarn.resourcemanager.address, 등의 옵션을 
                GenericOptionsParser 클래스의 COnfiguration conf 변수에 집어 넣음. 


                여튼 여차저차 해서 
                GetConf->run이 수행 됨 (arguments 는 String[] 으로 처리되서 
                이는 GetConf 클래스가 interface, Tool을 사용했기 때문이며, 
                public int run(final String[] args) throws Exception {
         *  
         */
        int res = ToolRunner.run(new GetConf(new HdfsConfiguration()), args);
        /*
         *  HdfsConfiguration->super -> Configration Class Constructor
         */
        System.exit(res);
    }
}
