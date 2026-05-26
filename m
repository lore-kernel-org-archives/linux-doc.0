Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41C42E009
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807445; cv=none; b=VANI+FyBxzr3AdtbsxeQh/4qUKp4/NoEtOKs3wb3xHNpfILuiZuEHJx7bLb6iWNkH8G5FzwpqD82KtaiOkvVcvdWmbMgmvWl5eqEVdfzKgZURcU1UVPExarbjo5wE0hwpddC5tNaKgPvkmAc1eZFDsQbxBZ74t5UhyOX0RwXzq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807445; c=relaxed/simple;
	bh=eoJ9KVN6AzkgP683bwnz7P4w9hu9GH5sFQh2kMmbjKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzjtOflgXpuKl+BupWfdU8TG4UtfE+BsTlYofzuzGdnR8flVYOjEL3L1ySdgtd+mMcQmbfHCtwHfwqgdIUVMIfIt1i67FXtSQXpAXOY1N3GnsV+39OP0seFsH0M8xUo9KNkR2zl+YAaDSeWz7cZyoVOghcYPjGDomyCk6Dj/4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0Z0C7Hfi; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0Z0C7Hfi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8AD9C79ABE;
	Tue, 26 May 2026 14:57:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B08D6011D;
	Tue, 26 May 2026 14:57:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 241FB108888A7;
	Tue, 26 May 2026 16:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fuP7SURbB389DlOoupYcupsddC8ij3RtWG4f6zctuq0=;
	b=0Z0C7Hfi6JgfxaIK0CjhwjNfLqzTasNtK0VbnCY/A2P4S+J9+ILG17i9Cd4TLZ4ImzsinF
	3gYiIR4zqDMS/uWIKe9clmKtCmq2SCfyRuqa626rapaVctHk0GpFd8ZHv4nCD3+H9jRDo5
	0CEPDLtlyW9U/kK20fVmbZEjmApoIjMeItE7R+G7inmINoEXPsTMhluHpihC0mzprHYfx/
	XGA3V376+bQKd1uGkPI1IemVpyUhMG6sqbkUT6vt19+UYxisaBz16WVOi5vcSh38lmRz6F
	kIZVfBYgSxet1IPt6i9F7gFGAJW/MofGswjn/P3OZtI9etivagUKCpuiXwqjzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:42 +0200
Subject: [PATCH v6 18/28] mtd: spi-nor: debugfs: Add locking support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-18-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The ioctl output may be counter intuitive in some cases. Asking for a
"locked status" over a region that is only partially locked will return
"unlocked" whereas in practice maybe the biggest part is actually
locked.

Knowing what is the real software locking state through debugfs would be
very convenient for development/debugging purposes, hence this proposal
for adding an extra block at the end of the file: a "locked sectors"
array which lists every section, if it is locked or not, showing both
the address ranges and the sizes in numbers of "lock sectors" (which on
small density devices is typically different than erase blocks).

Here is an example of output, what is after the "sector map" is new.

$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef a0 20 00 00 00
size		64.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP

opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-03ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Here are below more examples of output with various situations. The full
output of the "params" content has been manually removed to only show
what has been added and how it behaves.

$ flash_lock -l /dev/mtd0 0x3f00000 16
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03efffff | unlocked | 1008
 03f00000-03ffffff |   locked | 16
$
$ flash_lock -u /dev/mtd0 0x3f00000 8
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03f7ffff | unlocked | 1016
 03f80000-03ffffff |   locked | 8
$
$ flash_lock -u /dev/mtd0
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
$
$ flash_lock -l /dev/mtd0
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff |   locked | 1024
$
$ flash_lock -u /dev/mtd0 0x20000 1022
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022
---
 drivers/mtd/spi-nor/core.h    |  8 ++++++++
 drivers/mtd/spi-nor/debugfs.c | 28 ++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/swp.c     | 13 +++++++++----
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index cd355e94b97e..ce46771ecdc8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -287,6 +287,9 @@ struct spi_nor_erase_map {
  *		false otherwise. This feedback may be misleading because users
  *		may get an "unlocked" status even though a subpart of the region
  *		is effectively locked.
+ *
+ * If in doubt during development, check-out the debugfs output which tries to
+ * be more user friendly.
  */
 struct spi_nor_locking_ops {
 	int (*lock)(struct spi_nor *nor, loff_t ofs, u64 len);
@@ -678,6 +681,7 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 			     const struct sfdp_bfpt *bfpt);
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
+bool spi_nor_has_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
 void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
@@ -712,6 +716,10 @@ static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
 	return !nor->info->size;
 }
 
+u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor);
+void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs, u64 *len);
+bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr);
+
 #ifdef CONFIG_DEBUG_FS
 void spi_nor_debugfs_register(struct spi_nor *nor);
 void spi_nor_debugfs_shutdown(void);
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index d0191eb9f879..82df8ad4176c 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/debugfs.h>
+#include <linux/math64.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
@@ -77,11 +78,14 @@ static void spi_nor_print_flags(struct seq_file *s, unsigned long flags,
 static int spi_nor_params_show(struct seq_file *s, void *data)
 {
 	struct spi_nor *nor = s->private;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region = erase_map->regions;
 	const struct flash_info *info = nor->info;
 	char buf[16], *str;
+	loff_t lock_start;
+	u64 lock_length;
 	unsigned int i;
 
 	seq_printf(s, "name\t\t%s\n", info->name);
@@ -159,6 +163,30 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 			   region[i].overlaid ? "yes" : "no");
 	}
 
+	if (!spi_nor_has_default_locking_ops(nor))
+		return 0;
+
+	seq_puts(s, "\nlocked sectors\n");
+	seq_puts(s, " region (in hex)   | status   | #sectors\n");
+	seq_puts(s, " ------------------+----------+---------\n");
+
+	spi_nor_get_locked_range_sr(nor, nor->dfs_sr_cache, &lock_start, &lock_length);
+	if (!lock_length || lock_length == params->size) {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, params->size - 1,
+			   lock_length ? "  locked" : "unlocked",
+			   div_u64(params->size, min_prot_len));
+	} else if (!lock_start) {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_length - 1,
+			   "  locked", div_u64(lock_length, min_prot_len));
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_length, params->size - 1,
+			   "unlocked", div_u64(params->size - lock_length, min_prot_len));
+	} else {
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_start - 1,
+			   "unlocked", div_u64(lock_start, min_prot_len));
+		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_start, params->size - 1,
+			   "  locked", div_u64(lock_length, min_prot_len));
+	}
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(spi_nor_params);
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index cd37fec08c0e..2411d8f1012d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -34,7 +34,7 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 		return 0;
 }
 
-static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
+u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 {
 	unsigned int bp_slots, bp_slots_needed;
 	/*
@@ -55,8 +55,8 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 		return sector_size;
 }
 
-static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
-					u64 *len)
+void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
+				 u64 *len)
 {
 	u64 min_prot_len;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
@@ -114,7 +114,7 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
-static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
+bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
@@ -416,6 +416,11 @@ void spi_nor_init_default_locking_ops(struct spi_nor *nor)
 	nor->params->locking_ops = &spi_nor_sr_locking_ops;
 }
 
+bool spi_nor_has_default_locking_ops(struct spi_nor *nor)
+{
+	return nor->params->locking_ops == &spi_nor_sr_locking_ops;
+}
+
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, u64 len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);

-- 
2.53.0

