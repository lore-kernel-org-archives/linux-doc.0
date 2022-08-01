Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9827C00144
	for <linux-doc@archiver.kernel.org>; Mon,  1 Aug 2022 20:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiHAUHM convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Aug 2022 16:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiHAUHL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 16:07:11 -0400
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E554275F6
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 13:07:10 -0700 (PDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271EmakC020236
        for <linux-doc@vger.kernel.org>; Mon, 1 Aug 2022 13:07:09 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hn2ftxb0k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 01 Aug 2022 13:07:09 -0700
Received: from twshared13315.14.prn3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 13:07:08 -0700
Received: by devvm3365.prn0.facebook.com (Postfix, from userid 415935)
        id 57CB7E81E724; Mon,  1 Aug 2022 12:55:19 -0700 (PDT)
From:   Adel Abouchaev <adel.abushaev@gmail.com>
To:     <kuba@kernel.org>
CC:     <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
        <corbet@lwn.net>, <dsahern@kernel.org>, <shuah@kernel.org>,
        <imagedong@tencent.com>, <netdev@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        Adel Abouchaev <adel.abushaev@gmail.com>
Subject: [RFC net-next 3/6] net: Add UDP ULP operations, initialization and handling prototype functions.
Date:   Mon, 1 Aug 2022 12:52:25 -0700
Message-ID: <20220801195228.723273-4-adel.abushaev@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220801195228.723273-1-adel.abushaev@gmail.com>
References: <Adel Abouchaev <adel.abushaev@gmail.com>
 <20220801195228.723273-1-adel.abushaev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ol_y_P2ckj_MZxXkNZ6BqHMVB3GvRYwE
X-Proofpoint-GUID: Ol_y_P2ckj_MZxXkNZ6BqHMVB3GvRYwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_10,2022-08-01_01,2022-06-22_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Define functions to add UDP ULP handling, registration with UDP protocol
and supporting data structures. Create structure for QUIC ULP and add empty
prototype functions to support it.

Signed-off-by: Adel Abouchaev <adel.abushaev@gmail.com>
---
 include/net/inet_sock.h  |   2 +
 include/net/udp.h        |  33 +++++++
 include/uapi/linux/udp.h |   1 +
 net/Kconfig              |   1 +
 net/Makefile             |   1 +
 net/ipv4/Makefile        |   3 +-
 net/ipv4/udp.c           |   6 ++
 net/ipv4/udp_ulp.c       | 190 +++++++++++++++++++++++++++++++++++++++
 8 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 net/ipv4/udp_ulp.c

diff --git a/include/net/inet_sock.h b/include/net/inet_sock.h
index 6395f6b9a5d2..e9c44b3ccffe 100644
--- a/include/net/inet_sock.h
+++ b/include/net/inet_sock.h
@@ -238,6 +238,8 @@ struct inet_sock {
 	__be32			mc_addr;
 	struct ip_mc_socklist __rcu	*mc_list;
 	struct inet_cork_full	cork;
+	const struct udp_ulp_ops	*udp_ulp_ops;
+	void __rcu		*ulp_data;
 };
 
 #define IPCORK_OPT	1	/* ip-options has been held in ipcork.opt */
diff --git a/include/net/udp.h b/include/net/udp.h
index 8dd4aa1485a6..f50011a20c92 100644
--- a/include/net/udp.h
+++ b/include/net/udp.h
@@ -523,4 +523,37 @@ struct proto *udp_bpf_get_proto(struct sock *sk, struct sk_psock *psock);
 int udp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore);
 #endif
 
+/*
+ * Interface for adding Upper Level Protocols over UDP
+ */
+
+#define UDP_ULP_NAME_MAX	16
+#define UDP_ULP_MAX		128
+
+struct udp_ulp_ops {
+	struct list_head	list;
+
+	/* initialize ulp */
+	int (*init)(struct sock *sk);
+	/* cleanup ulp */
+	void (*release)(struct sock *sk);
+
+	char		name[UDP_ULP_NAME_MAX];
+	struct module	*owner;
+};
+
+int udp_register_ulp(struct udp_ulp_ops *type);
+void udp_unregister_ulp(struct udp_ulp_ops *type);
+int udp_set_ulp(struct sock *sk, const char *name);
+void udp_get_available_ulp(char *buf, size_t len);
+void udp_cleanup_ulp(struct sock *sk);
+int udp_setsockopt_ulp(struct sock *sk, sockptr_t optval,
+		       unsigned int optlen);
+int udp_getsockopt_ulp(struct sock *sk, char __user *optval,
+		       int __user *optlen);
+
+#define MODULE_ALIAS_UDP_ULP(name)\
+	__MODULE_INFO(alias, alias_userspace, name);\
+	__MODULE_INFO(alias, alias_udp_ulp, "udp-ulp-" name)
+
 #endif	/* _UDP_H */
diff --git a/include/uapi/linux/udp.h b/include/uapi/linux/udp.h
index 0ee4c598e70b..893691f0108a 100644
--- a/include/uapi/linux/udp.h
+++ b/include/uapi/linux/udp.h
@@ -34,6 +34,7 @@ struct udphdr {
 #define UDP_NO_CHECK6_RX 102	/* Disable accpeting checksum for UDP6 */
 #define UDP_SEGMENT	103	/* Set GSO segmentation size */
 #define UDP_GRO		104	/* This socket can receive UDP GRO packets */
+#define UDP_ULP		105	/* Attach ULP to a UDP socket */
 #define UDP_QUIC_ADD_TX_CONNECTION	106 /* Add QUIC Tx crypto offload */
 #define UDP_QUIC_DEL_TX_CONNECTION	107 /* Del QUIC Tx crypto offload */
 #define UDP_QUIC_ENCRYPT		108 /* QUIC encryption parameters */
diff --git a/net/Kconfig b/net/Kconfig
index 6b78f695caa6..93e3b1308aec 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -63,6 +63,7 @@ menu "Networking options"
 source "net/packet/Kconfig"
 source "net/unix/Kconfig"
 source "net/tls/Kconfig"
+source "net/quic/Kconfig"
 source "net/xfrm/Kconfig"
 source "net/iucv/Kconfig"
 source "net/smc/Kconfig"
diff --git a/net/Makefile b/net/Makefile
index fbfeb8a0bb37..28565bfe29cb 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -16,6 +16,7 @@ obj-y				+= ethernet/ 802/ sched/ netlink/ bpf/ ethtool/
 obj-$(CONFIG_NETFILTER)		+= netfilter/
 obj-$(CONFIG_INET)		+= ipv4/
 obj-$(CONFIG_TLS)		+= tls/
+obj-$(CONFIG_QUIC)		+= quic/
 obj-$(CONFIG_XFRM)		+= xfrm/
 obj-$(CONFIG_UNIX_SCM)		+= unix/
 obj-y				+= ipv6/
diff --git a/net/ipv4/Makefile b/net/ipv4/Makefile
index bbdd9c44f14e..88d3baf4af95 100644
--- a/net/ipv4/Makefile
+++ b/net/ipv4/Makefile
@@ -14,7 +14,8 @@ obj-y     := route.o inetpeer.o protocol.o \
 	     udp_offload.o arp.o icmp.o devinet.o af_inet.o igmp.o \
 	     fib_frontend.o fib_semantics.o fib_trie.o fib_notifier.o \
 	     inet_fragment.o ping.o ip_tunnel_core.o gre_offload.o \
-	     metrics.o netlink.o nexthop.o udp_tunnel_stub.o
+	     metrics.o netlink.o nexthop.o udp_tunnel_stub.o \
+	     udp_ulp.o
 
 obj-$(CONFIG_BPFILTER) += bpfilter/
 
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index aa9f2ec3dc46..e4a5f66b3141 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2778,6 +2778,9 @@ int udp_lib_setsockopt(struct sock *sk, int level, int optname,
 		up->pcflag |= UDPLITE_RECV_CC;
 		break;
 
+	case UDP_ULP:
+		return udp_setsockopt_ulp(sk, optval, optlen);
+
 	default:
 		err = -ENOPROTOOPT;
 		break;
@@ -2846,6 +2849,9 @@ int udp_lib_getsockopt(struct sock *sk, int level, int optname,
 		val = up->pcrlen;
 		break;
 
+	case UDP_ULP:
+		return udp_getsockopt_ulp(sk, optval, optlen);
+
 	default:
 		return -ENOPROTOOPT;
 	}
diff --git a/net/ipv4/udp_ulp.c b/net/ipv4/udp_ulp.c
new file mode 100644
index 000000000000..3801ed7ad17d
--- /dev/null
+++ b/net/ipv4/udp_ulp.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Pluggable UDP upper layer protocol support, based on pluggable TCP upper
+ * layer protocol support.
+ *
+ * Copyright (c) 2016-2017, Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2016-2017, Dave Watson <davejwatson@fb.com>. All rights reserved.
+ */
+
+#include <linux/gfp.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mm.h>
+#include <linux/types.h>
+#include <linux/skmsg.h>
+#include <net/tcp.h>
+#include <net/udp.h>
+
+static DEFINE_SPINLOCK(udp_ulp_list_lock);
+static LIST_HEAD(udp_ulp_list);
+
+/* Simple linear search, don't expect many entries! */
+static struct udp_ulp_ops *udp_ulp_find(const char *name)
+{
+	struct udp_ulp_ops *e;
+
+	list_for_each_entry_rcu(e, &udp_ulp_list, list,
+				lockdep_is_held(&udp_ulp_list_lock)) {
+		if (strcmp(e->name, name) == 0)
+			return e;
+	}
+
+	return NULL;
+}
+
+static const struct udp_ulp_ops *__udp_ulp_find_autoload(const char *name)
+{
+	const struct udp_ulp_ops *ulp = NULL;
+
+	rcu_read_lock();
+	ulp = udp_ulp_find(name);
+
+#ifdef CONFIG_MODULES
+	if (!ulp && capable(CAP_NET_ADMIN)) {
+		rcu_read_unlock();
+		request_module("udp-ulp-%s", name);
+		rcu_read_lock();
+		ulp = udp_ulp_find(name);
+	}
+#endif
+	if (!ulp || !try_module_get(ulp->owner))
+		ulp = NULL;
+
+	rcu_read_unlock();
+	return ulp;
+}
+
+/* Attach new upper layer protocol to the list
+ * of available protocols.
+ */
+int udp_register_ulp(struct udp_ulp_ops *ulp)
+{
+	int ret = 0;
+
+	spin_lock(&udp_ulp_list_lock);
+	if (udp_ulp_find(ulp->name))
+		ret = -EEXIST;
+	else
+		list_add_tail_rcu(&ulp->list, &udp_ulp_list);
+
+	spin_unlock(&udp_ulp_list_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(udp_register_ulp);
+
+void udp_unregister_ulp(struct udp_ulp_ops *ulp)
+{
+	spin_lock(&udp_ulp_list_lock);
+	list_del_rcu(&ulp->list);
+	spin_unlock(&udp_ulp_list_lock);
+
+	synchronize_rcu();
+}
+EXPORT_SYMBOL_GPL(udp_unregister_ulp);
+
+void udp_cleanup_ulp(struct sock *sk)
+{
+	struct inet_sock *inet = inet_sk(sk);
+
+	/* No sock_owned_by_me() check here as at the time the
+	 * stack calls this function, the socket is dead and
+	 * about to be destroyed.
+	 */
+	if (!inet->udp_ulp_ops)
+		return;
+
+	if (inet->udp_ulp_ops->release)
+		inet->udp_ulp_ops->release(sk);
+	module_put(inet->udp_ulp_ops->owner);
+
+	inet->udp_ulp_ops = NULL;
+}
+
+static int __udp_set_ulp(struct sock *sk, const struct udp_ulp_ops *ulp_ops)
+{
+	struct inet_sock *inet = inet_sk(sk);
+	int err;
+
+	err = -EEXIST;
+	if (inet->udp_ulp_ops)
+		goto out_err;
+
+	err = ulp_ops->init(sk);
+	if (err)
+		goto out_err;
+
+	inet->udp_ulp_ops = ulp_ops;
+	return 0;
+
+out_err:
+	module_put(ulp_ops->owner);
+	return err;
+}
+
+int udp_set_ulp(struct sock *sk, const char *name)
+{
+	struct sk_psock *psock = sk_psock_get(sk);
+	const struct udp_ulp_ops *ulp_ops;
+
+	if (psock){
+		sk_psock_put(sk, psock);
+		return -EINVAL;
+	}
+
+	sock_owned_by_me(sk);
+	ulp_ops = __udp_ulp_find_autoload(name);
+	if (!ulp_ops)
+		return -ENOENT;
+
+	return __udp_set_ulp(sk, ulp_ops);
+}
+
+int udp_setsockopt_ulp(struct sock *sk, sockptr_t optval, unsigned int optlen)
+{
+	char name[UDP_ULP_NAME_MAX];
+	int val, err;
+
+	if (!optlen || optlen > UDP_ULP_NAME_MAX)
+		return -EINVAL;
+
+	val = strncpy_from_sockptr(name, optval, optlen);
+	if (val < 0)
+		return -EFAULT;
+
+	if (val == UDP_ULP_NAME_MAX)
+		return -EINVAL;
+
+	name[val] = 0;
+	lock_sock(sk);
+	err = udp_set_ulp(sk, name);
+	release_sock(sk);
+	return err;
+}
+
+int udp_getsockopt_ulp(struct sock *sk, char __user *optval, int __user *optlen)
+{
+	struct inet_sock *inet = inet_sk(sk);
+	int len;
+
+	if (get_user(len, optlen))
+		return -EFAULT;
+
+	len = min_t(unsigned int, len, UDP_ULP_NAME_MAX);
+	if (len < 0)
+		return -EINVAL;
+
+	if (!inet->udp_ulp_ops) {
+		if (put_user(0, optlen))
+			return -EFAULT;
+		return 0;
+	}
+
+	if (put_user(len, optlen))
+		return -EFAULT;
+	if (copy_to_user(optval, inet->udp_ulp_ops->name, len))
+		return -EFAULT;
+
+	return 0;
+}
-- 
2.30.2

