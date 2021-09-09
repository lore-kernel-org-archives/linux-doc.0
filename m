Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B0EC433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Sep 2021 01:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56B5061168
	for <linux-doc@archiver.kernel.org>; Thu,  9 Sep 2021 01:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349015AbhIIBVs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Sep 2021 21:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348988AbhIIBVr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Sep 2021 21:21:47 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEE1C061575
        for <linux-doc@vger.kernel.org>; Wed,  8 Sep 2021 18:20:39 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k13so293318lfv.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Sep 2021 18:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OefVOVq0AzG5SCIZk9X5n8kU1bubBJVxFW/wP6CcUpU=;
        b=gAMYrAraY6OvoyClxwwXsWd5ezMnRlIVwXQ/DTKtTFiIWUwFskxuJ8xYitd8xKWTS+
         jKS5bHr3baY59fGTZliG5wwlCVCx+abcuE7W1KP23mhVhPgHV2O3JZbj4fD0l0drcnnA
         p1pUKfZiDzqIdpp/7BiTgqiXDAvzg3n8T9jKIjvx9STCU8btABjiyhOiVjvLJ7EDu5uS
         ihgkLCqomNaHntdfaM99wC6lmSjXwwH6LdJ3D2acQM8M6rFnTK/ftpUjW5Ot1krkWhf8
         EuUW1XeaPVQPzqOvMCaGp/ZrkYjQ7rwiOc9TscLnnR0SlfsxyGBOxr83UysinEWlaiSE
         +gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OefVOVq0AzG5SCIZk9X5n8kU1bubBJVxFW/wP6CcUpU=;
        b=AVNw2T5whlquAtWCKSohfKzMcSeHcYjsX4fkCIYJ+cWEmCKpmXC0iy/fSGzMV9xMY5
         eAizW54mBmlAwKz3LaAAj5Q8je+ImoFtj74SwBJWqqXX0/PU1O6ExEL1W3yjc/OuXhUw
         4exvLAdFlweJTFnXQqfQGzvwo50INA2oH0wNX4mjm7Vb/KtvyKDW20oBXMB+9OdWd2vT
         cdCjeRREWW3acgQEqdtKDJSXyJgu+GEPkeVakALfjr6tTxW08R+v3VF7ek0B+mxG1U86
         pqyprh0Ffx4JbEsJNfdglsEsd5VBgbmuIi8+jjl67zn4OlTlbGzMdCvslxjZQdTWG7XO
         MDWg==
X-Gm-Message-State: AOAM5320GxAdFYn7Mp/OewqfT/1PPu3YXAxaW60DMNnVs+q8GLbC5hfw
        Gx8n4AG0Tirodml1b4s4+WMpldUdUo4=
X-Google-Smtp-Source: ABdhPJxvtbSi8GLrkaTM/w35glIAA32YPMwZo8xDu/esxqb89hRYWVTK2zsOdsBmLCFevvUY9nGBXw==
X-Received: by 2002:a05:6512:159e:: with SMTP id bp30mr351365lfb.539.1631150437423;
        Wed, 08 Sep 2021 18:20:37 -0700 (PDT)
Received: from localhost.localdomain ([2a03:5342:f:6::2])
        by smtp.gmail.com with ESMTPSA id u21sm21733lju.119.2021.09.08.18.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 18:20:36 -0700 (PDT)
Subject: Re: [PATCH] Doc: page_migration: fix numbering for non-LRU movable
 flags
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20210908145215.592325-1-lixinhai.lxh@gmail.com>
 <87mtomq1hb.fsf@meer.lwn.net>
Cc:     linux-mm@kvack.org
From:   Li Xinhai <lixinhai.lxh@gmail.com>
Message-ID: <f6efb4d9-55cb-f782-cfcb-75e6a2dd9285@gmail.com>
Date:   Thu, 9 Sep 2021 09:20:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87mtomq1hb.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 9/9/21 4:03 AM, Jonathan Corbet wrote:
> Li Xinhai <lixinhai.lxh@gmail.com> writes:
> 
>> The non-LRU movable flags part is not relevant to above 3 funcitons, so remove
>> the number 4.
>>
>> Signed-off-by: Li Xinhai <lixinhai.lxh@gmail.com>
>>
>> ---
>>   Documentation/vm/page_migration.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/vm/page_migration.rst b/Documentation/vm/page_migration.rst
>> index db9d7e5539cb..08810f549f70 100644
>> --- a/Documentation/vm/page_migration.rst
>> +++ b/Documentation/vm/page_migration.rst
>> @@ -205,7 +205,7 @@ which are function pointers of struct address_space_operations.
>>      In this function, the driver should put the isolated page back into its own data
>>      structure.
>>   
>> -4. non-LRU movable page flags
>> +Non-LRU movable page flags
> 
> So should this be a section heading instead?
No. This line and the following content still belong to its current section, so only
need remove '4.', and 'non'-> 'Non'.

>
> Thanks,
> 
> jon
> 
