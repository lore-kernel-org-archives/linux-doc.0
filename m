Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 71E167D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 02:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbeLLCsQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Dec 2018 21:48:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:38468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726237AbeLLCsP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Dec 2018 21:48:15 -0500
Received: from sol.localdomain (c-24-23-142-8.hsd1.ca.comcast.net [24.23.142.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FCD620855;
        Wed, 12 Dec 2018 02:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544582894;
        bh=dUx9E1yngo5JB8tCVd+KmU/rvkY7eMxjKb4sg5ZJpeU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CVkGCDXcXClRpfCHFO016rMfeodDeDIldjepqgi3iv/Zfu09fmaA2GagbNlJFIMhm
         5nJ4lq9bprRZ6UmSr7paG6fUx9DpRRtGolyEETp1D5MmkW9OCFyd8VagSA43VZN7x/
         oVCXPHZDi+5A5iWmSYs7KiuZ+REHAaQGx4cPPRvE=
Date:   Tue, 11 Dec 2018 18:48:12 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Chandan Rajendra <chandan@linux.vnet.ibm.com>
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
Subject: Re: [PATCH V2 3/7] fscrypt: remove filesystem specific build config
 option
Message-ID: <20181212024811.GB722@sol.localdomain>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-4-chandan@linux.vnet.ibm.com>
 <20181212015211.GA23905@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181212015211.GA23905@roeck-us.net>
User-Agent: Mutt/1.11.0 (2018-11-25)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 11, 2018 at 05:52:11PM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Tue, Dec 04, 2018 at 03:26:46PM +0530, Chandan Rajendra wrote:
> > In order to have a common code base for fscrypt "post read" processing
> > for all filesystems which support encryption, this commit removes
> > filesystem specific build config option (e.g. CONFIG_EXT4_FS_ENCRYPTION)
> > and replaces it with a build option (i.e. CONFIG_FS_ENCRYPTION) whose
> > value affects all the filesystems making use of fscrypt.
> > 
> > Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> 
> this patch causes a recursive dependency when trying to build ia64 images.
> 
> make ARCH=ia64 allnoconfig:
> 
> scripts/kconfig/conf  --allnoconfig Kconfig
> arch/ia64/Kconfig:126:error: recursive dependency detected!
> arch/ia64/Kconfig:126:	choice <choice> contains symbol IA64_HP_SIM
> arch/ia64/Kconfig:200:	symbol IA64_HP_SIM is part of choice PM
> kernel/power/Kconfig:144:	symbol PM is selected by PM_SLEEP
> kernel/power/Kconfig:104:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
> kernel/power/Kconfig:31:	symbol HIBERNATE_CALLBACKS is selected by HIBERNATION
> kernel/power/Kconfig:34:	symbol HIBERNATION depends on SWAP
> init/Kconfig:250:	symbol SWAP depends on BLOCK
> block/Kconfig:5:	symbol BLOCK is selected by UBIFS_FS
> fs/ubifs/Kconfig:1:	symbol UBIFS_FS depends on MISC_FILESYSTEMS
> fs/Kconfig:220:	symbol MISC_FILESYSTEMS is selected by ACPI_APEI
> drivers/acpi/apei/Kconfig:8:	symbol ACPI_APEI depends on ACPI
> drivers/acpi/Kconfig:9:	symbol ACPI depends on ARCH_SUPPORTS_ACPI
> drivers/acpi/Kconfig:6:	symbol ARCH_SUPPORTS_ACPI is selected by IA64_HP_SIM
> arch/ia64/Kconfig:200:	symbol IA64_HP_SIM is part of choice <choice>
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> 
> scripts/kconfig/Makefile:69: recipe for target 'allnoconfig' failed
> 
> Reverting the patch fixes the problem.
> 

Thanks for the report.  Chandan, it appears the problem is UBIFS_FS selecting
BLOCK.  It's actually not necessary because now the parts of fs/crypto/ that
depend on BLOCK are separated out into a separate file fs/crypto/bio.c that is
only compiled with CONFIG_BLOCK.  So how about just removing the selection of
BLOCK from fs/ubifs/Kconfig:

	select BLOCK if FS_ENCRYPTION

- Eric
