Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976E0C636D6
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 18:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjBIStB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 13:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjBIStA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 13:49:00 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5777F59E7B
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 10:48:59 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id y4so1968146pfe.4
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 10:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBCCRT/9+pLKu5FymkoHc9xf4Gc9hpzzFtrQnNwvTxw=;
        b=bKF5d5Nd8lyHPOWWI1AwfhtshWiysfT7QgeZlxRG/tNrLtNbT2neFQwDH4LoqWpldT
         +CbG8L2bzmr0hfZ8gavYm2gU3AWV4Oz+K5vZA/JcGJh760dQpCMnNNYJO1c5lIT2TZj9
         xtMd6E8wyOvler1mJnGXghGbzu7HpGyKgAcctGAz/+MmyOycRlyCkzDPp3ZvUZJLZy3j
         rd8Q2mcXIffUDGpm/H8Lw/ExWODfC/8w+00KTreqJidGP4srGgEMTeju68DRk44aLOZZ
         zoJUCFicRoyniTDTrgujH1Wwq98xBVJsn8WaS6TNUTXU4Zu2BBMVMUYsRnZuwIvHXIs9
         7esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBCCRT/9+pLKu5FymkoHc9xf4Gc9hpzzFtrQnNwvTxw=;
        b=FPrmtNXY18GLk5SQEZ2gP6+UIXW7d2uKmEva4PCH+cEHVKcdqWo73jBx2UHfEvY7Zr
         t3JeL1vAzpzzjjv5lVAg9PX/pEcdoYKN0sGJeqG+jrcHEL3OsTUij0MRnkhF+HPqne68
         +FMjV6Kc1PD/L71Dci0oLOSC0LFVLKnlKBJkQHJ5o7nw1h3y+eEgqcr50VYGrNcFCKwg
         fmxXRCW8mDsvuDfgYnbZsvu0Mhp5VQSJWuRj79CyD+fNliDQdx4REnlKHfzPZnCTj3Lg
         /8spzjvX87pMU9GtGo+noAo/UaKMs7IeyruA52bbrvZKxeycQiZgL6FXY4mEokDzalGX
         CzVA==
X-Gm-Message-State: AO0yUKVtGwrH5fDFT3A3OoRCnuYdmNmbf2ryDZdQYxyznuy5Fc6LVoqI
        iUqWvZ190B585CPtoK6aA+ajgQ==
X-Google-Smtp-Source: AK7set+8uRYm02PUJG2CI1RNNKf0Dv8QTlWW8X4JW7B0f5RBh37dYdguHZpdEr6DnQO8aegWmvmpXg==
X-Received: by 2002:a62:164b:0:b0:5a8:5247:2593 with SMTP id 72-20020a62164b000000b005a852472593mr3046770pfw.28.1675968538638;
        Thu, 09 Feb 2023 10:48:58 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n12-20020aa78a4c000000b005a7e9d0c419sm1767046pfa.58.2023.02.09.10.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:48:58 -0800 (PST)
Date:   Thu, 09 Feb 2023 10:48:58 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 10:46:25 PST (-0800)
Subject:     Re: [PATCH] Documentation: riscv: fix insufficient list item indent
In-Reply-To: <Y9c0EU5epWCeoPB8@debian.me>
CC:     Conor Dooley <conor@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, lkp@intel.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     bagasdotme@gmail.com
Message-ID: <mhng-4defd1c9-ee2a-4f95-89f9-7c47ee6b97e9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 29 Jan 2023 19:05:53 PST (-0800), bagasdotme@gmail.com wrote:
> On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> When adding the ISA string ordering rules, I didn't sufficiently indent
>> one of the list items.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> Seems like you forget to add link to the report:
>
> Link: https://lore.kernel.org/linux-doc/202301300743.bp7Dpazv-lkp@intel.com/

Is that the normal way to do it?  I've only been adding the Reported-by 
like the bot suggests, but I guess it's kind of nice information to have 
the bug report as well.  From looking at git history it's kind of a mix.

Maybe the bot should suggest this in the bug report, right next to the other
tag?

>> ---
>>  Documentation/riscv/uabi.rst | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
>> index 2ebec4c52230..8960fac42c40 100644
>> --- a/Documentation/riscv/uabi.rst
>> +++ b/Documentation/riscv/uabi.rst
>> @@ -21,10 +21,10 @@ so for our purposes the following rules apply:
>>     single-letter extensions and before any higher-privileged extensions.
>>  
>>  #. For additional standard extensions, the first letter following the 'Z'
>> -  conventionally indicates the most closely related alphabetical
>> -  extension category. If multiple 'Z' extensions are named, they will be ordered
>> -  first by category, in canonical order, as listed above, then alphabetically
>> -  within a category.
>> +   conventionally indicates the most closely related alphabetical
>> +   extension category. If multiple 'Z' extensions are named, they will be
>> +   ordered first by category, in canonical order, as listed above, then
>> +   alphabetically within a category.
>>  
>>  #. Standard supervisor-level extensions (starting with 'S') will be listed
>>     after standard unprivileged extensions.  If multiple supervisor-level
>
> The warning is fixed, thanks!
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> -- 
> An old man doll... just what I always wanted! - Clara
