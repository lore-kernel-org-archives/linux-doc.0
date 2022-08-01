Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C81FC19F2B
	for <linux-doc@archiver.kernel.org>; Mon,  1 Aug 2022 20:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbiHAUBT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Aug 2022 16:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiHAUBS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 16:01:18 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F1C2678
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 13:01:17 -0700 (PDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271GPTN0008575
        for <linux-doc@vger.kernel.org>; Mon, 1 Aug 2022 13:01:17 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hn2bn5yja-6
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 01 Aug 2022 13:01:16 -0700
Received: from snc-exhub201.TheFacebook.com (2620:10d:c085:21d::7) by
 snc-exhub202.TheFacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 13:01:14 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 13:01:13 -0700
Received: by devvm3365.prn0.facebook.com (Postfix, from userid 415935)
        id 3B00FE81E71A; Mon,  1 Aug 2022 12:55:18 -0700 (PDT)
From:   Adel Abouchaev <adel.abushaev@gmail.com>
To:     <kuba@kernel.org>
CC:     <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
        <corbet@lwn.net>, <dsahern@kernel.org>, <shuah@kernel.org>,
        <imagedong@tencent.com>, <netdev@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        "Adel Abouchaev" <adel.abushaev@gmail.com>
Subject: [RFC net-next 2/6] net: Define QUIC specific constants, control and data plane structures
Date:   Mon, 1 Aug 2022 12:52:24 -0700
Message-ID: <20220801195228.723273-3-adel.abushaev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220801195228.723273-1-adel.abushaev@gmail.com>
References: <Adel Abouchaev <adel.abushaev@gmail.com>
 <20220801195228.723273-1-adel.abushaev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: oA8sj_osHKed4MwTzpQ1e-27Pm-hioeV
X-Proofpoint-ORIG-GUID: oA8sj_osHKed4MwTzpQ1e-27Pm-hioeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_10,2022-08-01_01,2022-06-22_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Define control and data plane structures to pass in control plane for
flow add/remove and during packet send within ancillary data. Define
constants to use within SOL_UDP to program QUIC sockets.

Signed-off-by: Adel Abouchaev <adel.abushaev@gmail.com>
---
 include/uapi/linux/quic.h | 61 +++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/udp.h  |  3 ++
 2 files changed, 64 insertions(+)
 create mode 100644 include/uapi/linux/quic.h

diff --git a/include/uapi/linux/quic.h b/include/uapi/linux/quic.h
new file mode 100644
index 000000000000..79680b8b18a6
--- /dev/null
+++ b/include/uapi/linux/quic.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) */
+
+#ifndef _UAPI_LINUX_QUIC_H
+#define _UAPI_LINUX_QUIC_H
+
+#include <linux/types.h>
+#include <linux/tls.h>
+
+#define QUIC_MAX_CONNECTION_ID_SIZE 20
+
+/* Side by side data for QUIC egress operations */
+#define QUIC_BYPASS_ENCRYPTION 0x01
+
+struct quic_tx_ancillary_data {
+	__aligned_u64	next_pkt_num;
+	__u8	flags;
+	__u8	conn_id_length;
+};
+
+struct quic_connection_info_key {
+	__u8	conn_id[QUIC_MAX_CONNECTION_ID_SIZE];
+	__u8	conn_id_length;
+};
+
+struct quic_aes_gcm_128 {
+	__u8	header_key[TLS_CIPHER_AES_GCM_128_KEY_SIZE];
+	__u8	payload_key[TLS_CIPHER_AES_GCM_128_KEY_SIZE];
+	__u8	payload_iv[TLS_CIPHER_AES_GCM_128_IV_SIZE];
+};
+
+struct quic_aes_gcm_256 {
+	__u8	header_key[TLS_CIPHER_AES_GCM_256_KEY_SIZE];
+	__u8	payload_key[TLS_CIPHER_AES_GCM_256_KEY_SIZE];
+	__u8	payload_iv[TLS_CIPHER_AES_GCM_256_IV_SIZE];
+};
+
+struct quic_aes_ccm_128 {
+	__u8	header_key[TLS_CIPHER_AES_CCM_128_KEY_SIZE];
+	__u8	payload_key[TLS_CIPHER_AES_CCM_128_KEY_SIZE];
+	__u8	payload_iv[TLS_CIPHER_AES_CCM_128_IV_SIZE];
+};
+
+struct quic_chacha20_poly1305 {
+	__u8	header_key[TLS_CIPHER_CHACHA20_POLY1305_KEY_SIZE];
+	__u8	payload_key[TLS_CIPHER_CHACHA20_POLY1305_KEY_SIZE];
+	__u8	payload_iv[TLS_CIPHER_CHACHA20_POLY1305_IV_SIZE];
+};
+
+struct quic_connection_info {
+	__u16	cipher_type;
+	struct quic_connection_info_key		key;
+	union {
+		struct quic_aes_gcm_128 aes_gcm_128;
+		struct quic_aes_gcm_256 aes_gcm_256;
+		struct quic_aes_ccm_128 aes_ccm_128;
+		struct quic_chacha20_poly1305 chacha20_poly1305;
+	};
+};
+
+#endif
+
diff --git a/include/uapi/linux/udp.h b/include/uapi/linux/udp.h
index 4828794efcf8..0ee4c598e70b 100644
--- a/include/uapi/linux/udp.h
+++ b/include/uapi/linux/udp.h
@@ -34,6 +34,9 @@ struct udphdr {
 #define UDP_NO_CHECK6_RX 102	/* Disable accpeting checksum for UDP6 */
 #define UDP_SEGMENT	103	/* Set GSO segmentation size */
 #define UDP_GRO		104	/* This socket can receive UDP GRO packets */
+#define UDP_QUIC_ADD_TX_CONNECTION	106 /* Add QUIC Tx crypto offload */
+#define UDP_QUIC_DEL_TX_CONNECTION	107 /* Del QUIC Tx crypto offload */
+#define UDP_QUIC_ENCRYPT		108 /* QUIC encryption parameters */
 
 /* UDP encapsulation types */
 #define UDP_ENCAP_ESPINUDP_NON_IKE	1 /* draft-ietf-ipsec-nat-t-ike-00/01 */
-- 
2.30.2

