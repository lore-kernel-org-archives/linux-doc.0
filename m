Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF159C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 01:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiCIBQ1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 20:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiCIBQU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 20:16:20 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9F857B35
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 17:05:58 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id j26so719170wrb.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 17:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BlWs9Oc0zj9F2EHZcLB2J8SiaLs42pAAB4ehhmuarrk=;
        b=VyN7JMo6vbO64BMsSBYP06buMY3DUlc/4kwNjhwQem2ii3W8SmgZmDvZRuhzbXEPVp
         /HoQ4b8wz2JqhUyXHzdsaMB1bfpsVDrJMOU4BtjIHOBsfN/2ug+NMcbeUV6LMBlcCDB2
         sa7IwL82CQNufZu/wr3AhCP+cQFqC3WMqIC/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BlWs9Oc0zj9F2EHZcLB2J8SiaLs42pAAB4ehhmuarrk=;
        b=WonLlrQhVeCh9w6siTVG5h+v21SYg+DYwHXH29mseJb40DikbVqNWe1WLuG0XTux9r
         F7pf37h7s+zy6ikmLgDvHwRkdXxZZHl8r/9Vu1WUFjAW+1l/ODvob1tOrP/DL4ABdWqP
         CeeNNRfODbHS5FCJxmpH25I9cLIFQ9+yZO2qDmGljO4M65RrbUkVmi0A5Pu1qV5A4s2M
         dDOd4znUjYl3rmpdMIMGjwGvBzj9E+1PGrGT+/YPMZg9721sMu/ZnNmGhfz03+4i79BG
         eCwpxEk5MVueKwxP0AedQLDfDaDnIZayTyadryej/k7me5f0b7dLFvjCJiPK8thkY7Db
         N84g==
X-Gm-Message-State: AOAM533IKzjRZorcS6HcBeq+2w11ToHE+Hc6I1AITlZd49ogtbi+o4XD
        QkohxT5snGfgGfia/7/VNd8JpFvK6Ut+W3lQs6g=
X-Google-Smtp-Source: ABdhPJyD1sfE+vpx/5saHIT+JBFTNpAsZ+wTc9Tue99XmeYouH9xlygly4A07h4sCWW49gzaaqfh3Q==
X-Received: by 2002:a17:906:1e91:b0:6ae:99d9:93b1 with SMTP id e17-20020a1709061e9100b006ae99d993b1mr15381742ejj.111.1646784180306;
        Tue, 08 Mar 2022 16:03:00 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id f3-20020a1709067f8300b006ce051bf215sm82908ejr.192.2022.03.08.16.02.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 16:02:57 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id j17so610267wrc.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:02:57 -0800 (PST)
X-Received: by 2002:a05:6512:3049:b0:447:d55d:4798 with SMTP id
 b9-20020a056512304900b00447d55d4798mr12247526lfb.531.1646784166111; Tue, 08
 Mar 2022 16:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20220308234723.3834941-1-yuzhao@google.com> <20220308234723.3834941-7-yuzhao@google.com>
In-Reply-To: <20220308234723.3834941-7-yuzhao@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Mar 2022 16:02:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiW0riV3Di3r8s-z0VNyn71q8cHfZqbSM3-9LvwjNjJOg@mail.gmail.com>
Message-ID: <CAHk-=wiW0riV3Di3r8s-z0VNyn71q8cHfZqbSM3-9LvwjNjJOg@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] mm: multi-gen LRU: minimal implementation
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

On Tue, Mar 8, 2022 at 3:48 PM Yu Zhao <yuzhao@google.com> wrote:
> +
> +config TIERS_PER_GEN
> +       int "Number of tiers per generation"
> +       depends on LRU_GEN
> +       range 2 4
> +       default 4
> +       help
> +         Do not decrease this value unless you run out of spare bits in page
> +         flags, i.e., you see the "Not enough bits in page flags" build error.
> +
> +         This option uses N-2 bits in page flags.

Exact same issue as with the previous patch. Don't ask things like
this. Most *definitely* don't ask things like this if they can cause
build errors.

Just set the tiers to 4, and make sure that the number of generations
is small enough that the "Not enough bits in page flags" build error
just cannot happen.

This kind of "ask people questions they cannot sanely answer" is not acceptable.

And build errors that depend on configuration also aren't acceptable.

End result: DO NOT DO THIS.

The whole "ask user a question that you can't answer yourself" is an
actively wrong cop-out.

If you can't answer it, then the user sure as hell can't either, and
the question is pure garbage and only results in more problems and
less coherent testing.

                      Linus
