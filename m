Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F54ECAAA1
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 17:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiH2R1R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 13:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiH2R1Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 13:27:16 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447E78E4EF
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 10:27:12 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id m1so11050480edb.7
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 10:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=gXzsOE1CShzICjrF5qGy2ierXGFwu1QBu0gbN37zalE=;
        b=Ut/Yn1l3ZfKq3kllusnwCW49U1+1e9wmphOxJZL9GkGYiMI92RHLiKlBhN3oEZvanI
         7JYgCGOtlhsspYwQS7VYStSwZpo7WvkVcklDEeY8RpOVreWefdxEoXKv29L7rmxzpHKR
         /hWDL1eQgn7kgPaex1M/knUHaYiw/VvWxr2uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=gXzsOE1CShzICjrF5qGy2ierXGFwu1QBu0gbN37zalE=;
        b=sl7ap1+Pt4ZUULmtiJ0OiVoB9eQHchCuErK/vV38QqL4EoB+j0ia72JUTezdmvNejH
         Gkvyux9ftAtQ2D6DezdAQ0kwFPrkNTGeEj213eKhG1eeOn3qX8AULxfmTSpp7ZDLFdTH
         7QsdXd6WVOStXCE6pdjjN49BWYyCQmDUJv7ulYreAJyARolwkvX9546qOx6NIRW6d8XI
         8WiyoeAGnWee0lHhdnwNIwst3lgwp4E38zHsYyz6p18wXkjq6arcgamaILl0VDmsHtXr
         nzjNPn/Aezqcp8bxOk32ET3idBZvvKkzBXMSpsjU7/JKKHdV77fnGRmTyOmZ1oGM2PK5
         vqpw==
X-Gm-Message-State: ACgBeo2Pk6hUi8zwBNNe+O1/3Y0eMMK0OZrKmjHt+26q//pu8elmUx1L
        6uv0c7vTiFaIBWr5TdvxvMyw6qp2nX984SGf
X-Google-Smtp-Source: AA6agR7+jetsG8UiM4CQpFMpujzLtQan7HeuOT92LGbgoaa7GGvPVVlJYbwr9Y6WhKfgTNiaFrFlmQ==
X-Received: by 2002:a05:6402:2753:b0:43a:d6f2:9839 with SMTP id z19-20020a056402275300b0043ad6f29839mr16859404edd.73.1661794030481;
        Mon, 29 Aug 2022 10:27:10 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id s14-20020a1709067b8e00b0073dc60271b2sm4754774ejo.32.2022.08.29.10.27.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 10:27:10 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id ay12so4581892wmb.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 10:27:10 -0700 (PDT)
X-Received: by 2002:a05:600c:657:b0:3a5:e4e6:ee24 with SMTP id
 p23-20020a05600c065700b003a5e4e6ee24mr7189742wmm.68.1661793592665; Mon, 29
 Aug 2022 10:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220824163100.224449-1-david@redhat.com> <20220824163100.224449-2-david@redhat.com>
 <0db131cf-013e-6f0e-c90b-5c1e840d869c@nvidia.com> <ea380cf0-acda-aaba-fb63-2834da91b66b@redhat.com>
 <CALu+AoThhou7z+JCyv44AxGWDLDt2b7h0W6wcKRsJyLvSR1iQA@mail.gmail.com>
 <fe7aee66-d9f7-e472-a13f-e4c5aa176cca@redhat.com> <CALu+AoRwVfr=9KabOLUQigWwCtP5RLQ1YaKbG75ZVM9E-bW2ZQ@mail.gmail.com>
 <CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com> <29fb251b-4622-4eb6-538d-bab6ac6a76f6@nvidia.com>
In-Reply-To: <29fb251b-4622-4eb6-538d-bab6ac6a76f6@nvidia.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 29 Aug 2022 10:19:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whScqgJaP71QBBS9ik0kUrZBDLw+ZvzF4AxEo7eviGwaw@mail.gmail.com>
Message-ID: <CAHk-=whScqgJaP71QBBS9ik0kUrZBDLw+ZvzF4AxEo7eviGwaw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Dave Young <dyoung@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, kexec@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Stephen Johnston <sjohnsto@redhat.com>,
        Prarit Bhargava <prarit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 28, 2022 at 9:49 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> ...here. I count ~1000 calls to panic() in today's kernel, to a
> function in kernel/panic.c that shows no hint of being removed, nor
> even deprecated.

Heh. I guess we never finished the panic() removal.

It's been decades, I suspect we ended up deciding that the bootup
failures might as well continue to panic.

Anyway, please don't use it. It's one of those things that should
never ever trigger, and mainly for something like "oops, I ran out of
memory during boot" etc.

Oh, I'm sure it's crept into other places too, but that doesn't make it ok.

                 Linus
