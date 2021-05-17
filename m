Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67744C43460
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 03:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 489566108D
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 03:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhEQDWu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 23:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbhEQDWt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 23:22:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C98FC06174A
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 20:21:30 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id t4so2349480plc.6
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 20:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v2/JMnpjJon9pcgocgciHUbFtSNzysRehWHotfQWKpI=;
        b=l4yl5jvqSBSNIfIwuU0ht9oE6Hs8XbxxbK/7cklHdTeM8pwBLLjzELYfjYwiqkzLBO
         uFUQpcWYe3VVCdjnlbgCOBhqYZdQKspaVJvh02pGWSm8FMFmyN5t8e526MEJPg8wuJy8
         S45WhsCb5I9YchdKrDo8d7dbNIjKT8GasQAWTzphUhOyeDruibNseUBHhQj+DFCu1jcc
         CZR5Cmm6f90jvh0ZoGUhZkFStNNIdN/z/1FzV3Oo0gDFdr0ZFqmmH8GvixMAIM3QpP9F
         flZsW+ckSARUNpB7qx+QUPkdubyO8697rtqMtKiTIsQiiYECswd73OgT+zSt1r25FElJ
         TQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v2/JMnpjJon9pcgocgciHUbFtSNzysRehWHotfQWKpI=;
        b=EzAH4y/k3pf/6f8ftUaSdB5le7psb6d3rKwZ11DF1xJc7Oem03XgmsAiX3r7O/lPDH
         bv/YiYh6/P1wHqz0MdFwvzkQ5fRlL5YK66KGSFeeNZSJa8OLsIduqPtIMGviXXL1wJRW
         gAPpsHUt2kvB57b1t2knD2iJzhVsUfuz2wLZvgTvppybTvDMq3hGcblMN95SxkOIfvvn
         43Jts7DXjAzc67y8rOFLPGLVMyLH/lzwXYoi4esWljp+I9/P5yRvznqjSFVV6pw3etEV
         4s5xLy/ju5P9koUlsoPacmYZJgVNBn7wSTnWxx0EU7KG3DxqGe303nkvJ+e5qq/1aaKl
         Q6tQ==
X-Gm-Message-State: AOAM531/rpOHZrqmjZ3utPh3TcxqPmoOaVfW5YnEvCv7teSQWTPYXWbK
        UPt6psgjdvIDsQO951ByyRk=
X-Google-Smtp-Source: ABdhPJyyFakpncOXCkfq6jLVx9IWeBzAczMOhWlTCADCfTFN3mm8HMSc3BZi5nPYNImqk5CrmJu2aw==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id x15-20020a170902e04fb02900eb66b06d08mr58763999plx.50.1621221689851;
        Sun, 16 May 2021 20:21:29 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id w19sm1440311pfu.215.2021.05.16.20.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 20:21:29 -0700 (PDT)
Subject: Re: [PATCH v4] docs/zh_CN: add core-api workqueue.rst translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
References: <20210515082406.2473543-1-siyanteng@loongson.cn>
 <dab014b9-ec11-dc12-30f7-1b43a852b296@gmail.com>
 <CAEensMy0OYJ99j1nfvOPAaL+oKFXkkeksnGaRpuP4eTi5kDnmw@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <58e53600-29ea-9379-2cb0-64f85417ed8b@gmail.com>
Date:   Mon, 17 May 2021 11:21:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEensMy0OYJ99j1nfvOPAaL+oKFXkkeksnGaRpuP4eTi5kDnmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/17 上午9:34, yanteng si wrote:
> Alex Shi <seakeel@gmail.com> 于2021年5月16日周日 上午11:32写道：
>>
>>
>>
>> On 2021/5/15 下午4:24, Yanteng Si wrote:
>>> +
>>> +内核内联文档参考
>>> +================
>>> +
>>> +check the functions in include/linux/workqueue.h in kernel source code.
>>> +
>>> +check the functions in kernel/workqueue.c in kernel source code.
>>
>> Better to combine above 2 lines and use Chinese to introduce them?
> 
> 请在以下文件中查看相关函数：
> 
> include/linux/workqueue.h
> kernel/workqueue.c
> 


Nice!

> Thanks,
> Yanteng
> 
