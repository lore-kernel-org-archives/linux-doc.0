Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC73C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 16 Apr 2022 00:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356688AbiDPAGY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Apr 2022 20:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbiDPAGX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 20:06:23 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146264338E
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 17:03:54 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id j16so8170853vsv.2
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 17:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ztOn9qTNjZOdib9wu9VtT2ux2AzPcxh/m+7PKVCw6iQ=;
        b=R5JSg0OZdet4qAUAD70eGrmGlbnfq6SE/UKMx9mVP3XjOuHnA4bSF78m1q8xItuGE9
         vjqnxSxQ4spxqIw4T67UAoX/WAcpVdYRh0Do8X6bcppYXWpUgrN8T6JkIEu/GY1wQYyh
         A68dT7GLg+KlcZh58eo3TpGvYK6OsZzyfMZQDrLE0MQ6uR9X86jvNVceMpuK6ksQ1AGF
         vNgu+/XSqK9byqpg3ekX51zXiD0AKThWb3YM076hxyjIsBkx1tLG5G2nPZKahaiU1EQ/
         FUnVlc5HTy63gEsQMroqaIki707KQUKD83kXincChwkr/HdyaaFWnemn3Dfdf9e2bpd8
         6Bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ztOn9qTNjZOdib9wu9VtT2ux2AzPcxh/m+7PKVCw6iQ=;
        b=z1/CiPZVE562ifCzJqf4LgB78KOkQ9/icosjaD98ZPRp56xe1YfV6KRF3PI2ebJ/e+
         P4VIjYR7Yu32Miq0Ixo3m4H0O82JL9Hg4Tj1LifR54CxPTLXSwcD2kdTUJRAnyTrvGig
         BgpohrrwYlaGy9lZS0vr8f11wBv44Ir1QE971EjgDLY1gWSUVNMyREbD1SfRaN9EGfcb
         yfZyVx9Fsdsb9lXSDyM//V2EqxPfJWH+hPsqTxi2lbSPMfexdobY/IQylX3Y5MTU+nRe
         AxxmDQcenKvg7GC5egQsXQ2ovpOWUrnPiPBgOeluYT+0DAehuDD9A9km86VQbPGtyLGe
         OiGg==
X-Gm-Message-State: AOAM53077/cdQZhX1+YcVrz7EkJPOvUlM2SE+Q56DklF3+vENQi2RKpW
        WOLFmZOB455+9EfV5NlCN+nqSmYOZpaLBxQPdYtZgQ==
X-Google-Smtp-Source: ABdhPJw2ERJ54VhqBYtjNfKf1yIUSVFp1Wz9yRWf2I17eE6bxYiU0nBVH1Y+brrNjKX5bhrMgcp/2etChjEHOe5V/60=
X-Received: by 2002:a05:6102:3753:b0:325:c20e:4b1c with SMTP id
 u19-20020a056102375300b00325c20e4b1cmr371331vst.84.1650067433140; Fri, 15 Apr
 2022 17:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-13-yuzhao@google.com>
 <20220411191634.674554d3de2ba37b3db40ca2@linux-foundation.org>
In-Reply-To: <20220411191634.674554d3de2ba37b3db40ca2@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 15 Apr 2022 18:03:16 -0600
Message-ID: <CAOUHufYhhCPFqoRbtn+=OFxZxNWS9yxW9Re_s-2TYGqCEaMXVw@mail.gmail.com>
Subject: Re: [PATCH v10 12/14] mm: multi-gen LRU: debugfs interface
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
> On Wed,  6 Apr 2022 21:15:24 -0600 Yu Zhao <yuzhao@google.com> wrote:
>
> > Add /sys/kernel/debug/lru_gen for working set estimation and proactive
> > reclaim. These features are required to optimize job scheduling (bin
> > packing) in data centers [1][2].
>
> debugfs is for ephemeral temp stuf which can and will change or
> disappear at any time.  Anything which is "required" by userspace
> should not be in debufgs.

Right. "required" is probably a poor choice of words. "These
techniques are commonly used to optimize job scheduling" would sound
better.

> Presumably sysfs is the place.  Fully documented and with usage
> examples in the changelog so we can carefully review the proposed
> extensions to Linux's ABI.  Extensions which must be maintained
> unchanged for all time.

Eventually, yes. There still is a long way to go. Rest assured, this
is something Google will keep investing resources on.
