Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A1DC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 01:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346404AbiAKBu2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jan 2022 20:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346331AbiAKBu2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jan 2022 20:50:28 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72F4C06173F
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 17:50:27 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id m4so19623263edb.10
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 17:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EetO87X1Cc8PLBp7/dYf1qI4/zBTYAFhbzwsEuQlAc0=;
        b=Oq2UN+3x0Nz3S9avHhTQ89xnKr9pPDSwJUJ+WyUVDmx3IxxBr7E17MVLrv7h/u8MXD
         oioMf6P6tBKFLTtnOlGNXcvHoO2/NcsaXQt15ZYfDzy2RgWb3Ef/Y48bEsbS6AXT1Ntc
         gkVetaKNrgmpdOn3ctfa4L8vGd8C/GAbM+b74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EetO87X1Cc8PLBp7/dYf1qI4/zBTYAFhbzwsEuQlAc0=;
        b=3gt5n3nYMnqW+/Khdk5duEkyC7k72h+wZW8q4ISrU+f8ity2+/rV+j4TqegXywGdcF
         AxvDIC3gV35j0oAbHoFoMlE5x86lC5DaGHnw9KYDHw/lBE86QpLVRYk+L0ZZK6o+ZUdL
         +LKCKD6BE2pjt7kB0FG4RIYusVMBo4eURVaSiJm5QfqYOC/nd54cmdRMFGZlbVB471ie
         7SZBj2D6UIPULTxdKjoBNXXcY5ZP5gszlBDspK92PtIh++9YTnhcX0OI1ekwj9RR8UsB
         lBf0u1li3ybiiRZ6GxSQJQBB//3FOoY6TRX0/T6wSQorZdhym6zz+Qfs3Kh88lQd6SAc
         Np9A==
X-Gm-Message-State: AOAM531wlBXvOqQBokYaAQjAy1CQ90RQ2p3v69x+yJlB6q8+iuQ/qncC
        LQeIlRuG7O8QuNtZdsbrthpRQtJxripTszJFJ6s=
X-Google-Smtp-Source: ABdhPJx+MQ6TUUzuKTcdlxQ515laKsPw/YpmQPsMtFz6DlOzX607bt/1245cMTEs+0TVeaJ4jN2rFg==
X-Received: by 2002:a50:ab1a:: with SMTP id s26mr2320039edc.182.1641865826220;
        Mon, 10 Jan 2022 17:50:26 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id z18sm4433208edc.76.2022.01.10.17.50.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 17:50:26 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id w16so61052312edc.11
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 17:50:25 -0800 (PST)
X-Received: by 2002:adf:c74e:: with SMTP id b14mr1780419wrh.97.1641865334895;
 Mon, 10 Jan 2022 17:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20220104202227.2903605-1-yuzhao@google.com> <YdSuSHa/Vjl6bPkg@google.com>
 <YdgKClGAuHlkzVbQ@dhcp22.suse.cz> <YdiKVJlClB3h1Kmg@google.com>
 <YdxTR4+FL08XyFuO@dhcp22.suse.cz> <YdythmxHpSksJiXs@google.com> <CAJmaN=n=kn9-gC8if5wp8Gfj7uN+QVrX0ex=9JPXC7rPvGf1Qg@mail.gmail.com>
In-Reply-To: <CAJmaN=n=kn9-gC8if5wp8Gfj7uN+QVrX0ex=9JPXC7rPvGf1Qg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 10 Jan 2022 17:41:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=whAOM+xQm9vMe33qf8X1LX2QQZ7RBgKe_KH2C3LB=6Jdw@mail.gmail.com>
Message-ID: <CAHk-=whAOM+xQm9vMe33qf8X1LX2QQZ7RBgKe_KH2C3LB=6Jdw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
To:     Jesse Barnes <jsbarnes@google.com>
Cc:     Yu Zhao <yuzhao@google.com>, Michal Hocko <mhocko@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, page-reclaim@google.com,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 10, 2022 at 2:46 PM Jesse Barnes <jsbarnes@google.com> wrote:
>
> So unless we want to eschew big mm changes entirely (we shouldn't!
> look at net or scheduling for how important big rewrites are to
> progress), I think we should be open to experimenting with new stuff.

So I personally think this is worth going with, partly simply due to
the reported improvements that have been measured.

But also to a large extent because the whole notion of doing
multi-generational LRU isn't exactly some wackadoodle crazy thing. We
already do active vs inactive, the whole multi-generational thing just
doesn't seem to be so "far out".

 But yes, numbers talk, and I get the feeling that we just need to try
it. Maybe not 5.17, but..

           Linus
