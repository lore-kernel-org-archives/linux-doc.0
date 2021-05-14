Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B13CC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1A056140E
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhENJbx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 05:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbhENJbw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 05:31:52 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CA4C06174A
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:30:40 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q6so1197766pjj.2
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A09+EYA0PXskdAXtM3BzR+9Ud3Hu/4OzprRYy1tbjn8=;
        b=K3sIBrPRzJXGTXtWGLeWV3Ayc0eobDuqIJqPt3KLyf2sIgeK7xK6rDlHpOICkMdZ4+
         QUXABQcOrXOReKgwYA4FsxOsPC6Y82oLmdpBSaVPi9TCo/aisckevrv5fdrZzwisi4Ll
         FUh5XIJXt0nZdWU3sdDMNZ04gYytcWl5x8+UxUHQRV9J0y4VcGGLZvUKwLl2064UClAq
         61RR0nThg5FPRFzxjGBEKqn3UjXUCpOtERHuaGHWMReiW1c/2kth8EJ9EkbxW43CjtZS
         TIOAZ2VTDa2zPzipr9lQG9YIRZr37HBQe6Lwp9aPvqKhb3N+EB3sPsWuXE+PKLFGCYJ5
         anPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A09+EYA0PXskdAXtM3BzR+9Ud3Hu/4OzprRYy1tbjn8=;
        b=HZwpEb8b9aPpPiGlPWpMqXhZfmpFixfKctJL8gSLeOq3PchYPzaO9LwkEcEdJBi+t8
         ZVHp4CNjQAUjPe1LQOWbStoJ4y7pLIlKyISI58cL8dqs6zGmm0qxjTtsFLO5RmpRMYBe
         YlLgVoo4GQXDuMAP37e5KLYzLwzUhYW2iwhE8HqYu5HCtkpm6T8w7374ShRZgyf3Hsu1
         Tfe/uFLa1aEXqSAo4vqzhfOIdz0rTWl1c9WEt5NGdiD+VPVojO+Zp2ByCangvccrZeMZ
         av1V7DAHLlPeoGkwY+O5ZShNBaRHmuWL+3iies6G5n2BJ65eOAeYjjg8ZoFMPP7gnW2P
         fv4Q==
X-Gm-Message-State: AOAM531V0Qbj1BiDXENE/LRUsXJW6fYw3/o0etH4X2CIjV/wi5tUHFbn
        j/gTp4KtxXli04WLMptzhkc=
X-Google-Smtp-Source: ABdhPJyaQcPHCeMXw8V0GcSOyxMzTLXo3f3YIRF5J94YlLiH/d9N3Lf236ichfEAxsKw9U6y7H9dpA==
X-Received: by 2002:a17:90b:193:: with SMTP id t19mr48821411pjs.35.1620984640359;
        Fri, 14 May 2021 02:30:40 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id m8sm3717159pfk.49.2021.05.14.02.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 02:30:39 -0700 (PDT)
Subject: Re: [PATCH v3] docs/zh_CN: add core-api workqueue.rst translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
References: <20210512083341.914-1-siyanteng@loongson.cn>
 <87lf8i7jbj.fsf@meer.lwn.net> <87o8de61zz.fsf@meer.lwn.net>
 <4eb9f549-d734-a5d2-aa2a-e66d009a31e5@gmail.com>
 <CAEensMx6HxD5_Gv2Snd+OGOF0MNU4fsuB_z_pCDWyW8z+5SC=Q@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <c91e7f95-0c48-292c-d353-d2ca4ac62051@gmail.com>
Date:   Fri, 14 May 2021 17:30:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEensMx6HxD5_Gv2Snd+OGOF0MNU4fsuB_z_pCDWyW8z+5SC=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/14 下午5:09, yanteng si wrote:
> Alex Shi <seakeel@gmail.com> 于2021年5月14日周五 下午12:53写道：
>>
>>
>>
>> On 2021/5/14 上午12:18, Jonathan Corbet wrote:
>>>>> This patch translates Documentation/core-api/workqueue.rst into Chinese.
>>>>>
>>>>>
>>>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>>>> Reviewed-by: Alex Shi <alexs@kenrel.org>
>>>> I fixed that typo too - it appears to originate from Alex...:)
>>
>> Sorry for the typo.
>>
>>> Actually, I've dropped this back out; it creates vast numbers of
>>> warnings:
>>>
>>>> Documentation/core-api/workqueue:398: ./include/linux/workqueue.h:3: WARNING: Duplicate C declaration, also
>>>> defined at translations/zh_CN/core-api/workqueue:3.
>>> This will be the result of the ".. kernel-doc::" directives at the end,
>>> which create new definitions (within sphinx) for all the symbols pulled
>>> in.
>>>
>>> In the long term, we may want to try to find some sort of fix for this.
>>> But we're really just recreating a bunch of (English-language)
>>> documentation that's already rendered once; I'm not sure it makes any
>>> real sense to do that.  So I would suggest that, for now, when you are
>>> translating documents with kernel-doc directives, you should leave those
>>> directives out.  Stick in a note directing readers to the original if
>>> they want to see that material...
>>>
>>> Make sense?
>>
>> Yes, it is a reasonable solution for now.
> OK, I will.
> I will remove them and then direct the reader to the original
> document. just like:
> 
> .. note:: 抱歉，由于原始文档在此处交叉引用了代码中的注释，而现在并不是翻译这些注释的好时机（将会带来很多编译警告），所以请暂时浏览英文文档，链接在本文档顶部。

Jon said just remove kernel-doc, not all line? If so, don't need above explanation.



> 
> Thanks，
> Yanteng
>>
>> Thanks
>> Alex
>>>
>>> Thanks,
>>>
>>> jon
>>>
