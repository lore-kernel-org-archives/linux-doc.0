Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0AEC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 15 Apr 2022 21:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356122AbiDOVj4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Apr 2022 17:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351959AbiDOVjw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 17:39:52 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED893980A
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 14:37:21 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 17so10717357lji.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 14:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lLriqQ645VZTKiVXonXX4zRxAjFhyB+B/84wbgqzXws=;
        b=Gq2Vs1cFahE54e4owDzXlpQ6dM9RqC+NMapopJ2Rgvnza5P4DZtfb948KXCZcASNMh
         Iezdw+NJsOwznSxZ1Bpo42TB6jsvbJqRWxbAc6bUJkl3zS3MuE5HboWtBp6hRyTXcZb5
         RQkyzuR9gn2IlHUb49/bg4XA6i75eDo/o8CNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lLriqQ645VZTKiVXonXX4zRxAjFhyB+B/84wbgqzXws=;
        b=VE6GZbcdhwuUcN+aSa2yJYkFb6hlCcHG4avBOHLkXQ4DIQQLdHQ85XD+uh2y5KvKs/
         xN9CkgWUhEf8GoTDh5kjgg/SH8YmuH04TRp7EZbkNk+tDn/c2V1O9GR47FtKYVXz3WkE
         LpfjV723hoT+8zhqeFBUVH9wgbiQg6eEghJDR2a0ga/4piX59XSlOxIcrxkKIVcDYleE
         wQEDmlFj/f5L4+jqz8CIo6pEyDJt9TN2lcn7uLFedbtB9HNCFfA5tfdqMW+fplrzGeJi
         n6rimqpV/e8vtxJgpG3ST75rrydzCUf/7ZMyK8BKaayDf3xUoDMGsN8sIyeRApTPHVW/
         kBpg==
X-Gm-Message-State: AOAM531vEj5MB3qaWcrcp1Be4jPanKNsEwDsK22CwMZfpMt529s1f2Cd
        qjkEUjpaZz5WCSawZw8DA3mewMfLdorPWWko
X-Google-Smtp-Source: ABdhPJxp1RoY2yBwJunY5t2HOquNKeX7abVd6OoK6g/IpYqwSyHH2nkACFD738BMeOJMW5In84RbIg==
X-Received: by 2002:a05:651c:b14:b0:24d:9c4e:42bf with SMTP id b20-20020a05651c0b1400b0024d9c4e42bfmr531081ljr.432.1650058639202;
        Fri, 15 Apr 2022 14:37:19 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id t4-20020a2e9c44000000b0024ac62a66d9sm375377ljj.60.2022.04.15.14.37.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 14:37:18 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id a8so10458122ljq.5
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 14:37:18 -0700 (PDT)
X-Received: by 2002:a2e:a78d:0:b0:24b:62bc:28ab with SMTP id
 c13-20020a2ea78d000000b0024b62bc28abmr551675ljf.164.1650058628048; Fri, 15
 Apr 2022 14:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-9-yuzhao@google.com>
 <20220411191621.0378467ad99ebc822d5ad005@linux-foundation.org>
 <CAOUHufYeC=Kuu59BPL_48sM67CqACxH2wWy-SYGXpadgMDmY3w@mail.gmail.com>
 <20220414185654.e7150bcbe859e0dd4b9c61af@linux-foundation.org>
 <CAOUHufYy6yQS9ARN9C5+ODkopR+ez4TH3hZNZo4HtNHBExS1mA@mail.gmail.com>
 <20220415121521.764a88dda55ae8c676ad26b0@linux-foundation.org>
 <CAOUHufYsjwMGMFCfYoh79rFZqwqS1jDihcBS9sHd-gBxEAD3Ug@mail.gmail.com> <20220415143220.cc37b0b0a368ed2bf2a821f8@linux-foundation.org>
In-Reply-To: <20220415143220.cc37b0b0a368ed2bf2a821f8@linux-foundation.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 15 Apr 2022 14:36:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvkRTVBhAamt0kYyp925jk_+g7T0CyPke_FbCWGQ1VvA@mail.gmail.com>
Message-ID: <CAHk-=whvkRTVBhAamt0kYyp925jk_+g7T0CyPke_FbCWGQ1VvA@mail.gmail.com>
Subject: Re: [PATCH v10 08/14] mm: multi-gen LRU: support page table walks
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Yu Zhao <yuzhao@google.com>,
        Justin Forbes <jforbes@fedoraproject.org>,
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

On Fri, Apr 15, 2022 at 2:32 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> We could create a new MM-developer-only assertion.  Might even call it
> MM_BUG_ON().  With compile-time enablement but perhaps not a runtime
> switch.

.. or VM_BUG_ON() could just become a WARN_ON_ONCE().

Which it should be anyway - since the code has to be written to
continue after that BUG_ON() anyway.

There is absolutely _zero_ advantage to killing the machine. If you
want to be notified about "this must not happen", then WARN_ON_ONCE()
is the right thing to use.

BUG_ON() is basically always the wrong thing to do.

                Linus
