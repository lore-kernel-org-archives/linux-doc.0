Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F83C277E
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318861; cv=none; b=RI9SFQ4znWYvewrEFPDFDVUPLqAUmczSBF0kwoul7qcuKMthiAh2BB6E7wZdjgSafHxbfDUFcHhI+C/HSzIek/VD51mz2x200zn1Eh+j4y2cLT9Z/eh/JpNbVg+gNtC3tA3z/kjuZGeRfLMjox/cq8C69rgIlh8UXv6xBR66++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318861; c=relaxed/simple;
	bh=pR618ztvTzUuiWNktevlQpbgRTLtdl8bAlVCkG2JGXs=;
	h=Mime-Version:Subject:From:To:CC:Message-ID:Date:Content-Type:
	 References; b=dVFNwIqYzibswWvbN8QXxBMqetFi8JURMUa6WvaKvOwgt9uIiyV44YKXmALbUv1En31fa2VIErxaOB+Xggx9KFYdpl1lQgPefViNZinNDDGvhBAgzSQXF5wHrOckRgq7AEfS72Bhv8Ge0DMD0fW7mnsYSZP8UQrdFft88H1iJrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=g5yvQQcx; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="g5yvQQcx"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260706062044epoutp01a9c0eec36cab8f04d140941e7e30d204~-nwpxU8Cj2054020540epoutp01S
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 06:20:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260706062044epoutp01a9c0eec36cab8f04d140941e7e30d204~-nwpxU8Cj2054020540epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783318844;
	bh=cVLVCnrPBN8gwd7UF03YbdGliMI2z6LiM3CW6zFI3rI=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=g5yvQQcxCLJingVzRnNeHfUPYqbPArp+2Iybt3O6uSy4VeT8KUro76cqMr5SdF/XA
	 hGclvskMig+7tsMAGe15Z4j/tL4w6jw6xu00QuYaNxWhlmAFnmo1teXGWksgesy/2P
	 5t8Le9Nyy1zX1sL+H1OBwHAuFxq5RG8P0QxQDCqs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260706062044epcas2p3e09a282cb2a524bc1cf7fd3aed36d042~-nwpZQfy32270322703epcas2p3I;
	Mon,  6 Jul 2026 06:20:44 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.210]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gtvP76ftKz3hhTF; Mon,  6 Jul
	2026 06:20:43 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH] f2fs: introduce gcless mount option to avoid foreground GC
Reply-To: yonggil.song@samsung.com
Sender: Yonggil Song <yonggil.song@samsung.com>
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
	<chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
CC: Yonggil Song <yonggil.song@samsung.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
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
Message-ID: <20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>
Date: Mon, 06 Jul 2026 15:20:43 +0900
X-CMS-MailID: 20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe
References: <CGME20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>

Under heavy out-of-place overwrite at near-full utilization, foreground
GC picks nearly-fully-valid victims and relocates almost every block,
while the scattered invalid space is not SSR-reusable until a checkpoint
stabilizes it.  WAF explodes even though reclaimable space exists.

Add a "gcless" mount option that counts checkpoint-stable invalid blocks
(invalid as of the last checkpoint, hence SSR-reusable) and credits them
as free sections in has_not_enough_free_secs().  The watermark then sees
the slack as free, so f2fs_balance_fs() skips foreground GC and
allocation reclaims the space through SSR instead.  The count is
recomputed at mount and after each successful checkpoint under
block_operations(), where it is exact and needs no locking.

The option is limited to adaptive (non-LFS) mode.

8 GiB UFS, 2 GiB random overwrite at 99% utilization:
  baseline: WAF 76.7, foreground GC calls 578k
  gcless:   WAF  1.2, foreground GC calls 504

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 Documentation/filesystems/f2fs.rst |  8 +++++
 fs/f2fs/checkpoint.c               |  1 +
 fs/f2fs/debug.c                    |  4 +++
 fs/f2fs/f2fs.h                     | 12 ++++++++
 fs/f2fs/gc.c                       |  5 ++--
 fs/f2fs/segment.c                  | 47 ++++++++++++++++++++++++++++++
 fs/f2fs/segment.h                  | 15 ++++++++++
 fs/f2fs/super.c                    | 17 +++++++++++
 8 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 7e4031631286..05ac3f76bfba 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -409,6 +409,14 @@ lookup_mode=%s		 Control the directory lookup behavior for casefolded
 					        on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
 					        flag.
 			     ================== ========================================
+gcless			 Avoid foreground GC by crediting checkpoint-stable invalid
+			 blocks (invalid at the last checkpoint and thus SSR-reusable)
+			 as free space in the free section watermark, so allocation
+			 recycles that slack via SSR instead of relocating valid
+			 blocks. Intended for heavy out-of-place overwrite at
+			 near-full utilization, where it reduces write amplification.
+			 Not allowed in LFS mode (including zoned block devices),
+			 by default it's disabled.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 01e1ba77263e..0d83e90b583c 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1932,6 +1932,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		f2fs_release_discard_addrs(sbi);
 	} else {
 		f2fs_clear_prefree_segments(sbi, cpc);
+		f2fs_update_cib(sbi);
 	}
 
 	f2fs_restore_inmem_curseg(sbi);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index af88db8fdb71..b1435e01447d 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -285,6 +285,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	for (i = 0; i < MAX_CALL_TYPE; i++)
 		si->cp_call_count[i] = atomic_read(&sbi->cp_call_count[i]);
 
+	si->cib_total_blocks = READ_ONCE(sbi->cib_total_blocks);
+
 	for (i = 0; i < 2; i++) {
 		si->segment_count[i] = sbi->segment_count[i];
 		si->block_count[i] = sbi->block_count[i];
@@ -623,6 +625,8 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - Total : %4d\n", si->nr_total_ckpt);
 		seq_printf(s, "  - Cur time : %4d(ms)\n", si->cur_ckpt_time);
 		seq_printf(s, "  - Peak time : %4d(ms)\n", si->peak_ckpt_time);
+		seq_printf(s, "GCless CIB budget : %u blocks\n",
+			   si->cib_total_blocks);
 		seq_printf(s, "GC calls: %d (gc_thread: %d)\n",
 			   si->gc_call_count[BACKGROUND] +
 			   si->gc_call_count[FOREGROUND],
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e40b6b2784ee..51c615724cf5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -137,6 +137,7 @@ enum f2fs_mount_opt {
 	 * string rather than using the MS_LAZYTIME flag, so this must remain.
 	 */
 	F2FS_MOUNT_LAZYTIME,
+	F2FS_MOUNT_GCLESS,
 	F2FS_MOUNT_RESERVE_NODE,
 };
 
@@ -1870,6 +1871,15 @@ struct f2fs_sb_info {
 
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
+	/*
+	 * Checkpoint-stable invalid blocks: sum of blocks that were invalid at
+	 * the last checkpoint and are thus SSR-eligible while their section stays
+	 * dirty.  Written only by f2fs_update_cib() (mount and after each
+	 * successful checkpoint, under block_operations()), read locklessly, so a
+	 * plain block_t with READ_ONCE()/WRITE_ONCE() suffices -- no atomic.
+	 */
+	block_t cib_total_blocks;
+
 	/* for cleaning operations */
 	struct f2fs_rwsem gc_lock;		/*
 						 * semaphore for GC, avoid
@@ -4000,6 +4010,7 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_check);
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
 void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
+void f2fs_update_cib(struct f2fs_sb_info *sbi);
 block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
 int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
 void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
@@ -4289,6 +4300,7 @@ struct f2fs_stat_info {
 	int dirty_count, node_pages, meta_pages, compress_pages;
 	int compress_page_hit;
 	int prefree_count, free_segs, free_secs;
+	block_t cib_total_blocks;
 	int cp_call_count[MAX_CALL_TYPE], cp_count;
 	int gc_call_count[MAX_CALL_TYPE];
 	int gc_segs[2][2];
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e60c1106f70b..ebf47ef5fff0 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1964,10 +1964,11 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		 * threshold, we can make them free by checkpoint. Then, we
 		 * secure free segments which doesn't need fggc any more.
 		 */
-		if (prefree_segments(sbi)) {
+		if (prefree_segments(sbi) || test_opt(sbi, GCLESS)) {
 			stat_inc_cp_call_count(sbi, TOTAL_CALL);
 			ret = f2fs_write_checkpoint(sbi, &cpc);
-			if (ret)
+			if (ret ||
+			    (test_opt(sbi, GCLESS) && has_enough_free_secs(sbi, 0, 0)))
 				goto stop;
 			/* Reset due to checkpoint */
 			sec_freed = 0;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 788f8b050249..e020714261ff 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -305,6 +305,53 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
 		f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
 }
 
+static inline u32 cib_contrib_of_se(struct f2fs_sb_info *sbi, unsigned long seg)
+{
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	struct free_segmap_info *free_i = SM_I(sbi)->free_info;
+	struct seg_entry *se = get_seg_entry(sbi, seg);
+	u32 usable = f2fs_usable_blks_in_seg(sbi, seg);
+	u32 ckpt_v = se->ckpt_valid_blocks;
+
+	/* free, prefree and current segments hold no reusable SSR slack */
+	if (test_bit(seg, free_i->free_segmap))
+		return 0;
+	if (test_bit(seg, dirty_i->dirty_segmap[PRE]))
+		return 0;
+	if (is_curseg(sbi, seg))
+		return 0;
+	if (ckpt_v >= usable)
+		return 0;
+
+	return usable - ckpt_v;
+}
+
+/*
+ * Recompute the checkpoint-stable invalid-block budget by scanning all main
+ * segments via ckpt_valid_blocks (free/prefree/current segments contribute
+ * nothing).  Called at mount and after every successful checkpoint, both under
+ * block_operations(), so it is the only writer and needs no atomic; readers use
+ * READ_ONCE().  ckpt_valid_blocks is fixed between checkpoints, so the value is
+ * exact at each checkpoint -- gcless checkpoints often enough to keep it fresh,
+ * which is why no per-allocation delta hooks are needed.
+ */
+void f2fs_update_cib(struct f2fs_sb_info *sbi)
+{
+	unsigned long nsegs = MAIN_SEGS(sbi);
+	unsigned long seg;
+	block_t total = 0;
+
+	if (!test_opt(sbi, GCLESS)) {
+		WRITE_ONCE(sbi->cib_total_blocks, 0);
+		return;
+	}
+
+	for (seg = 0; seg < nsegs; seg++)
+		total += cib_contrib_of_se(sbi, seg);
+
+	WRITE_ONCE(sbi->cib_total_blocks, total);
+}
+
 static int __f2fs_commit_atomic_write(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 068845660b0f..3226930d759a 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -702,6 +702,21 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 	free_secs = free_sections(sbi) + freed;
 	required_secs = needed + reserved_sections(sbi) +
 			__get_secs_required(sbi);
+	/*
+	 * Credit the checkpoint-stable invalid-block budget (SSR-reusable slack)
+	 * to free_secs, so the watermark lets allocation recycle that slack via
+	 * SSR instead of running foreground GC.  cib_total_blocks is a section/
+	 * block count (always non-negative), so the math stays in unsigned int and
+	 * is capped at the sections still unaccounted for.
+	 */
+	if (test_opt(sbi, GCLESS)) {
+		unsigned int sec_blks = CAP_BLKS_PER_SEC(sbi);
+		unsigned int add_secs = READ_ONCE(sbi->cib_total_blocks) / sec_blks;
+		unsigned int room = free_secs < MAIN_SECS(sbi) ?
+					MAIN_SECS(sbi) - free_secs : 0;
+
+		free_secs += min(add_secs, room);
+	}
 
 	return free_secs < required_secs;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f5..8cb2eb2ce836 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -234,6 +234,7 @@ enum {
 	Opt_jqfmt,
 	Opt_checkpoint,
 	Opt_lookup_mode,
+	Opt_gcless,
 	Opt_err,
 };
 
@@ -336,6 +337,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag("usrquota", Opt_usrquota),
 	fsparam_flag("grpquota", Opt_grpquota),
 	fsparam_flag("prjquota", Opt_prjquota),
+	fsparam_flag("gcless", Opt_gcless),
 	fsparam_string("usrjquota", Opt_usrjquota),
 	fsparam_flag("usrjquota", Opt_usrjquota),
 	fsparam_string("grpjquota", Opt_grpjquota),
@@ -1230,6 +1232,9 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_nat_bits:
 		ctx_set_opt(ctx, F2FS_MOUNT_NAT_BITS);
 		break;
+	case Opt_gcless:
+		ctx_set_opt(ctx, F2FS_MOUNT_GCLESS);
+		break;
 	case Opt_lookup_mode:
 		F2FS_CTX_INFO(ctx).lookup_mode = result.uint_32;
 		ctx->spec_mask |= F2FS_SPEC_lookup_mode;
@@ -1603,6 +1608,13 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		f2fs_err(sbi, "Allow to mount readonly mode only");
 		return -EROFS;
 	}
+
+	/* Only for adaptive mode */
+	if (test_opt(sbi, GCLESS) && f2fs_lfs_mode(sbi)) {
+		f2fs_err(sbi, "gcless is not allowed in LFS mode");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -2542,6 +2554,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).lookup_mode == LOOKUP_AUTO)
 		seq_show_option(seq, "lookup_mode", "auto");
 
+	if (test_opt(sbi, GCLESS))
+		seq_puts(seq, ",gcless");
+
 	return 0;
 }
 
@@ -5344,6 +5359,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto sync_free_meta;
 
+	f2fs_update_cib(sbi);
+
 	/*
 	 * If filesystem is not mounted as read-only then
 	 * do start the gc_thread.

base-commit: cb8ff3ead9a3fc43727980be58c7099506f65261
-- 
2.43.0

