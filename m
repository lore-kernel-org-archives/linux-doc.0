Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141E8C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 03:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF61960FF2
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 03:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhEQDWt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 23:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbhEQDWp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 23:22:45 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CA8C061573
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 20:21:01 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso3767928pjx.1
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 20:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wr8StjvYX40daVfOB12K69metaDxXVZVUpkTMH4+xYk=;
        b=udtPh8PlBwWZbXqkFDvokTJT1yJzGO3jSwykF3//4zxEF2Q7dkHZsrctCa/EkqlU7Z
         pJy5BbN7gmj/1AARPvkGMUiVdq+d/oo/dmqG/hADq3JjEnCjOW+uvVKAIH0jHCKg/Y8M
         Snej8PtruQyogwjZ+nYug4xIAUpXQt0V0/7+zK2PRGcuxh2HLftCn/HLGN8KbZiRfteT
         udV7tfU5x9lyAtPtr2K4VpUlAADgUi+31qAWwrifCIvKoOgXHO6rE9x89CQ64cBIyQIO
         iDpBSVk+g/de07/O2fGwQOJdgrXjM94pPjiYtmvCqML3FgfUdUKjZ3l6DRQe7UBd/BFX
         MgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wr8StjvYX40daVfOB12K69metaDxXVZVUpkTMH4+xYk=;
        b=ADUiqR5BC4hALrJ2WVtanAzBQqcFrq9R8K0t2EADDvPyc7S2odxyij5/DfiXqdD2NF
         lDEkXVw+dvwBdThpVCmZFKXFLjlh5fsz4IDYLFhyGnmp1YRg9yQHOusWXEyVOJ6pa6we
         qLW8aP/FQHxWaSn3udDx+gniepMVEZpd5cfuzwRU2OLmcTMRsdauOt8yXnnCURO5p7dL
         wRMlp/zD78IdeAP7chHQ4m4X7CB1Li4b340QKXKqgVFTgMImiwC/nHQYrlDoxH7Fk2cc
         WcNp5Bt2G9FH2uCTMVMwZYmV58UlIet4SnzxdRdh+A4kLSHB8qMw2NQG/6Js1MBZX9xf
         ReMQ==
X-Gm-Message-State: AOAM533pTkINiLgHjPdUNhfeft1GZXuzVkzqhTrko7jjXQ/ut7sjJbp7
        h1eSMllo6BEcLoHLRk3/xlg=
X-Google-Smtp-Source: ABdhPJw8uvH7nla0vnSUk3YgCAVeU7q5v/l76rjjbAjqwEQAnTYhbBfGjHDAzm+QcV9ra/DljGalbw==
X-Received: by 2002:a17:902:a705:b029:ec:bd14:7825 with SMTP id w5-20020a170902a705b02900ecbd147825mr58739699plq.83.1621221661276;
        Sun, 16 May 2021 20:21:01 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id z7sm8895207pfb.93.2021.05.16.20.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 20:21:00 -0700 (PDT)
Subject: Re: [PATCH v6 1/3] docs/zh_CN: add core-api kernel-api.rst
 translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
References: <cover.1621062577.git.siyanteng@loongson.cn>
 <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
 <87f7bb59-cb85-de95-4e8d-72784686b9b9@gmail.com>
 <CAEensMydFLpmUaCHUYwQ7d_WR+HDbPboTdMAOA+H+FUqcaur_g@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <e371a1e6-d38d-f5fc-1ad6-1aee116da468@gmail.com>
Date:   Mon, 17 May 2021 11:20:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEensMydFLpmUaCHUYwQ7d_WR+HDbPboTdMAOA+H+FUqcaur_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/17 上午9:55, yanteng si wrote:
> Alex Shi <seakeel@gmail.com> 于2021年5月16日周日 上午11:30写道：
>>
>>
>>
>> On 2021/5/15 下午4:10, Yanteng Si wrote:
>>
>>> +安全框架
>>> +========
>>> +
>>> +check the functions in security/security.c in kernel source code.
>>> +   :internal:
>>> +
>>> +check the functions in security/inode.c in kernel source code.
>>> +   :export:
>>> +
>>> +审计接口
>>> +========
>>> +
>>> +check the functions in kernel/audit.c in kernel source code.
>>> +   :export:
>>> +
>>> +check the functions in kernel/auditsc.c in kernel source code.
>>> +   :internal:
>>> +
>>> +check the functions in kernel/auditfilter.c in kernel source code.
>>> +   :internal:
>>> +
>>
>> Too verbose w/o much useful info, Is the following better?
>>
>>   APIs in kernel code: kernel/audit.c, kernel/auitsc.c and kernel/auditfilter.c
>>
>>   该 APIs 在以下内核代码中 kernel/audit.c, kernel/auitsc.c and kernel/auditfilter.c
> It looks great, but in some cases, sentences that are too long have
> some difficulty with a new line, and they are not neat after the new
> line.
> For example::
> 
> 这些函数在以下内核代码中 include/asm-generic/bitops/instrumented-atomic.h，
> include/asm-generic/bitops/instrumented-non-atomic.h and
> include/asm-generic/bitops/instrumented-lock.h
> ...
> 
> how about::
> 
> 该API在以下内核代码中:
> 
> kernel/audit.c
> kernel/auitsc.c
> kernel/auditfilter.c
> 
> 该API在以下内核代码中:
> 
> include/asm-generic/bitops/instrumented-atomic.h
> include/asm-generic/bitops/instrumented-non-atomic.h
> include/asm-generic/bitops/instrumented-lock.h

Right split them into multiple lines looks better.


> ?
> 
> Thanks,
> Yanteng
> 
