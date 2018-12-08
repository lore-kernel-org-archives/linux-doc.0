Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 739DC7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  8 Dec 2018 07:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbeLHHH1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 8 Dec 2018 02:07:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38188 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbeLHHH1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Dec 2018 02:07:27 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB86wrrZ009298
        for <linux-doc@vger.kernel.org>; Sat, 8 Dec 2018 02:07:26 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p895sr8g6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 08 Dec 2018 02:07:26 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Sat, 8 Dec 2018 07:07:24 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 8 Dec 2018 07:07:17 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB877GlW62783584
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 8 Dec 2018 07:07:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AD98142047;
        Sat,  8 Dec 2018 07:07:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BF6014203F;
        Sat,  8 Dec 2018 07:07:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.85.67])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Sat,  8 Dec 2018 07:07:11 +0000 (GMT)
From:   Chandan Rajendra <chandan@linux.vnet.ibm.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-doc@vger.kernel.org, linux-mips@linux-mips.org,
        linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, tytso@mit.edu,
        adilger.kernel@dilger.ca, jaegeuk@kernel.org, yuchao0@huawei.com,
        corbet@lwn.net, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org, green.hu@gmail.com, deanbo422@gmail.com,
        schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, richard@nod.at,
        dedekind1@gmail.com, adrian.hunter@intel.com,
        viro@zeniv.linux.org.uk
Subject: Re: [PATCH V2 3/7] fscrypt: remove filesystem specific build config option
Date:   Sat, 08 Dec 2018 12:37:20 +0530
Organization: IBM
In-Reply-To: <20181204234320.GC70682@gmail.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com> <20181204095650.12562-4-chandan@linux.vnet.ibm.com> <20181204234320.GC70682@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 18120807-0028-0000-0000-00000327C220
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120807-0029-0000-0000-000023E3DE0D
Message-Id: <2062340.ny9MuQaG0V@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-08_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812080067
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wednesday, December 5, 2018 5:13:21 AM IST Eric Biggers wrote:
> Hi Chandan,
> 
> On Tue, Dec 04, 2018 at 03:26:46PM +0530, Chandan Rajendra wrote:
> > In order to have a common code base for fscrypt "post read" processing
> > for all filesystems which support encryption, this commit removes
> > filesystem specific build config option (e.g. CONFIG_EXT4_FS_ENCRYPTION)
> > and replaces it with a build option (i.e. CONFIG_FS_ENCRYPTION) whose
> > value affects all the filesystems making use of fscrypt.
> > 
> > Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> [...]
> > -config F2FS_FS_ENCRYPTION
> > -	bool "F2FS Encryption"
> > -	depends on F2FS_FS
> > -	depends on F2FS_FS_XATTR
> > -	select FS_ENCRYPTION
> > -	help
> > -	  Enable encryption of f2fs files and directories.  This
> > -	  feature is similar to ecryptfs, but it is more memory
> > -	  efficient since it avoids caching the encrypted and
> > -	  decrypted pages in the page cache.
> > -
> [...]
> > -config UBIFS_FS_ENCRYPTION
> > -	bool "UBIFS Encryption"
> > -	depends on UBIFS_FS && UBIFS_FS_XATTR && BLOCK
> > -	select FS_ENCRYPTION
> > -	default n
> > -	help
> > -	  Enable encryption of UBIFS files and directories. This
> > -	  feature is similar to ecryptfs, but it is more memory
> > -	  efficient since it avoids caching the encrypted and
> > -	  decrypted pages in the page cache.
> 
> Will it cause problems that now f2fs encryption can be "enabled" without
> F2FS_FS_XATTR, and ubifs encryption without UBIFS_FS_XATTR && BLOCK?
> 
> Otherwise I think this patch looks fine.  I'm a bit concerned about the bloat
> from making FS_ENCRYPTION non-modular, but given that it will make sharing I/O
> code much easier, it's probably worthwhile.
> 
> It would help to strip down the dependencies of FS_ENCRYPTION to just the stuff
> needed for just AES-256-XTS and AES-256-CTS.  I already sent out a patch a
> couple months ago (https://patchwork.kernel.org/patch/10589319/) to remove
> CONFIG_CTR which isn't used at all; I'll remind Ted to apply that.  But we could
> also drop CONFIG_SHA256, which is only needed for AES-128-CBC contents
> encryption.  If we do that, it should be a separate patch, though.

Hi Eric,

fscrypt_valid_enc_modes() allows FS_ENCRYPTION_MODE_AES_128_CBC to be used for
encryption of file's contents. This is consistent with what you had mentioned
above.

static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
                                           u32 filenames_mode)
{
        if (contents_mode == FS_ENCRYPTION_MODE_AES_128_CBC &&
            filenames_mode == FS_ENCRYPTION_MODE_AES_128_CTS)
                return true;

        if (contents_mode == FS_ENCRYPTION_MODE_AES_256_XTS &&
            filenames_mode == FS_ENCRYPTION_MODE_AES_256_CTS)
                return true;

        return false;
}

Hence FS_ENCRYPTION does need to have AES-128-CBC and by extension SHA256 code
compiled in right? 

-- 
chandan



