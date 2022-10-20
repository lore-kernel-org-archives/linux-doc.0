Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A299AC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 17:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiJTRgC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 13:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiJTRgB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 13:36:01 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00177FBCF9
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 10:35:58 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id y72so425206oia.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWECp01B4Xx6nEq/eutNw6SLXu9E/6fw2YNROX2OzQ0=;
        b=P6c+wo34AHTMfodvTE1hZyTqBtPJJ77PhKMVQAaKwNRySnWfFI9yAQGjHMkEVJisdj
         9fZvZ6fEOePG9WvMJeKEpcZto4/3bQvN3pJJFTtHOOlxLef94+44CI9Iv65zXqL4gIi8
         UgfZkHMq6og8I2COhZV0d/QiI51DItYR6+vNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWECp01B4Xx6nEq/eutNw6SLXu9E/6fw2YNROX2OzQ0=;
        b=gWkUxpHXIBWhUuNtORo3NTYsVbrKbZ3085n+Bt9uhbjDPU1D1CNw0n1wrW9xp0K+wh
         evHTj6zeXA2rQpBI2I8zNW2uTwkToUTLT/Tkqfe9J+F5cBj7CG+wfscMGtwRPypxggfu
         VvvHX81G0u2PIKrDob/yqYQCteC30wS75LOuuiN7av6+eOu1fiUp/AskpBneCWAEL8fz
         3N0ysC5CnAktICCT7bPY3CCnv7QpeD8cUziaMQ7hpT4mUcl/bYX8NpzYArsJgWJE0/+6
         rznkn2GOG3Qc9Hn8GL3s8L7kE2Ov719tqoPTQhknc/iP6UXfzT9wFf2Q1eaUTtorf4zq
         9Maw==
X-Gm-Message-State: ACrzQf1Qh1Xr/xACp5S66h8Z449xPojOiHC4cZgzouR8TVJkwpLS24Gu
        NnG+B1egV3WazuIr+9KMtXATeC/B8neyWw==
X-Google-Smtp-Source: AMsMyM4yDSH+4FlBxDfg8krMREhtTMPdSQkVR1Aea8CTonL9wSGdFYE1ul6P02d+EduXKC7Tt48QZg==
X-Received: by 2002:a05:6808:1ab0:b0:354:f6e9:f6c5 with SMTP id bm48-20020a0568081ab000b00354f6e9f6c5mr20671475oib.155.1666287358067;
        Thu, 20 Oct 2022 10:35:58 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 96-20020a9d0869000000b00661e7a16700sm130980oty.74.2022.10.20.10.35.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 10:35:56 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so294226otb.8
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 10:35:55 -0700 (PDT)
X-Received: by 2002:a25:bb44:0:b0:6bb:a336:7762 with SMTP id
 b4-20020a25bb44000000b006bba3367762mr11999002ybk.501.1666287344812; Thu, 20
 Oct 2022 10:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220815071332.627393-9-yuzhao@google.com>
 <Y0go8wWtdcyH1+Ch@hirez.programming.kicks-ass.net> <CAOUHufa9+FTO3Pv-5jC-e3S5goPsUGu-5KcPVHa4bWb0X+d2ug@mail.gmail.com>
 <CAHk-=wj1rc2t5noMtVOgu8XXeTM4KiggEub9PdcexxeQrYPZvA@mail.gmail.com> <Y1FXpHdyvXjrjbLw@hirez.programming.kicks-ass.net>
In-Reply-To: <Y1FXpHdyvXjrjbLw@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 20 Oct 2022 10:35:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whQchubuDpRGFabhmcZuzdt13OOF8wznXb+Dbi3GzBQhQ@mail.gmail.com>
Message-ID: <CAHk-=whQchubuDpRGFabhmcZuzdt13OOF8wznXb+Dbi3GzBQhQ@mail.gmail.com>
Subject: Re: [PATCH v14 08/14] mm: multi-gen LRU: support page table walks
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
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

On Thu, Oct 20, 2022 at 7:14 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> So I've been sitting on these here patches (and never having time to
> repost them), which is how I noticed in the first place:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/mm.pae

Well, that seems an improvement. I don't love how GUP_GET_PTE_LOW_HIGH
now affects the PMD too, but if it's ok for all the three users, I
guess it's ok. Maybe rename it now that it's not just the PTE?

That said, I reacted to that cmpxchg loop:

        } while (cmpxchg64(&pmdp->pmd, old.pmd, 0ULL) != old.pmd);

is this series just so old (but rebased) that it doesn't use "try_cmpxchg64()"?


               Linus
