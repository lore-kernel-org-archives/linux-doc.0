Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50F7C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 01:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiCIBMW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 20:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiCIBMQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 20:12:16 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF70312E14D
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 17:03:46 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id d10so1561818eje.10
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 17:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BVNrGCcOfvHiAcGFTY5YLY7Z1HHPIFngZYQsO1KxKDY=;
        b=SG8/miPNs2SqQ8nycTJeRar97B4Q7FMFusbGeyij2z7w6RORJwBq1pHwdtxhXCkrRP
         31vF6vX9uuDq2YbmdD68fWT0Gox8vxJsIr/Xdf2NdLBT+tW3RUdzKm+1mBy81yu0fuoT
         DDi5tUBGsrtwdVz6rvkrIvBZrf5rTovzb5E7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BVNrGCcOfvHiAcGFTY5YLY7Z1HHPIFngZYQsO1KxKDY=;
        b=hOXe+JwaxFAzdAjpImvzTg0QsjHgTsvfKmJIA+q4p/BEPkSK52fsImA0mL8MIU+50b
         zeh1W8xx5NsxItI5qqXaqQL1SyJcBS9VNIFdiELN6fHNWcLF2eyZvfQiMweTsWfW0vfU
         Zk1/W0cHNGfVgTq36WpXp77CrJA0ntg2cl033f2CvyXMsT4tvUcEVibGsh1hC0bXDq/v
         Dai7rSrNA1qYgOLqNEQZGDJRSXRGiJnBDYVNV26qV3aihna1WCEuiovlW/xqKzDk0Yz+
         4gkeIIFMpxn5ZZiFlBTTIvqyP+3ScatA1/hiO7QXPx0zi31JDtToTDfsRdvZoXJXn7RQ
         rdpA==
X-Gm-Message-State: AOAM5303613KpPJRGhC9A7VJZizDIB8FnF+DGJW3Vm0L9sVa453umYXx
        a9cnMe2UuLotJMpDKzy1lUV5Nadr2N4VFoIZDUU=
X-Google-Smtp-Source: ABdhPJy71PcGBgZJbGWqBXw+KqFh3F+UstasB3PGQOTV6poCCCySFWO32hlcdqmUMguUurdEZR3Pzg==
X-Received: by 2002:a17:907:1c16:b0:6d7:622b:efea with SMTP id nc22-20020a1709071c1600b006d7622befeamr15434899ejc.110.1646783953506;
        Tue, 08 Mar 2022 15:59:13 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906284500b006cc551d6cabsm86833ejc.63.2022.03.08.15.59.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 15:59:12 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id p9so495562wra.12
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 15:59:11 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr12145935ljg.358.1646783940635; Tue, 08
 Mar 2022 15:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20220308234723.3834941-1-yuzhao@google.com> <20220308234723.3834941-6-yuzhao@google.com>
In-Reply-To: <20220308234723.3834941-6-yuzhao@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Mar 2022 15:58:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wggLcQSk3i2h8RWR2GYnCDQW_t5sWOExh2Oojmxvz0hcA@mail.gmail.com>
Message-ID: <CAHk-=wggLcQSk3i2h8RWR2GYnCDQW_t5sWOExh2Oojmxvz0hcA@mail.gmail.com>
Subject: Re: [PATCH v8 05/14] mm: multi-gen LRU: groundwork
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
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
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, page-reclaim@google.com,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I still think this part is fundamentally wrong:

On Tue, Mar 8, 2022 at 3:48 PM Yu Zhao <yuzhao@google.com> wrote:
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 3326ee3903f3..4ef67f157374 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -892,6 +892,28 @@ config ANON_VMA_NAME
>           area from being merged with adjacent virtual memory areas due to the
>           difference in their name.
>
> +# the multi-gen LRU {
> +config LRU_GEN
> +       bool "Multi-Gen LRU"
> +       depends on MMU
> +       # the following options can use up the spare bits in page flags
> +       depends on !MAXSMP && (64BIT || !SPARSEMEM || SPARSEMEM_VMEMMAP)
> +       help
> +         A high performance LRU implementation for memory overcommit.
> +
> +config NR_LRU_GENS
> +       int "Max number of generations"
> +       depends on LRU_GEN
> +       range 4 31
> +       default 4
> +       help
> +         Do not increase this value unless you plan to use working set
> +         estimation and proactive reclaim. These features are usually for job
> +         scheduling optimizations in data centers.
> +
> +         This option uses order_base_2(N+1) bits in page flags.
> +# }

Pick a value. Don't ask a user for a value.

If you don't know what the value should be, the user sure as hell doesn't.

And if you don't pick a value for people to test, then people will
test random values and dilute and make the testing less valid in the
process.

There is absolutely no upside to asking people a question like this,
and only downsides.

If the quoted "schedulign optimizations" are real, then maybe bigger
values should be the default? Or maybe it should be a run-time
tunable, so that people can actually _test_ them?

Or - more likely - that config variable just shouldn't exist, at least
in some initial series, and you just should say "we use four
generations, we can tweak this if people have hard numbers later".

                 Linus
