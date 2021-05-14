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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACA1C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 04:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A97C61448
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 04:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhENEyx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 00:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbhENEyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 00:54:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ABAC061574
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 21:53:43 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so1052121pjb.4
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 21:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uHaj3NBbZoYiX/gHLczEU01oL/UcBH9A6Sa4k+Dr6bs=;
        b=Yr/Ge0VhDcdsv9SLDrFNMW6f3dvGxPBePbFyoNNwrMMC1UbIAt/dQtmFqSkCr8Pb27
         C2FFT3Lp1fw1tGqPyDj3C2Y3JelD1wa6o23nA7xZ2PbOStedfFQ18tN72jNh7iuq1t2J
         xWxqtrt6O0EJgV6sBcUplsdiMUvAm9R5UuIiG3sWfPFYtHhM+obJUOD4dfwXW0u+UdRX
         KlttBUv8Sh8jxKrjjPRAK85SSQg3fiejB10CM+z1u25EOIcyTcxUUqIl4yIVvU7YoWHg
         fbyLd/7rh0Z1sfg1eJIjjSD/fwZTQX8gIleBxVFns4RKk1q7rHbVM1AoK1vMCIAEV+gK
         FeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uHaj3NBbZoYiX/gHLczEU01oL/UcBH9A6Sa4k+Dr6bs=;
        b=TS5PSthpgFfeUrEgoQoGHpKTWXOgsotkrApvIMPlnk2p6pUpDopr0dEqGBkXaotDzG
         nSPLzH8H3dD67GO7cGggpSDlbfpUMq315DXQzFKX1w8CtRlwCOP5VdiKZFpoKKDdHDJ7
         RYpzxbq6iFzbYvyov35WSxHAKQezMOSHzGbk9p6jHfVtKVmaAToCIZBiJAZeYTeURCIy
         oca/ejPbtDvigxFEhzoE5MTyXQkgQDex1ahohczURsnTkU54yUa8VSiQDECzueAfCz2K
         nEmrXOFQl/pUanFkEdkpfT76kR4EU9gtlY6rnedesb+3QcZynpQJdagPvuQ+iMc9z6WG
         YPeQ==
X-Gm-Message-State: AOAM5319twIHMiy3TOPMtoVNFI/HX31hpBsheobA5dmXFgb7R+OQehvZ
        DPQZpWojdMIvluHh9kXPmSM=
X-Google-Smtp-Source: ABdhPJx4R/ZM3vtHE8Q2QC+9gXnnrJh9OOKESCAeILCenyZsF7wEkW3WgHlq51YZImHquLQ45mH3Pw==
X-Received: by 2002:a17:902:7b8e:b029:ec:982d:7a7e with SMTP id w14-20020a1709027b8eb02900ec982d7a7emr44049100pll.55.1620968022667;
        Thu, 13 May 2021 21:53:42 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id k9sm3478793pgq.27.2021.05.13.21.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 21:53:42 -0700 (PDT)
Subject: Re: [PATCH v3] docs/zh_CN: add core-api workqueue.rst translation
To:     Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
References: <20210512083341.914-1-siyanteng@loongson.cn>
 <87lf8i7jbj.fsf@meer.lwn.net> <87o8de61zz.fsf@meer.lwn.net>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <4eb9f549-d734-a5d2-aa2a-e66d009a31e5@gmail.com>
Date:   Fri, 14 May 2021 12:53:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8de61zz.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/14 上午12:18, Jonathan Corbet wrote:
>>> This patch translates Documentation/core-api/workqueue.rst into Chinese.
>>>
>>>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> Reviewed-by: Alex Shi <alexs@kenrel.org>
>> I fixed that typo too - it appears to originate from Alex...:)

Sorry for the typo.

> Actually, I've dropped this back out; it creates vast numbers of
> warnings:
> 
>> Documentation/core-api/workqueue:398: ./include/linux/workqueue.h:3: WARNING: Duplicate C declaration, also
>> defined at translations/zh_CN/core-api/workqueue:3.
> This will be the result of the ".. kernel-doc::" directives at the end,
> which create new definitions (within sphinx) for all the symbols pulled
> in.
> 
> In the long term, we may want to try to find some sort of fix for this.
> But we're really just recreating a bunch of (English-language)
> documentation that's already rendered once; I'm not sure it makes any
> real sense to do that.  So I would suggest that, for now, when you are
> translating documents with kernel-doc directives, you should leave those
> directives out.  Stick in a note directing readers to the original if
> they want to see that material...
> 
> Make sense?

Yes, it is a reasonable solution for now.

Thanks
Alex
> 
> Thanks,
> 
> jon
> 
