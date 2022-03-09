Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9071C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 01:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiCIBCh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 20:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiCIBCg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 20:02:36 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ADEA1A1
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 16:40:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id r7so972223lfc.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KfA4JgIAwrzcTd/4yRkk1J8RUcB4FSjox1guvVqXM6M=;
        b=gOPY1r/wzB5jYwuwRc6y3Yxrhd0fGC6yPlpf9+UB9omWnf6GTz6QTzPrdA7qfkJfHM
         lJ75Qqxmjo1vD3lxkPsHj+ZIudClKUQfypotCbBgEG08N3dw/YuJs8qjwqUXz2qOvy2j
         h6d9I3cmIm/w83PdSf1CY1Sj7DgY3Rbzp9ZI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KfA4JgIAwrzcTd/4yRkk1J8RUcB4FSjox1guvVqXM6M=;
        b=EHeUwZfzdtPUH10Ud5TYxhgGBtGNVPV5GkQ9AFPP2MUPrxsOb4rjzO/zAE6XeOL3B4
         aChbryZKuQhqkchhERSJGrpFDEzug8S0gfQTiRqLjIuJCOBYaGz4A8G09ZTbDbUqLeu2
         KfJXstyVQfxDb45qHFN8hvj4Lw3pvyY32ZZxAx0ddrYbxqK+zQMZKp9f8eyjNjnn8437
         VvE6av25GHsxc5JAGkwzivNaQPWMac5n8sVdfejvcl6guhfcSr5BOvuAXhqQyg31Q6kc
         z+r695eLV49kQerAUkxKh05o9LZM8Sn3F95I7s8kRdwzPAXnVAORIx2LBvlBhYH7r20D
         6imA==
X-Gm-Message-State: AOAM531qzrCKs+RLQLwBwj3gaKHQ4RevlxQlui1RfaizxTxAPIDMpZWI
        4b1nUe6wIoOCaG/QAvkjfrmIdY3Uu0j2UhqxWcw=
X-Google-Smtp-Source: ABdhPJy+Plbbm+j54Pq5qW8+J1Q8aXXqIPWzHM9aHu8+EYaPW9N3zeE8Z3oy33V+51E6bXgWgZdJAw==
X-Received: by 2002:a17:907:60ca:b0:6da:8f25:7983 with SMTP id hv10-20020a17090760ca00b006da8f257983mr15261261ejc.106.1646784442133;
        Tue, 08 Mar 2022 16:07:22 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id dz10-20020a0564021d4a00b0041665989a9csm109337edb.41.2022.03.08.16.07.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 16:07:21 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id i8so540080wrr.8
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:07:21 -0800 (PST)
X-Received: by 2002:a05:6512:3049:b0:447:d55d:4798 with SMTP id
 b9-20020a056512304900b00447d55d4798mr12256093lfb.531.1646784431050; Tue, 08
 Mar 2022 16:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20220308234723.3834941-1-yuzhao@google.com>
In-Reply-To: <20220308234723.3834941-1-yuzhao@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Mar 2022 16:06:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi5wg=72exwHODJdVtAfqa1e85dGfjGftuhHQ5Z4v-DNA@mail.gmail.com>
Message-ID: <CAHk-=wi5wg=72exwHODJdVtAfqa1e85dGfjGftuhHQ5Z4v-DNA@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] Multi-Gen LRU Framework
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
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 8, 2022 at 3:48 PM Yu Zhao <yuzhao@google.com> wrote:
>
> The current page reclaim is too expensive in terms of CPU usage and it
> often makes poor choices about what to evict. This patchset offers an
> alternative solution that is performant, versatile and
> straightforward.

So apart from my complaints about asking users config questions that
simply should not be asked, I really think this just needs to start
getting merged.

We've seen several numbers on the upsides, and I don't think we'll see
any of the downsides until we try it. And I don't think there is any
question that we _shouldn't_ try it, given the numbers posted.

But yeah, I certainly _hope_ that all the benchmarking has been done
with a unified set of config values, and it's not some kind of bogus
"cherry-picked config values for this particular machine" kind of
benchmarking that has been done.

Because that isn't valid benchmarking - comparing some "tuned for this
paeticular machine or load" setup to a default one is just not worth
even setting numbers to, and debases the whole value of posting
results.

                    Linus
