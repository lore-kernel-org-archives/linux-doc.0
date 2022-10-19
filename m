Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C13C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 19 Oct 2022 17:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbiJSRlO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Oct 2022 13:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiJSRlL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 13:41:11 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8A81B8679
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 10:41:09 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-132b8f6f1b2so21491603fac.11
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o7oESz5tomQbWcoWEgo0/iqd576fd8JG2PTmQCWKHUY=;
        b=LhnaCxQkYe9bL+uXUquBP284q0FFjCfp0v3tEE3Ew7ycTxf8ce+iI79qb3MGCCRuuU
         zjTJ8I9g99kNf5YqHMJEIgBBUDmx8TSibPKQcCCydysOcjqO4Oy0SigG4t1dTfmwSk9p
         Q8Xw+hnWgAzZpeoedADsV2vwGfcmjwBSuWbS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7oESz5tomQbWcoWEgo0/iqd576fd8JG2PTmQCWKHUY=;
        b=EWA1swWFUxlD1PcJK6wcxfj4M+lhB9sX79EVFxzwJv6QZSVqPPYhL/JctFat+DfSbo
         D5Yv9ORBju7NzH0e172V6Vszg9nF/od/NlKPCdwH0yOq+lIC54ytHakUq60EwEFa42VD
         bLFgZoRznuTo2vcJLlBbsQ6X2mZ9K2noekrnufPAIF5HYMAGMkiOEnUz+1UDQXoDqzPU
         o5ELhGodXEsnmZ3Sn3X1T/DthB+PTYNxq0YRfAInfyA9CBZcIXks0rx733xGLTAHz4os
         FfAnibYxC8lWdG8DMWegLiOIJZ+FlrI4FhDOPH6Y6xcWVCAoWPX4ypY0d++nHmjhB05e
         GZ9A==
X-Gm-Message-State: ACrzQf3lt3HIyqV47jyzfbYcT6nzoixvrqdpy02Uq6VXqGnCxUTzmzKW
        TaZWT2mGLjL/KweXaAjVVft0rklMk6UJfg==
X-Google-Smtp-Source: AMsMyM4xIq/dQbAeWF7d7cGgvf32Lr5qLGT2YoLgyiOGAfxC8nOLZ3EGKxMx3Nj+ALZISzxpT235hA==
X-Received: by 2002:a05:6870:3321:b0:136:c56b:626 with SMTP id x33-20020a056870332100b00136c56b0626mr5858352oae.271.1666201268965;
        Wed, 19 Oct 2022 10:41:08 -0700 (PDT)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com. [209.85.160.47])
        by smtp.gmail.com with ESMTPSA id k25-20020a056830151900b00661ac94f187sm7462685otp.42.2022.10.19.10.41.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 10:41:08 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-131dda37dddso21599563fac.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 10:41:07 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr6076270oad.126.1666201256175; Wed, 19
 Oct 2022 10:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220815071332.627393-9-yuzhao@google.com>
 <Y0go8wWtdcyH1+Ch@hirez.programming.kicks-ass.net> <CAOUHufa9+FTO3Pv-5jC-e3S5goPsUGu-5KcPVHa4bWb0X+d2ug@mail.gmail.com>
In-Reply-To: <CAOUHufa9+FTO3Pv-5jC-e3S5goPsUGu-5KcPVHa4bWb0X+d2ug@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 19 Oct 2022 10:40:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1rc2t5noMtVOgu8XXeTM4KiggEub9PdcexxeQrYPZvA@mail.gmail.com>
Message-ID: <CAHk-=wj1rc2t5noMtVOgu8XXeTM4KiggEub9PdcexxeQrYPZvA@mail.gmail.com>
Subject: Re: [PATCH v14 08/14] mm: multi-gen LRU: support page table walks
To:     Yu Zhao <yuzhao@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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

On Tue, Oct 18, 2022 at 10:51 PM Yu Zhao <yuzhao@google.com> wrote:
>
> pmd_read_atomic() should have a built-in READ_ONCE() in the first
> place.

I really think that is the right thing to do. Let's just move the
barrier in *there* instead.

It really should use 'READ_ONCE()', but it sadly cannot do that
portably, because 'pmd_t' may be a multi-word structure.

Of course, the x86-32 code does this all *almost* right, and
implements its own version of pmd_read_atomic(), but then sadly does
it _without_ actually using READ_ONCE() there.

So even when we could do it right, we don't.

But the x86-32 implementation of pmd_read_atomic() would be trivial to
fix to just use READ_ATOMIC, and the generic implementation should
just have a "barrier()" in it so that we wouldn't need crazy barriers
in the users.

Because as you say, the function is already called "read_atomic", and
it should damn well *act* that way then.

Hmm?

                 Linus
