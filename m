Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF6DC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 21:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbiADVne (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 16:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234990AbiADVne (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 16:43:34 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D94C061761
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 13:43:33 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id m21so154926119edc.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 13:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VlyYekp2oj/MkvkvX6Ay1MnkMaZXRB1aMd6yZZPObxg=;
        b=FB42VyHKTobzOeaP4gUSV6P6ReZLYkYHUoGFUaidmRZkPqcaL1gU1PiqCIQSDsIyP3
         G2dMmKIGbwCwZxL5Q6Geo0D+hbdN1rmrn3hKm7ibL56t4pBENhJw6uVIIkoQrlQVoWPl
         zgAQWzAnmn6OnNonVWgzgy8Lz5doKmYmIOf/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VlyYekp2oj/MkvkvX6Ay1MnkMaZXRB1aMd6yZZPObxg=;
        b=EOd/ktd4fFlQaNvLfuccvpR9yZjnLDG7MdxrPiLOhiHux9U8ihYsNCv2V+YYALoupp
         lw8m21vcQ6e+lsK6ZXuev8ber3WFMzyemT8sN9mysWZZUhXqdb3OlH7+iyqOPK73U/md
         7RQiRAPpcUpQ27l+KgMcv0Co+Iweu7GvAT/BnXlCVyBd4Lp7nuBXPlTqKY2qEOgapi5r
         DOF8K6VIByzhazOXQqksoOneirqrfUZZCYlhVwjYVCy/SpQEXnik9Y53aUmVACh/hAkM
         8SCT2f5V4umq/aVx8fUZNDFyVWk6G471ZDSfUsSS9MfMN08qQk1tfsSC+SIegI8yvzQP
         mFbA==
X-Gm-Message-State: AOAM532Q2TXJVxA+oqHpvLKRAgJXkOtR5zOavC3t2UrCPwY2SkQ0IA+9
        Eld/SIureyq8nOhxem2AUwHLbQiwzW5ApwbznkM=
X-Google-Smtp-Source: ABdhPJwccQNcHR6pGph9Rl7WZ6nanbeMBC1BYa0N+n0C/MNyDfQCYQvMMDTRdLUtiDyOWqakTJnBaA==
X-Received: by 2002:aa7:cfd5:: with SMTP id r21mr50836842edy.98.1641332612126;
        Tue, 04 Jan 2022 13:43:32 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id h3sm3907886ede.78.2022.01.04.13.43.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 13:43:30 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id s1so78825763wra.6
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 13:43:30 -0800 (PST)
X-Received: by 2002:adf:c74e:: with SMTP id b14mr10486476wrh.97.1641332609879;
 Tue, 04 Jan 2022 13:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20220104202227.2903605-1-yuzhao@google.com> <YdSuSHa/Vjl6bPkg@google.com>
In-Reply-To: <YdSuSHa/Vjl6bPkg@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Jan 2022 13:43:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=whMbX+GUBY=Fyxo3r-XVvfNyFA+4hUJS7UxgYDxf9Wbcw@mail.gmail.com>
Message-ID: <CAHk-=whMbX+GUBY=Fyxo3r-XVvfNyFA+4hUJS7UxgYDxf9Wbcw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
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
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 4, 2022 at 12:30 PM Yu Zhao <yuzhao@google.com> wrote:
>
> My goal is to get it merged asap so that users can reap the benefits
> and I can push the sequels. Please examine the data provided -- I
> think the unprecedented coverage and the magnitude of the improvements
> warrant a green light.

I'll leave this to Andrew. I had some stylistic nits, but all the
actual complexity is in that aging and eviction, and while I looked at
the patches, I certainly couldn't make much of a judgement on them.

The proof is in the numbers, and they look fine, but who knows what
happens when others test it. I don't see anything that looks worrisome
per se, I just see the silly small things that made me go "Eww".

             Linus
