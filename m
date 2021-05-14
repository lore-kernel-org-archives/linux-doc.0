Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9068C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7426F613F6
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 09:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhENJcG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 05:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhENJcG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 05:32:06 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D20C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:30:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so1381035pjp.4
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=94YPOinxQrcgwz9y/LSGoxsE090NjEt4+K58ZqBhz1E=;
        b=YsUEVO4gaqiVT8fq5gnPe14tDNxmVnf48zne8Nj9wz04j7yh3GycEkwMtZM5UFRh/q
         1ETWs1r+b5fEace934FrAc4B/8ycXaYeuJzr7HFuaTquyJFx1/NoZfFNMYuMqTl7ZmAA
         86hAMmVK6u6H/u7nTs0KJRFf3sPLiaHbQg7zdUgmfvv47zyPqOZckPVXWvwt75K/rRdT
         cOirRloNW++29dV054siDp3kHTiiv+MFAy4hamSiGr8f4gG27mvfiSMaaFk/zW9FpM+v
         RiOh3lWl979FbdRUb1oT4xLPmFgcZkZ94AUr5SbvI8MMogX72dr9YlTI2f+GNZT0XVpA
         KUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=94YPOinxQrcgwz9y/LSGoxsE090NjEt4+K58ZqBhz1E=;
        b=Jz5wzJpRK1GuaX1OaTjScsmle8CtNecGAwchJcG7l5GVP6ZVWdmbQvYVYsoqBzUpJJ
         VsgBMF3wGJ2xQ5CEbvyHC0FQ2tcNjFQjwXQdbBSEtPihxMFx6fbaRznuWv9CGX6Y/LXA
         yrY97GP74BtTK0wu7580TVA1ahFXCazTZ/MLzlAyxAlroep/XPFqUzy+0ltoKtvxeITd
         ep0YRK1Xx9pYSITXBhGG317jSTgoEB6dOlNi/sBNsMn18W0pIjrYJdh8+G1IXubTAdr3
         KqJjmACeQQzoG1TnTEwg1YFjEqaIHcwpb3MMOIQKCL5ReHU9kh3oV5bq+auz/ah4VBOg
         cDmQ==
X-Gm-Message-State: AOAM532Xfu56iyZ6kqh7HdytkQP3m62Qj4mgPHzlc2dTHkjMNzU/5mOk
        ljcRTnUFAl7uIzMs3Yj5x9Y=
X-Google-Smtp-Source: ABdhPJzMO1UE/xgXX9fjMfhZdmtuyWP1Fq6L9Vbg+JLqZ8/QrdmQFw8t5b4W24V+hTsiAYMwGb1wbA==
X-Received: by 2002:a17:90b:1e43:: with SMTP id pi3mr51536715pjb.51.1620984655107;
        Fri, 14 May 2021 02:30:55 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id kk7sm5739656pjb.16.2021.05.14.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 02:30:54 -0700 (PDT)
Subject: Re: [PATCH v3 6/6] docs/zh_CN: Add translation
 zh_CN/maintainer/modifying-patches.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
References: <cover.1620932189.git.bobwxc@email.cn>
 <683aff6409087841713738816067a01f250008c8.1620932189.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <11ebacfe-994b-5df6-8411-3830d8df3ca7@gmail.com>
Date:   Fri, 14 May 2021 17:30:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <683aff6409087841713738816067a01f250008c8.1620932189.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/14 上午3:08, Wu XiangCheng wrote:
> Add a new translation
>   Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> and link it to zh_CN/maintainer/index.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/maintainer/index.rst   |  4 +-
>  .../zh_CN/maintainer/modifying-patches.rst    | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> 
> diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
> index 18a820741f52..eb75ccea9a21 100644
> --- a/Documentation/translations/zh_CN/maintainer/index.rst
> +++ b/Documentation/translations/zh_CN/maintainer/index.rst
> @@ -17,7 +17,5 @@
>     rebasing-and-merging
>     pull-requests
>     maintainer-entry-profile
> +   modifying-patches
>  
> -TODOList:
> -
> --   modifying-patches
> diff --git a/Documentation/translations/zh_CN/maintainer/modifying-patches.rst b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> new file mode 100644
> index 000000000000..6f3bf493440c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> @@ -0,0 +1,51 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/maintainer/modifying-patches.rst
> +
> +:译者:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +.. _modifyingpatches_zh:
> +
> +修改补丁
> +========
> +
> +如果你是子系统或者分支的维护者，由于代码在你的和提交者的树中并不完全相同，
> +有时你需要稍微修改一下收到的补丁以合并它们。
> +
> +如果你严格遵守开发者来源证书的规则（c），你应该要求提交者重做，但这完全是会
> +适得其反的时间、精力浪费。规则（b）允许你调整代码，但这样修改提交者的代码并
> +让他背书你的错误是非常不礼貌的。为解决此问题，建议在你之前最后一个
> +Signed-off-by标签和你的之间添加一行，以指示更改的性质。这没有强制性要求，最
> +好在描述前面加上你的邮件和/或姓名，用方括号括住整行，以明显指出你对最后一刻
> +的更改负责。例如::
> +
> +        Signed-off-by: Random J Developer <random@developer.example.org>
> +        [lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
> +        Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
> +
> +如果您维护着一个稳定的分支，并希望同时明确贡献、跟踪更改、合并修复，并保护
> +提交者免受责难，这种做法尤其有用。请注意，在任何情况下都不得更改作者的身份
> +（From头），因为它会在变更日志中显示。
> +
> +回传（back-port）者特别要注意：为了便于跟踪，请在提交消息的顶部（就在主题行

I saw backport was translated a lot as 回合. Need a reconsideration?

Thanks
Alex

> +之后）插入补丁的来源，这是一种常见而有用的做法。例如，我们可以在3.x稳定版本
> +中看到以下内容::
> +
> +        Date:   Tue Oct 7 07:26:38 2014 -0400
> +
> +        libata: Un-break ATA blacklist
> +
> +        commit 1c40279960bcd7d52dbdf1d466b20d24b99176c8 upstream.
> +
> +下面是一个旧的内核在某补丁被回传后会出现的::
> +
> +        Date:   Tue May 13 22:12:27 2008 +0200
> +
> +        wireless, airo: waitbusy() won't delay
> +
> +        [backport of 2.6 commit b7acbdfbd1f277c1eb23f344f899cfa4cd0bf36a]
> +
> +不管什么格式，这些信息都为人们跟踪你的树，以及试图解决你树中的错误的人提供了
> +有价值的帮助。
