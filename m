Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB4346E44
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464905; cv=none; b=Bm4gK6wtVCZ5kDoWY8H9iQY3oxM3HAan92wd406pGGuGmGCLspKqFeBffiLz7lD37K2Ft3k7lf+fh1k7nMYiJhAnkToAXTySIeKjzv7WMhjnt847uw6sjiFSgsEPKDHnOljiIIbpUhtojtPU2BYhiWoZZ1WcxL0Muzxsz2OimFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464905; c=relaxed/simple;
	bh=b8sFbw841ABDM/YvW+A5q1quL9eC9jTXk/6WhyKFw9U=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=ExK4MCZpO6sRfNmJpGiCNxh++fIFSaLs4KLNMko+JwkwoZHfEi5Yn4Tjkxt6FEE8ijxRpAVPmPulmkH9UhCb3ici7BboixbMPtqA0K0+hZ/H4iJzq38rYNIZYFezicVWyFcJwdkzSIKEcemACsMA5rD7tbtXUYnwI9NgNaa4rys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HhGzqOW1; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HhGzqOW1"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260707225455epoutp03064f68bb81b27f8fbb9f2c159b8d8ac2~AI99xpupf0894408944epoutp03A
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 22:54:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260707225455epoutp03064f68bb81b27f8fbb9f2c159b8d8ac2~AI99xpupf0894408944epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783464895;
	bh=L/s6Gk379gIrLO0+Fxt0VgNVNOBKqPfsig6TjrNo11Y=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=HhGzqOW1x/vS2s7e1EgIu/rRKReg99JcP9xq/+LM7N7quhOedL5qMXjodLM0dEopS
	 D1vzWI//b818Yo8xtt1c8mpgEE0v8YEaCKgQfGVjPk7MWdOSxWrHy7C60bA80HzGep
	 0Td/M93mypJBDgE5nQ6+R0WV+c9m/5IfDOgVRenI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260707225454epcas2p226f4c419f00a58a752f0a36fb39f8305~AI99JzSEy2736727367epcas2p2a;
	Tue,  7 Jul 2026 22:54:54 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.202]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gvxPp0Lsxz6B9m5; Tue,  7 Jul
	2026 22:54:54 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH v2 2/2] f2fs: introduce gcless mount option to avoid
 foreground GC
Reply-To: yonggil.song@samsung.com
Sender: Yonggil Song <yonggil.song@samsung.com>
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
	<chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, Seokhwan Kim
	<sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p8>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260707225453epcms2p4f8323f4f8b88f3ee892cddc126da51a6@epcms2p4>
Date: Wed, 08 Jul 2026 07:54:53 +0900
X-CMS-MailID: 20260707225453epcms2p4f8323f4f8b88f3ee892cddc126da51a6
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87
References: <20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p8>
	<CGME20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p4>

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
v2:
 - split out the BIT_ULL() conversion for mount option bits into a
   preparation patch, fixing the 32-bit shift-count-overflow warning
   reported by kernel test robot <lkp@intel.com>
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
index 20a1e2353f60..a2a85eaa636d 100644
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
index 62d3a58cb1b2..07c7d88719a6 100644
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
-- 
2.43.0

