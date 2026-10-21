Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569027;
	b=fmpOdoqLxM4S9oBY2wAbDRJAqahGyzODrnESxCxTpoHyrf8WYC5ZGKcsV+9Gu3Lg0D8l
	 R8skJHn4op6LtCddorCVr/2YqmO7Bzg5UddVTsPd5VwzcCGMsAPi81dAC1G3GchMexrfH
	 jnVHv/QLqHpHzoyBuirSpoj059BqRLbq/mmQC1I7Dcb658N0qcsmPt3SJFFcmoLpPrU8e
	 A+8oYQgZRwa5EE2rHW/vhTIAeuep4+sNj2l1bVuldYsgqfAXS3Z6Z3GK/+UXEWUC98zVy
	 NwT06A53xOF74i+gVTNbAdHUaK3NJPeXJ7etHKkGkkqyZgXm05v1tvK0X7M2+1bEEtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569027;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=3pwxCBRVeEZ/qods097/HEvHxya7vUFtQV2DHtturOY=;
	b=m+U08WUx8Ly5ebFxhvbGVTk404NJPoPZrMUySXeN0dXR1RW1d0MUv8da+aNffm19lVfK
	 0oKnM7q/AAXFK0js2awj/BBl2ylI/yPQcpR2EyxUI6+7l6trwM8wGV/J04NNII4RPqdxb
	 +8C23266Kzzw/Iu3OVIn33j97M5RDhIO++ohJ3V/n8QRXh6o7OacDNlko+vNXz3KYB8Mc
	 3dIaQv9mmfWn3r2pQONuxSb23qHlzewqos4lezecP+xW13MrcClydwz1IJnGzj+HC0am7
	 03/2m3CaJ3QEMqA4OvnkZ6UhxLBiJ2wX99+8fj2BWUF+kWMcpI3JUbo+S+c40kgvdzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HOmX9251;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DhyBmx3E;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF52606A338
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 07:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF52606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HOmX9251;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DhyBmx3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792569026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pwxCBRVeEZ/qods097/HEvHxya7vUFtQV2DHtturOY=;
	b=HOmX9251PJCYx1Bzy7joS1lrvDWIAu3/1v9sI7SqV5qwYQJpJEjwc7J4dnAet2zTAHV1h/
	nFcNstmjnrx2GsTf2BOly6oUzdQnE/KMuiiVc6sDJJZw5W1/Iw90LQMAO5pXU6gVfGibaa
	gWvBAKuUsQrXZv9JjC74kdvse4ijOLM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-SsDKls6dMKKM2sPOEpa59g-1; Wed, 21 Oct 2026 07:50:12 +0000
X-MC-Unique: SsDKls6dMKKM2sPOEpa59g-1
X-Mimecast-MFC-AGG-ID: SsDKls6dMKKM2sPOEpa59g_1792569011
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1db220b42so3059985e9.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 00:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792569011; x=1793173811; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pwxCBRVeEZ/qods097/HEvHxya7vUFtQV2DHtturOY=;
        b=DhyBmx3EYsT34QeKtasb9yQEPRkdBCj33QEsEHTzhfUPGcsJ+NgzFHJQOVgHc3o66B
         iq1pnpY3Myxz6SEML0a+/5mOLQqkpl3Oqp0iLikK5BZ4tQ7jCHM7uC4wO0ze6rkFN5D2
         kyy9XwW1M4UGLC5CmMsAnIeYqjMxOp+6Krhrtcf9l7fSbyxY23RMfMIIy/Qu2yzGrJGf
         vOvvHsab2xsUBwtfUl/iJQm3ZAk5I31nU4bjGYFYo30mc0lRKUOZJJ7b5SiRYh13iMY+
         YuUnR8W5B3MdqVZWUwce3sCyfe8gLNXi0m8fvn770w4S0LjB2fjWIc0L7CE/a7PSJ6/L
         OvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569011; x=1793173811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3pwxCBRVeEZ/qods097/HEvHxya7vUFtQV2DHtturOY=;
        b=kOESf2QnSm7Q617E9DWM0STcgfdUygq9wDcTw59r+mHJa4H4zlj90oZ/iRJeccDYlT
         KTTXmKLqCgcj40qqnC4psuSNZZorB7vUrPpiw9IdFaFxQkrKklemyl5j66zN7+IEVih4
         dDleiq18s9H0BNK4Vao8aLNbgt14p1ISitXGzBoKPAp1/kO4gzzyDgLYf9tH1vW2xgT0
         v8SCrxELg0UVce6wiGwXXuStu+8SF5mpBnsrCGF+dVX9XGbrYRR3rLs8cPY2reyesgci
         6TPefLnArRFD9xNL0NNW6+u4I0JtuEM+m0FxGdZJGD2emcqlW6Fy3O3EWvxHuw5ziRh5
         /flg==
X-Forwarded-Encrypted: i=1; AKwUvBw+RTwrIyX/mcC4caWHLfS3GhCrz/gFR/ULsXt5kKCYoJ6yby92JL/entHozqp3CQzxaB6cHuCH/W8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLzF4e87C52Wnf8csfJRU4ZpnZLAag5FtrVpaKe4jxCcBGoA8t
	GGnYD1e3MuqobaapOiNTDfOEJx+IPHVJOeowkxmpyZGCXhyDb/cjzkC9gNFZ7IM4Jpkdw5UDdBG
	VHj8leUeQLACoeKVZj6tYibqELqzmK3Cy5wBpB2nJgVw8GUvzdN1w0biO0go1cA==
X-Gm-Gg: AYBFou0eX4ZJp/fpGwrO6VPUXpcrTUofiTk7WJ292KGvXBb7WWsdPfL5BQNxkDEeTCG
	NdFtxDiiiQVsu/ZH70OOYP5sonfYfGgMjVh8iOHs2E7i/WYV8jhCSBJWIUzRjcDchhMclcT8yX8
	by5qQOmUq17zpojXFJwTXCAhUTv/H+flGKl7RO1rc69zE0/vdD7GPE5wmxRuNNLmDMPbNasxZPu
	yPbm27/cPCIquS356n2K/7GAnMohEJP7OmPzf67Zqm0RG8Jh0Z332uRGNtWyMGUMwt3vtC2QlmE
	jRishSDh/YZCA+qDmqljBDHQ9JH5VFSEOp/coGVhtA1vShXNQwlAZ3czXXKdjWBeMB42Zg==
X-Received: by 2002:a05:600c:83c7:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a1fdd22df7mr22986115e9.18.1792569010874;
        Wed, 21 Oct 2026 00:50:10 -0700 (PDT)
X-Received: by 2002:a05:600c:83c7:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a1fdd22df7mr22985315e9.18.1792569010344;
        Wed, 21 Oct 2026 00:50:10 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb80e859sm59806415e9.4.2026.10.21.00.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:50:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:50:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH net v4 5/7] net: add a sysctl to opt out of virtio net hdr
 checksum validation
Message-ID: <595385b672b5411849d1defc78b68b25a908a77a.1792565282.git.mst@redhat.com>
References: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be251d104f881a309cfef150455efa128ebb101d.1792565282.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

The ingress validation as implemented by the previous
patch is stricter than what it replaced: GSO
packets whose checksum metadata matches no transport header are
dropped, and non-GSO ones get their checksum completed in place.
Such packets used to pass with the metadata unvalidated,
and with no overhead.

I judge that this should not affect any deployments, but there is still
some risk that it does.  In case a deployment depends on them anyway,
provide a per-netns switch to get the old behavior back:

echo 0 > /proc/sys/net/core/virtio_net_hdr_validate

The default is validating.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 Documentation/admin-guide/sysctl/net.rst | 19 +++++++++
 include/linux/virtio_net.h               | 26 ++++++++++++
 include/net/netns/core.h                 |  1 +
 net/core/dev.c                           |  7 ++++
 net/core/net_namespace.c                 |  1 +
 net/core/sysctl_net_core.c               | 50 ++++++++++++++++++++++++
 6 files changed, 104 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index e586e17fc7a5..3c0223575438 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
 Default: 1 (on)
 
 
+virtio_net_hdr_validate
+-----------------------
+
+When processing packets with a virtio net header (through tun, tap, a
+packet socket or a virtio network device) that request checksum offload
+(VIRTIO_NET_HDR_F_NEEDS_CSUM), validate the packet: complete the checksum
+in software, or drop the packet where the header does not match it.
+
+When disabled, the header is trusted not to corrupt the packet, and the
+checksum is offloaded to hardware (or not verified if it never reaches
+hardware). This is only safe if no protocol is processing the packets.
+
+The setting is per network namespace, but only writable by the host
+root: root inside a network namespace created by an unprivileged user
+cannot disable the validation.
+
+Default: 1 (on)
+
+
 wmem_default
 ------------
 
diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index ec6f47ce1c97..b3bbecbd023c 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -5,6 +5,7 @@
 #include <linux/if_vlan.h>
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <linux/jump_label.h>
 #include <linux/netdevice.h>
 #include <linux/udp.h>
 #include <net/gso.h>
@@ -78,6 +79,19 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
 	*thoff = nhoff + iph->ihl * sizeof(u32);
 	return iph;
 }
+/* Defined in net/core/dev.c, enabled while any network namespace
+ * has net.core.virtio_net_hdr_validate set to 0.
+ */
+DECLARE_STATIC_KEY_FALSE(virtio_net_hdr_validate_disabled_key);
+
+/* Failsafe: a namespace can disable the check with
+ * net.core.virtio_net_hdr_validate.
+ */
+static inline bool virtio_net_hdr_validate_disabled(struct sk_buff *skb)
+{
+	return static_branch_unlikely(&virtio_net_hdr_validate_disabled_key) &&
+	       !READ_ONCE(dev_net(skb->dev)->core.sysctl_virtio_net_hdr_validate);
+}
 
 /* Where does the L3 header start, and what protocol is it?
  * Handles Ethernet and VLAN headers; other devices use the
@@ -186,6 +200,12 @@ virtio_net_csum_partial_ok_at_offset(struct sk_buff *skb, u8 hdr_gso_type,
 	unsigned int thoff;
 	int ip_proto;
 
+	/* Failsafe: a namespace opted out of the validation,
+	 * trust the checksum metadata as before.
+	 */
+	if (virtio_net_hdr_validate_disabled(skb))
+		return true;
+
 	if (!virtio_net_l4_start(skb, nhoff, proto, &thoff, &ip_proto))
 		return false;
 
@@ -228,6 +248,9 @@ virtio_net_csum_partial_ok(struct sk_buff *skb, u8 hdr_gso_type)
 	int nhoff;
 	__be16 proto;
 
+	if (virtio_net_hdr_validate_disabled(skb))
+		return true;
+
 	if (!virtio_net_l3_start(skb, &nhoff, &proto))
 		return false;
 
@@ -519,6 +542,9 @@ virtio_net_tnl_offsets_ok(struct sk_buff *skb, bool outer_isv6,
 	unsigned int thoff;
 	int ip_proto;
 
+	if (virtio_net_hdr_validate_disabled(skb))
+		return true;
+
 	if (!virtio_net_l3_start(skb, &nhoff, &proto))
 		return false;
 	if (outer_isv6 != (proto == htons(ETH_P_IPV6)))
diff --git a/include/net/netns/core.h b/include/net/netns/core.h
index 9ef3d70e5e9c..02ce232fe9a9 100644
--- a/include/net/netns/core.h
+++ b/include/net/netns/core.h
@@ -18,6 +18,7 @@ struct netns_core {
 	u8	sysctl_txrehash;
 	u8	sysctl_tstamp_allow_data;
 	u8	sysctl_bypass_prot_mem;
+	u8	sysctl_virtio_net_hdr_validate;
 
 #ifdef CONFIG_PROC_FS
 	struct prot_inuse __percpu *prot_inuse;
diff --git a/net/core/dev.c b/net/core/dev.c
index e76762e29360..43b8823c83f6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -128,6 +128,7 @@
 #include <linux/if_vlan.h>
 #include <linux/ip.h>
 #include <net/ip.h>
+#include <linux/virtio_net.h>
 #include <net/mpls.h>
 #include <linux/ipv6.h>
 #include <linux/in.h>
@@ -2389,6 +2390,12 @@ EXPORT_SYMBOL(tcf_sw_enabled_key);
 
 DEFINE_STATIC_KEY_FALSE(netstamp_needed_key);
 EXPORT_SYMBOL(netstamp_needed_key);
+
+/* Enabled while any network namespace has net.core.virtio_net_hdr_validate
+ * set to 0.
+ */
+DEFINE_STATIC_KEY_FALSE(virtio_net_hdr_validate_disabled_key);
+EXPORT_SYMBOL(virtio_net_hdr_validate_disabled_key);
 #ifdef CONFIG_JUMP_LABEL
 static atomic_t netstamp_needed_deferred;
 static atomic_t netstamp_wanted;
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index da5f881fbd3b..8a21baaa7e6d 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -396,6 +396,7 @@ static __net_init void preinit_net_sysctl(struct net *net)
 	net->core.sysctl_optmem_max = 128 * 1024;
 	net->core.sysctl_txrehash = SOCK_TXREHASH_ENABLED;
 	net->core.sysctl_tstamp_allow_data = 1;
+	net->core.sysctl_virtio_net_hdr_validate = 1;
 	net->core.sysctl_txq_reselection = msecs_to_jiffies(1000);
 }
 
diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index eb35da3556f4..3e4037b82a97 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -18,6 +18,8 @@
 #include <linux/slab.h>
 #include <linux/sched/isolation.h>
 #include <linux/hex.h>
+#include <linux/virtio_net.h>
+#include <linux/jump_label.h>
 
 #include <net/ip.h>
 #include <net/sock.h>
@@ -678,6 +680,43 @@ static struct ctl_table net_core_table[] = {
 	},
 };
 
+/* Protects changes to virtio_net_hdr_validate_disabled_key and each
+ * net->core.sysctl_virtio_net_hdr_validate.  The packet path reads
+ * the value without a lock.
+ */
+static DEFINE_MUTEX(virtio_net_hdr_validate_mutex);
+
+static int virtio_net_hdr_validate_sysctl(const struct ctl_table *table,
+					  int write, void *buffer,
+					  size_t *lenp, loff_t *ppos)
+{
+	u8 *value = table->data;
+	u8 old, new;
+	int ret;
+
+	/* Root in a user namespace must not be able to weaken the
+	 * validation for the network namespace it controls.
+	 */
+	if (write && !capable(CAP_NET_ADMIN))
+		return -EPERM;
+
+	mutex_lock(&virtio_net_hdr_validate_mutex);
+
+	old = READ_ONCE(*value);
+	ret = proc_dou8vec_minmax(table, write, buffer, lenp, ppos);
+	new = READ_ONCE(*value);
+	if (write && !ret && old != new) {
+		if (new)
+			static_branch_dec(&virtio_net_hdr_validate_disabled_key);
+		else
+			static_branch_inc(&virtio_net_hdr_validate_disabled_key);
+	}
+
+	mutex_unlock(&virtio_net_hdr_validate_mutex);
+
+	return ret;
+}
+
 static const struct ctl_table netns_core_table[] = {
 #if IS_ENABLED(CONFIG_RPS)
 	{
@@ -737,6 +776,15 @@ static const struct ctl_table netns_core_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE
 	},
+	{
+		.procname	= "virtio_net_hdr_validate",
+		.data		= &init_net.core.sysctl_virtio_net_hdr_validate,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= virtio_net_hdr_validate_sysctl,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE
+	},
 	/* sysctl_core_net_init() will set the values after this
 	 * to readonly in network namespaces
 	 */
@@ -841,6 +889,8 @@ static __net_exit void sysctl_core_net_exit(struct net *net)
 	tbl = net->core.sysctl_hdr->ctl_table_arg;
 	unregister_net_sysctl_table(net->core.sysctl_hdr);
 	BUG_ON(tbl == netns_core_table);
+	if (!net->core.sysctl_virtio_net_hdr_validate)
+		static_branch_dec(&virtio_net_hdr_validate_disabled_key);
 #if IS_ENABLED(CONFIG_RPS)
 	kfree(net->core.rps_default_mask);
 #endif
-- 
MST

