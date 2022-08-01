Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3213FC00144
	for <linux-doc@archiver.kernel.org>; Mon,  1 Aug 2022 20:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbiHAUHP convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Aug 2022 16:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiHAUHO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 16:07:14 -0400
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDCE275F6
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 13:07:13 -0700 (PDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 271Fm0oo025032
        for <linux-doc@vger.kernel.org>; Mon, 1 Aug 2022 13:07:13 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0089730.ppops.net (PPS) with ESMTPS id 3hn057ph37-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 01 Aug 2022 13:07:12 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 13:07:09 -0700
Received: by devvm3365.prn0.facebook.com (Postfix, from userid 415935)
        id 0A28AE81E739; Mon,  1 Aug 2022 12:55:21 -0700 (PDT)
From:   Adel Abouchaev <adel.abushaev@gmail.com>
To:     <kuba@kernel.org>
CC:     <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
        <corbet@lwn.net>, <dsahern@kernel.org>, <shuah@kernel.org>,
        <imagedong@tencent.com>, <netdev@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        Adel Abouchaev <adel.abushaev@gmail.com>
Subject: [RFC net-next 5/6] net: Add flow counters and Tx processing error counter
Date:   Mon, 1 Aug 2022 12:52:27 -0700
Message-ID: <20220801195228.723273-6-adel.abushaev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220801195228.723273-1-adel.abushaev@gmail.com>
References: <Adel Abouchaev <adel.abushaev@gmail.com>
 <20220801195228.723273-1-adel.abushaev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: v4Dp29VwwsI_c0BF8cyM1DCr_PXGEFqv
X-Proofpoint-ORIG-GUID: v4Dp29VwwsI_c0BF8cyM1DCr_PXGEFqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_11,2022-08-01_01,2022-06-22_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added flow counters. Total flow counter is accumulative, the current shows the
number of flows currently in flight, the error counters is accumulating the
number of errors during Tx processing.

Signed-off-by: Adel Abouchaev <adel.abushaev@gmail.com>
---
 include/net/netns/mib.h   |  3 +++
 include/net/quic.h        | 10 +++++++++
 include/net/snmp.h        |  6 +++++
 include/uapi/linux/snmp.h | 11 ++++++++++
 net/quic/Makefile         |  2 +-
 net/quic/quic_main.c      | 46 +++++++++++++++++++++++++++++++++++++++
 net/quic/quic_proc.c      | 45 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 net/quic/quic_proc.c

diff --git a/include/net/netns/mib.h b/include/net/netns/mib.h
index 7e373664b1e7..dcbba3d1ceec 100644
--- a/include/net/netns/mib.h
+++ b/include/net/netns/mib.h
@@ -24,6 +24,9 @@ struct netns_mib {
 #if IS_ENABLED(CONFIG_TLS)
 	DEFINE_SNMP_STAT(struct linux_tls_mib, tls_statistics);
 #endif
+#if IS_ENABLED(CONFIG_QUIC)
+	DEFINE_SNMP_STAT(struct linux_quic_mib, quic_statistics);
+#endif
 #ifdef CONFIG_MPTCP
 	DEFINE_SNMP_STAT(struct mptcp_mib, mptcp_statistics);
 #endif
diff --git a/include/net/quic.h b/include/net/quic.h
index 15e04ea08c53..b6327f3b7632 100644
--- a/include/net/quic.h
+++ b/include/net/quic.h
@@ -25,6 +25,16 @@
 #define QUIC_MAX_PLAIN_PAGES		16
 #define QUIC_MAX_CIPHER_PAGES_ORDER	4
 
+#define __QUIC_INC_STATS(net, field)				\
+	__SNMP_INC_STATS((net)->mib.quic_statistics, field)
+#define QUIC_INC_STATS(net, field)				\
+	SNMP_INC_STATS((net)->mib.quic_statistics, field)
+#define QUIC_DEC_STATS(net, field)				\
+	SNMP_DEC_STATS((net)->mib.quic_statistics, field)
+
+int __net_init quic_proc_init(struct net *net);
+void __net_exit quic_proc_fini(struct net *net);
+
 struct quic_internal_crypto_context {
 	struct quic_connection_info	conn_info;
 	struct crypto_skcipher		*header_tfm;
diff --git a/include/net/snmp.h b/include/net/snmp.h
index 468a67836e2f..f94680a3e9e8 100644
--- a/include/net/snmp.h
+++ b/include/net/snmp.h
@@ -117,6 +117,12 @@ struct linux_tls_mib {
 	unsigned long	mibs[LINUX_MIB_TLSMAX];
 };
 
+/* Linux QUIC */
+#define LINUX_MIB_QUICMAX	__LINUX_MIB_QUICMAX
+struct linux_quic_mib {
+	unsigned long	mibs[LINUX_MIB_QUICMAX];
+};
+
 #define DEFINE_SNMP_STAT(type, name)	\
 	__typeof__(type) __percpu *name
 #define DEFINE_SNMP_STAT_ATOMIC(type, name)	\
diff --git a/include/uapi/linux/snmp.h b/include/uapi/linux/snmp.h
index 904909d020e2..708f62e28c9d 100644
--- a/include/uapi/linux/snmp.h
+++ b/include/uapi/linux/snmp.h
@@ -347,4 +347,15 @@ enum
 	__LINUX_MIB_TLSMAX
 };
 
+/* linux QUIC mib definitions */
+enum
+{
+	LINUX_MIB_QUICNUM = 0,
+	LINUX_MIB_QUICCURRTXSW,			/* QuicCurrTxSw */
+	LINUX_MIB_QUICTXSW,			/* QuicTxSw */
+	LINUX_MIB_QUICTXSWERROR,		/* QuicTxSwError */
+	__LINUX_MIB_QUICMAX
+};
+
+
 #endif	/* _LINUX_SNMP_H */
diff --git a/net/quic/Makefile b/net/quic/Makefile
index 928239c4d08c..a885cd8bc4e0 100644
--- a/net/quic/Makefile
+++ b/net/quic/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_QUIC) += quic.o
 
-quic-y := quic_main.o
+quic-y := quic_main.o quic_proc.o
diff --git a/net/quic/quic_main.c b/net/quic/quic_main.c
index e738c8130a4f..eb0fdeabd3c4 100644
--- a/net/quic/quic_main.c
+++ b/net/quic/quic_main.c
@@ -362,6 +362,8 @@ static int do_quic_conn_add_tx(struct sock *sk, sockptr_t optval,
 	if (rc < 0)
 		goto err_free_ciphers;
 
+	QUIC_INC_STATS(sock_net(sk), LINUX_MIB_QUICCURRTXSW);
+	QUIC_INC_STATS(sock_net(sk), LINUX_MIB_QUICTXSW);
 	return 0;
 
 err_free_ciphers:
@@ -411,6 +413,7 @@ static int do_quic_conn_del_tx(struct sock *sk, sockptr_t optval,
 	crypto_free_aead(crypto_ctx->packet_aead);
 	memzero_explicit(crypto_ctx, sizeof(*crypto_ctx));
 	kfree(connhash);
+	QUIC_DEC_STATS(sock_net(sk), LINUX_MIB_QUICCURRTXSW);
 
 	return 0;
 }
@@ -436,6 +439,9 @@ static int do_quic_setsockopt(struct sock *sk, int optname, sockptr_t optval,
 		break;
 	}
 
+	if (rc)
+		QUIC_INC_STATS(sock_net(sk), LINUX_MIB_QUICTXSWERROR);
+
 	return rc;
 }
 
@@ -1242,6 +1248,9 @@ static int quic_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
 	quic_put_plain_user_pages(plain_pages, nr_plain_pages);
 
 out:
+	if (unlikely(ret < 0))
+		QUIC_INC_STATS(sock_net(sk), LINUX_MIB_QUICTXSWERROR);
+
 	return ret;
 }
 
@@ -1374,6 +1383,36 @@ static void quic_release(struct sock *sk)
 	release_sock(sk);
 }
 
+static int __net_init quic_init_net(struct net *net)
+{
+	int err;
+
+	net->mib.quic_statistics = alloc_percpu(struct linux_quic_mib);
+	if (!net->mib.quic_statistics)
+		return -ENOMEM;
+
+	err = quic_proc_init(net);
+	if (err)
+		goto err_free_stats;
+
+	return 0;
+
+err_free_stats:
+	free_percpu(net->mib.quic_statistics);
+	return err;
+}
+
+static void __net_exit quic_exit_net(struct net *net)
+{
+	quic_proc_fini(net);
+	free_percpu(net->mib.quic_statistics);
+}
+
+static struct pernet_operations quic_proc_ops = {
+	.init = quic_init_net,
+	.exit = quic_exit_net,
+};
+
 static struct udp_ulp_ops quic_ulp_ops __read_mostly = {
 	.name		= "quic-crypto",
 	.owner		= THIS_MODULE,
@@ -1383,6 +1422,12 @@ static struct udp_ulp_ops quic_ulp_ops __read_mostly = {
 
 static int __init quic_register(void)
 {
+	int err;
+
+	err = register_pernet_subsys(&quic_proc_ops);
+	if (err)
+		return err;
+
 	udp_register_ulp(&quic_ulp_ops);
 	return 0;
 }
@@ -1390,6 +1435,7 @@ static int __init quic_register(void)
 static void __exit quic_unregister(void)
 {
 	udp_unregister_ulp(&quic_ulp_ops);
+	unregister_pernet_subsys(&quic_proc_ops);
 }
 
 module_init(quic_register);
diff --git a/net/quic/quic_proc.c b/net/quic/quic_proc.c
new file mode 100644
index 000000000000..cb4fe7a589b5
--- /dev/null
+++ b/net/quic/quic_proc.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/* Copyright (C) 2019 Meta Platforms, Inc. */
+
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#include <net/snmp.h>
+#include <net/quic.h>
+
+#ifdef CONFIG_PROC_FS
+static const struct snmp_mib quic_mib_list[] = {
+	SNMP_MIB_ITEM("QuicCurrTxSw", LINUX_MIB_QUICCURRTXSW),
+	SNMP_MIB_ITEM("QuicTxSw", LINUX_MIB_QUICTXSW),
+	SNMP_MIB_ITEM("QuicTxSwError", LINUX_MIB_QUICTXSWERROR),
+	SNMP_MIB_SENTINEL
+};
+
+static int quic_statistics_seq_show(struct seq_file *seq, void *v)
+{
+	unsigned long buf[LINUX_MIB_QUICMAX] = {};
+	struct net *net = seq->private;
+	int i;
+
+	snmp_get_cpu_field_batch(buf, quic_mib_list, net->mib.quic_statistics);
+	for (i = 0; quic_mib_list[i].name; i++)
+		seq_printf(seq, "%-32s\t%lu\n", quic_mib_list[i].name, buf[i]);
+
+	return 0;
+}
+#endif
+
+int __net_init quic_proc_init(struct net *net)
+{
+#ifdef CONFIG_PROC_FS
+	if (!proc_create_net_single("quic_stat", 0444, net->proc_net,
+				    quic_statistics_seq_show, NULL))
+		return -ENOMEM;
+#endif /* CONFIG_PROC_FS */
+
+	return 0;
+}
+
+void __net_exit quic_proc_fini(struct net *net)
+{
+	remove_proc_entry("quic_stat", net->proc_net);
+}
-- 
2.30.2

