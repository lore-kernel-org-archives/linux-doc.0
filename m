Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE8CC00144
	for <linux-doc@archiver.kernel.org>; Mon,  1 Aug 2022 20:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiHAUBR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Aug 2022 16:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiHAUBQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 16:01:16 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168D118E20
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 13:01:15 -0700 (PDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271HK3cX030908
        for <linux-doc@vger.kernel.org>; Mon, 1 Aug 2022 13:01:14 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hn1rrx5k1-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 01 Aug 2022 13:01:14 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 13:01:14 -0700
Received: by devvm3365.prn0.facebook.com (Postfix, from userid 415935)
        id ECFC3E81E702; Mon,  1 Aug 2022 12:55:15 -0700 (PDT)
From:   Adel Abouchaev <adel.abushaev@gmail.com>
To:     <kuba@kernel.org>
CC:     <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
        <corbet@lwn.net>, <dsahern@kernel.org>, <shuah@kernel.org>,
        <imagedong@tencent.com>, <netdev@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        Adel Abouchaev <adel.abushaev@gmail.com>
Subject: [RFC net-next 1/6] net: Documentation on QUIC kernel Tx crypto.
Date:   Mon, 1 Aug 2022 12:52:23 -0700
Message-ID: <20220801195228.723273-2-adel.abushaev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220801195228.723273-1-adel.abushaev@gmail.com>
References: <Adel Abouchaev <adel.abushaev@gmail.com>
 <20220801195228.723273-1-adel.abushaev@gmail.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: KNRJ1nO8F7ko1O9XLsiGrao4MWnCcmUS
X-Proofpoint-ORIG-GUID: KNRJ1nO8F7ko1O9XLsiGrao4MWnCcmUS
Content-Transfer-Encoding: 8BIT
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_10,2022-08-01_01,2022-06-22_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adding Documentation/networking/quic.rst file to describe kernel QUIC
code.

Signed-off-by: Adel Abouchaev <adel.abushaev@gmail.com>
---
 Documentation/networking/quic.rst | 176 ++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/networking/quic.rst

diff --git a/Documentation/networking/quic.rst b/Documentation/networking/quic.rst
new file mode 100644
index 000000000000..eaa2d36310be
--- /dev/null
+++ b/Documentation/networking/quic.rst
@@ -0,0 +1,176 @@
+.. _kernel_quic:
+
+===========
+KERNEL QUIC
+===========
+
+Overview
+========
+
+QUIC is a secure general-purpose transport protocol that creates a stateful
+interaction between a client and a server. QUIC provides end-to-end integrity
+and confidentiality. Refer to RFC 9000 for more information on QUIC.
+
+The kernel Tx side offload covers the encryption of the application streams
+in the kernel rather than in the application. These packets are 1RTT packets
+in QUIC connection. Encryption of every other packets is still done by the
+QUIC library in user space.
+
+
+
+User Interface
+==============
+
+Creating a QUIC connection
+--------------------------
+
+QUIC connection originates and terminates in the application, using one of many
+available QUIC libraries. The code instantiates QUIC client and QUIC server in
+some form and configures them to use certain addresses and ports for the
+source and destination. The client and server negotiate the set of keys to
+protect the communication during different phases of the connection, maintain
+the connection and perform congestion control.
+
+Requesting to add QUIC Tx kernel encryption to the connection
+-------------------------------------------------------------
+
+Each flow that should be encrypted by the kernel needs to be registered with
+the kernel using socket API. A setsockopt() call on the socket creates an
+association between the QUIC connection ID of the flow with the encryption
+parameters for the crypto operations:
+
+.. code_block:: c
+  struct quic_connection_info conn_info;
+  char conn_id[5] = {0x01, 0x02, 0x03, 0x04, 0x05};
+  const size_t conn_id_len = sizeof(conn_id);
+  char conn_key[16] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+                       0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
+  char conn_iv[12] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+                      0x08, 0x09, 0x0a, 0x0b};
+  char conn_hdr_key[16] = {0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
+                       0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f};
+
+  conn_info.cipher_type = TLS_CIPHER_AES_GCM_128;
+
+  memset(&conn_info.key, 0, sizeof(struct quic_connection_info_key));
+  conn_info.key.conn_id_length = 5;
+  memcpy(&conn_info.key.conn_id[QUIC_MAX_CONNECTION_ID_SIZE - conn_id_len],
+         &conn_id, conn_id_len);
+
+  memcpy(&conn_info.payload_key, conn_key, sizeof(conn_key));
+  memcpy(&conn_info.payload_iv, conn_iv, sizeof(conn_iv));
+  memcpy(&conn_info.header_key, conn_hdr_key, sizeof(conn_hdr_key));
+
+  setsockopt(fd, SOL_UDP, UDP_QUIC_ADD_TX_CONNECTION, &conn_info,
+             sizeof(conn_info));
+
+
+Requesting to remove QUIC Tx kernel crypto offload control messages
+-------------------------------------------------------------------
+
+All flows are removed when the socket is closed. To request an explicit remove
+of the offload for the connection during the lifetime of the socket the process
+is similar to adding the flow. Only the connection ID and its length are 
+necessary to supply to remove the connection from the offload:
+
+.. code_block:: c
+
+  memset(&conn_info.key, 0, sizeof(struct quic_connection_info_key));
+  conn_info.key.conn_id_length = 5;
+  memcpy(&conn_info.key.conn_id[QUIC_MAX_CONNECTION_ID_SIZE - conn_id_len],
+         &conn_id, conn_id_len);
+  setsockopt(fd, SOL_UDP, UDP_QUIC_DEL_TX_CONNECTION, &conn_info,
+             sizeof(conn_info));
+
+Sending QUIC application data
+-----------------------------
+
+For QUIC Tx encryption offload, the application should use sendmsg() socket
+call and provide ancillary data with information on connection ID length and
+offload flags for the kernel to perform the encryption and GSO support if
+requested.
+
+.. code_block:: c
+
+  size_t cmsg_tx_len = sizeof(struct quic_tx_ancillary_data);
+  uint8_t cmsg_buf[CMSG_SPACE(cmsg_tx_len)];
+  struct quic_tx_ancillary_data * anc_data;
+  size_t quic_data_len = 4500;
+  struct cmsghdr * cmsg_hdr;
+  char quic_data[9000];
+  struct iovec iov[2];
+  int send_len = 9000;
+  struct msghdr msg;
+  int err;
+
+  iov[0].iov_base = quic_data;
+  iov[0].iov_len = quic_data_len;
+  iov[1].iov_base = quic_data + 4500;
+  iov[1].iov_len = quic_data_len;
+
+  if (client.addr.sin_family == AF_INET) {
+    msg.msg_name = &client.addr;
+    msg.msg_namelen = sizeof(client.addr);
+  } else {
+    msg.msg_name = &client.addr6;
+    msg.msg_namelen = sizeof(client.addr6);
+  }
+
+  msg.msg_iov = iov;
+  msg.msg_iovlen = 2;
+  msg.msg_control = cmsg_buf;
+  msg.msg_controllen = sizeof(cmsg_buf);
+  cmsg_hdr = CMSG_FIRSTHDR(&msg);
+  cmsg_hdr->cmsg_level = IPPROTO_UDP;
+  cmsg_hdr->cmsg_type = UDP_QUIC_ENCRYPT;
+  cmsg_hdr->cmsg_len = CMSG_LEN(cmsg_tx_len);
+  anc_data = CMSG_DATA(cmsg_hdr);
+  anc_data->flags = 0;
+  anc_data->next_pkt_num = 0x0d65c9;
+  anc_data->conn_id_length = conn_id_len;
+  err = sendmsg(self->sfd, &msg, 0);
+
+QUIC Tx offload in kernel will read the data from userspace, encrypt and
+copy it to the ciphertext within the same operation.
+
+
+Sending QUIC application data with GSO
+--------------------------------------
+When GSO is in use, the kernel will use the GSO fragment size as the target
+for ciphertext. The packets from the user space should align on the boundary
+of GSO fragment size minus the size of the tag for the chosen cipher. For the
+GSO fragment 1200, the plain packets should follow each other at every 1184
+bytes, given the tag size of 16. After the encryption, the rest of the UDP
+and IP stacks will follow the defined value of GSO fragment which will include
+the trailing tag bytes.
+
+To set up GSO fragmentation:
+
+.. code_block:: c
+  setsockopt(self->sfd, SOL_UDP, UDP_SEGMENT, &frag_size, sizeof(frag_size));
+
+If the GSO fragment size is provided in ancillary data within the sendmsg()
+call, the value in ancillary data will take precedence over the segment size
+provided in setsockopt to split the payload into packets. This is consistent
+with the UDP stack behavior.
+
+Integrating to userspace QUIC libraries
+---------------------------------------
+
+Userspace QUIC libraries integration would depend on the implementation of the
+QUIC protocol. For MVFST library, the control plane is integrated into the
+handshake callbacks to properly configure the flows into the socket; and the
+data plane is integrated into the methods that perform encryption and send
+the packets to the batch scheduler for transmissions to the socket.
+
+MVFST library can be found at https://github.com/facebookincubator/mvfst.
+
+Statistics
+==========
+
+QUIC Tx offload to the kernel has counters reflected in /proc/net/quic_stat:
+
+  QuicCurrTxSw  - number of currently active kernel offloaded QUIC connections
+  QuicTxSw      - accumulative total number of offloaded QUIC connections
+  QuicTxSwError - accumulative total number of errors during QUIC Tx offload to
+                  kernel
-- 
2.30.2

