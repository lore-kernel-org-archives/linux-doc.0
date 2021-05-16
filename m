Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2983C433ED
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 03:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ABE361151
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 03:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhEPDhU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 May 2021 23:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhEPDhT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 May 2021 23:37:19 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DDBC061573
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 20:36:05 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so1087326pjb.3
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 20:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JYucUyCH4Qgba8fU9TpizW4AHyU8XiwpanslXjr8q5s=;
        b=W3Jpzc5NV14kZeaZJJVVhexbNP2bHhy74QU136hh7kAHvFxoriUCgfw59Sj0WyCJCL
         t4WGcSJEARv3eRjig46guPLMeNwxBVjZYhlTw7RYRbNBHopCw39JqG7VCPc3seYTEvsM
         wFxr1JQgQGcIwHdxPzvVcqk8IIUfcrwbvqbbssJNug2ZSZmDmcTzRrIusJQH1Sz0KOe3
         +TTMvRhtHksBI1/O7T0OpIdxzuv7FdRpeAk2Ypt0XBU3zbjrbBS5SQvSRj811a8WFAy2
         fRxftH6gxexcciwevNAOXLKTicSz0HdVSrYPyjUZkQql3d9uDd4SNHghvt5EUXz1TU7t
         Wyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JYucUyCH4Qgba8fU9TpizW4AHyU8XiwpanslXjr8q5s=;
        b=IqnkOZDHf92zbjN/4ndYN7lP4QpkbO+jo0Gsy2OVIRYU0uSZ2NUgUPgnwvW6rXJvzM
         QIv0S2eF+ADWP/PDhtlFBte9obE7voz2r8J3Tg10OKUR24PEwqb/qHIVTtxSGCeH1Wzd
         HGq2fLHP0GqY5bnnKHci+4W2wuVvmyZDPynvgATbgKKJNxgQF+MYYpF4+qu4pAF/SlHt
         dHb5RTRhSH40xNd4Pm98C8ATI2JgKFLxtYSC/sTV4Hyz3RV7elxYegfHHnkmqizT5JVp
         OodjQYBUvuNgYm4oEEKSGM8dzIyPUu4Rz5Ya3IkYqXhhmlhnMLkLIqkC5ktNfSORjsSH
         I/Mg==
X-Gm-Message-State: AOAM533hoyGXPIMdH0v+JWqVpZKX50R/wWqytDi/msslWXRxM2VAHw3/
        l3WCPp/dJLiv+cIkvfy0yfs=
X-Google-Smtp-Source: ABdhPJxQ0lN2Se+UwXQkYlS7R7x7rXRqha9G/Z5WS7ecj03oXxjI99ygD23iY2buq2fL6z4yQpiJBw==
X-Received: by 2002:a17:90a:e550:: with SMTP id ei16mr19720351pjb.127.1621136164458;
        Sat, 15 May 2021 20:36:04 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id t133sm7389174pgb.0.2021.05.15.20.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 May 2021 20:36:03 -0700 (PDT)
Subject: Re: [PATCH v3 6/6] docs/zh_CN: Add translation
 zh_CN/maintainer/modifying-patches.rst
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
References: <cover.1620932189.git.bobwxc@email.cn>
 <683aff6409087841713738816067a01f250008c8.1620932189.git.bobwxc@email.cn>
 <11ebacfe-994b-5df6-8411-3830d8df3ca7@gmail.com>
 <20210515162908.GA13063@bobwxc.top>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <ef27f610-e51a-4875-949a-13effbae07c5@gmail.com>
Date:   Sun, 16 May 2021 11:35:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210515162908.GA13063@bobwxc.top>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/16 上午12:29, Wu X.C. wrote:
> On Fri, May 14, 2021 at 05:30:51PM +0800, Alex Shi wrote:
>>
>>
>> On 2021/5/14 上午3:08, Wu XiangCheng wrote:
>>> Add a new translation
>>>   Documentation/translations/zh_CN/maintainer/modifying-patches.rst
>>> and link it to zh_CN/maintainer/index.rst
>>>
>>> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
>>> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>>  .../translations/zh_CN/maintainer/index.rst   |  4 +-
>>>  .../zh_CN/maintainer/modifying-patches.rst    | 51 +++++++++++++++++++
>>>  2 files changed, 52 insertions(+), 3 deletions(-)
>>>  create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
>>> index 18a820741f52..eb75ccea9a21 100644
>>> --- a/Documentation/translations/zh_CN/maintainer/index.rst
>>> +++ b/Documentation/translations/zh_CN/maintainer/index.rst
>>> @@ -17,7 +17,5 @@
>>>     rebasing-and-merging
>>>     pull-requests
>>>     maintainer-entry-profile
>>> +   modifying-patches
>>>  
>>> -TODOList:
>>> -
>>> --   modifying-patches
>>> diff --git a/Documentation/translations/zh_CN/maintainer/modifying-patches.rst b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
>>> new file mode 100644
>>> index 000000000000..6f3bf493440c
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
>>> @@ -0,0 +1,51 @@
>>> +.. include:: ../disclaimer-zh_CN.rst
>>> +
>>> +:Original: Documentation/maintainer/modifying-patches.rst
>>> +
>>> +:译者:
>>> +
>>> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
>>> +
>>> +.. _modifyingpatches_zh:
>>> +
>>> +修改补丁
>>> +========
>>> +
>>> +如果你是子系统或者分支的维护者，由于代码在你的和提交者的树中并不完全相同，
>>> +有时你需要稍微修改一下收到的补丁以合并它们。
>>> +
>>> +如果你严格遵守开发者来源证书的规则（c），你应该要求提交者重做，但这完全是会
>>> +适得其反的时间、精力浪费。规则（b）允许你调整代码，但这样修改提交者的代码并
>>> +让他背书你的错误是非常不礼貌的。为解决此问题，建议在你之前最后一个
>>> +Signed-off-by标签和你的之间添加一行，以指示更改的性质。这没有强制性要求，最
>>> +好在描述前面加上你的邮件和/或姓名，用方括号括住整行，以明显指出你对最后一刻
>>> +的更改负责。例如::
>>> +
>>> +        Signed-off-by: Random J Developer <random@developer.example.org>
>>> +        [lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
>>> +        Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
>>> +
>>> +如果您维护着一个稳定的分支，并希望同时明确贡献、跟踪更改、合并修复，并保护
>>> +提交者免受责难，这种做法尤其有用。请注意，在任何情况下都不得更改作者的身份
>>> +（From头），因为它会在变更日志中显示。
>>> +
>>> +回传（back-port）者特别要注意：为了便于跟踪，请在提交消息的顶部（就在主题行
>>
>> I saw backport was translated a lot as 回合. Need a reconsideration?
>>
>> Thanks
>> Alex
>>
> 
> find a issue from pro-git2 zh translation team
> https://github.com/progit/progit2-zh/issues/224
> 
> use 向后移植

Yes,  this looks better.

Thanks
Alex

> 
> their term list
> https://github.com/progit/progit2-zh/blob/master/TRANSLATION_NOTES.asc
> 
> and this
> https://github.com/git/git/blob/master/po/zh_CN.po
> 
> Thanks
> Wu X.C.
> 
