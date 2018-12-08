Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E1927D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  8 Dec 2018 06:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbeLHGxN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 8 Dec 2018 01:53:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56152 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726252AbeLHGxN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Dec 2018 01:53:13 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB86mQ6s007014
        for <linux-doc@vger.kernel.org>; Sat, 8 Dec 2018 01:53:11 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p8424afsb-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 08 Dec 2018 01:53:11 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Sat, 8 Dec 2018 06:53:10 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
        by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 8 Dec 2018 06:53:05 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB86r3eV19464348
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 8 Dec 2018 06:53:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0C159AC05B;
        Sat,  8 Dec 2018 06:53:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6FA7BAC059;
        Sat,  8 Dec 2018 06:52:55 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.72.40])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Sat,  8 Dec 2018 06:52:55 +0000 (GMT)
From:   Chandan Rajendra <chandan@linux.vnet.ibm.com>
To:     linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-doc@vger.kernel.org, linux-mips@linux-mips.org,
        linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-fsdevel@vger.kernel.org
Cc:     Chandan Rajendra <chandan@linux.vnet.ibm.com>, tytso@mit.edu,
        adilger.kernel@dilger.ca, ebiggers@kernel.org, jaegeuk@kernel.org,
        yuchao0@huawei.com, corbet@lwn.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, green.hu@gmail.com,
        deanbo422@gmail.com, schwidefsky@de.ibm.com,
        heiko.carstens@de.ibm.com, richard@nod.at, dedekind1@gmail.com,
        adrian.hunter@intel.com, viro@zeniv.linux.org.uk
Subject: [PATCH V3 7/9] fsverity: Remove filesystem specific build config option
Date:   Sat,  8 Dec 2018 12:21:42 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
References: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18120806-0040-0000-0000-0000049F801E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010192; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01128647; UDB=6.00577119; IPR=6.00908778;
 MB=3.00024599; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-08 06:53:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120806-0041-0000-0000-000008A89DAC
Message-Id: <20181208065144.19486-8-chandan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-08_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812080065
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to have a common code base for fsverity "post read" processing
for all filesystems which support fsverity, this commit removes
filesystem specific build config option (e.g. CONFIG_EXT4_FS_VERITY)
and replaces it with a build option (i.e. CONFIG_FS_VERITY) whose
value affects all the filesystems making use of fsverity.

Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
---
 Documentation/filesystems/fsverity.rst |  4 ++--
 fs/ext4/Kconfig                        | 20 --------------------
 fs/ext4/ext4.h                         |  2 --
 fs/ext4/readpage.c                     |  4 ++--
 fs/ext4/super.c                        |  6 +++---
 fs/ext4/sysfs.c                        |  4 ++--
 fs/f2fs/Kconfig                        | 20 --------------------
 fs/f2fs/data.c                         |  2 +-
 fs/f2fs/f2fs.h                         |  2 --
 fs/f2fs/super.c                        |  6 +++---
 fs/f2fs/sysfs.c                        |  4 ++--
 fs/verity/Kconfig                      |  3 ++-
 fs/verity/fsverity_private.h           |  1 -
 include/linux/fs.h                     |  4 ++--
 include/linux/fsverity.h               |  7 +++----
 15 files changed, 22 insertions(+), 67 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index d633fc0567bd..bb208dad10d9 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -279,7 +279,7 @@ ext4
 
 ext4 supports fs-verity since kernel version TODO.
 
-CONFIG_EXT4_FS_VERITY must be enabled in the kernel config.  Also, the
+CONFIG_FS_VERITY must be enabled in the kernel config.  Also, the
 filesystem must have been formatted with ``-O verity``, or had
 ``tune2fs -O verity`` run on it.  These require e2fsprogs v1.44.4-2 or
 later.  This e2fsprogs version is also required for e2fsck to
@@ -306,7 +306,7 @@ f2fs
 
 f2fs supports fs-verity since kernel version TODO.
 
-CONFIG_F2FS_FS_VERITY must be enabled in the kernel config.  Also, the
+CONFIG_FS_VERITY must be enabled in the kernel config.  Also, the
 filesystem must have been formatted with ``-O verity``.  This requires
 f2fs-tools v1.11.0 or later.
 
diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index e1002bbf35bf..031e5a82d556 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -96,26 +96,6 @@ config EXT4_FS_SECURITY
 	  If you are not using a security module that requires using
 	  extended attributes for file security labels, say N.
 
-config EXT4_FS_VERITY
-	bool "Ext4 Verity"
-	depends on EXT4_FS
-	select FS_VERITY
-	help
-	  This option enables fs-verity for ext4.  fs-verity is the
-	  dm-verity mechanism implemented at the file level.  Userspace
-	  can append a Merkle tree (hash tree) to a file, then enable
-	  fs-verity on the file.  ext4 will then transparently verify
-	  any data read from the file against the Merkle tree.  The file
-	  is also made read-only.
-
-	  This serves as an integrity check, but the availability of the
-	  Merkle tree root hash also allows efficiently supporting
-	  various use cases where normally the whole file would need to
-	  be hashed at once, such as auditing and authenticity
-	  verification (appraisal).
-
-	  If unsure, say N.
-
 config EXT4_DEBUG
 	bool "EXT4 debugging support"
 	depends on EXT4_FS
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 64bf9fb7ef18..bff8d639dd0c 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -41,8 +41,6 @@
 #endif
 
 #include <linux/fscrypt.h>
-
-#define __FS_HAS_VERITY IS_ENABLED(CONFIG_EXT4_FS_VERITY)
 #include <linux/fsverity.h>
 
 #include <linux/compiler.h>
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 2c037df629dd..8717ac0a5bb2 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -158,7 +158,7 @@ static struct bio_post_read_ctx *get_bio_post_read_ctx(struct inode *inode,
 
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
 		post_read_steps |= 1 << STEP_DECRYPT;
-#ifdef CONFIG_EXT4_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 	if (inode->i_verity_info != NULL &&
 	    (index < ((i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT)))
 		post_read_steps |= 1 << STEP_VERITY;
@@ -205,7 +205,7 @@ static void mpage_end_io(struct bio *bio)
 
 static inline loff_t ext4_readpage_limit(struct inode *inode)
 {
-#ifdef CONFIG_EXT4_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 	if (IS_VERITY(inode)) {
 		if (inode->i_verity_info)
 			/* limit to end of metadata region */
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 35ed3c48f8d2..0d169de59f76 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1316,7 +1316,7 @@ static const struct fscrypt_operations ext4_cryptops = {
 };
 #endif
 
-#ifdef CONFIG_EXT4_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 static int ext4_set_verity(struct inode *inode, loff_t data_i_size)
 {
 	int err;
@@ -1402,7 +1402,7 @@ static const struct fsverity_operations ext4_verityops = {
 	.set_verity		= ext4_set_verity,
 	.get_metadata_end	= ext4_get_metadata_end,
 };
-#endif /* CONFIG_EXT4_FS_VERITY */
+#endif /* CONFIG_FS_VERITY */
 
 #ifdef CONFIG_QUOTA
 static const char * const quotatypes[] = INITQFNAMES;
@@ -4235,7 +4235,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 #ifdef CONFIG_FS_ENCRYPTION
 	sb->s_cop = &ext4_cryptops;
 #endif
-#ifdef CONFIG_EXT4_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 	sb->s_vop = &ext4_verityops;
 #endif
 #ifdef CONFIG_QUOTA
diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index 8bc915452a38..6fa0f47c3180 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -227,7 +227,7 @@ EXT4_ATTR_FEATURE(meta_bg_resize);
 #ifdef CONFIG_FS_ENCRYPTION
 EXT4_ATTR_FEATURE(encryption);
 #endif
-#ifdef CONFIG_EXT4_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 EXT4_ATTR_FEATURE(verity);
 #endif
 EXT4_ATTR_FEATURE(metadata_csum_seed);
@@ -239,7 +239,7 @@ static struct attribute *ext4_feat_attrs[] = {
 #ifdef CONFIG_FS_ENCRYPTION
 	ATTR_LIST(encryption),
 #endif
-#ifdef CONFIG_EXT4_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 	ATTR_LIST(verity),
 #endif
 	ATTR_LIST(metadata_csum_seed),
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index a5a1a381fcf1..e57cc754d543 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -71,26 +71,6 @@ config F2FS_CHECK_FS
 
 	  If you want to improve the performance, say N.
 
-config F2FS_FS_VERITY
-	bool "F2FS Verity"
-	depends on F2FS_FS
-	select FS_VERITY
-	help
-	  This option enables fs-verity for f2fs.  fs-verity is the
-	  dm-verity mechanism implemented at the file level.  Userspace
-	  can append a Merkle tree (hash tree) to a file, then enable
-	  fs-verity on the file.  f2fs will then transparently verify
-	  any data read from the file against the Merkle tree.  The file
-	  is also made read-only.
-
-	  This serves as an integrity check, but the availability of the
-	  Merkle tree root hash also allows efficiently supporting
-	  various use cases where normally the whole file would need to
-	  be hashed at once, such as auditing and authenticity
-	  verification (appraisal).
-
-	  If unsure, say N.
-
 config F2FS_IO_TRACE
 	bool "F2FS IO tracer"
 	depends on F2FS_FS
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 844ec573263e..83b59b985894 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -610,7 +610,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 
 	if (f2fs_encrypted_file(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
-#ifdef CONFIG_F2FS_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 	if (inode->i_verity_info != NULL &&
 	    (first_idx < ((i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT)))
 		post_read_steps |= 1 << STEP_VERITY;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 54bd93c7b630..7161918042e7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -25,8 +25,6 @@
 #include <crypto/hash.h>
 
 #include <linux/fscrypt.h>
-
-#define __FS_HAS_VERITY IS_ENABLED(CONFIG_F2FS_FS_VERITY)
 #include <linux/fsverity.h>
 
 #ifdef CONFIG_F2FS_CHECK_FS
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 73320202bd01..4a67b901eefc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2197,7 +2197,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
 };
 #endif
 
-#ifdef CONFIG_F2FS_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 static int f2fs_set_verity(struct inode *inode, loff_t data_i_size)
 {
 	int err;
@@ -2223,7 +2223,7 @@ static const struct fsverity_operations f2fs_verityops = {
 	.set_verity		= f2fs_set_verity,
 	.get_metadata_end	= f2fs_get_metadata_end,
 };
-#endif /* CONFIG_F2FS_FS_VERITY */
+#endif /* CONFIG_FS_VERITY */
 
 static struct inode *f2fs_nfs_get_inode(struct super_block *sb,
 		u64 ino, u32 generation)
@@ -3147,7 +3147,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 #ifdef CONFIG_FS_ENCRYPTION
 	sb->s_cop = &f2fs_cryptops;
 #endif
-#ifdef CONFIG_F2FS_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 	sb->s_vop = &f2fs_verityops;
 #endif
 	sb->s_xattr = f2fs_xattr_handlers;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 737677655bc0..949e6d87f4e3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -444,7 +444,7 @@ F2FS_FEATURE_RO_ATTR(flexible_inline_xattr, FEAT_FLEXIBLE_INLINE_XATTR);
 F2FS_FEATURE_RO_ATTR(quota_ino, FEAT_QUOTA_INO);
 F2FS_FEATURE_RO_ATTR(inode_crtime, FEAT_INODE_CRTIME);
 F2FS_FEATURE_RO_ATTR(lost_found, FEAT_LOST_FOUND);
-#ifdef CONFIG_F2FS_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 F2FS_FEATURE_RO_ATTR(verity, FEAT_VERITY);
 #endif
 F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
@@ -507,7 +507,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 	ATTR_LIST(quota_ino),
 	ATTR_LIST(inode_crtime),
 	ATTR_LIST(lost_found),
-#ifdef CONFIG_F2FS_FS_VERITY
+#ifdef CONFIG_FS_VERITY
 	ATTR_LIST(verity),
 #endif
 	ATTR_LIST(sb_checksum),
diff --git a/fs/verity/Kconfig b/fs/verity/Kconfig
index a7470a2e4892..6d9437a432cd 100644
--- a/fs/verity/Kconfig
+++ b/fs/verity/Kconfig
@@ -1,5 +1,5 @@
 config FS_VERITY
-	tristate "FS Verity (read-only file-based authenticity protection)"
+	bool "FS Verity (read-only file-based authenticity protection)"
 	select CRYPTO
 	# SHA-256 is selected as it's intended to be the default hash algorithm.
 	# To avoid bloat, other wanted algorithms must be selected explicitly.
@@ -23,6 +23,7 @@ config FS_VERITY
 	  the contents may actually be needed.  Also, fs-verity verifies
 	  data each time it is paged back in, which provides better
 	  protection against malicious disks vs. an ahead-of-time hash.
+	  Currently Ext4 and F2FS make use of this feature.
 
 	  If unsure, say N.
 
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 4b39d0a5544b..a7acb98ac42e 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -15,7 +15,6 @@
 #define pr_fmt(fmt) "fs-verity: " fmt
 
 #include <crypto/sha.h>
-#define __FS_HAS_VERITY 1
 #include <linux/fsverity.h>
 
 /*
diff --git a/include/linux/fs.h b/include/linux/fs.h
index de602d9f8d0e..1583b861a225 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -704,7 +704,7 @@ struct inode {
 	struct fscrypt_info	*i_crypt_info;
 #endif
 
-#if IS_ENABLED(CONFIG_FS_VERITY)
+#ifdef CONFIG_FS_VERITY
 	struct fsverity_info	*i_verity_info;
 #endif
 
@@ -1407,7 +1407,7 @@ struct super_block {
 #ifdef CONFIG_FS_ENCRYPTION
 	const struct fscrypt_operations	*s_cop;
 #endif
-#if IS_ENABLED(CONFIG_FS_VERITY)
+#ifdef CONFIG_FS_VERITY
 	const struct fsverity_operations *s_vop;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index c30c4f6ed411..ea8c418bd7d5 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -19,8 +19,7 @@ struct fsverity_operations {
 	int (*get_metadata_end)(struct inode *inode, loff_t *metadata_end_ret);
 };
 
-#if __FS_HAS_VERITY
-
+#ifdef CONFIG_FS_VERITY
 /* ioctl.c */
 extern int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
 extern int fsverity_ioctl_measure(struct file *filp, void __user *arg);
@@ -42,7 +41,7 @@ static inline bool fsverity_check_hole(struct inode *inode, struct page *page)
 	return inode->i_verity_info == NULL || fsverity_verify_page(page);
 }
 
-#else /* !__FS_HAS_VERITY */
+#else  /* ! CONFIG_FS_VERITY */
 
 /* ioctl.c */
 
@@ -107,6 +106,6 @@ static inline bool fsverity_check_hole(struct inode *inode, struct page *page)
 	return true;
 }
 
-#endif	/* !__FS_HAS_VERITY */
+#endif	/* ! CONFIG_FS_VERITY */
 
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.19.1

