Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300034;
	b=wTNUVWoSTgwFdhtXVmvmIwPZPgtw9pB9UwTnJEVNVTuFGHRU1gOq5OYLFYR3xzhuqOIz
	 DSxRPmm/3fxNp8g2ju1fp53Jif2Zo2fJqL3hRPdkZukYeavoSKB5O/ImKceIYopSO0LaS
	 zMb6ADQN8PmyQ1AR9dMt5n3xVTSeX8GcmH0vh6Rn7Dp/Zk6t3v5nZE95aNb/xGX6d1Zg/
	 vuzLOIai3hRR4EYh8HTyOLPJALs9VKsoPqioRiLljs3/hJxZumjF7C+p+9C/I5CbWv3w9
	 o7vJEf39grZMsmp0BSSD/PWCJAtaM/Be7rEcCITAA3EbHRB4DplUsarYkBvyDGiOd1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300034;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=bUVveIwGFo4/gN+IS0wmxK6pE4j+UVKCdppm7YRvY+E=;
	b=MvuEFYxmoai/aYRZM7ytoUSVtHQ2Bhn8qYN1e0+bn/3I5P3s9gyBk24/SbU+8Za6USBs
	 NkMCfzmIbNvFKqjIsam97thrKOEq5Meo11XOGc8ktF3ygN4miDY0m4akh4xVPviOoEzui
	 64sU3fMQ1HxI9Pc3CJxm1bTL5A8UQPOjcBCZ9QSmhQ9yk06uzZC2YqzRdt/EnYnVYOePb
	 sX5u4oJohjDq6Du8poEcS243o+I6EfVnoVjWsgdtyM7RaapDOV6l0E4/IOyIvJEUlQpYG
	 MG/qO/YU46HKrmwHC/+J8IyNtZNLk9Gt/CnXqR/wtV1AvFlmXZAPPaD/Zd0Z2RQZBIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W6oBMVi7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W7m8afxz;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ACB606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 18:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07ACB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W6oBMVi7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W7m8afxz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793300033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUVveIwGFo4/gN+IS0wmxK6pE4j+UVKCdppm7YRvY+E=;
	b=W6oBMVi7it7W1g5QDhBpO6q9Njm7x0+PMTnlfk5d3dSt/2EPqfA/kxgE/O0f0/LZSOloG1
	bdFDdCw8NGOIwfaTHTJbz0EgsmzDz4Qxrz4yeW8otD2RBL8dl7hBstlPN9LTN2DAGT1Dgq
	Bxu61CyR6Rak2L3G0/YwTsZknSQV6bc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-SIpEEbbNP3C2RlFNP2dMhA-1; Thu, 29 Oct 2026 14:53:46 -0400
X-MC-Unique: SIpEEbbNP3C2RlFNP2dMhA-1
X-Mimecast-MFC-AGG-ID: SIpEEbbNP3C2RlFNP2dMhA_1793300025
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so1542999f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793300025; x=1793904825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUVveIwGFo4/gN+IS0wmxK6pE4j+UVKCdppm7YRvY+E=;
        b=W7m8afxzvrleQUtFz73iSTXIaMLH+b/2oVZRkHaC23QvQhwyGbz4MMIv1EJG0npheQ
         FSYWUrs9KtHNyWuDxJQAoPPUplAvxRtK5TGMsK5M/BAePbJeaOCczS1JoEiDbcTC72Xz
         eLtxSINNwSE7EyxUqf51loMYVbVAZU0QN8UtiVmw2S9rAP4omh7sWKpYGQK3TJwVXiW3
         dp2L3Mn/Wn9MleNtS4+D35pLx69KakGRQ3g5Wv5ThlTiAukBMJxSE3FwB1U1tL1nBHFU
         S+YyQGjHMTX/Y2+5EUrWH+lQFn5X5gUoomaC/aYBtdhPzaJV7EshzBHRJu7FO5ihAqKQ
         XuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300025; x=1793904825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bUVveIwGFo4/gN+IS0wmxK6pE4j+UVKCdppm7YRvY+E=;
        b=x/iDvXMFi1QbVY8BmO2KhC3TziIJwCIEAlCcvnV30T69C0TLDRtrL1naXOK0PoSfgD
         CCGvNWCojmXLCQBwrP0U6jLQTqXS8IuGJGnSS69oR4gVhp5gycXCF77Gp1JhT7NXCT+J
         9H0hg0f9dXiMI1MB6qCPCHYSjdrQ9dkUcq84hTFd3PosLI4eljHNGgo0eSstEfBuRIay
         AIkBuQgPTczgPm60hwr7iCLjvMifCtJhghHiVb/LxHBKRgWysk9RIVOBGIlOUuOOLk8f
         0QAcKsTBlOPmpVdoyG9RvfksKjdGEuvfkKwda1goGiK2YUDQGpP390stSiPDW3REXyrA
         cwcA==
X-Forwarded-Encrypted: i=1; AKwUvBzQLq/y4anWuxjqDNNVjWjKBlrg2UzK0b3eUCo105YVO28bFXQImnbfQwVk0Gh1EpMwPJZu9ru6ofU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhhK6lUPewI01eLLJKActl0NOMFFSaoKzP8foK4oEnIwBQoy3f
	7MSstSC7q2vy2/sfQZTa3z8iDAzbUTg96GdVCS9/6nmRM28v9DbFfQ0kZE/UeZkH5DAJZbzEcFk
	SmoqDgG5+1wfy4oMlgmkIYK/boTk2UaZKBBQkCNkblfqpSIRF148+9Cp/xwwLMw==
X-Gm-Gg: AYBFou0lyWCDnZv++r8kwpMByHVNHPP3wDOMNWGxYoRbx2mPPP8kdiy8Vp8RkM0GJTr
	vVjB4klhAWT80wW+kIiyNeAWakiAShPhyPZTULgfXxcsUEpdHJpBdZtWvaiRgBBcF9yMy8bA1zj
	5QNZNw795Xnp6HWPCfPP7a9vovOKF8wusBTl6CRcC8aZC/VCWMHLSgls07db4vanEYrZUOVuSeQ
	hN3dPbSHFWYW4lPUF4dB4SQzaa7yg8oSZAuzmOfCXg8XFyIakI0ABO5a/8b7Y5hLL9JVyvQmA66
	0XCOa/Hr8QSFRmoJoh7raeV/Wf/u35BrI4m/MMdOAW+Ep203p4g3eUKReISsSlGGiWbJIT4PagM
	fFF+I1VoGgAUDjUzpgsjy/ah8ervcjWj+MH0V7LcEp2ER
X-Received: by 2002:a05:600c:4e44:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4a967f84817mr142656915e9.29.1793300024497;
        Thu, 29 Oct 2026 11:53:44 -0700 (PDT)
X-Received: by 2002:a05:600c:4e44:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4a967f84817mr142656575e9.29.1793300023931;
        Thu, 29 Oct 2026 11:53:43 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eba32c1sm182535f8f.58.2026.10.29.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:53:42 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:53:38 -0400
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
Subject: [PATCH RFC v7 5/5] net: add a sysctl to opt out of virtio net hdr
 checksum validation
Message-ID: <7ff59e838eba4b63768327dfe553d6d9cac6afbf.1793276116.git.mst@redhat.com>
References: <cover.1793276116.git.mst@redhat.com>
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
In-Reply-To: <cover.1793276116.git.mst@redhat.com>
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
index fe43e8595958..3d89772cb7fe 100644
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
index 54048759cc6e..b2bd5ab3fdb6 100644
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
@@ -87,6 +88,18 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
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
@@ -200,6 +213,12 @@ virtio_net_csum_partial_ok_at_offset(struct sk_buff *skb, u8 hdr_gso_type,
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
 
@@ -242,6 +261,9 @@ virtio_net_csum_partial_ok(struct sk_buff *skb, u8 hdr_gso_type)
 	int nhoff;
 	__be16 proto;
 
+	if (virtio_net_hdr_validate_disabled(skb))
+		return true;
+
 	if (!virtio_net_l3_start(skb, &nhoff, &proto))
 		return false;
 
@@ -533,6 +555,9 @@ virtio_net_tnl_offsets_ok(struct sk_buff *skb, bool outer_isv6,
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
index 87a79d6004c8..960c97980544 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -128,6 +128,7 @@
 #include <linux/if_vlan.h>
 #include <linux/ip.h>
 #include <net/ip.h>
+#include <linux/virtio_net.h>
 #include <net/mpls.h>
 #include <net/route.h>
 #include <linux/ipv6.h>
@@ -2427,6 +2428,12 @@ EXPORT_SYMBOL(tcf_sw_enabled_key);
 
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
index 473c162736d6..04cd2d758ccc 100644
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
@@ -693,6 +695,43 @@ static struct ctl_table net_core_table[] = {
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
@@ -752,6 +791,15 @@ static const struct ctl_table netns_core_table[] = {
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
@@ -856,6 +904,8 @@ static __net_exit void sysctl_core_net_exit(struct net *net)
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

