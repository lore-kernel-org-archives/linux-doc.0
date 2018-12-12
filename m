Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 277A87D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 09:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbeLLJvi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Dec 2018 04:51:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33522 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726697AbeLLJvi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Dec 2018 04:51:38 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBC9ndkK141354
        for <linux-doc@vger.kernel.org>; Wed, 12 Dec 2018 04:51:37 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2paycqt89u-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 12 Dec 2018 04:51:37 -0500
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Wed, 12 Dec 2018 09:51:36 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
        by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 12 Dec 2018 09:51:31 -0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wBC9pSVn20119630
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Dec 2018 09:51:28 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A5E326A054;
        Wed, 12 Dec 2018 09:51:28 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2652D6A047;
        Wed, 12 Dec 2018 09:51:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.69.92])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 12 Dec 2018 09:51:19 +0000 (GMT)
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
Subject: [PATCH V5 6/9] f2fs: use IS_VERITY() to check inode's fsverity status
Date:   Wed, 12 Dec 2018 15:20:15 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181212095018.12648-1-chandan@linux.vnet.ibm.com>
References: <20181212095018.12648-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18121209-0016-0000-0000-000009633645
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010214; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01130624; UDB=6.00587518; IPR=6.00910758;
 MB=3.00024664; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-12 09:51:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121209-0017-0000-0000-000041608A7E
Message-Id: <20181212095018.12648-7-chandan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-12_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812120087
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit removes the f2fs specific f2fs_verity_file() and makes use
of the generic IS_VERITY() macro or file_is_verity() to check for the
verity status of an inode.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
---
 fs/f2fs/f2fs.h  | 7 +------
 fs/f2fs/file.c  | 6 +++---
 fs/f2fs/inode.c | 4 +++-
 fs/f2fs/super.c | 1 +
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f9c8b0afc1de..54bd93c7b630 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3448,18 +3448,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
 #endif
 }
 
-static inline bool f2fs_verity_file(struct inode *inode)
-{
-	return file_is_verity(inode);
-}
-
 /*
  * Returns true if the reads of the inode's data need to undergo some
  * postprocessing step, like decryption or authenticity verification.
  */
 static inline bool f2fs_post_read_required(struct inode *inode)
 {
-	return f2fs_encrypted_file(inode) || f2fs_verity_file(inode);
+	return f2fs_encrypted_file(inode) || IS_VERITY(inode);
 }
 
 #define F2FS_FEATURE_FUNCS(name, flagname) \
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6c7ad15000b9..2eb4821d95d1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -491,7 +491,7 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (err)
 		return err;
 
-	if (f2fs_verity_file(inode)) {
+	if (IS_VERITY(inode)) {
 		err = fsverity_file_open(inode, filp);
 		if (err)
 			return err;
@@ -701,7 +701,7 @@ int f2fs_getattr(const struct path *path, struct kstat *stat,
 	struct f2fs_inode *ri;
 	unsigned int flags;
 
-	if (f2fs_verity_file(inode)) {
+	if (IS_VERITY(inode)) {
 		/*
 		 * For fs-verity we need to override i_size with the original
 		 * data i_size.  This requires I/O to the file which with
@@ -800,7 +800,7 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (err)
 		return err;
 
-	if (f2fs_verity_file(inode)) {
+	if (IS_VERITY(inode)) {
 		err = fsverity_prepare_setattr(dentry, attr);
 		if (err)
 			return err;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index d731d23aedee..ff9126616d65 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -45,9 +45,11 @@ void f2fs_set_inode_flags(struct inode *inode)
 		new_fl |= S_DIRSYNC;
 	if (file_is_encrypt(inode))
 		new_fl |= S_ENCRYPTED;
+	if (file_is_verity(inode))
+		new_fl |= S_VERITY;
 	inode_set_flags(inode, new_fl,
 			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|
-			S_ENCRYPTED);
+			S_ENCRYPTED|S_VERITY);
 }
 
 static void __get_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4287cf348d3c..73320202bd01 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2207,6 +2207,7 @@ static int f2fs_set_verity(struct inode *inode, loff_t data_i_size)
 		return err;
 
 	file_set_verity(inode);
+	f2fs_set_inode_flags(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 	return 0;
 }
-- 
2.19.1

