Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49634C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 21:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbiADVYi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 16:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbiADVYg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 16:24:36 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38442C061761
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 13:24:36 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o6so153631634edc.4
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GqCKiYf+A5/18Td7yUtraHJy9LcjRCLCoUvNRD43+aU=;
        b=MfmNtueDVHnsYYwF7606zl1wvwmIUnMkrmZ7STTEI1WpjAcevanPdDcs4OmFi2IheI
         ZX6k3fGcbSo2/VuqQrrJ1JSFADXNPImGsiq3jIBXGy2+DjBDR2VH5ooOrmw0Bi5LsIxT
         Rf15u9d3j01bbR65HG8J945P6mls16I7jrX9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GqCKiYf+A5/18Td7yUtraHJy9LcjRCLCoUvNRD43+aU=;
        b=7Z6ap1aIuVz9krsclDjh8HkpPvjhME8moY8AsdvguHSseQff+MbXK0WJRGasGqrjmI
         XCzBgi6VW/u1rKJRay5N9JgBWP0zV76M5mRaqmZ/D0AxIqujRBgHm+v/SKXg+CBK4Jwq
         jhp/ZHm1aMMw+K5o+9WZFAHHdLVatQD8W8fGTPynIwmYhZ6hMoZ1sHhjVtf3FwJjiK80
         nIBNVj2j3EU6xlRPCK4KUBlpFdl7ByWGER8+AyG3XzEWl9/pjkN9Hik3sx4YnnZ+9W+m
         y2Qq7+dShiZ/W77ji25B31Zbb7Ef4xWycFkDkdwd64mazfYbg+G46Ynv/RiAe1VU5/n1
         n91w==
X-Gm-Message-State: AOAM532qm6xH2rfUWYxTC7RU+bwvXsoWlGG7wCS8fdja1pyE7sZs5YL/
        UU2bI5KB5zSpFYHRQXMvpY7GiewxVx//Jx48
X-Google-Smtp-Source: ABdhPJzbLuGUQK2rQO54BmviKl3eYq0UXJ8qNUvVBeYK+YytbtmWmyeLf7XB5TDNWXCm1A3MPLyLhg==
X-Received: by 2002:a17:906:1d4e:: with SMTP id o14mr39253499ejh.205.1641331474495;
        Tue, 04 Jan 2022 13:24:34 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id v16sm15197139edc.4.2022.01.04.13.24.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 13:24:33 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id s1so78750084wra.6
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 13:24:33 -0800 (PST)
X-Received: by 2002:a05:6000:10d2:: with SMTP id b18mr43639104wrx.193.1641331473028;
 Tue, 04 Jan 2022 13:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20220104202227.2903605-1-yuzhao@google.com> <20220104202227.2903605-3-yuzhao@google.com>
In-Reply-To: <20220104202227.2903605-3-yuzhao@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Jan 2022 13:24:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgvOqj6LUhNp8V5ddT8eZyYdFDzMZE73KgPggOnc28VWg@mail.gmail.com>
Message-ID: <CAHk-=wgvOqj6LUhNp8V5ddT8eZyYdFDzMZE73KgPggOnc28VWg@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] mm: x86: add CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
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
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 5c2ccb85f2ef..5a4843242f09 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -85,6 +85,7 @@ config X86
> +       select ARCH_HAS_NONLEAF_PMD_YOUNG       if X86_64

Why is this limited to 64-bit?

I'm ok with that - maybe it's a simple case of "this is not worth
doing on 32-bit", but I'd like the explanation to be written out.

Right now the commit message literally points the architecture manual
that sio relevant for both 32-bit and 64-bit - and then the patch
itself makes it 64-bit only.

              Linus
