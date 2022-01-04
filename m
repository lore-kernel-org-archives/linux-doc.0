Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB42C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 21:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbiADVej (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 16:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234349AbiADVeh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 16:34:37 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE77C061761
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 13:34:37 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o6so153720297edc.4
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 13:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9sZ4yuZGqCPqkUDnmCAq5OUkSffiqPtJLP/mxilEStc=;
        b=WTQCJWiv/F+zhihRmn78BQddeC/Aw0oCQZBElMoXRJVG0+X7CNlVU8TYFOV20Oh5WE
         z0rV8GBZbj47SX8qHPJu6ELaRQdWsC+bROMLvqOZa9L0wZzl3Gw+Gl8cp6ri6RK+G5iT
         Vk+4igFuBi1wjYknZjhz8qCMITn8347p12Mhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9sZ4yuZGqCPqkUDnmCAq5OUkSffiqPtJLP/mxilEStc=;
        b=i+DtgmhJ9BDWmsX8Lk/qA7NHOPWfyTaZkyHvmk1kZRpm6EK/XU10Ih962MuoK5Wdw0
         6QbB3Yo8MXTLl1j/D8nDNB5Narq1pSOXLUOVMnZtKQBvfHqVVZ6KAy8i4HsyxO2KTP02
         XWm/mLx2UwsrF+YJrWMtKwuEQcdFLvVYOA15I13wXNKnZtffeKJylj6CxKYysEDCwrPF
         nZXFJpvzXAHSomaUU1jZsuRjlj+LICaBgoUcNoZlwfSEODI6NMhlikYM/RHcNXFA8/Dh
         sCh8zsrmVroLwdncZUDiEV0OPo7cYEpw722AyLWOlOwuba26Lj7Y1Ihzj9UunoDcHtvF
         DMkA==
X-Gm-Message-State: AOAM5327pUX7v+wjSmo5Kjo8D1/WoKAbDxEg7aAgUG+04f65T3gE1trX
        CEy7tktzlZn2dGV7wgOeAQngJA+Qbh7Us02jNEM=
X-Google-Smtp-Source: ABdhPJwMoKT5RxRG5KpBkhMTCvjGSWOFPabGsjIKjhWVF6mrmo9PcuoRMbg8ABUPkn2xqpPEBXX7Iw==
X-Received: by 2002:a17:906:c7c9:: with SMTP id dc9mr40855674ejb.559.1641332075897;
        Tue, 04 Jan 2022 13:34:35 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id g21sm4285877edt.12.2022.01.04.13.34.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 13:34:35 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so1291002wmb.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 13:34:34 -0800 (PST)
X-Received: by 2002:a7b:c305:: with SMTP id k5mr224179wmj.144.1641332074339;
 Tue, 04 Jan 2022 13:34:34 -0800 (PST)
MIME-Version: 1.0
References: <20220104202227.2903605-1-yuzhao@google.com> <20220104202227.2903605-5-yuzhao@google.com>
In-Reply-To: <20220104202227.2903605-5-yuzhao@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Jan 2022 13:34:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wib5-tUrf2=zYL9hjCqqFykZmTr_-vMAvSo48boCA+-Wg@mail.gmail.com>
Message-ID: <CAHk-=wib5-tUrf2=zYL9hjCqqFykZmTr_-vMAvSo48boCA+-Wg@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] mm: multigenerational lru: groundwork
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, page-reclaim@google.com,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 4, 2022 at 12:23 PM Yu Zhao <yuzhao@google.com> wrote:
>

> index a7e4a9e7d807..fadbf8e6abcd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
>
> +#ifdef CONFIG_LRU_GEN
> +static inline void task_enter_lru_fault(void)
> +{
> +       WARN_ON_ONCE(current->in_lru_fault);
...

Why are these in this very core header file?

They are used in one single file - mm/memory.c.

They should be just static functions there.

I'm also not sure why the calling convention is

        if (lru_fault)
                task_enter_lru_fault();

instead of doing just

        task_enter_lru_fault(vma);

and having that function do

        /* Don't do LRU fault accounting for SEQ/RAND files */
        if (unlikely(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ)))
                return;

which would seem to be a lot more legible and straightforward.

In fact, you could do it without any conditionals at all, if you just
remove the WARN_ON_ONCE() from the exit path, turning it into just

        current->in_lru_fault = !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ));

for 'enter' and just

        current->in_lru_fault = 0;

for exit.

It seems pointless to have that extra variable, and the extra
conditionals, for a case that is probably very unusual indeed.

                  Linus
