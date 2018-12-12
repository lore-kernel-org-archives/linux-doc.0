Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1378D7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 04:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbeLLEIJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Dec 2018 23:08:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59260 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726372AbeLLEIJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Dec 2018 23:08:09 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBC443kg088907
        for <linux-doc@vger.kernel.org>; Tue, 11 Dec 2018 23:08:07 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2pasbw3frm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 11 Dec 2018 23:08:07 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Wed, 12 Dec 2018 04:08:07 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
        by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 12 Dec 2018 04:08:01 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wBC47xFG22675632
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Dec 2018 04:07:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2DD03112066;
        Wed, 12 Dec 2018 04:07:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6DC13112063;
        Wed, 12 Dec 2018 04:07:51 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.35.96])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 12 Dec 2018 04:07:51 +0000 (GMT)
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
Subject: [PATCH V4 2/9] f2fs: use IS_ENCRYPTED() to check encryption status
Date:   Wed, 12 Dec 2018 09:37:29 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181212040736.2849-1-chandan@linux.vnet.ibm.com>
References: <20181212040736.2849-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18121204-0060-0000-0000-000002E2AB63
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010214; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01130510; UDB=6.00587450; IPR=6.00910643;
 MB=3.00024659; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-12 04:08:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121204-0061-0000-0000-00004781B8FD
Message-Id: <20181212040736.2849-3-chandan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-12_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812120032
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit removes the f2fs specific f2fs_encrypted_inode() and makes
use of the generic IS_ENCRYPTED() macro to check for the encryption
status of an inode.

Acked-by: Chao Yu <yuchao0@huawei.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
---
 fs/f2fs/data.c  |  4 ++--
 fs/f2fs/dir.c   | 10 +++++-----
 fs/f2fs/f2fs.h  |  7 +------
 fs/f2fs/file.c  | 10 +++++-----
 fs/f2fs/inode.c |  4 ++--
 fs/f2fs/namei.c |  6 +++---
 6 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 09d9fc1676a7..844ec573263e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1491,7 +1491,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	}
 
 	if (size) {
-		if (f2fs_encrypted_inode(inode))
+		if (IS_ENCRYPTED(inode))
 			flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
 
 		ret = fiemap_fill_next_extent(fieinfo, logical,
@@ -1764,7 +1764,7 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 	if (policy & (0x1 << F2FS_IPU_ASYNC) &&
 			fio && fio->op == REQ_OP_WRITE &&
 			!(fio->op_flags & REQ_SYNC) &&
-			!f2fs_encrypted_inode(inode))
+			!IS_ENCRYPTED(inode))
 		return true;
 
 	/* this is only set during fdatasync */
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index bacc667950b6..cf9e2564388d 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -385,7 +385,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		if (err)
 			goto put_error;
 
-		if ((f2fs_encrypted_inode(dir) || dummy_encrypt) &&
+		if ((IS_ENCRYPTED(dir) || dummy_encrypt) &&
 					f2fs_may_encrypt(inode)) {
 			err = fscrypt_inherit_context(dir, inode, page, false);
 			if (err)
@@ -399,7 +399,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 
 	if (new_name) {
 		init_dent_inode(new_name, page);
-		if (f2fs_encrypted_inode(dir))
+		if (IS_ENCRYPTED(dir))
 			file_set_enc_name(inode);
 	}
 
@@ -808,7 +808,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 		de_name.name = d->filename[bit_pos];
 		de_name.len = le16_to_cpu(de->name_len);
 
-		if (f2fs_encrypted_inode(d->inode)) {
+		if (IS_ENCRYPTED(d->inode)) {
 			int save_len = fstr->len;
 
 			err = fscrypt_fname_disk_to_usr(d->inode,
@@ -852,7 +852,7 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 	struct fscrypt_str fstr = FSTR_INIT(NULL, 0);
 	int err = 0;
 
-	if (f2fs_encrypted_inode(inode)) {
+	if (IS_ENCRYPTED(inode)) {
 		err = fscrypt_get_encryption_info(inode);
 		if (err && err != -ENOKEY)
 			goto out;
@@ -914,7 +914,7 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 
 static int f2fs_dir_open(struct inode *inode, struct file *filp)
 {
-	if (f2fs_encrypted_inode(inode))
+	if (IS_ENCRYPTED(inode))
 		return fscrypt_get_encryption_info(inode) ? -EACCES : 0;
 	return 0;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dadb5f468f20..368c7e78fe6b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3436,14 +3436,9 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
 /*
  * crypto support
  */
-static inline bool f2fs_encrypted_inode(struct inode *inode)
-{
-	return file_is_encrypt(inode);
-}
-
 static inline bool f2fs_encrypted_file(struct inode *inode)
 {
-	return f2fs_encrypted_inode(inode) && S_ISREG(inode->i_mode);
+	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
 }
 
 static inline void f2fs_set_encrypted_inode(struct inode *inode)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 87794b2a45ff..6c7ad15000b9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -585,7 +585,7 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 	zero_user(page, offset, PAGE_SIZE - offset);
 
 	/* An encrypted inode should have a key and truncate the last page. */
-	f2fs_bug_on(F2FS_I_SB(inode), cache_only && f2fs_encrypted_inode(inode));
+	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
 	if (!cache_only)
 		set_page_dirty(page);
 	f2fs_put_page(page, 1);
@@ -730,7 +730,7 @@ int f2fs_getattr(const struct path *path, struct kstat *stat,
 		stat->attributes |= STATX_ATTR_APPEND;
 	if (flags & F2FS_COMPR_FL)
 		stat->attributes |= STATX_ATTR_COMPRESSED;
-	if (f2fs_encrypted_inode(inode))
+	if (IS_ENCRYPTED(inode))
 		stat->attributes |= STATX_ATTR_ENCRYPTED;
 	if (flags & F2FS_IMMUTABLE_FL)
 		stat->attributes |= STATX_ATTR_IMMUTABLE;
@@ -1587,7 +1587,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
 
-	if (f2fs_encrypted_inode(inode) &&
+	if (IS_ENCRYPTED(inode) &&
 		(mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)))
 		return -EOPNOTSUPP;
 
@@ -1671,7 +1671,7 @@ static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	unsigned int flags = fi->i_flags;
 
-	if (f2fs_encrypted_inode(inode))
+	if (IS_ENCRYPTED(inode))
 		flags |= F2FS_ENCRYPT_FL;
 	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode))
 		flags |= F2FS_INLINE_DATA_FL;
@@ -2430,7 +2430,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	if (!S_ISREG(src->i_mode) || !S_ISREG(dst->i_mode))
 		return -EINVAL;
 
-	if (f2fs_encrypted_inode(src) || f2fs_encrypted_inode(dst))
+	if (IS_ENCRYPTED(src) || IS_ENCRYPTED(dst))
 		return -EOPNOTSUPP;
 
 	if (src == dst) {
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ddef483ad689..d731d23aedee 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -43,7 +43,7 @@ void f2fs_set_inode_flags(struct inode *inode)
 		new_fl |= S_NOATIME;
 	if (flags & F2FS_DIRSYNC_FL)
 		new_fl |= S_DIRSYNC;
-	if (f2fs_encrypted_inode(inode))
+	if (file_is_encrypt(inode))
 		new_fl |= S_ENCRYPTED;
 	inode_set_flags(inode, new_fl,
 			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|
@@ -453,7 +453,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_mapping->a_ops = &f2fs_dblock_aops;
 		inode_nohighmem(inode);
 	} else if (S_ISLNK(inode->i_mode)) {
-		if (f2fs_encrypted_inode(inode))
+		if (file_is_encrypt(inode))
 			inode->i_op = &f2fs_encrypted_symlink_inode_operations;
 		else
 			inode->i_op = &f2fs_symlink_inode_operations;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 99299ede7429..6ae37e0cf6e3 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -75,7 +75,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 	set_inode_flag(inode, FI_NEW_INODE);
 
 	/* If the directory encrypted, then we should encrypt the inode. */
-	if ((f2fs_encrypted_inode(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
+	if ((IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
 				f2fs_may_encrypt(inode))
 		f2fs_set_encrypted_inode(inode);
 
@@ -476,7 +476,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		if (err)
 			goto out_iput;
 	}
-	if (f2fs_encrypted_inode(dir) &&
+	if (IS_ENCRYPTED(dir) &&
 	    (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
 	    !fscrypt_has_permitted_context(dir, inode)) {
 		f2fs_msg(inode->i_sb, KERN_WARNING,
@@ -803,7 +803,7 @@ static int f2fs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
-	if (f2fs_encrypted_inode(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) {
+	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) {
 		int err = fscrypt_get_encryption_info(dir);
 		if (err)
 			return err;
-- 
2.19.1

