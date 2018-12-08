Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5DF457D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  8 Dec 2018 06:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbeLHGxd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 8 Dec 2018 01:53:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44674 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726266AbeLHGxc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Dec 2018 01:53:32 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB86mOAa028024
        for <linux-doc@vger.kernel.org>; Sat, 8 Dec 2018 01:53:31 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p81fcr4bn-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 08 Dec 2018 01:53:31 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Sat, 8 Dec 2018 06:53:30 -0000
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
        by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 8 Dec 2018 06:53:24 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB86rMjB20447432
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 8 Dec 2018 06:53:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8AC7BAC05B;
        Sat,  8 Dec 2018 06:53:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 77D79AC059;
        Sat,  8 Dec 2018 06:53:14 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.72.40])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Sat,  8 Dec 2018 06:53:14 +0000 (GMT)
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
Subject: [PATCH V3 9/9] fsverity: Move verity status check to fsverity_prepare_setattr
Date:   Sat,  8 Dec 2018 12:21:44 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
References: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18120806-0040-0000-0000-0000049F8024
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010192; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01128647; UDB=6.00577119; IPR=6.00908778;
 MB=3.00024599; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-08 06:53:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120806-0041-0000-0000-000008A89DB2
Message-Id: <20181208065144.19486-10-chandan@linux.vnet.ibm.com>
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

Instead of conditionally checking for verity status of an inode before
invoking fsverity_prepare_setattr(), this commit moves the check inside the
definition of fsverity_prepare_setattr().

Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
---
 fs/ext4/inode.c   | 8 +++-----
 fs/f2fs/file.c    | 8 +++-----
 fs/verity/setup.c | 2 +-
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 703f55635824..44561e68886b 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5510,11 +5510,9 @@ int ext4_setattr(struct dentry *dentry, struct iattr *attr)
 	if (error)
 		return error;
 
-	if (IS_VERITY(inode)) {
-		error = fsverity_prepare_setattr(dentry, attr);
-		if (error)
-			return error;
-	}
+	error = fsverity_prepare_setattr(dentry, attr);
+	if (error)
+		return error;
 
 	if (is_quota_modification(inode, attr)) {
 		error = dquot_initialize(inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 925c0d9608da..422907ca37c6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -798,11 +798,9 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (err)
 		return err;
 
-	if (IS_VERITY(inode)) {
-		err = fsverity_prepare_setattr(dentry, attr);
-		if (err)
-			return err;
-	}
+	err = fsverity_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
 
 	if (is_quota_modification(inode, attr)) {
 		err = dquot_initialize(inode);
diff --git a/fs/verity/setup.c b/fs/verity/setup.c
index bc463dc601b1..154556d72691 100644
--- a/fs/verity/setup.c
+++ b/fs/verity/setup.c
@@ -796,7 +796,7 @@ EXPORT_SYMBOL_GPL(fsverity_file_open);
  */
 int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
 {
-	if (attr->ia_valid & ATTR_SIZE) {
+	if (IS_VERITY(d_inode(dentry)) && (attr->ia_valid & ATTR_SIZE)) {
 		pr_debug("Denying truncate of verity file (ino %lu)\n",
 			 d_inode(dentry)->i_ino);
 		return -EPERM;
-- 
2.19.1

