Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 122007D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 03:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbeLLDQK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Dec 2018 22:16:10 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43531 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbeLLDQK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Dec 2018 22:16:10 -0500
Received: by mail-pg1-f194.google.com with SMTP id v28so7622458pgk.10;
        Tue, 11 Dec 2018 19:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=knO8+GL2htjp9OgYiGzADsCPNWHogocmnPTrG+VZNKs=;
        b=QX0wCEtheauO1TkQgr7bwnBZBjqasgOzMixfXy5Jmk2Zg63MwIP7nWn124c1kvOUPf
         kqRhg+Glgn01V87OsONDwshBzpXK0zs3UXMkVxOq1NhQnHL7TzbQt9Ymeb1q/Xtb6cNX
         aOU3eTI7Tvf1jYQANkFJ9T9/3F3iAJcE9WegPJFHe9BEezWtwf1M1OX3z5H/iS5HB3g0
         EjDly/9Rnck8HAaQ8VfTsAAlvEOMgPMu0GWuozXoGcfz4GEbSMZfHdKxoG31r/8Aw8Wy
         7ijJGYfVArwHjhsHHSP+y4C/pe4W/ZP00hR8lNknttGaWinoS3dlWrQdyopOmQIL1Cpg
         ex9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=knO8+GL2htjp9OgYiGzADsCPNWHogocmnPTrG+VZNKs=;
        b=U4pF5rOTcJwhuzK60mIfydo/DX0S9KGfZtIVXKFrGT7VTpSc21LvdvIJhtF74ahVtV
         kCNnJDdO+ytFwgnVI9bbuvDMAQLA05VcqQwfnDNneoPsWsfiF0maMLIjtWE4TL1SfHWx
         FARlu+uGmcuGn2W+aA6TX09AkOKwH7gPqlJmWSfsBWmRO6Mag6KAeLJWFYUwACuzceIC
         IvZmA48W/7R0jOnF5bZK3+HWXKB9NA7iyKP03UNVx3StSp3JLfCWknAw+sDMm5z9LwXo
         WNxbqE/w9r7CSQnity8yi/SyAdXnAgTxoZSYa10TQCVwko8MQa3CjpaQiCfLiTtajCT1
         vHWw==
X-Gm-Message-State: AA+aEWb8RK7fnyWdyqaTdYE6sGfV8/kd/N2djH2wfwY5jzoR0VQQZGvU
        vVhNGKp2YsK47HVd6hSes2s=
X-Google-Smtp-Source: AFSGD/Uqbn/WIM6a99kfPP5XlXLkicMxKOseUWTaSVyuUKhhRva+JwcFPApff8298yB4jSceRcl21A==
X-Received: by 2002:a63:af18:: with SMTP id w24mr16986832pge.385.1544584569062;
        Tue, 11 Dec 2018 19:16:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t29sm24217732pfa.158.2018.12.11.19.16.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 19:16:08 -0800 (PST)
Subject: Re: [PATCH V2 3/7] fscrypt: remove filesystem specific build config
 option
To:     Eric Biggers <ebiggers@kernel.org>,
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
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-4-chandan@linux.vnet.ibm.com>
 <20181212015211.GA23905@roeck-us.net> <20181212024811.GB722@sol.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a006332b-a5cd-188b-d0bf-f2b7da6bad3b@roeck-us.net>
Date:   Tue, 11 Dec 2018 19:16:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181212024811.GB722@sol.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/11/18 6:48 PM, Eric Biggers wrote:
> On Tue, Dec 11, 2018 at 05:52:11PM -0800, Guenter Roeck wrote:
>> Hi,
>>
>> On Tue, Dec 04, 2018 at 03:26:46PM +0530, Chandan Rajendra wrote:
>>> In order to have a common code base for fscrypt "post read" processing
>>> for all filesystems which support encryption, this commit removes
>>> filesystem specific build config option (e.g. CONFIG_EXT4_FS_ENCRYPTION)
>>> and replaces it with a build option (i.e. CONFIG_FS_ENCRYPTION) whose
>>> value affects all the filesystems making use of fscrypt.
>>>
>>> Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
>>
>> this patch causes a recursive dependency when trying to build ia64 images.
>>
>> make ARCH=ia64 allnoconfig:
>>
>> scripts/kconfig/conf  --allnoconfig Kconfig
>> arch/ia64/Kconfig:126:error: recursive dependency detected!
>> arch/ia64/Kconfig:126:	choice <choice> contains symbol IA64_HP_SIM
>> arch/ia64/Kconfig:200:	symbol IA64_HP_SIM is part of choice PM
>> kernel/power/Kconfig:144:	symbol PM is selected by PM_SLEEP
>> kernel/power/Kconfig:104:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
>> kernel/power/Kconfig:31:	symbol HIBERNATE_CALLBACKS is selected by HIBERNATION
>> kernel/power/Kconfig:34:	symbol HIBERNATION depends on SWAP
>> init/Kconfig:250:	symbol SWAP depends on BLOCK
>> block/Kconfig:5:	symbol BLOCK is selected by UBIFS_FS
>> fs/ubifs/Kconfig:1:	symbol UBIFS_FS depends on MISC_FILESYSTEMS
>> fs/Kconfig:220:	symbol MISC_FILESYSTEMS is selected by ACPI_APEI
>> drivers/acpi/apei/Kconfig:8:	symbol ACPI_APEI depends on ACPI
>> drivers/acpi/Kconfig:9:	symbol ACPI depends on ARCH_SUPPORTS_ACPI
>> drivers/acpi/Kconfig:6:	symbol ARCH_SUPPORTS_ACPI is selected by IA64_HP_SIM
>> arch/ia64/Kconfig:200:	symbol IA64_HP_SIM is part of choice <choice>
>> For a resolution refer to Documentation/kbuild/kconfig-language.txt
>> subsection "Kconfig recursive dependency limitations"
>>
>> scripts/kconfig/Makefile:69: recipe for target 'allnoconfig' failed
>>
>> Reverting the patch fixes the problem.
>>
> 
> Thanks for the report.  Chandan, it appears the problem is UBIFS_FS selecting
> BLOCK.  It's actually not necessary because now the parts of fs/crypto/ that
> depend on BLOCK are separated out into a separate file fs/crypto/bio.c that is
> only compiled with CONFIG_BLOCK.  So how about just removing the selection of
> BLOCK from fs/ubifs/Kconfig:
> 
> 	select BLOCK if FS_ENCRYPTION
> 
The recursion is gone if I make this change.

Guenter
