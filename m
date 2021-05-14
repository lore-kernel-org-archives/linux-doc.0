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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21601C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 10:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02EBA61406
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 10:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhENKlx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 06:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhENKlw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 06:41:52 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F73C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 03:40:41 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t193so11283404pgb.4
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ld42yHIqEG0wmVNFEG+l0IFKVvqjTJsbcu0Ni5xOAEY=;
        b=db65Mc2AOGQg9wwmhC4j/ZhqruBMX0LFxKp5XqR4vW7zfCfs5tdRcth03HkD0qdJIy
         Q8CD3AdOAxpfAFSXqwUVkVYrMElBy/sw3mSiRhcKpM9Oyhn6E9r30cSvhpCGuTfwqwG4
         5YWV5LHtMWML4/hM1yhyBzf6V6t9iNWZ9s7F4w4xyFh2n9n3AXGMu+4StVCeJMjxi1pV
         Tc+M+QRMcUmAR0QhB2w2ZUPKfP92OEb5S9d5BuvzSL1Bwz06W8JjXoQnxdXzr9kjyzS4
         14QoFnt01XZJ4GfqIasvvIRgExk52MdCrrPPM6g5AiiHlA2XCXi4kY3/Bwfr6Vj88E+H
         FYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ld42yHIqEG0wmVNFEG+l0IFKVvqjTJsbcu0Ni5xOAEY=;
        b=CmcY8+P6zTaimE5Pr7OGfpqkujt38fJc5+/BbndXGfSQLR26gc5XW8VhW/ZLM7fmbc
         U9z1n8QpIFL5HU8iWC4lFDLgD6105q/CUEBSl/g13SOaaKoU8+v3u+GwLi/2P7gGExGS
         ikntLtzk/F7ghRIYB+R/x+1jUhYOWZq+g/9q8Rv85yj95TdNd1W1kmMTKRwcdzF+um6f
         b4V0UXdf6DkeUv1JBnCyrb4NtdZkS+9yShXygcE2nYUOd+jN737Q/Xx5tNiVHNivI2gp
         apn99dtf/KJjVlCc0O0jodzAfbAWZVudNhHTOvuqGp70uwtEE2tulzZZsnSPM6QsD82v
         adLg==
X-Gm-Message-State: AOAM530QM2O0tPOXlixD8ePsnGpQgA14AJPqSf9yS07zzuXx39Cb4tYd
        QASaonf6JT7aEhOpjeYKygdKzB87D0V90w==
X-Google-Smtp-Source: ABdhPJz0wQ3Wv50wgtOa58zS3YU1ktS4z460iA6Qx6q52nsIKwLK1dLY4Y80lA+IfYsQwdAC0HUI7A==
X-Received: by 2002:a63:4e4f:: with SMTP id o15mr6044126pgl.208.1620988841234;
        Fri, 14 May 2021 03:40:41 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id ms2sm4533423pjb.8.2021.05.14.03.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 03:40:40 -0700 (PDT)
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
 <c91e7f95-0c48-292c-d353-d2ca4ac62051@gmail.com>
 <CAEensMzfzYasxCjnwR9T7ULa6EW7NWB4Y=nnLP+HX8RLvxiNVQ@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <6e364571-b1ea-26d6-8b7e-246a24ac07ab@gmail.com>
Date:   Fri, 14 May 2021 18:40:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEensMzfzYasxCjnwR9T7ULa6EW7NWB4Y=nnLP+HX8RLvxiNVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/14 下午5:47, yanteng si wrote:
> Alex Shi <seakeel@gmail.com> 于2021年5月14日周五 下午5:30写道：
>>
>>
>>
>> On 2021/5/14 下午5:09, yanteng si wrote:
>>> Alex Shi <seakeel@gmail.com> 于2021年5月14日周五 下午12:53写道：
>>>>
>>>>
>>>>
>>>> On 2021/5/14 上午12:18, Jonathan Corbet wrote:
>>>>>>> This patch translates Documentation/core-api/workqueue.rst into Chinese.
>>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>>>>>> Reviewed-by: Alex Shi <alexs@kenrel.org>
>>>>>> I fixed that typo too - it appears to originate from Alex...:)
>>>>
>>>> Sorry for the typo.
>>>>
>>>>> Actually, I've dropped this back out; it creates vast numbers of
>>>>> warnings:
>>>>>
>>>>>> Documentation/core-api/workqueue:398: ./include/linux/workqueue.h:3: WARNING: Duplicate C declaration, also
>>>>>> defined at translations/zh_CN/core-api/workqueue:3.
>>>>> This will be the result of the ".. kernel-doc::" directives at the end,
>>>>> which create new definitions (within sphinx) for all the symbols pulled
>>>>> in.
>>>>>
>>>>> In the long term, we may want to try to find some sort of fix for this.
>>>>> But we're really just recreating a bunch of (English-language)
>>>>> documentation that's already rendered once; I'm not sure it makes any
>>>>> real sense to do that.  So I would suggest that, for now, when you are
>>>>> translating documents with kernel-doc directives, you should leave those
>>>>> directives out.  Stick in a note directing readers to the original if
>>>>> they want to see that material...
>>>>>
>>>>> Make sense?
>>>>
>>>> Yes, it is a reasonable solution for now.
>>> OK, I will.
>>> I will remove them and then direct the reader to the original
>>> document. just like:
>>>
>>> .. note:: 抱歉，由于原始文档在此处交叉引用了代码中的注释，而现在并不是翻译这些注释的好时机（将会带来很多编译警告），所以请暂时浏览英文文档，链接在本文档顶部。
>>
>> Jon said just remove kernel-doc, not all line? If so, don't need above explanation.
> just like:
> 
>  +列表管理函数
>  +============
>  +
> -+.. kernel-doc:: include/linux/list.h
> + include/linux/list.h

I prefer sth like in this line, does this look fine?

  + check the functions in include/linux/list.h in kernel source code.

>  +   :internal:
>  +
>  +基本的C库函数
>  +=============
>> _< ?
> 
> Thanks,
> 
> Yanteng
> 
