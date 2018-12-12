Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 757777D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 06:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbeLLG1j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Dec 2018 01:27:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41702 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbeLLG1i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Dec 2018 01:27:38 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBC6OIuU040015
        for <linux-doc@vger.kernel.org>; Wed, 12 Dec 2018 01:27:37 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pauv1tu61-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 12 Dec 2018 01:27:37 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
        Wed, 12 Dec 2018 06:27:34 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 12 Dec 2018 06:27:27 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wBC6RQqg29229250
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Dec 2018 06:27:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id ADFB442042;
        Wed, 12 Dec 2018 06:27:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 58FDF42041;
        Wed, 12 Dec 2018 06:27:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.69.92])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 12 Dec 2018 06:27:21 +0000 (GMT)
From:   Chandan Rajendra <chandan@linux.vnet.ibm.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-ext4@vger.kernel.org,
        linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        linux-mips@linux-mips.org, linux-s390@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
        yuchao0@huawei.com, corbet@lwn.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, green.hu@gmail.com,
        deanbo422@gmail.com, schwidefsky@de.ibm.com,
        heiko.carstens@de.ibm.com, richard@nod.at, dedekind1@gmail.com,
        adrian.hunter@intel.com, viro@zeniv.linux.org.uk
Subject: Re: [PATCH V2 3/7] fscrypt: remove filesystem specific build config option
Date:   Wed, 12 Dec 2018 11:57:31 +0530
Organization: IBM
In-Reply-To: <20181212024811.GB722@sol.localdomain>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com> <20181212015211.GA23905@roeck-us.net> <20181212024811.GB722@sol.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 18121206-0020-0000-0000-000002F5C868
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121206-0021-0000-0000-00002145F28F
Message-Id: <5001320.eMptl8WvNp@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-12_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812120056
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wednesday, December 12, 2018 8:18:12 AM IST Eric Biggers wrote:
> On Tue, Dec 11, 2018 at 05:52:11PM -0800, Guenter Roeck wrote:
> > Hi,
> > 
> > On Tue, Dec 04, 2018 at 03:26:46PM +0530, Chandan Rajendra wrote:
> > > In order to have a common code base for fscrypt "post read" processing
> > > for all filesystems which support encryption, this commit removes
> > > filesystem specific build config option (e.g. CONFIG_EXT4_FS_ENCRYPTION)
> > > and replaces it with a build option (i.e. CONFIG_FS_ENCRYPTION) whose
> > > value affects all the filesystems making use of fscrypt.
> > > 
> > > Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> > 
> > this patch causes a recursive dependency when trying to build ia64 images.
> > 
> > make ARCH=ia64 allnoconfig:
> > 
> > scripts/kconfig/conf  --allnoconfig Kconfig
> > arch/ia64/Kconfig:126:error: recursive dependency detected!
> > arch/ia64/Kconfig:126:	choice <choice> contains symbol IA64_HP_SIM
> > arch/ia64/Kconfig:200:	symbol IA64_HP_SIM is part of choice PM
> > kernel/power/Kconfig:144:	symbol PM is selected by PM_SLEEP
> > kernel/power/Kconfig:104:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
> > kernel/power/Kconfig:31:	symbol HIBERNATE_CALLBACKS is selected by HIBERNATION
> > kernel/power/Kconfig:34:	symbol HIBERNATION depends on SWAP
> > init/Kconfig:250:	symbol SWAP depends on BLOCK
> > block/Kconfig:5:	symbol BLOCK is selected by UBIFS_FS
> > fs/ubifs/Kconfig:1:	symbol UBIFS_FS depends on MISC_FILESYSTEMS
> > fs/Kconfig:220:	symbol MISC_FILESYSTEMS is selected by ACPI_APEI
> > drivers/acpi/apei/Kconfig:8:	symbol ACPI_APEI depends on ACPI
> > drivers/acpi/Kconfig:9:	symbol ACPI depends on ARCH_SUPPORTS_ACPI
> > drivers/acpi/Kconfig:6:	symbol ARCH_SUPPORTS_ACPI is selected by IA64_HP_SIM
> > arch/ia64/Kconfig:200:	symbol IA64_HP_SIM is part of choice <choice>
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> > 
> > scripts/kconfig/Makefile:69: recipe for target 'allnoconfig' failed
> > 
> > Reverting the patch fixes the problem.
> > 
> 
> Thanks for the report.  Chandan, it appears the problem is UBIFS_FS selecting
> BLOCK.  It's actually not necessary because now the parts of fs/crypto/ that
> depend on BLOCK are separated out into a separate file fs/crypto/bio.c that is
> only compiled with CONFIG_BLOCK.  So how about just removing the selection of
> BLOCK from fs/ubifs/Kconfig:
> 
> 	select BLOCK if FS_ENCRYPTION
> 

Yes, I will do that.

Also, Apologies for sending V4 of the patchset without checking for newer
responses from you.

-- 
chandan



