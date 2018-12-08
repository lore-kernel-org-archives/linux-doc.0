Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5CB8C7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  8 Dec 2018 06:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbeLHGxE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 8 Dec 2018 01:53:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55474 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726147AbeLHGxD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Dec 2018 01:53:03 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB86mNK7006933
        for <linux-doc@vger.kernel.org>; Sat, 8 Dec 2018 01:53:02 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p8424afp2-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 08 Dec 2018 01:53:02 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Sat, 8 Dec 2018 06:53:01 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
        by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 8 Dec 2018 06:52:55 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB86qrZL18088126
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 8 Dec 2018 06:52:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DB3EFAC05B;
        Sat,  8 Dec 2018 06:52:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B315FAC05E;
        Sat,  8 Dec 2018 06:52:45 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.72.40])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Sat,  8 Dec 2018 06:52:41 +0000 (GMT)
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
Subject: [PATCH V3 6/9] f2fs: use IS_VERITY() to check inode's fsverity status
Date:   Sat,  8 Dec 2018 12:21:41 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
References: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18120806-0072-0000-0000-000003D65931
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010192; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01128647; UDB=6.00582089; IPR=6.00908778;
 MB=3.00024599; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-08 06:53:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120806-0073-0000-0000-00004A5F4936
Message-Id: <20181208065144.19486-7-chandan@linux.vnet.ibm.com>
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

This commit removes the f2fs specific f2fs_verity_file() and makes use
of the generic IS_VERITY() macro or file_is_verity() to check for the
verity status of an inode.

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

