Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673916;
	b=kqIWO+AtHsMuoH4rM1HIv07fh2Og63ehLDJcSQFLRD16pa6F9xEElU6BASCG5rvO+IIj
	 h12rbV84bR3wTd5kpCVMBbULgl/BfnlDhk+lub5NajzUYRAQMcdV7HMcusH4niAdJOeav
	 UL5Yay0tWfRzTuEx7sf6R/ruw63jfN1s1g8SUNyqethoPp4R8eo0eSyxuFL7QUfAz5D+7
	 FkhEej+7++un5ZJRvPjV5ZRg+J8PU+jFwpOxf+Zu0OMQw5Nd12fF5Nux9jTEq8QDkSL6h
	 p5LvEOqsYb60kzGVcj9QoBnNVE7nwg9fo/zkaoO3xgTTnDO2FBL+9lJgGT+rz+wdn3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673916;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=n2146TWUgdwHvS4zjmu5EqVSZcyKohA+l2jbGNsx8S4=;
	b=BhJkwSUbUpc4B0XmBvmV9PNg5yMUZonUmznYJnvOzqGDeIsUPzaYlYvjWfiyl0ceAxnf
	 o0LH2W3ojyIBIKhL+W4fUIhCy2P2hsf2A4FTfoK8ARn23D1L0L0CTtaODNlwOrB4s36px
	 9lhR5oEy/vcRnLossickmRgON0dkFnZze72uc9aTvgwBV+5Xy/JcV200m+utiYwqM42FR
	 J8P+kzAbmQpII38TMLTgnAPH4GaQXP4jGVlGJTDmEDnERXogqK3n5EJdfNtoxF95tBDn2
	 Lf6iaiBkUW2Lsjt9YJ3J/f1Hs46kH+ovbBhBTiA1XBpBVLvvGItbmHa/of/ISlbcmKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O9or39Vr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MpJlP5E9;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DF660A3803
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 12:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DF660A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O9or39Vr;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MpJlP5E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792673914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2146TWUgdwHvS4zjmu5EqVSZcyKohA+l2jbGNsx8S4=;
	b=O9or39Vrb3GGgJ2zHzHuonrZjAv10bKSToF5UrlSYxxbsvHB4PoWf4j1dZswiFjsbwZu1S
	PVPjoF6nWonWZxioyEswxMYaBDEgDF2O09uoD9G8CnGGjC6Kzd61+tn4YAAd3SdhG0dTFN
	Z7fxwQLrnOBY0F5yan8VMzlz5kQ+T3Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-kNqyK45PMui65snA7q_ydA-1; Thu, 22 Oct 2026 12:58:31 +0000
X-MC-Unique: kNqyK45PMui65snA7q_ydA-1
X-Mimecast-MFC-AGG-ID: kNqyK45PMui65snA7q_ydA_1792673910
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a01ba12198so6342785e9.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792673910; x=1793278710; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n2146TWUgdwHvS4zjmu5EqVSZcyKohA+l2jbGNsx8S4=;
        b=MpJlP5E9duoQMHTdqOlS484UdpyR2kEAttkD0SJ2jlLZ7g/YptXm3vFUqFw2aI+fMd
         xvBHPckKcFrZLqMxI0oMysbLMWmRcL8rpZ90okYUayMBWd6OmUMjFINxPlrI48FARXHw
         L749cnhAlhQF4zbcpYio+jfzCXPrgtLhKoUYiZUYLr/K0Utoxt/sngOzH9dwWnEjCbfT
         nyMG4TL3GD1+VV7EwupFGsyoBhs8cxlVjXOrOdB85Feq66X8lbtSWsLtFGKcq0FL5o+l
         FvxjKREfjdvbMZnaQdnUapkynHb/cNCERjUjK6HIA7MaVG/cEy6bfCgwQzPK7sznZi68
         J/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673910; x=1793278710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n2146TWUgdwHvS4zjmu5EqVSZcyKohA+l2jbGNsx8S4=;
        b=T3YzPKWdpGC9Yjfkr6Ds7RGaRySCLqZxXpGWKcJXDCDxQg18CtShSO1yf0PLbb8ZCD
         7NZZW7/+J5zJtidE217H+D2ZzOS8nt2c7giNPfcq7eUDxMJK6VV7lFBwXwo/Vp+/T/nE
         880ovyc+nQfcVjO5rtWab0vbdG0BvImZgzI27P1YBLD0ml1gaHFmr1ry6vw3ouOIclso
         Xo2JZIOapCHwtfB6/PjLmq1lQjKWrEcP/etxcqzAnPt421E+d0b1sIB10U0JQJNvRLUR
         k7Lodhd61SnhunXj6xDfjJzpAgE3fOutfm3x6mcgnW1qF5sexoOX0+57+pnyO6VFp9fr
         BQyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2SacOKhz8jS/64s0Cm6//voyMYDjOlmnQ7lq/vDnL102tnysqEwOXCDLm/Dj1LUnN5ejTm4KbXqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLs3EVNvo99VsjxecZsWybVWbx7Qu1k/H3jb8LaDZ+iywMzCR0
	d9qxXy/jjuC5qGVM5rNZcERGd/etmX80J9Xvk4Rg0YoE3QOLFYEFGryfS3Lc8Ht/msA3g7mzJl5
	CT4GQcrOVQWKliOkftgZBrVVivOS9ku4sBoIolAbAWJob+1vZGSZh56SefWD3FA==
X-Gm-Gg: AYBFou0Vh9jbh/iNBghNJ/MNZQfd8Ut8iTfBMqvrJmy90gb8R+WyfbdfEU8/+74GfAv
	P0DTV9d1SKbBTA1SaHgejcRQ7m6qGWfKclpBQ6I05yj5SkMq3ijcQY6bEqGfYVfBDgQu/zqYIgU
	B02kPW+8B+S0Nrgc3fkiM7oy/AAy8A2wGon/KPyMTnQsDJ9geX+zx684nw4TlkX8j06A2CsZ9l6
	2v2U4VYuu/hbJ28DqJOaFwEiR+gaq6fyhOHqmjsah5c7z0lAR67UYIdlL4zOdLxgI7KwDBIR279
	DdlBFTfHWRKgEFoeu0j9upfR49cQgFGWuzP0PTy6/wQFvbWnEj1m/RCKKgaZHtxot5U=
X-Received: by 2002:a05:600c:34d6:b0:4a2:bbd:ea3a with SMTP id 5b1f17b1804b1-4a20bbdea84mr19221475e9.6.1792673909687;
        Thu, 22 Oct 2026 05:58:29 -0700 (PDT)
X-Received: by 2002:a05:600c:34d6:b0:4a2:bbd:ea3a with SMTP id 5b1f17b1804b1-4a20bbdea84mr19221005e9.6.1792673909044;
        Thu, 22 Oct 2026 05:58:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b29907sm65756795e9.3.2026.10.22.05.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:58:28 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:58:24 -0400
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
	Willem de Bruijn <willemb@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH net v5 5/7] net: add a sysctl to opt out of virtio net hdr
 checksum validation
Message-ID: <2beba4c8b84c811120b6100bcccd8b90e7458787.1792668082.git.mst@redhat.com>
References: <cover.v5.git.mst@redhat.com>
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
In-Reply-To: <cover.v5.git.mst@redhat.com>
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
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    v4->v5:
        document the netns lifetime requirement (sashiko)

 Documentation/admin-guide/sysctl/net.rst | 19 +++++++++
 include/linux/virtio_net.h               | 27 +++++++++++++
 include/net/netns/core.h                 |  1 +
 net/core/dev.c                           |  7 ++++
 net/core/net_namespace.c                 |  1 +
 net/core/sysctl_net_core.c               | 50 ++++++++++++++++++++++++
 6 files changed, 105 insertions(+)

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
index 52852a33a2db..cea70ccf0ed4 100644
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
@@ -78,6 +79,20 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
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
+ * The caller must keep the netns of skb->dev alive.
+ */
+static inline bool virtio_net_hdr_validate_disabled(struct sk_buff *skb)
+{
+	return static_branch_unlikely(&virtio_net_hdr_validate_disabled_key) &&
+	       !READ_ONCE(dev_net(skb->dev)->core.sysctl_virtio_net_hdr_validate);
+}
 
 /* Where does the L3 header start, and what protocol is it?
  * Handles Ethernet and VLAN headers; other devices use the
@@ -189,6 +204,12 @@ virtio_net_csum_partial_ok_at_offset(struct sk_buff *skb, u8 hdr_gso_type,
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
 
@@ -231,6 +252,9 @@ virtio_net_csum_partial_ok(struct sk_buff *skb, u8 hdr_gso_type)
 	int nhoff;
 	__be16 proto;
 
+	if (virtio_net_hdr_validate_disabled(skb))
+		return true;
+
 	if (!virtio_net_l3_start(skb, &nhoff, &proto))
 		return false;
 
@@ -522,6 +546,9 @@ virtio_net_tnl_offsets_ok(struct sk_buff *skb, bool outer_isv6,
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

