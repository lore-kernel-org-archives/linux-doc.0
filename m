Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AA7027D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 04:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbeLLEI2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Dec 2018 23:08:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46950 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbeLLEI2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Dec 2018 23:08:28 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBC3xAtR047864
        for <linux-doc@vger.kernel.org>; Tue, 11 Dec 2018 23:08:27 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2parkwn2h2-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 11 Dec 2018 23:08:27 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Wed, 12 Dec 2018 04:08:26 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
        by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 12 Dec 2018 04:08:20 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wBC48IIC21561542
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Dec 2018 04:08:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F21FE112064;
        Wed, 12 Dec 2018 04:08:17 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8D7D6112067;
        Wed, 12 Dec 2018 04:08:09 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.35.96])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 12 Dec 2018 04:08:09 +0000 (GMT)
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
Subject: [PATCH V4 4/9] Add S_VERITY and IS_VERITY()
Date:   Wed, 12 Dec 2018 09:37:31 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181212040736.2849-1-chandan@linux.vnet.ibm.com>
References: <20181212040736.2849-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18121204-0068-0000-0000-000003704817
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010214; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01130510; UDB=6.00587450; IPR=6.00910643;
 MB=3.00024659; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-12 04:08:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121204-0069-0000-0000-000046BC5B95
Message-Id: <20181212040736.2849-5-chandan@linux.vnet.ibm.com>
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

