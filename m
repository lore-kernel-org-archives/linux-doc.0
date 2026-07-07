Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36693347500
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464648; cv=none; b=lcwmY1C1kYuaIPRULXi4zdiM8BxDrqaCdFnXdPU4CijjOcK462FDFQNUZrZtcZXn305iPZ+dsApoZlQpZ3k+5fQ289A5HteQoLBDHbT8HhBacd1t7KZ3166qK0LuNUuzGWMMguv7HhNsAAnx8aV6qa5zod0CwrMzze6rOi91pN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464648; c=relaxed/simple;
	bh=CqkfXMX8CcYxgNTGMJrnloxNYaGlSuNBBoJ9+jg/6aA=;
	h=Mime-Version:Subject:From:To:CC:Message-ID:Date:Content-Type:
	 References; b=Vc2yB43k3veKYQxgd+9bURFGm4okZDbPFGdEq6Xh0MsJqNF+f2MqfQLxnkXhgNxdwAxeWmH13EfGen/qJm9k/vkBeX025BwbeJ4+zPi9/97XLA3QFU0Nd20IYAO7eTomf6XBUbPlOMmMeYzsksP796D0nyztTUBBWRW/kmVUeKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iyAts/Sk; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iyAts/Sk"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260707225037epoutp029c0a68186f0d556a61a8b39a0ad66dd4~AI6Nd-5N83177631776epoutp02J
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 22:50:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260707225037epoutp029c0a68186f0d556a61a8b39a0ad66dd4~AI6Nd-5N83177631776epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783464637;
	bh=IEudq681X/1Ew4NuGJGDJlCKidXrN0Ytfz60y12p3wI=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=iyAts/SkHgrdyPReBTO/U5iYLo++9ZqvxPNxw3ARBfrDdxDgm6F2lcdt8OL3B/ah8
	 F/3ax6/pNl4DtqhYy6csRJvANeN8g/pNr410xG65DJVWcZt/zTipGYqF8klr5/RUrv
	 TL/u4JSbXAfxpkx4otI4N7pA5Yrz8yZ9FypTYmgo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260707225036epcas2p185d145828b1d3162ccf75d212de96860~AI6M6v7rc2339923399epcas2p1q;
	Tue,  7 Jul 2026 22:50:36 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.202]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4gvxJr0fzWz2SSKY; Tue,  7 Jul
	2026 22:50:36 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH v2 1/2] f2fs: use BIT_ULL() for mount option bits
Reply-To: yonggil.song@samsung.com
Sender: Yonggil Song <yonggil.song@samsung.com>
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
	<chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
CC: "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Dongjin Kim <dongjin_.kim@samsung.com>,
	Seokhwan Kim <sukka.kim@samsung.com>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p8>
Date: Wed, 08 Jul 2026 07:50:35 +0900
X-CMS-MailID: 20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87
References: <CGME20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p8>

The mount option bitmasks mount_opt.opt and f2fs_fs_context.opt_mask
are unsigned long long, but the bits are manipulated with BIT(), which
is unsigned long.  On 32-bit architectures a 33rd mount option would
shift past the type width, which is undefined behaviour:

  fs/f2fs/f2fs.h:2945:4: warning: shift count >= width of type
  [-Wshift-count-overflow]

Switch test_opt()/set_opt()/clear_opt(), the fs_context helpers and the
direct opt_mask users to BIT_ULL().  No functional change with the
current 32 options; this prepares for adding more.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607071623.ZxOpKv3S-lkp@intel.com/
Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/f2fs.h  |  6 +++---
 fs/f2fs/super.c | 28 ++++++++++++++--------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e40b6b2784ee..20a1e2353f60 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -142,11 +142,11 @@ enum f2fs_mount_opt {
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt &= ~BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt &= ~BIT_ULL(F2FS_MOUNT_##option))
 #define set_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt |= BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt |= BIT_ULL(F2FS_MOUNT_##option))
 #define test_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt & BIT_ULL(F2FS_MOUNT_##option))
 
 #define ver_after(a, b)	(typecheck(unsigned long long, a) &&		\
 		typecheck(unsigned long long, b) &&			\
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f5..62d3a58cb1b2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -416,21 +416,21 @@ struct f2fs_fs_context {
 static inline void ctx_set_opt(struct f2fs_fs_context *ctx,
 			       enum f2fs_mount_opt flag)
 {
-	ctx->info.opt |= BIT(flag);
-	ctx->opt_mask |= BIT(flag);
+	ctx->info.opt |= BIT_ULL(flag);
+	ctx->opt_mask |= BIT_ULL(flag);
 }
 
 static inline void ctx_clear_opt(struct f2fs_fs_context *ctx,
 				 enum f2fs_mount_opt flag)
 {
-	ctx->info.opt &= ~BIT(flag);
-	ctx->opt_mask |= BIT(flag);
+	ctx->info.opt &= ~BIT_ULL(flag);
+	ctx->opt_mask |= BIT_ULL(flag);
 }
 
 static inline bool ctx_test_opt(struct f2fs_fs_context *ctx,
 				enum f2fs_mount_opt flag)
 {
-	return ctx->info.opt & BIT(flag);
+	return ctx->info.opt & BIT_ULL(flag);
 }
 
 void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
@@ -1422,7 +1422,7 @@ static int f2fs_check_compression(struct fs_context *fc,
 			ctx_test_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE))
 			f2fs_info(sbi, "Image doesn't support compression");
 		clear_compression_spec(ctx);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_COMPRESS_CACHE);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_COMPRESS_CACHE);
 		return 0;
 	}
 	if (ctx->spec_mask & F2FS_SPEC_compress_extension) {
@@ -1490,43 +1490,43 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		return -EINVAL;
 
 	if (f2fs_hw_should_discard(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_DISCARD)) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "discard is required for zoned block devices");
 		return -EINVAL;
 	}
 
 	if (!f2fs_hw_support_discard(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_DISCARD)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "device does not support discard");
 		ctx_clear_opt(ctx, F2FS_MOUNT_DISCARD);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_DISCARD);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_DISCARD);
 	}
 
 	if (f2fs_sb_has_device_alias(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_READ_EXTENT_CACHE)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_READ_EXTENT_CACHE)) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
 		f2fs_err(sbi, "device aliasing requires extent cache");
 		return -EINVAL;
 	}
 
 	if (test_opt(sbi, RESERVE_ROOT) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_ROOT)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_RESERVE_ROOT)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_ROOT)) {
 		f2fs_info(sbi, "Preserve previous reserve_root=%u",
 			F2FS_OPTION(sbi).root_reserved_blocks);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_ROOT);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_RESERVE_ROOT);
 		ctx->spec_mask &= ~F2FS_SPEC_reserve_root;
 	}
 	if (test_opt(sbi, RESERVE_NODE) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_NODE)) &&
+			(ctx->opt_mask & BIT_ULL(F2FS_MOUNT_RESERVE_NODE)) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
 		f2fs_info(sbi, "Preserve previous reserve_node=%u",
 			F2FS_OPTION(sbi).root_reserved_nodes);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_NODE);
+		ctx->opt_mask &= ~BIT_ULL(F2FS_MOUNT_RESERVE_NODE);
 		ctx->spec_mask &= ~F2FS_SPEC_reserve_node;
 	}
 

base-commit: cb8ff3ead9a3fc43727980be58c7099506f65261
-- 
2.43.0

