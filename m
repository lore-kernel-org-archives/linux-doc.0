Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3BE247D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 04:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbeLLEHu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Dec 2018 23:07:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60192 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726362AbeLLEHu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Dec 2018 23:07:50 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBC3xCen091519
        for <linux-doc@vger.kernel.org>; Tue, 11 Dec 2018 23:07:49 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pasww2eqj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 11 Dec 2018 23:07:49 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Wed, 12 Dec 2018 04:07:47 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
        by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 12 Dec 2018 04:07:42 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wBC47enk20774976
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Dec 2018 04:07:40 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CF106112065;
        Wed, 12 Dec 2018 04:07:40 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CEB86112064;
        Wed, 12 Dec 2018 04:07:32 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.35.96])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 12 Dec 2018 04:07:32 +0000 (GMT)
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
Subject: [PATCH V4 0/9] Remove fs specific fscrypt and fsverity build config options
Date:   Wed, 12 Dec 2018 09:37:27 +0530
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18121204-0068-0000-0000-000003704809
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010214; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01130510; UDB=6.00587450; IPR=6.00910643;
 MB=3.00024659; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-12 04:07:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121204-0069-0000-0000-000046BC5B44
Message-Id: <20181212040736.2849-1-chandan@linux.vnet.ibm.com>
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

In order to have a common code base for fscrypt & fsverity "post read"
processing across filesystems which implement fscrypt/fsverity, this
commit removes filesystem specific build config option
(CONFIG_EXT4_FS_ENCRYPTION, CONFIG_EXT4_FS_VERITY,
CONFIG_F2FS_FS_ENCRYPTION, CONFIG_F2FS_FS_VERITY and
CONFIG_UBIFS_FS_ENCRYPTION) and replaces it with build options
(CONFIG_FS_ENCRYPTION and CONFIG_FS_VERITY) whose values affect all
the filesystems making use of fscrypt and fsverity.

The Kconfig recursive dependency issue reported by kbuild test bot for
IA64 architecture still needs to be fixed. I should be able to fix the
problem and post the next verison of patches by today.

PS: Since I have access to only to x86 and ppc64le machines, I haven't tested the
defconfig files for other architectures.

Changelog:
V3 -> V4:
1. For non-fsverity supported kernels, return success when fsverity_file_open()
   is invoked for non-fsverity files.

V2 -> V3:
1. Remove unnecessary line breaks.
2. Remove the definition of f2fs_encrypted_inode().
3. Fix Kconfig dependencies for fscrypt w.r.t F2FS and UBIFS. If F2FS is enabled
   in the kernel build configuration, F2FS_FS_XATTR is selected if FS_ENCRYPTION
   is enabled. Similarly, if UBIFS is enabled in the kernel build configuration,
   UBIFS_FS_XATTR and BLOCK is selected if FS_ENCRYPTION is enabled.
4. Two new patches have been added to move verity status check to
   fsverity_file_open() and fsverity_prepare_setattr().
5. For patch "f2fs: use IS_VERITY() to check inode's fsverity status", the
   acked-by tag given by Chao Yu has been removed since I added an invocation to
   f2fs_set_inode_flags() inside f2fs_set_verity(). This is needed to have
   S_VERITY flag set on the corresponding VFS inode.

V1 -> V2:
1. Address the following review comments provided by Eric Biggers,
   - In ext4_should_use_dax(), Use ext4_test_inode_flag() to check for
     fscrypt/fsverity status of an inode.
   - Update documentation associated with fscrypt & fsverity to refer to
     CONFIG_FS_ENCRYPTION and CONFIG_FS_VERITY build flags.
   - Remove filesystem specific fscrypt build configuration from defconfig
     files.
   - Provide a list of supported filesystems for CONFIG_FS_ENCRYPTION and
     CONFIG_FS_VERITY build flags.
   - Update comment describing S_VERITY flag.
2. Remove UBIFS specific encryption build option and make use of the generic
   CONFIG_FS_ENCRYPTION flag.

RFC -> V1:
1. Add a new patch to implement S_VERITY/IS_VERITY().
2. Split code that replaces filesystem specific routines with generic
   IS_ENCRYPTED() and IS_VERITY() calls into separate patches.

Chandan Rajendra (9):
  ext4: use IS_ENCRYPTED() to check encryption status
  f2fs: use IS_ENCRYPTED() to check encryption status
  fscrypt: remove filesystem specific build config option
  Add S_VERITY and IS_VERITY()
  ext4: use IS_VERITY() to check inode's fsverity status
  f2fs: use IS_VERITY() to check inode's fsverity status
  fsverity: Remove filesystem specific build config option
  fsverity: Move verity status check to fsverity_file_open
  fsverity: Move verity status check to fsverity_prepare_setattr

 Documentation/filesystems/fscrypt.rst   |   4 +-
 Documentation/filesystems/fsverity.rst  |   4 +-
 arch/mips/configs/generic_defconfig     |   2 +-
 arch/nds32/configs/defconfig            |   2 +-
 arch/s390/configs/debug_defconfig       |   2 +-
 arch/s390/configs/performance_defconfig |   2 +-
 fs/crypto/Kconfig                       |   5 +-
 fs/crypto/fscrypt_private.h             |   1 -
 fs/ext4/Kconfig                         |  35 --
 fs/ext4/dir.c                           |  10 +-
 fs/ext4/ext4.h                          |  23 +-
 fs/ext4/ext4_jbd2.h                     |   2 +-
 fs/ext4/extents.c                       |   4 +-
 fs/ext4/file.c                          |   8 +-
 fs/ext4/ialloc.c                        |   2 +-
 fs/ext4/inode.c                         |  40 ++-
 fs/ext4/ioctl.c                         |   4 +-
 fs/ext4/move_extent.c                   |   3 +-
 fs/ext4/namei.c                         |  18 +-
 fs/ext4/page-io.c                       |   9 +-
 fs/ext4/readpage.c                      |  10 +-
 fs/ext4/super.c                         |  13 +-
 fs/ext4/sysfs.c                         |   8 +-
 fs/f2fs/Kconfig                         |  32 +-
 fs/f2fs/data.c                          |   6 +-
 fs/f2fs/dir.c                           |  10 +-
 fs/f2fs/f2fs.h                          |  23 +-
 fs/f2fs/file.c                          |  28 +-
 fs/f2fs/inode.c                         |   8 +-
 fs/f2fs/namei.c                         |   6 +-
 fs/f2fs/super.c                         |  15 +-
 fs/f2fs/sysfs.c                         |   8 +-
 fs/ubifs/Kconfig                        |  13 +-
 fs/ubifs/Makefile                       |   2 +-
 fs/ubifs/ioctl.c                        |   4 +-
 fs/ubifs/sb.c                           |   2 +-
 fs/ubifs/super.c                        |   2 +-
 fs/ubifs/ubifs.h                        |   5 +-
 fs/verity/Kconfig                       |   3 +-
 fs/verity/fsverity_private.h            |   1 -
 fs/verity/setup.c                       |   5 +-
 include/linux/fs.h                      |  10 +-
 include/linux/fscrypt.h                 | 416 +++++++++++++++++++++++-
 include/linux/fscrypt_notsupp.h         | 231 -------------
 include/linux/fscrypt_supp.h            | 204 ------------
 include/linux/fsverity.h                |  17 +-
 46 files changed, 562 insertions(+), 700 deletions(-)
 delete mode 100644 include/linux/fscrypt_notsupp.h
 delete mode 100644 include/linux/fscrypt_supp.h

-- 
2.19.1

