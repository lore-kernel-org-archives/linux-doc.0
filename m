Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93288C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 15 Apr 2022 01:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238812AbiDOBSA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Apr 2022 21:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236757AbiDOBR7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Apr 2022 21:17:59 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253E17CDF2
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 18:15:32 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id i27so3033748vkr.5
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 18:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqQ5iSXHRChMtfKt3RIiTUV6la+/DUpLnLLVZuKBh7Q=;
        b=oviqlwgsbsf/uMOiFPTaRFR184BPOabtCsqvs6xHtrlZpVbO4wKVB0eo7OE3eF6N/f
         WoaWM5yeZZLbX4bTnkrRStEi99QdeKS6Z3yPjXlEJ8thMjBN2y6vtiXz9+r5waIlarMi
         PEuJDrqRxDNGWEvZtqcjJ6wDZjHCrtXjyW8RCewvZZTM8b8ewk2aMLxst08o3jkmgvHj
         dBaMIEPKx2pirgP/PA/oNB8wvUGcKYkBWFZi8QlKZ5MZdK/U1NzAv8EWY+L7ieWQPXio
         KQeZRRy2WP6HjteGasYoS9ndZF9Muc0bdCZWEfz9K4vzCapbUgbZygSvSEc1A6iW2EBz
         SL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqQ5iSXHRChMtfKt3RIiTUV6la+/DUpLnLLVZuKBh7Q=;
        b=ijocQws/8owtFUSm74BF6yZADPwNym7WFFTiMui0memtLkoT2amAv6C0EOlMN0f8BT
         bcUcgqnqobrMpF1NNc1FCgpoGUUr2P6PIM3baNzbCWWltfxMZ6J+WGXo1/612riiOMJC
         FusH5NknlIAHxRUJNY6Ljcaaub17XV7uzufSbUTOpEYGegOPpGUOlRh4fqC0xeopWLDG
         apxYCmLaZzh7Abo8bSbD111b/k0iB7rpnVQ5uOof+i5vYwj48b+XDiOUr6e8C/ZBhVCZ
         XFv/cHIQTyk75x6AlY7CNK9E0RSg8fbV1qu1EaunhN5t7iy2HQcaOQKRgSMU9R7IYKtd
         E0MQ==
X-Gm-Message-State: AOAM5308rkfzf7aj4ZH04oJn4HJbnkQ0CMHiLo2azpzhI1I5k2bUEUOM
        bwX2pBzv015mWXryjr2RjLqqi7oZSE1TR17ZPkoKUg==
X-Google-Smtp-Source: ABdhPJwvGDjSCKwPleIWn79rkQzoHHhv5ROws7qejBtcO8EAQjqcBUMU+Hjaa8vtashbeHOejWBcqwTJDS8z7VZov/8=
X-Received: by 2002:a1f:314b:0:b0:331:fff6:a89e with SMTP id
 x72-20020a1f314b000000b00331fff6a89emr2454874vkx.26.1649985331160; Thu, 14
 Apr 2022 18:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-9-yuzhao@google.com>
 <20220411191621.0378467ad99ebc822d5ad005@linux-foundation.org>
In-Reply-To: <20220411191621.0378467ad99ebc822d5ad005@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Thu, 14 Apr 2022 19:14:54 -0600
Message-ID: <CAOUHufYeC=Kuu59BPL_48sM67CqACxH2wWy-SYGXpadgMDmY3w@mail.gmail.com>
Subject: Re: [PATCH v10 08/14] mm: multi-gen LRU: support page table walks
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
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

On Mon, Apr 11, 2022 at 8:16 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed,  6 Apr 2022 21:15:20 -0600 Yu Zhao <yuzhao@google.com> wrote:
>
> > +static void update_batch_size(struct lru_gen_mm_walk *walk, struct folio *folio,
> > +                           int old_gen, int new_gen)
> > +{
> > +     int type = folio_is_file_lru(folio);
> > +     int zone = folio_zonenum(folio);
> > +     int delta = folio_nr_pages(folio);
> > +
> > +     VM_BUG_ON(old_gen >= MAX_NR_GENS);
> > +     VM_BUG_ON(new_gen >= MAX_NR_GENS);
>
> General rule: don't add new BUG_ONs, because they crash the kenrel.
> It's better to use WARN_ON or WARN_ON_ONCE then try to figure out a way
> to keep the kernel limping along.  At least so the poor user can gather logs.

These are VM_BUG_ONs, which are BUILD_BUG_ONs except for (mostly MM) developers.
