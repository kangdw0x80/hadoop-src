LIB_DIR="/home/kangdw/devel/hadoop-3.0.2-src/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-nativetask/target/native/target/usr/local/lib"
                      if [ -d ${LIB_DIR} ] ; then
                        TARGET_DIR="/home/kangdw/devel/hadoop-3.0.2-src/hadoop-mapreduce-project/target/hadoop-mapreduce-3.0.2/lib/native"
                        mkdir -p ${TARGET_DIR}
                        cp -R ${LIB_DIR}/lib* ${TARGET_DIR}
                      fi