Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2351C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 22:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiCUWug (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Mar 2022 18:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiCUWub (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 18:50:31 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660DC69716
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 15:43:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id m30so12789981wrb.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 15:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BH/ZvdHwavygsraND3jZ9umdlqtC3J2xs3HpZjL2mwo=;
        b=c9f3Pm5IXTpo39kOd0g++gJvtwaFhoqGjkoHxlqOe7Xi1L7cCP3CuQXXRVkJjdLjuo
         IE79P2+w5wFiYpdJmX0ofyWAZYycl34hnsS8D4ynzd82H5n4Ly8vXdsyUlivtGQuBnmL
         b9SF9v0advLxASxQduWy0nkNPxJMmDIwkXSzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BH/ZvdHwavygsraND3jZ9umdlqtC3J2xs3HpZjL2mwo=;
        b=GD5lyxwW5G6LvXPAVh3BBSg6z7/ygEQL+nM9Csh/LsLawQ3wn8GCJ3mlWksheiNg1F
         ebx/0bsNyhvH3gM6Tb0/fun0GJZWW1hvZGCyGqCGRpXUc5/ueKvTnarFTP5noNv/wL76
         zhg4QziIglUgh8qF1XoPqZS9uucKMQREh5wRgx/N4oqf60dPEdgnvm81sFXSHHjG/t1p
         qb9mCqWR29NQK8/iYcaRbs6MQI2s2is0gdlgGn3mtFCPhPO4EXSh+lgejAEjUC0wMc3i
         P+7CKX4Bgxq2nTLKRhxud1FvZn4gJGM9lbtjz6A16y00sykA9mQXB1Sb6CWSKY0YX9ZG
         TZHQ==
X-Gm-Message-State: AOAM530FrG/8O4JBrmx7RU3ymNu7fQrruWwiFBcqXLkE+O6+mKswh3Qe
        bMkXSjluvdQO8i/CfwKv2hUlfuM0Ltj2B8MeS/Y=
X-Google-Smtp-Source: ABdhPJz2b11zCQDy/6DrkoIez8/fx0Y/fsUYLN1ymofEsMYq6G3oMv6iIz8GITkWDMzBbUP8Vhl9Qw==
X-Received: by 2002:a2e:b98c:0:b0:247:f82b:a0ec with SMTP id p12-20020a2eb98c000000b00247f82ba0ecmr16789758ljp.418.1647900550945;
        Mon, 21 Mar 2022 15:09:10 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id c7-20020a2e9d87000000b00247ebe11990sm2223417ljj.10.2022.03.21.15.09.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 15:09:10 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id b5so3145847ljf.13
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 15:09:10 -0700 (PDT)
X-Received: by 2002:a05:6512:2294:b0:448:6c86:3c78 with SMTP id
 f20-20020a056512229400b004486c863c78mr15507615lfu.531.1647900215381; Mon, 21
 Mar 2022 15:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220319142759.1026237-1-chenhuacai@loongson.cn>
 <CAK8P3a12dY57+ZPEREAUrsNf45S0_4-yYHen6p0-PjJEivjczg@mail.gmail.com>
 <CAHk-=wj81Cgjb5xj=ghB0oEA4ronnc=WKZLTPGpJYPUn=QcQ5g@mail.gmail.com> <CAK8P3a33TZm2NZg28KbCCeLzLvf759_5r8hr-rcWftci9qinog@mail.gmail.com>
In-Reply-To: <CAK8P3a33TZm2NZg28KbCCeLzLvf759_5r8hr-rcWftci9qinog@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 15:03:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHLUK8oew17oD=4v-7DXUEDAbrup+7oZ8Stq0m9S2EGQ@mail.gmail.com>
Message-ID: <CAHk-=wiHLUK8oew17oD=4v-7DXUEDAbrup+7oZ8Stq0m9S2EGQ@mail.gmail.com>
Subject: Re: [PATCH V8 00/22] arch: Add basic LoongArch support
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 21, 2022 at 2:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I can prepare a pull request when it gets to that, but I think the boot protocol
> should be fixed first, and that makes it 5.19 material.

Thanks. No problem on 5.19, it's not like I don't have enough pending
for this merge window already..

                 Linus
