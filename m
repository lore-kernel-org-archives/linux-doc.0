Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53666C433ED
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 09:22:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28F066102A
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 09:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbhDYJXW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Apr 2021 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhDYJXV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Apr 2021 05:23:21 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE65C061756
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 02:22:42 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id o21so11442530qtp.7
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ugedal.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rHqJw4XM6KNvFgd+6eDTbM0uYiK/qMr9nT+Gi0khnDA=;
        b=SAOjTqPoCFTcLZj5stQfJeMd/KGGLv5NxQXsZbWoxuvzKg6ZsmT9fWWd8MGgtBcvPu
         C746UW5yMeE1fk++7oSPbZBrLMjXIlZiBJn7Yogfhd0++JsS8iBnbvw4owZ+EKCr0dtd
         JzbX4TuLaaFDQ3R/KT3yyP9FtwgNgIQv7hGQde2hyYyHEhzZy++K+SpA4qerlNOhfFVB
         OmVkWixn8WHVbbUkDaGoJdRGGhas98j/koleU/Bg/7Sj7dtWFxGLOzlGAjP8gfZuP6h0
         RAkSiUEOSMZmSIwG8Hi5UeUxKFc6UgPv07ysBz2EMZ0XxdEtW4Ls2MKAEF72JeBswMjF
         DCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rHqJw4XM6KNvFgd+6eDTbM0uYiK/qMr9nT+Gi0khnDA=;
        b=bWI929p5dBcRP8VbC1b1Wj5Pq6ra6xSvmUyvhDl4tqAutgKJ8n3xEsLuTeAdWNCCom
         LR+XsPtbTYUMT74eURP+8GFOAtK+wfNr4f6lW/WHEzuz1mcDEkQGsspeat5fkhi0Tu5k
         e4ZY1r3iNs7W+a35/dZ9GM8HWesfGBGmfSA+RrkNDAefo9F7Ipeel//j15jIWmAi5lAU
         WvKCLMD/3SgFdjSXC14jHVH0Dg3zKhyxOh2IKJlMsbZbhWb6U1zm4KpOcN0dWx7i7aga
         14aByPySE5fHOABmTZ1ykEAwjUNVhD6UabPvT51QXRzeXvNk8dCtwk7s2dta8QJDBFvM
         /yRw==
X-Gm-Message-State: AOAM531J42UL+JVJZxBMLUNWcGs+arYrpQ/3ViDRRQ8AE8GzIqzvbi/c
        csqGNkx8cdYr6Ny71wre6guSVmaPFiFbAeEgsALztg==
X-Google-Smtp-Source: ABdhPJz+CpGWp3z6KtFJnKnrWirHyoSvnFfQhQ0xnhfu43WTI+sxJJZP9GsIKoGP8IrQfjVQl++aHKWThvkRQtw+KTo=
X-Received: by 2002:ac8:5a52:: with SMTP id o18mr12065400qta.138.1619342561124;
 Sun, 25 Apr 2021 02:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210416141146.542786-1-odin@uged.al> <YHn3cifQv1FUOqfU@slm.duckdns.org>
 <YH2Y9FucBW2GLLLQ@cmpxchg.org>
In-Reply-To: <YH2Y9FucBW2GLLLQ@cmpxchg.org>
From:   Odin Ugedal <odin@ugedal.com>
Date:   Sun, 25 Apr 2021 11:22:09 +0200
Message-ID: <CAFpoUr2+8aftSG0bok5--p+LaeoAPZ-kNGpk29LHsXp-T+AHBw@mail.gmail.com>
Subject: Re: [RFC] docs/admin-guide/cgroup-v2: Add hugetlb rsvd files
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Tejun Heo <tj@kernel.org>, Odin Ugedal <odin@uged.al>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> My preference would be to first try to write a version of the doc in
> cgroup2's briefer style, and then, depending on how that works out,
> see whether we can delete (replace with link) the cgroup1 text, or
> keep it for archiving purposes.

Thanks! That sounds like the best way to do it! Will take a look, and
post an updated patch.

Odin
