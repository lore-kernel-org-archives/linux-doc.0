Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768190;
	b=M37nAvGx5UrDSZYbCBh8OA3FMeuIo8PjthhbCVHr1LvF3hAH8MTSf9DJ745r1KqGH3YX
	 RXsgqrtVm4FyrY6VpWnh+CALgTnIQEsZaHfp5tJIqIkr/MOEaLO33ocfBtzO1SbVRVDHq
	 qp+CtIjwhVamT3dBjGNJTSMX/P798Sn2U1vY95PQ4Pnvr66OeWJD9+JwHm/XGwQrN/y51
	 XyuJ20n4ty4afbkfT76Y+8SL5K/U5m/1/swvDBD6ugt6WxF1xC/CrOAnzvREFoU2t8NfS
	 rRsTRrjQ8F6/gmRZbL6LNHJ/D5k48fq9/F3DrGntjZIAGDxcDaFhP2Aw8yFb9IiLn2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768190;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=mXloVW6rZxDahnxqb4ykjI1/+DaQ13fITP+bGDCTCpc=;
	b=Qf1JmBiwdtGAgxaSLsqw+/SFS8JI8+9w39/+IsNi0eKf20fs9HKLUvYDKa1RS++tbWHK
	 U9qiPAdrG3Sa3w08eJKYg9qWwezBTDIejM/jdgI3Xhz5QKKm7d+e60LR2vO2WWBlIqF36
	 tDzMjzQvyVkJhLmzvQYUO/W6eF3eFPTwmqmnB4Uk1qWUGmMejD3yTW/g8heoEn8dt5evo
	 Ezb599MjEHmvLJ3PSQj+8aucFwjt5iLLhZ2Eg8fyniVCbFwPMKGrK55VsORfyV3Wcapj5
	 oTBQqLYf2CyexM39Sin+8ju+FJH6voI9KOKVc/tGIvQznVWAjtYi/RH+z9GI8twqoJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GTa+GYQB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ey2p7m4I;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884A60A5BD1
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5884A60A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GTa+GYQB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ey2p7m4I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792768189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXloVW6rZxDahnxqb4ykjI1/+DaQ13fITP+bGDCTCpc=;
	b=GTa+GYQBllQ2SeWAakdN0ndJte3F8GoPV9yma1UPUbGnzPmq+ScZPX/CZynt014MYq8fth
	a9yvz+LTpY1UvpuAFDa1HV+RFkFrfW27083sc1WS07U/DFWqnmkDE/ug1S1FYVD9zBADhk
	9DuxJZSvOXj8+THvc2wNQf9CBXnCi70=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649--WbsnMdJMpWnHxDRBh8PJw-1; Fri, 23 Oct 2026 11:09:47 -0400
X-MC-Unique: -WbsnMdJMpWnHxDRBh8PJw-1
X-Mimecast-MFC-AGG-ID: -WbsnMdJMpWnHxDRBh8PJw_1792768187
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48af4a0bd0fso530890f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792768187; x=1793372987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXloVW6rZxDahnxqb4ykjI1/+DaQ13fITP+bGDCTCpc=;
        b=ey2p7m4Iu1Wj+LocTs1y90QeQ2cmKEQYmN+b+7iOcu1gZU9SxWlfJB8NzqNIMe5f0C
         yD+wi2DnVzh2O406U4q1Hr8HbPDhAXpD0U5xspO20pMsW1FKI/MUeOVmVtDPEiUVwCJ9
         fg77724waFRxYhnBR8n5zrSPRItjHs2pnirA6exxe3s4RAdfwRYYv0mFno8mBDngQuE/
         3GAtRpIP16D1ALVJwxpuKoHTS3nozAGiXCrPv1VFqk6xynSOkOl6Ijt+Z90eZ7ymPqwU
         Aip3sTmhhHDiAeGaueRpneAb7DiVjyEULuDsn+eMDh2O+WnrOgMrZdhPFwdn3xv7xRHT
         oi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768187; x=1793372987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mXloVW6rZxDahnxqb4ykjI1/+DaQ13fITP+bGDCTCpc=;
        b=sepRpPq+UEHr6qsINeJP3f/e8E9rSxTKZonzqFGbGtT53/JxaGTds68h5EG+7fdIlN
         EC2je0DNicK/iG0plJrr/X2/7ggmLhthgX907zq1hP4uN2eksftDdGMekbqgJWfSR225
         3GsKgLHf3el2AvvBKbFYzwyryK4AxBumUmmoxnLhAJ+5PjOsEryTOz78yzmXXF5GRxcA
         eddENO8F8sbvIzIiFeuJRnt8aql1bME8IGEvgixIvhqU2po6rKPZjzalHFc0ASWTNMym
         YdeQKOkt/n0GNK3E+TPrUjiH8jRik7Q4QW19AmX1t0XgesnoiTLSU2xc8T7ZjldYwOoZ
         lhYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA7aSSsHxk5O/VbyKAuG6IsDfYxWFM5Wt6aZGzRY8qhPWOFA2U3KiYvN4mELIEaA+mJ23mq3+3PGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEVR8jxdozRjs2sDNwn3Yp4MOJSgmyu+1qFjRf9o8XDhJvbeSq
	g8aEMK9B8qdJOI1m0lySbEcTbqQAc+2/QOtrxzN91rMfKJU6XttNG2Ouw07F9FBPay0qN7j6Dpj
	Tmi/k5Y4kRw8spAauFVi+bffQGLi+orHefVZJGsaq/RVbBihrxAGh+qzZawz5nA==
X-Gm-Gg: AYBFou3aC0Y5TTAmVEfXP41BiO/EUeQHoUG1Wir3oxbuzv4NKWKk1yJYEbaLU2Dei5J
	mNUz7pH2LEbTt37TpHtDHkq3jKpCyN9jbzkSzEbaCXYouwi3gMchQpR1FQnhnqaLioezGhgw+72
	aVd47lFaTYx4GqZMMWPRk/RkU28ShhGWpYRyZZhtZX7+Yxcncq8ykFNZ4XPxkOE5Tfmw2/nxT2C
	SjJzNCvZtVE45+aKeVXNFEgIGih5NopApdBGu16xUKiBCQ+TCEze/kXs0gftFQtqq1ZgWD03yQv
	p0FsLtTPmkoHjLH6vRUbvMLieuVCV9hoX2N0S376Povp177i76NUgmdJmNiZa7Wrv0iUoQ0=
X-Received: by 2002:a5d:584f:0:b0:48e:261b:a49d with SMTP id ffacd0b85a97d-48e38587cd3mr4057101f8f.15.1792768186319;
        Fri, 23 Oct 2026 08:09:46 -0700 (PDT)
X-Received: by 2002:a5d:584f:0:b0:48e:261b:a49d with SMTP id ffacd0b85a97d-48e38587cd3mr4057050f8f.15.1792768185685;
        Fri, 23 Oct 2026 08:09:45 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d410708sm305580f8f.38.2026.10.23.08.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:43 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:09:41 -0400
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
Subject: [PATCH net v6 5/5] net: add a sysctl to opt out of virtio net hdr
 checksum validation
Message-ID: <a631141eaf64501420583332af5d97d2641a8d98.1792768096.git.mst@redhat.com>
References: <cover.1792768096.git.mst@redhat.com>
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
In-Reply-To: <cover.1792768096.git.mst@redhat.com>
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
 include/linux/virtio_net.h               | 25 ++++++++++++
 include/net/netns/core.h                 |  1 +
 net/core/dev.c                           |  7 ++++
 net/core/net_namespace.c                 |  1 +
 net/core/sysctl_net_core.c               | 50 ++++++++++++++++++++++++
 6 files changed, 103 insertions(+)

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
index 14120710d075..c6b5957b3248 100644
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
@@ -85,6 +86,18 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
 	return (struct iphdr *)(skb->data + nhoff);
 }
 
+/* Defined in net/core/dev.c, enabled while any network namespace
+ * has net.core.virtio_net_hdr_validate set to 0.
+ */
+DECLARE_STATIC_KEY_FALSE(virtio_net_hdr_validate_disabled_key);
+
+/*The caller must keep the netns of skb->dev alive. */
+static inline bool virtio_net_hdr_validate_disabled(struct sk_buff *skb)
+{
+	return static_branch_unlikely(&virtio_net_hdr_validate_disabled_key) &&
+	       !READ_ONCE(dev_net(skb->dev)->core.sysctl_virtio_net_hdr_validate);
+}
+
 /* Where does the L3 header start, and what protocol is it?
  * Handles Ethernet and VLAN headers; other devices use the
  * network header offset the caller set up.
@@ -198,6 +211,12 @@ virtio_net_csum_partial_ok_at_offset(struct sk_buff *skb, u8 hdr_gso_type,
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
 
@@ -240,6 +259,9 @@ virtio_net_csum_partial_ok(struct sk_buff *skb, u8 hdr_gso_type)
 	int nhoff;
 	__be16 proto;
 
+	if (virtio_net_hdr_validate_disabled(skb))
+		return true;
+
 	if (!virtio_net_l3_start(skb, &nhoff, &proto))
 		return false;
 
@@ -531,6 +553,9 @@ virtio_net_tnl_offsets_ok(struct sk_buff *skb, bool outer_isv6,
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

