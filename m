Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272B9C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 26 Mar 2022 20:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbiCZUfj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Mar 2022 16:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiCZUfj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Mar 2022 16:35:39 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDA913DF1
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:34:01 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bg10so21472536ejb.4
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q3ovlUP9oP3KOPVRzS2l45i5ewEnSWL0JFQ06/HulGU=;
        b=EmBMPQsMUA/1s+ovtWl8b3YvOukUQkZ8xl1UXloUpExBp4rGI43A1Je+tUV+cRKiCs
         MZXcIt7SEOhjabvrFz2BkMNoPF+8JlbkcPB2EVhcnkKiGSmZBXbDrviIJkNTfaxbNUlO
         hDoO/biIc7wr4gpcE+jcufS7I4ZTgOMJ2mfcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3ovlUP9oP3KOPVRzS2l45i5ewEnSWL0JFQ06/HulGU=;
        b=tf3fqjog3MPn0ec7z8hNCPxEU556BYU23vaJPc+hYRYL0cYUa911lsRwWvmRUsOXiU
         ziUEas7K1QiC3pjyeUSbL6jxeoabgBqC8/h6ES6+QLazXtmmaWVfhV65zQHSVT8+8tfQ
         XvTClkfKet9Aw0wJu40vtj/IFsFIuSZF9oh99nKcrK2uLeCMJhwiMjl7TzkKJFD3EDja
         kCAUNyg76rneW/fgeKcNI/tE14VZvep7eQoVaICOq1khIVwchAiKjFGwxQFHRVyUPaH6
         EFMUI9IqMLDTKPnGXbdqZ9uAcKzQH01UvLo8W6rr4E29+xd2vRXvIzMlB/E8+bEGe1qo
         uOXg==
X-Gm-Message-State: AOAM532ViboIZTIY3c993lpXS44GxTi3zxRC1NhKgz/Jg6PK/O3GaM9n
        8eNwM6fJrv+jXksrNMCL55RoH5gA3tJ8yj7KUBg=
X-Google-Smtp-Source: ABdhPJwBErA0eCVyHj4n5eysXiRGyov8EzOms2T5cEwazkkt10TpIby3KzQkDjS4o9rbr3Naacu/rg==
X-Received: by 2002:a17:907:1c10:b0:6da:6316:d009 with SMTP id nc16-20020a1709071c1000b006da6316d009mr18862957ejc.621.1648326839898;
        Sat, 26 Mar 2022 13:33:59 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b006e0da7ef847sm944572ejb.13.2022.03.26.13.33.59
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Mar 2022 13:33:59 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id r13so15053563wrr.9
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:33:59 -0700 (PDT)
X-Received: by 2002:a05:6512:3d8f:b0:44a:2c65:8323 with SMTP id
 k15-20020a0565123d8f00b0044a2c658323mr13197197lfv.52.1648326480783; Sat, 26
 Mar 2022 13:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220326010003.3155137-1-yuzhao@google.com> <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
 <CAOUHufbqum18T4kZ=d_hMehz=N=3iSuNfGrLof5tB8kjGkk8yw@mail.gmail.com>
In-Reply-To: <CAOUHufbqum18T4kZ=d_hMehz=N=3iSuNfGrLof5tB8kjGkk8yw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 26 Mar 2022 13:27:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whbdpeeKbCYggJqfk0ExEPyxSW-yXSsNUqsGpd5ozt-Kg@mail.gmail.com>
Message-ID: <CAHk-=whbdpeeKbCYggJqfk0ExEPyxSW-yXSsNUqsGpd5ozt-Kg@mail.gmail.com>
Subject: Re: [page-reclaim] Re: [GIT PULL] Multi-gen LRU for 5.18-rc1
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <baohua@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Donald Carr <d@chaos-reins.com>,
        Hillf Danton <hdanton@sina.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Rik van Riel <riel@surriel.com>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 25, 2022 at 6:16 PM Yu Zhao <yuzhao@google.com> wrote:
>
> No. I could ask Stephen to see if he is willing to take this series. I
> was hoping to go through Andrew since his tree is what most MM
> developers test. I haven't heard from Andrew, so I assume he has no
> strong opinion and I don't want to put him in a different position.

So I'd definitely want to see this in linux-next for a while, which
implies it's not ready for this merge window.

I'm not convinced linux-next sees a lot of runtime testing (but it
gets *some* of that too, certainly), but it does get a fair amount of
at least build verification with a lot of odd configurations and a lot
of different architectures.

                Linus
