Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6C1C61DA4
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 18:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjBIStA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 13:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjBISs7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 13:48:59 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C14929413
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 10:48:58 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id iz19so2516943plb.13
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 10:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZIc/r7bYzuMIOjUvK2RHyGmiHZMKzy4Jer4EZvR+SI=;
        b=kzE5FfjwdBdIF/eeWlIsvAAck4G0O8J9DNcHqjkgNi66nqzhoJmKNtopyWw+sCQkO2
         o8ZnkPJRfwecnoJTc7bytUPqfju8U/eTB+fqHWmWh3ys3MQoabstp4ZVzm8Vk5ClL0yf
         F2uJEerQTOKROdhsTiVEE3+Ejg+RFcbGgW0bYz878jpvkzWoOVNnI+f9m8iHyiRvuCfj
         7E2U37xlGl+RCM46tHAjbH/y7WVk+gCFt5DDwvJI//1JP/9OxO1G7AzCE6ltviuf3Lfe
         jp1rGa2JkrUSuId9kW/cF/WNKD/+FEn5sXvDnbYf4C++C7XKv5yGXgsFJIbKKaA0qb4m
         zkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZIc/r7bYzuMIOjUvK2RHyGmiHZMKzy4Jer4EZvR+SI=;
        b=bxGAfgloO7R28fnq6IrGnGjna/u2Zj+o1Ihq/voA+WoVZrIajnS7pNmb6q42tvQeDa
         OzM/csTeuOVvQCaFhfnDZuFF2/rbrttVswyVl/Bt8e9E6905F0/aT/ed4zBWxbINkw5i
         uA2x5+jd8cTXVRu7QRrv+77NghGTmou9X5g4GLN9L8uD6KSl7HbtYQH9sIs4fNEtzSTa
         DkZ/QEz8sP3rdkDOdfoWL0S/aKpTp8MAW/rWopZFzwg/NqpD4SZ+IXwH90+s3fK2/igi
         6mhLcqz61VImOSKLJNBbMJNYr5nnmEcMD+xXQ5E74M2HrYPwk34rjD9SWE64QNtJDVmK
         Jzvg==
X-Gm-Message-State: AO0yUKWQifW6ESwJqyYGME6/JT+RGo0p3czfkVRCUqTFGpTZDM97rpfi
        W6xB07eh/YZM8/PJaD9hSHhv9/oFUI6vBvLK
X-Google-Smtp-Source: AK7set+kgwcYaWGpVCyc3+lgy7B5U35kA772efRGUmYujP80e5RphXKdpXTlBvyQNcCjSTtpuB/RRQ==
X-Received: by 2002:a17:90b:4f43:b0:22c:69e:3f23 with SMTP id pj3-20020a17090b4f4300b0022c069e3f23mr14163118pjb.12.1675968537389;
        Thu, 09 Feb 2023 10:48:57 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id gn24-20020a17090ac79800b0023114357761sm1691949pjb.40.2023.02.09.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:48:56 -0800 (PST)
Date:   Thu, 09 Feb 2023 10:48:56 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 10:44:59 PST (-0800)
Subject:     Re: [PATCH] Documentation: riscv: fix insufficient list item indent
In-Reply-To: <Y+JnLkFlZ7ACW7A+@wendy>
CC:     Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        linux-doc@vger.kernel.org, corbet@lwn.net, lkp@intel.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-aea2bf4a-210a-4645-a475-4ee232d42ec8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 07 Feb 2023 06:58:54 PST (-0800), Conor Dooley wrote:
> Hey Palmer,
>
> If you do end up having WiFi could you pick this up so that the
> regressions report thingy stops whining at me?

Sorry I forgot about this one, it's on for-next.

>
> Thanks!
>
> On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> When adding the ISA string ordering rules, I didn't sufficiently indent
>> one of the list items.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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
>> -- 
>> 2.39.1
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>> 
