FROM atlassian/confluence-server:6.11.2
# 传入破解补丁
ADD crackfile/atlassian-extras-decoder-v2-3.2.jar ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.2.jar
# 传入mysql链接驱动
ADD crackfile/mysql-connector-java-5.1.46.jar ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib/
# 设置文件属组
RUN chown -R ${RUN_USER}:${RUN_GROUP} ${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.2.jar

CMD ["/entrypoint.sh", "-fg"]
ENTRYPOINT ["/sbin/tini", "--"]
