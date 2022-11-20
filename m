Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726C4C433FE
	for <linux-doc@archiver.kernel.org>; Sun, 20 Nov 2022 01:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiKTBpS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Nov 2022 20:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiKTBpS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Nov 2022 20:45:18 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FACB94AE
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 17:45:16 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id v3so8229184pgh.4
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6d5qGnIGRBzKsQXl05dVgjjiXTsNLkw5ORfFj9rjOM=;
        b=JAAmPXOmxPT2t+wgJzkz1PLrrEl2558J8GWMAZMnFRcNJ0pjf3I1VsAwpTyhsTxjoc
         706ptPj9J9tGCrdvoIfaJJ1+EOVpLt6T4UhyqvAZsJpr2zzONvuvP3BV6P10Am80Ldyh
         msQKGKk1Dn8IaeTQFW+gmxSaI6em4Lo3zUmj4RIQrb1n3K7Ms4wjPAMhIvqnr4jTs5ch
         7ncAx9u1zXbWwZsrf7myYnR9YE/RjQC9siba61Y7XZDAOuwGRrjz5/vA9eXMEdSX5o7J
         7bjkN+3BxwbflWWoUbi7CfYdEubGolEWkM8grWzXjDp1vaLe6iAzNzrCh4hawFM40fqQ
         zEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6d5qGnIGRBzKsQXl05dVgjjiXTsNLkw5ORfFj9rjOM=;
        b=lj+G4gDcmqU3ja7MJ8Lfvr80XTF2Ae3+XdKSYLOgVETRhRs4FfsAZ/WTCRjJvYcbcc
         S2Mk/tTT8O1RCtOsYszhHSfhkce3q6WJ9HVCEAUZ4jZnWb4T9gXvxxOmvRHSaeuQAtYq
         h8RQ7GC+qqQc6XiMFUyHbkkbcbMC8OsNYvlG+FDYJXhZYlcNS2EEaHpnB8uOg1Aw2TQz
         u9pOtVlL/3sxnPax+daQfm7D6lLT9iJKbNayip6sYAi0BjNd/JC1xjdFbzTqu3MRk8N8
         3kmh+pKRBMyGGpOUzSLDTs9k1X2RbmIaB6+Qp7jgoaxPSEfNClXDqhZep7hUZpRn332M
         bMXA==
X-Gm-Message-State: ANoB5plbMj2Ub6+NMzkFJyfrBzwREbWdliC0UFpXm4ZWUrj7UpGdRjQt
        b0+sJeoGKvrrsQDr0Tk6+wn0L72N8oE=
X-Google-Smtp-Source: AA0mqf6OCbjLsFSU4wqNUWleb7x2pCWJyROK5fToPD1F1A4KqPrDcjrrX2KyraQlXgOQwdVld94bxw==
X-Received: by 2002:a63:a54d:0:b0:46f:8466:745c with SMTP id r13-20020a63a54d000000b0046f8466745cmr384717pgu.87.1668908716422;
        Sat, 19 Nov 2022 17:45:16 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-87.three.co.id. [180.214.232.87])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709027b8100b00181e55d02dcsm6472540pll.139.2022.11.19.17.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 17:45:16 -0800 (PST)
Message-ID: <f3f56a20-cdff-3735-3c9a-babedaaa245f@gmail.com>
Date:   Sun, 20 Nov 2022 08:45:12 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7] mm: add zblock - new allocator for use via zpool API
To:     Ananda Badmaev <a.badmaev@clicknet.pro>
Cc:     linux-mm@kvack.org, vitaly.wool@konsulko.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <20221119082159.63636-1-a.badmaev@clicknet.pro>
 <Y3jQFS55OFV3y8cu@debian.me>
 <a9aa5944-4094-9c0f-fb1b-017f350857cb@clicknet.pro>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <a9aa5944-4094-9c0f-fb1b-017f350857cb@clicknet.pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/20/22 00:24, Ananda Badmaev wrote:
> 19.11.2022 15:46, Bagas Sanjaya пишет:
>> On Sat, Nov 19, 2022 at 11:21:59AM +0300, ananda wrote:
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +.. _block:
>>
>> Why is the anchor label for doc title _block? Why not _zblock instead?
>>
> 
> This is a typo. It will be fixed in the next version if necessary.
> 
> 
>>> +
>>> +Zblock stores integer number of compressed objects per block. These
>>> +blocks consist of several consecutive physical pages (from 1 to 8) and
>>> +are arranged in lists. The range from 0 to PAGE_SIZE is divided into the
>>> +number of intervals corresponding to the number of lists and each list
>>> +only operates objects of size from its interval. Thus the block lists are
>>> +isolated from each other, which makes it possible to simultaneously
>>> +perform actions with several objects from different lists.
>>> +
>>> +Blocks make it possible to densely arrange objects of various sizes
>>> +resulting in low internal fragmentation. Also this allocator tries to fill
>>> +incomplete blocks instead of adding new ones thus in many cases providing
>>> +a compression ratio substantially higher than z3fold and zbud. Zblock does
>>> +not require MMU and also is superior to zsmalloc with regard to the worst
>>> +execution times, thus allowing for better response time and real-time
>>> +characteristics of the whole system.
>>> +
>>> +Like z3fold and zsmalloc zblock_alloc() does not return a dereferenceable
>>> +pointer. Instead, it returns an unsigned long handle which encodes actual
>>> +location of the allocated object.
>>> +
>>> +Unlike zbud and z3fold zblock works well with objects of various sizes - both
>>> +highly compressed and poorly compressed including cases where both types
>>> +are present.
>>
>> The wording can be better (including doc title label suggestion):
>>
>> ---- >8 ----
>>
>> diff --git a/Documentation/mm/zblock.rst b/Documentation/mm/zblock.rst
>> index 5008ce90b54bef..1eb91a8d175dbb 100644
>> --- a/Documentation/mm/zblock.rst
>> +++ b/Documentation/mm/zblock.rst
>> @@ -1,31 +1,31 @@
>>   .. SPDX-License-Identifier: GPL-2.0
>>   -.. _block:
>> +.. _zblock:
>>     ======
>>   zblock
>>   ======
>>   -Zblock stores integer number of compressed objects per block. These
>> -blocks consist of several consecutive physical pages (from 1 to 8) and
>> -are arranged in lists. The range from 0 to PAGE_SIZE is divided into the
>> -number of intervals corresponding to the number of lists and each list
>> -only operates objects of size from its interval. Thus the block lists are
>> -isolated from each other, which makes it possible to simultaneously
>> -perform actions with several objects from different lists.
>> +Zblock stores integer number of compressed objects per block. These blocks
>> +consist of several consecutive physical pages (from 1 to 8) and are arranged in
>> +lists. The range from 0 to PAGE_SIZE is divided into the number of intervals
>> +corresponding to each list and these only operates on objects of size from the
>> +corresponding interval. Thus the block lists are isolated from each other,
>> +which makes it possible to simultaneously perform actions with several objects
>> +from different lists.
>>   -Blocks make it possible to densely arrange objects of various sizes
>> +With zblock, it is possible to densely arrange objects of various sizes,
>>   resulting in low internal fragmentation. Also this allocator tries to fill
>> -incomplete blocks instead of adding new ones thus in many cases providing
>> -a compression ratio substantially higher than z3fold and zbud. Zblock does
>> -not require MMU and also is superior to zsmalloc with regard to the worst
>> +incomplete blocks instead of adding new ones. As a result, in many cases it
>> +provides a compression ratio substantially higher than z3fold and zbud. Zblock
>> +does not require MMU and also is superior to zsmalloc with regard to the worst
>>   execution times, thus allowing for better response time and real-time
>>   characteristics of the whole system.
>>   -Like z3fold and zsmalloc zblock_alloc() does not return a dereferenceable
>> -pointer. Instead, it returns an unsigned long handle which encodes actual
>> -location of the allocated object.
>> +Like similar allocation method from z3fold and zsmalloc, zblock_alloc() does
>> +not return a dereferenceable pointer. Instead, it returns an unsigned long
>> +handle which encodes actual location of the allocated object.
>>   -Unlike zbud and z3fold zblock works well with objects of various sizes - both
>> -highly compressed and poorly compressed including cases where both types
>> -are present.
>> +Unlike zbud and z3fold, zblock works well with objects of various sizes -
>> +including but not limited to highly compressed and poorly compressed, as well
>> +as cases where both object types exist.
>>
>> Thanks.
>>
> 
> I'm not sure there's much point in simply reformulating the text, but in the next version it may be worth a bit changing this text along with other changes.
> 

OK, thanks.

Next time, don't forget to Cc linux-doc list for patches touching Documentation/.
Adding one since you don't.

-- 
An old man doll... just what I always wanted! - Clara

