Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332B3B27F4
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326537; cv=none; b=fBFhUMpxQKPo5333TwJjBDhPgX4fmIIiBsOw72cExHFC5ybRhvApwRHqWD6kPYUabl/3iR0EgcDb1sYkc0fjYgqU0P7l0nIxdy4zpEHrIjKPfgG61YbxMpyhYcJq49hvwI5+kqN6RYgya4kjuqH/SzQnKM/3kYfAlpzx5HvpPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326537; c=relaxed/simple;
	bh=mHaCExpqq/Y7fEbbmhobTh33ojfO5o1xv6vpAgO1dIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnHJurKkw6a09bj/c9zcMKhpoeiGV5962W6cyRs8CxeDPl6i+aUWQPUuVeCBn/CuI/vjjE23pbRwYZjE6nqjbmtd5EvReE6uBkD020k0purtGTIh1k17ttn4GdxJ2jfEr7EdIFVnvPe5v/iViTXOtgPFqvpBTFxb01QTP31rGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=PmcVPaqO; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="PmcVPaqO"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8244537ab76so621000a34.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2026 15:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791326484; x=1791931284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MT8LFBKbAblU1rf6rEhd8LliNpbGxLMtyrIqhKh9Xu4=;
        b=PmcVPaqOxNuMXcURDkSvZCzg3UTHqUZEvL89vLJpRr6DKhGoBqmhT3tp6o8WAFHeSk
         Uhv46yQmacdTm8t4KbWWqa3+bOaB34na6S35Xbu3Av56kKacV7AUQU6z8jH19dRNVPcb
         9XxXaPAhL2bwMwlF4QXvnF9/D393jY+skNPIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326484; x=1791931284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MT8LFBKbAblU1rf6rEhd8LliNpbGxLMtyrIqhKh9Xu4=;
        b=OqLm23z90ULte/z/U6TqNZ20RfRA4soz126yBkQT/kWtnsoMfGaez+1xpVoN4Zeuii
         /ts0BWLizHCClvwZfcjHYQoLR5QyAkHRiM9W0maIUtidmlfkou7YV9u2f0+2jdO6mchu
         KrkVyqPU0KWXHYXHf/+SiWPLBZwo4PodjaLqUvI8RjTwT1HTtMmZIbO9BbH/l5+3wsXH
         cBxWhPncuEN0RktjjmVU9cpLUCJQZ2kMWVofnFnr88g9dgXoiXUmmS2a305iMAZ5dS4g
         oBxSoXDB4qcaBUC0fyG20hEanDpwGe6k2CSh7W7d6m2w6dBheiar7PtIgeqgtHJADxPr
         D+YQ==
X-Gm-Message-State: AFuF++mJL2eWgxvTUILd+MQrZOPZpbgK0CIn0kqjA+Zq5A9OD/YmBFsx
	+VrE15mbul66vdpVTxxnXlCmtP2cB/ZNx0NcZ9oPhHhozz85Qs2Vas+Yq2ShEEXf5Fo=
X-Gm-Gg: AYBFou2IpeRGlOT595wmeuJM3UGn2boSwTBclkTGRRDjPaq4X7cXUhdHFaUrr9iBdPY
	d1xeVIBYxVEkBlsFfNMgG8EEXCNjbnG9ShCk/k+Nm35scCDEy4PO0gtbmGt6c3A2VBVu8x0tsg1
	4zH9oEUrPgsVbZ8C4EmupIiBykLTAgYO1Fm12fN+H9LIR/SvedRY/eP4GU/1lmjNXtWabsgj2my
	A/+2YdIra7RZOE2H2K7MLe9uQoxGUxpNMvHl++BaWzMixz3OKdQaUQzI+4eHAGQg51rmJDeuJXJ
	QZFHsEKCLTDd9RMU4emg+45GEwIFlYBRulcSMqb48xDgfv3N9j9xu2mkdVcyGMruHLTB+m3uTK/
	84s/w8y+A6sH3GByBTG8B2+fe5Z8a4WNwZcHyxV006WN3Jcp//CF/uyawA5cJ01Rgit1OadNGUg
	4HuF3SqPRHwKntduL1UfzzKLEh4XehpjcimyK57bErPqwYj1N51+JaNfcbvRy4Y78wiKQMGru32
	BL7mivcqFtKJhvIWyOSpWcRWhmhLZfZgOS0EaBw+4DvVMexQQVlz50iKHlHg9gohkQaD/oYYG7F
	qd6SURsVPyg=
X-Received: by 2002:a05:6808:f93:b0:4b9:a88b:8892 with SMTP id 5614622812f47-4fc46373d6emr765933b6e.40.1791326483877;
        Tue, 06 Oct 2026 15:41:23 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc49a7594bsm577379b6e.17.2026.10.06.15.41.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:41:23 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH net] neighbour: stop using device addresses in hashes
Date: Tue,  6 Oct 2026 15:41:18 -0700
Message-ID: <20261006224118.50200-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTM_GETNEIGHTBL exposes the live hash multiplier and bucket mask. For
ARP, that multiplier is applied to the IPv4 key XOR hash32_ptr(dev).
Since hash32_ptr() merely folds the address, timing chosen-key misses
through the unprivileged SIOCGARP ioctl can reveal the folded address
of the loopback net_device. NDISC uses the same address-dependent
first hash term.

Give each net_device an independent random neighbour hash discriminator
at allocation time and use it in both protocol hashes. Keep it immutable
so that lookups, insertion and rehashing agree even if the device's
ifindex or network namespace changes. This retains the cross-namespace
hash distribution that motivated using the device pointer, without
putting a kernel address into the observable hash. A dedicated value
also avoids making a salt used by unrelated network hashes observable.

The existing NDTA_CONFIG fields and neighbour key comparisons can stay
unchanged. Update the net_device cacheline documentation and assertions
for the new read-mostly field.

Fixes: b14f243a42c7 ("net: Dont use ifindices in hash fns")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 Documentation/networking/net_cachelines/net_device.rst | 1 +
 include/linux/netdevice.h                              | 2 ++
 include/net/arp.h                                      | 3 +--
 include/net/ndisc.h                                    | 3 +--
 net/core/dev.c                                         | 4 +++-
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 512f6d6fa3d8f8b4a861b87b1b2d5f8c4156d6cf..f6e8e7522ea73e25f0eea304fef5676c3be57c8a 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -30,6 +30,7 @@ xdp_features_t                      xdp_features
 struct net_device_ops*              netdev_ops                  read_mostly                             netdev_core_pick_tx,netdev_start_xmit(tx)
 struct xdp_metadata_ops*            xdp_metadata_ops
 int                                 ifindex                                         read_mostly         ip6_rcv_core
+u32                                 neigh_hash_mix              read_mostly         read_mostly         arp_hashfn,ndisc_hashfn(tx/rx)
 unsigned_short                      gflags
 unsigned_short                      hard_header_len             read_mostly         read_mostly         ip6_xmit(tx);gro_list_prepare(rx)
 unsigned_int                        mtu                         read_mostly                             ip_finish_output2
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 87cafc932e9e6584405821a87be0e31e0fc65b77..b7fd5c40bb7831f403c4558e2fcdacad50b8cdd8 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1878,6 +1878,7 @@ enum netdev_reg_state {
  *				disabled together with the latter.
  *
  *	@ifindex:	interface index
+ *	@neigh_hash_mix: Immutable per-device random salt for neighbour table hashing
  *	@group:		The group the device belongs to
  *
  *	@stats:		Statistics struct, which was left as a legacy, use
@@ -2209,6 +2210,7 @@ struct net_device {
 	enum netdev_stat_type	pcpu_stat_type:8;
 	netdev_features_t	features;
 	struct inet6_dev __rcu	*ip6_ptr;
+	u32			neigh_hash_mix;
 	__cacheline_group_end(net_device_read_txrx);
 
 	/* RX read-mostly hotpath */
diff --git a/include/net/arp.h b/include/net/arp.h
index e8747e0713c79f6f4934bb8474498f59cc5b189c..f32d2318ba08353e5c0f31479d102043a9d8127a 100644
--- a/include/net/arp.h
+++ b/include/net/arp.h
@@ -4,7 +4,6 @@
 #define _ARP_H
 
 #include <linux/if_arp.h>
-#include <linux/hash.h>
 #include <net/neighbour.h>
 
 
@@ -13,7 +12,7 @@ extern struct neigh_table arp_tbl;
 static inline u32 arp_hashfn(const void *pkey, const struct net_device *dev, u32 *hash_rnd)
 {
 	u32 key = *(const u32 *)pkey;
-	u32 val = key ^ hash32_ptr(dev);
+	u32 val = key ^ dev->neigh_hash_mix;
 
 	return val * hash_rnd[0];
 }
diff --git a/include/net/ndisc.h b/include/net/ndisc.h
index 9e5379ad2d8e004e1c6be2ed6b37aaf4fb55d553..ab9c7750052e8ffc53fe1c9b69f27cb239b4e4c4 100644
--- a/include/net/ndisc.h
+++ b/include/net/ndisc.h
@@ -54,7 +54,6 @@ enum {
 #include <linux/types.h>
 #include <linux/if_arp.h>
 #include <linux/netdevice.h>
-#include <linux/hash.h>
 
 #include <net/neighbour.h>
 
@@ -346,7 +345,7 @@ static inline u32 ndisc_hashfn(const void *pkey, const struct net_device *dev, _
 {
 	const u32 *p32 = pkey;
 
-	return (((p32[0] ^ hash32_ptr(dev)) * hash_rnd[0]) +
+	return (((p32[0] ^ dev->neigh_hash_mix) * hash_rnd[0]) +
 		(p32[1] * hash_rnd[1]) +
 		(p32[2] * hash_rnd[2]) +
 		(p32[3] * hash_rnd[3]));
diff --git a/net/core/dev.c b/net/core/dev.c
index f660fccfc0dbc56d7e1a9643525229b278bca547..d6922b4ee64fe0fe60896a8ce69cf90bf174a156 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -12131,6 +12131,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 		return NULL;
 
 	dev->priv_len = sizeof_priv;
+	dev->neigh_hash_mix = get_random_u32();
 
 	ref_tracker_dir_init(&dev->refcnt_tracker, 128, "netdev");
 #ifdef CONFIG_PCPU_DEV_REFCNT
@@ -13353,7 +13354,8 @@ static void __init net_dev_struct_check(void)
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, hard_header_len);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, features);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, ip6_ptr);
-	CACHELINE_ASSERT_GROUP_SIZE(struct net_device, net_device_read_txrx, 46);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_txrx, neigh_hash_mix);
+	CACHELINE_ASSERT_GROUP_SIZE(struct net_device, net_device_read_txrx, 50);
 
 	/* RX read-mostly hotpath */
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_rx, ptype_specific);
-- 
2.53.0

