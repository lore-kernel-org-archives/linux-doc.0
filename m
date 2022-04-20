Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7039C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 20 Apr 2022 20:07:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382042AbiDTUKm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Apr 2022 16:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382045AbiDTUKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Apr 2022 16:10:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F1546B14
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 13:07:48 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu29so4999793lfb.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=or6JCjKhYhBiaiW00aMF7rUmRM1Om7N8+nnkFL4bbB4=;
        b=PwJpWKVjNrMu7Gg4yVflFwYwWc4nnM7umtCY/l7yKXyV5Ft110X2v0svZpu5ToN4Y5
         DixablUApzvMzWya52D6gsldNClKZ0hyWeT/vhefyz8p4NqsfRLxoQJka5SJ7qGYV5KB
         ffG4ldzo9WpYNDxAEPmlwy7ETPe2MogPwMbPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=or6JCjKhYhBiaiW00aMF7rUmRM1Om7N8+nnkFL4bbB4=;
        b=TwpbXJEy4Kh79ko+qDfLeJJG2g9gvI7w4vdIaO4DcHseQVsAlLVaSbe87+E7a++VDb
         YwCHntZHF8t+Lrfc/4OZNglr1z56SQfFOrVfojA8m1BJ0ee0STVLdscghEfbuWB21E/Z
         NVVjNxHvo31K6PKonaap+o97gQ6QhuZ686yxSuvnDowdsJB4LWy8XprUdMJiw/oMVE36
         cJt//Bu8mDlcYYeJSsjUzHzmlJVTGorFdF77f06E99s6RfNy3xycQGiIHakBzaIrbSC0
         pT+dzdk3IOxDdhmoo862fdPD8G3eoWAo+79rXBbaOelvZfFwXnAzATLjlZhklX7xRPk2
         0Gcg==
X-Gm-Message-State: AOAM5310rLFWqkuU2NfpzKDfzXWJJjluXZ7y9qwg51PKUycMKnvEWHHU
        IJ1c7ggfvo2um8/e4s/Oz3Tp5mJZb7vjGwa3gdI=
X-Google-Smtp-Source: ABdhPJzsoS6XAt8DOpKFpv+iVY5C1tSNYJisiuRTC9QaY2x+X2TJiSrKVRPo8/9fpxWvxak1RBlivw==
X-Received: by 2002:a05:6512:3f0b:b0:450:aba7:850b with SMTP id y11-20020a0565123f0b00b00450aba7850bmr15770726lfa.78.1650485266452;
        Wed, 20 Apr 2022 13:07:46 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id l28-20020a19495c000000b0044a8abcb589sm1927366lfj.186.2022.04.20.13.07.42
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 13:07:43 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id c15so3204329ljr.9
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 13:07:42 -0700 (PDT)
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr15354025lfh.687.1650485251826; Wed, 20
 Apr 2022 13:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-6-yuzhao@google.com>
 <20220411191615.a34959bdcc25ef3f9c16a7ce@linux-foundation.org>
 <20220412070616.GT2731@worktop.programming.kicks-ass.net> <CAOUHufbUyTL-xx1RBovfSh+CrK7mBHGOouvyQBjy1RX1f3dkzw@mail.gmail.com>
In-Reply-To: <CAOUHufbUyTL-xx1RBovfSh+CrK7mBHGOouvyQBjy1RX1f3dkzw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 20 Apr 2022 13:07:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiPHodQRZuO=b9bzB_e42NkpW4MH6-kWbTp8oYnHMk0WA@mail.gmail.com>
Message-ID: <CAHk-=wiPHodQRZuO=b9bzB_e42NkpW4MH6-kWbTp8oYnHMk0WA@mail.gmail.com>
Subject: Re: [PATCH v10 05/14] mm: multi-gen LRU: groundwork
To:     Yu Zhao <yuzhao@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
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

On Tue, Apr 19, 2022 at 5:39 PM Yu Zhao <yuzhao@google.com> wrote:
>
> A related question: if I pass new = old to try_cmpxchg(), does it know
> that and avoid an unnecessary atomic op?

No. try_cmpxchg() basically translates directly to a cmpxchg
instruction (on x86) with the return value being the eflags 'Z' bit.

               Linus
