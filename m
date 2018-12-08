Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3124E7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  8 Dec 2018 06:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbeLHGwl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 8 Dec 2018 01:52:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44266 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbeLHGwl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Dec 2018 01:52:41 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB86mPcB092206
        for <linux-doc@vger.kernel.org>; Sat, 8 Dec 2018 01:52:39 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p82u4vxa0-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 08 Dec 2018 01:52:39 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Sat, 8 Dec 2018 06:52:39 -0000
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
        by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 8 Dec 2018 06:52:32 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB86qU2P18809058
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 8 Dec 2018 06:52:30 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D13D0AC062;
        Sat,  8 Dec 2018 06:52:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EB419AC05B;
        Sat,  8 Dec 2018 06:52:22 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.72.40])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Sat,  8 Dec 2018 06:52:22 +0000 (GMT)
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
Subject: [PATCH V3 4/9] Add S_VERITY and IS_VERITY()
Date:   Sat,  8 Dec 2018 12:21:39 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
References: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18120806-2213-0000-0000-00000326D147
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010192; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01128647; UDB=6.00586333; IPR=6.00908778;
 MB=3.00024599; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-08 06:52:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120806-2214-0000-0000-00005C871BBB
Message-Id: <20181208065144.19486-5-chandan@linux.vnet.ibm.com>
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

Similar to S_ENCRYPTED/IS_ENCRYPTED(), this commit adds
S_VERITY/IS_VERITY() to be able to check if a VFS inode has verity
information associated with it.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
---
 include/linux/fs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 389a35e028bf..de602d9f8d0e 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1938,6 +1938,7 @@ struct super_operations {
 #define S_DAX		0	/* Make all the DAX code disappear */
 #endif
 #define S_ENCRYPTED	16384	/* Encrypted file (using fs/crypto/) */
+#define S_VERITY	32768	/* Verity file (using fs/verity/) */
 
 /*
  * Note that nosuid etc flags are inode-specific: setting some file-system
@@ -1978,6 +1979,7 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
 #define IS_NOSEC(inode)		((inode)->i_flags & S_NOSEC)
 #define IS_DAX(inode)		((inode)->i_flags & S_DAX)
 #define IS_ENCRYPTED(inode)	((inode)->i_flags & S_ENCRYPTED)
+#define IS_VERITY(inode)	((inode)->i_flags & S_VERITY)
 
 #define IS_WHITEOUT(inode)	(S_ISCHR(inode->i_mode) && \
 				 (inode)->i_rdev == WHITEOUT_DEV)
-- 
2.19.1

