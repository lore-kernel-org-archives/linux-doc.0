Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6A3A7D927
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Dec 2018 09:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbeLDJ5o (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 04:57:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57824 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726035AbeLDJ5o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Dec 2018 04:57:44 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB49rtS6069066
        for <linux-doc@vger.kernel.org>; Tue, 4 Dec 2018 04:57:43 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p5pw51dwp-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 04 Dec 2018 04:57:43 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Tue, 4 Dec 2018 09:57:40 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
        by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 4 Dec 2018 09:57:35 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB49vXRW18743414
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Dec 2018 09:57:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B930DAC05E;
        Tue,  4 Dec 2018 09:57:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E1C8AAC059;
        Tue,  4 Dec 2018 09:57:27 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.71])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  4 Dec 2018 09:57:27 +0000 (GMT)
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
Subject: [PATCH V2 5/7] ext4: use IS_VERITY() to check inode's fsverity status
Date:   Tue,  4 Dec 2018 15:26:48 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18120409-0052-0000-0000-00000360E8A2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010169; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01126788; UDB=6.00585218; IPR=6.00906923;
 MB=3.00024437; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-04 09:57:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120409-0053-0000-0000-00005EFBA845
Message-Id: <20181204095650.12562-6-chandan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-04_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812040087
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit now uses IS_VERITY() macro to check if fsverity is
enabled on an inode.

Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
---
 fs/ext4/ext4.h     |  9 ---------
 fs/ext4/file.c     |  2 +-
 fs/ext4/inode.c    | 10 ++++++----
 fs/ext4/readpage.c |  2 +-
 fs/ext4/super.c    |  1 +
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index db21df885186..64bf9fb7ef18 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2296,15 +2296,6 @@ extern unsigned ext4_free_clusters_after_init(struct super_block *sb,
 					      struct ext4_group_desc *gdp);
 ext4_fsblk_t ext4_inode_to_goal_block(struct inode *);
 
-static inline bool ext4_verity_inode(struct inode *inode)
-{
-#ifdef CONFIG_EXT4_FS_VERITY
-	return ext4_test_inode_flag(inode, EXT4_INODE_VERITY);
-#else
-	return false;
-#endif
-}
-
 #ifdef CONFIG_FS_ENCRYPTION
 static inline int ext4_fname_setup_filename(struct inode *dir,
 			const struct qstr *iname,
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index cb4b69ef01a2..30fbd663354f 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -444,7 +444,7 @@ static int ext4_file_open(struct inode * inode, struct file * filp)
 	if (ret)
 		return ret;
 
-	if (ext4_verity_inode(inode)) {
+	if (IS_VERITY(inode)) {
 		ret = fsverity_file_open(inode, filp);
 		if (ret)
 			return ret;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 09d8857b0e3c..79d14d8bbbf4 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3884,7 +3884,7 @@ static ssize_t ext4_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 		return 0;
 #endif
 
-	if (ext4_verity_inode(inode))
+	if (IS_VERITY(inode))
 		return 0;
 
 	/*
@@ -4726,7 +4726,7 @@ static bool ext4_should_use_dax(struct inode *inode)
 		return false;
 	if (ext4_test_inode_flag(inode, EXT4_INODE_ENCRYPT))
 		return false;
-	if (ext4_verity_inode(inode))
+	if (ext4_test_inode_flag(inode, EXT4_INODE_VERITY))
 		return false;
 	return true;
 }
@@ -4750,9 +4750,11 @@ void ext4_set_inode_flags(struct inode *inode)
 		new_fl |= S_DAX;
 	if (flags & EXT4_ENCRYPT_FL)
 		new_fl |= S_ENCRYPTED;
+	if (flags & EXT4_VERITY_FL)
+		new_fl |= S_VERITY;
 	inode_set_flags(inode, new_fl,
 			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|S_DAX|
-			S_ENCRYPTED);
+			S_ENCRYPTED|S_VERITY);
 }
 
 static blkcnt_t ext4_inode_blocks(struct ext4_inode *raw_inode,
@@ -5510,7 +5512,7 @@ int ext4_setattr(struct dentry *dentry, struct iattr *attr)
 	if (error)
 		return error;
 
-	if (ext4_verity_inode(inode)) {
+	if (IS_VERITY(inode)) {
 		error = fsverity_prepare_setattr(dentry, attr);
 		if (error)
 			return error;
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 7252f0a60cdb..2c037df629dd 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -206,7 +206,7 @@ static void mpage_end_io(struct bio *bio)
 static inline loff_t ext4_readpage_limit(struct inode *inode)
 {
 #ifdef CONFIG_EXT4_FS_VERITY
-	if (ext4_verity_inode(inode)) {
+	if (IS_VERITY(inode)) {
 		if (inode->i_verity_info)
 			/* limit to end of metadata region */
 			return fsverity_full_i_size(inode);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 16fb483a6f4a..35ed3c48f8d2 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1344,6 +1344,7 @@ static int ext4_set_verity(struct inode *inode, loff_t data_i_size)
 	err = ext4_reserve_inode_write(handle, inode, &iloc);
 	if (err == 0) {
 		ext4_set_inode_flag(inode, EXT4_INODE_VERITY);
+		ext4_set_inode_flags(inode);
 		EXT4_I(inode)->i_disksize = data_i_size;
 		err = ext4_mark_iloc_dirty(handle, inode, &iloc);
 	}
-- 
2.19.1

