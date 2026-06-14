Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC43C8723
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451352; cv=none; b=HoDqP15FSm5jZNjGoFerMoD2fTbPXpAKWe4Xoajz1neeCyKzKmqKdgD7ZndT1AtAUaH0wVcTkAETgUOHRT1FzNtje/IRxNYh3NlBKUmIqOVvC78fYHau8ZlitG2V7StejEiSIso8/AdeMNlOT9S73tipMr0weJAN4UAMqyy3fX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451352; c=relaxed/simple;
	bh=2qbaxAmOz/03S1z42XWX1DSWpKSGCcUEGVlDXmyaPuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flh5SvoegzJeKJiwqgQGYjKZ2XVOeT+zFVPQPl+gnakgomJP2RI1A4vPoT80sjtmXL1Ho2kO00YoZU+FgtOyeuSwfK9/btaT2TFyLVmN2R7rDd7hhmfHuEatt1IlcguFD+q7G03YX33xrULHbhVpkS2cq5KHyCNWY9XIGAKbKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWv+/YBS; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWv+/YBS"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-13810b63a1aso6017526c88.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451350; x=1782056150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqqqzN/un7modzILRxLhENIMAUsIfINfzYCHz19cABg=;
        b=cWv+/YBSPSeIvdAU1BoQuM+gtlSg7AT0+3ojPVi9jFtgeGdmYtxKaVdo4o5Oi+pP2v
         HIuVyty54eKMuFa/zkhH3Vb59aFydhxxh6Ehzo7grFVYk7g9z3m3wZerm8Eojc+e63W2
         kE9JQbGAKeH8dueSxXzDEn7NFvF49tKisLQN5GQSubgy2n+lg3+b8RbjoaqvGRHjA986
         2LcLXzVz+o27fWnkz0W0t9vYhNJ8+pfhUndsMGPh80p11m4fvl20A/KDBvYxyowCjR7Z
         43j94eqxEq/bq3H11YbvyMP8Csib4T87YxY7y4dNfFX2+Wb6uE3pJU8bnDCjoXYJfRS9
         Eu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451350; x=1782056150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eqqqzN/un7modzILRxLhENIMAUsIfINfzYCHz19cABg=;
        b=G2QxQ6tgzBw8SHWFO0Tt/ctzsfKpY406sTZA67r6nZJSyrN3/fvQxMkFpPueIuHZqa
         tMYtVbu2OQHdfhUGF3xpUPCdDhs/jYBMvctuxxyArOuZbh6MQG6f2KVFI2sTjfNqbN9g
         P7zqcXvgQu1UGk/oxpmYsflK86eLHBI6uqOx0IBcZwJuQZrgiLarCaAbPJRQnSlzKuNK
         z/nQ9cEA9o8Tw54mauj/ffE/62IxFLukZgi9IgJ8+Pt6eZtJtzc3YXUFLG8O27/SxVMM
         WF7L4YpJgAo6Y7IQKv/2Xy+fNLMMcbeRx9ZVKdlmmxsP86+9Ff58lHaA8UVc0zjRowll
         BgYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Nnd7kBWWcNuj8MkDHPcvPnC6hfsWP9M3mXVHMleL3X3o+YW2zm/aM8unISXZ4JFS6ABwSZ4yjf2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsX1OI6PBOGdr7rKij5b6uJAVX14yRw9x7VfATYO1A728wLyC
	jYqb6ofik7INcsXox/EaOYpUE4jGzjUam8SWLLTHQ3Ku0R44VcZCuQkX
X-Gm-Gg: Acq92OGsGMtIJgt2d2f5J2+a+/+u8eXXoDgx/b7SMRdHjSQeYvzBU2x9jVDC9vWlaoC
	Dv2qXKQ8JhcOQ+TyVl+BuMQvAzh7wo2OHHl6NpcK9gSLr3F2Dv3dOH/+BDi4OEAzscEZ1QJ2C32
	PKs0mDumV2o7GShRrztPPXaHRbd62PCdI0ze9VY9iR3IrhRJVPtX0I7uT3pz22vg3FgdlXYDZMW
	bgzr4uDW/cloeEfl7e8J2vc0Z8MSCu8zVYFjQnEWDGeJLsazY5gsJ0/TqOXpu1XgK9LxCfXd8AL
	nAiOq1QCi13gS7ZNNUlobQ7K3+pDgzDBZaOZeBLl217/NFfK9Q8rkez4l0x7HVO5ynG/XFKr8Fc
	jmgwh46tZut8O0NKiSywvAE7C9Wy/ZW28/raWVtlE658sieRNaCcyplxjvZQcUxWTyMoCdfG7AA
	srfqqgQICqqAZWJWugz2VERyRDfUU0QjM51M57yueVVI3t7Y9yyGQ5Gczt0DQ0tC4f+BD7T7Nf8
	g==
X-Received: by 2002:a05:7300:430a:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30820054cf7mr6805219eec.20.1781451349538;
        Sun, 14 Jun 2026 08:35:49 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0849sm12580632eec.7.2026.06.14.08.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:35:48 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sun, 14 Jun 2026 23:35:30 +0800
Subject: [PATCH 2/3] mm/zram: handle swap read/write via swap_ops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-zram-swap-ops-block-register-v1-2-6c1a6639c222@gmail.com>
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
In-Reply-To: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, 
 Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, 
 Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, 
 Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1781451334; l=11858;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=2qbaxAmOz/03S1z42XWX1DSWpKSGCcUEGVlDXmyaPuk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEv+tR5OUe81EegG8ncJ4DaCPM+vw7TUvCH/zkhKES+2dvopJhFxjMgr7FQNErX+193BvZb0LHl
 cthhc3lv8KwE=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

Register zram_swap_ops at module init.  The swap core still batches
folios into a swap_iocb; on flush, zram_swap_submit_write() maps each
folio page to its swap slot index and stores it via zram_write_page()
into the zspool, avoiding one bio per page.

For swap-in, zram_swap_submit_read() walks the same batch.  Without a
backing device, each slot is decompressed with read_from_zspool() while
slot_lock is held and mark_slot_accessed() runs in the same critical
section, so idle writeback cannot take the slot between read and mark.
When backing_dev is set, delegate the entire iocb to
swap_bdev_submit_read() because the batch may mix ZRAM_WB slots that
live on the backing block device.

Omit ->can_merge: zram batches through swap_iocb and compresses each
slot by index.  Block-sector merge rules do not apply.

Export swap_iocb_nr_folios(), swap_iocb_folio(), swap_read_end(),
swap_write_end(), and swap_bdev_submit_read() for the custom swap I/O
path.

Fail zram_init() if swap_register_block_ops() fails so the module
does not load without its swap path registered.

Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 drivers/block/zram/zram_drv.c | 127 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/swap.h          |   5 ++
 mm/page_io.c                  |  81 ++++++++++++++++++++++++++-
 3 files changed, 210 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 7917fc7a2a29..9b2bd0287402 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -34,6 +34,8 @@
 #include <linux/part_stat.h>
 #include <linux/kernel_read_file.h>
 #include <linux/rcupdate.h>
+#include <linux/swap.h>
+#include <linux/swapops.h>
 
 #include "zram_drv.h"
 
@@ -55,6 +57,9 @@ static unsigned int num_devices = 1;
 static size_t huge_class_size;
 
 static const struct block_device_operations zram_devops;
+#if IS_ENABLED(CONFIG_SWAP)
+static bool zram_swap_ops_registered;
+#endif
 
 static void slot_free(struct zram *zram, u32 index);
 #define slot_dep_map(zram, index) (&(zram)->table[(index)].dep_map)
@@ -2958,6 +2963,115 @@ static int zram_open(struct gendisk *disk, blk_mode_t mode)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SWAP)
+static void zram_swap_submit_read(struct swap_io_ctx *ctx)
+{
+	struct zram *zram = ctx->sis->bdev->bd_disk->private_data;
+	struct swap_iocb *sio = ctx->sio;
+	int nr = swap_iocb_nr_folios(sio);
+	bool failed = false;
+	int i, j;
+
+	/*
+	 * With a backing device configured, the batch may include ZRAM_WB
+	 * slots.  Fall back to the block read path for the whole iocb
+	 * instead of checking each slot.
+	 */
+#ifdef CONFIG_ZRAM_WRITEBACK
+	if (zram->backing_dev) {
+		swap_bdev_submit_read(ctx);
+		return;
+	}
+#endif
+
+	for (i = 0; i < nr; i++) {
+		struct folio *folio = swap_iocb_folio(sio, i);
+		u32 base = swp_offset(folio->swap);
+
+		for (j = 0; j < folio_nr_pages(folio); j++) {
+			u32 idx = base + j;
+			struct page *page = folio_page(folio, j);
+			int ret;
+
+			/*
+			 * read_from_zspool() and mark_slot_accessed() must run
+			 * under the same slot_lock.  zram_read_page() unlocks
+			 * before returning, which leaves a window where
+			 * writeback can pick an idle slot we just read.
+			 */
+			slot_lock(zram, idx);
+			ret = read_from_zspool(zram, page, idx);
+			if (!ret)
+				mark_slot_accessed(zram, idx);
+			slot_unlock(zram, idx);
+			if (ret) {
+				failed = true;
+				atomic64_inc(&zram->stats.failed_reads);
+				pr_alert_ratelimited("Read-error on swap-device %s at index %u: err=%d\n",
+						     zram->disk->disk_name, idx, ret);
+				goto out;
+			}
+			flush_dcache_page(page);
+		}
+	}
+out:
+	swap_read_end(sio, failed);
+}
+
+static void zram_swap_submit_write(struct swap_io_ctx *ctx)
+{
+	struct zram *zram = ctx->sis->bdev->bd_disk->private_data;
+	struct swap_iocb *sio = ctx->sio;
+	int nr = swap_iocb_nr_folios(sio);
+	bool failed = false;
+	int i, j, ret = 0;
+	u32 idx = 0;
+
+	for (i = 0; i < nr; i++) {
+		struct folio *folio = swap_iocb_folio(sio, i);
+		u32 base = swp_offset(folio->swap);
+
+		for (j = 0; j < folio_nr_pages(folio); j++) {
+			idx = base + j;
+			ret = zram_write_page(zram, folio_page(folio, j), idx);
+			if (ret) {
+				/*
+				 * Leave partial zram data in place, same as the bio
+				 * write path.  swap_write_end() re-dirties every
+				 * page in the batch so they stay in swapcache with
+				 * their swap entries.  Freeing zram slots here would
+				 * leave entries pointing at empty indices until
+				 * slot_free_notify runs.
+				 */
+				failed = true;
+				atomic64_inc(&zram->stats.failed_writes);
+				pr_alert_ratelimited("Write-error on swap-device %s at index %u: err=%d\n",
+						     zram->disk->disk_name, idx, ret);
+				goto out;
+			}
+			slot_lock(zram, idx);
+			mark_slot_accessed(zram, idx);
+			slot_unlock(zram, idx);
+		}
+	}
+out:
+	swap_write_end(sio, failed);
+}
+
+/*
+ * No ->can_merge: block rules exist to grow bios on contiguous sectors and
+ * matching blkcg.  zram already batches through swap_iocb, and
+ * submit_write() compresses each slot by index, not by sector layout.
+ * Reusing swap_bdev_can_merge() would only split batches without helping
+ * zspool I/O.
+ */
+static const struct swap_ops zram_swap_ops = {
+	.submit_read		= zram_swap_submit_read,
+	.submit_write		= zram_swap_submit_write,
+};
+
+#endif /* CONFIG_SWAP */
+
 static const struct block_device_operations zram_devops = {
 	.open = zram_open,
 	.submit_bio = zram_submit_bio,
@@ -3233,6 +3347,10 @@ static int zram_remove_cb(int id, void *ptr, void *data)
 
 static void destroy_devices(void)
 {
+#if IS_ENABLED(CONFIG_SWAP)
+	if (zram_swap_ops_registered)
+		swap_unregister_block_ops(&zram_devops);
+#endif
 	class_unregister(&zram_control_class);
 	idr_for_each(&zram_index_idr, &zram_remove_cb, NULL);
 	zram_debugfs_destroy();
@@ -3269,6 +3387,15 @@ static int __init zram_init(void)
 		return -EBUSY;
 	}
 
+#if IS_ENABLED(CONFIG_SWAP)
+	ret = swap_register_block_ops(&zram_devops, &zram_swap_ops);
+	if (ret) {
+		pr_err("zram: failed to register swap ops (%d)\n", ret);
+		goto out_error;
+	}
+	zram_swap_ops_registered = true;
+#endif
+
 	while (num_devices != 0) {
 		mutex_lock(&zram_index_mutex);
 		ret = zram_add();
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 1d51df4179c1..70bf6f3f04dc 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -54,6 +54,11 @@ struct swap_ops {
 int swap_register_block_ops(const struct block_device_operations *fops,
 			    const struct swap_ops *ops);
 void swap_unregister_block_ops(const struct block_device_operations *fops);
+int swap_iocb_nr_folios(struct swap_iocb *sio);
+struct folio *swap_iocb_folio(struct swap_iocb *sio, int idx);
+void swap_read_end(struct swap_iocb *sio, bool failed);
+void swap_write_end(struct swap_iocb *sio, bool failed);
+void swap_bdev_submit_read(struct swap_io_ctx *ctx);
 
 #define SWAP_FLAG_PREFER	0x8000	/* set if swap priority specified */
 #define SWAP_FLAG_PRIO_MASK	0x7fff
diff --git a/mm/page_io.c b/mm/page_io.c
index 3ab620860379..7c17e44823d1 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -486,7 +486,21 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct folio *folio)
 	delayacct_swapin_end();
 }
 
-static void swap_write_end(struct swap_iocb *sio, bool failed)
+/**
+ * swap_write_end - finish a swap write iocb
+ * @sio:    swap_iocb whose pages were just written
+ * @failed: true if any of the underlying writes failed
+ *
+ * Ends writeback on every page captured by @sio. On failure each page
+ * is also re-dirtied and PG_reclaim is cleared, mirroring the bio
+ * write completion path. @sio is returned to the swap iocb mempool.
+ *
+ * swap_ops providers must call this exactly once per submit_write()
+ * ctx (typically at the end of their submit_write callback).
+ *
+ * Context: any context the submit_write() callback runs in.
+ */
+void swap_write_end(struct swap_iocb *sio, bool failed)
 {
 	int p;
 
@@ -501,6 +515,7 @@ static void swap_write_end(struct swap_iocb *sio, bool failed)
 	}
 	mempool_free(sio, sio_pool);
 }
+EXPORT_SYMBOL_GPL(swap_write_end);
 
 static void swap_fs_write_complete(struct kiocb *iocb, long ret)
 {
@@ -536,7 +551,26 @@ static void end_swap_bio_write(struct bio *bio)
 	swap_write_end(sio, failed);
 }
 
-static void swap_read_end(struct swap_iocb *sio, bool failed)
+/**
+ * swap_read_end - finish a swap read iocb
+ * @sio:    swap_iocb whose folios were just read in
+ * @failed: true if any of the underlying reads failed
+ *
+ * Unlocks every folio captured by @sio. On success each folio is also
+ * marked uptodate and swap-in counters (PSWPIN, mTHP, memcg) are bumped
+ * by folio_nr_pages(). On failure folios are left not-uptodate so the
+ * caller observes the failure and retries or surfaces an error. @sio is
+ * returned to the swap iocb mempool.
+ *
+ * swap_ops providers must call this exactly once per submit_read() ctx
+ * (typically at the end of their submit_read callback). If the provider
+ * defers to swap_bdev_ops.submit_read() for fallback, the bdev path
+ * will call swap_read_end() itself and the provider must not call it
+ * again for the same ctx.
+ *
+ * Context: any context the submit_read() callback runs in.
+ */
+void swap_read_end(struct swap_iocb *sio, bool failed)
 {
 	int p;
 
@@ -557,6 +591,34 @@ static void swap_read_end(struct swap_iocb *sio, bool failed)
 
 	mempool_free(sio, sio_pool);
 }
+EXPORT_SYMBOL_GPL(swap_read_end);
+
+/**
+ * swap_iocb_nr_folios - number of folios in a swap I/O batch
+ * @sio: swap_iocb passed to a swap_ops submit callback.
+ *
+ * Returns how many folios the swap core has batched into @sio. Used
+ * together with swap_iocb_folio() so swap_ops providers can walk the
+ * batch without depending on the swap core's internal iocb layout.
+ */
+int swap_iocb_nr_folios(struct swap_iocb *sio)
+{
+	return sio->nr_bvecs;
+}
+EXPORT_SYMBOL_GPL(swap_iocb_nr_folios);
+
+/**
+ * swap_iocb_folio - folio at slot @idx in a swap I/O batch
+ * @sio: swap_iocb passed to a swap_ops submit callback.
+ * @idx: index in the range [0, swap_iocb_nr_folios(@sio)).
+ *
+ * Returns the folio at the given batch slot.
+ */
+struct folio *swap_iocb_folio(struct swap_iocb *sio, int idx)
+{
+	return page_folio(sio->bvecs[idx].bv_page);
+}
+EXPORT_SYMBOL_GPL(swap_iocb_folio);
 
 static void swap_fs_read_complete(struct kiocb *iocb, long ret)
 {
@@ -613,7 +675,19 @@ static void swap_bdev_submit_write(struct swap_io_ctx *ctx)
 	}
 }
 
-static void swap_bdev_submit_read(struct swap_io_ctx *ctx)
+/**
+ * swap_bdev_submit_read - fall back to the default block-device read path
+ * @ctx: in-progress submit_read context.
+ *
+ * Builds a bio for the accumulated ctx and submits it through the
+ * normal block layer. swap_ops providers can call this when they
+ * cannot serve a particular ctx themselves (for example zram folios
+ * stored on a backing device). The bio completion path takes care of
+ * calling swap_read_end() on @ctx. The caller must not call it again.
+ *
+ * Context: any context the submit_read() callback runs in.
+ */
+void swap_bdev_submit_read(struct swap_io_ctx *ctx)
 {
 	struct swap_iocb *sio = ctx->sio;
 	struct bio *bio = &sio->bio;
@@ -638,6 +712,7 @@ static void swap_bdev_submit_read(struct swap_io_ctx *ctx)
 		submit_bio(bio);
 	}
 }
+EXPORT_SYMBOL_GPL(swap_bdev_submit_read);
 
 static bool swap_bdev_can_merge(struct folio *folio, struct folio *prev_folio,
 		size_t prev_folio_size, int rw)

-- 
2.43.0

