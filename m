Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92263C4321E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Nov 2022 19:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiK3Tpr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Nov 2022 14:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiK3TpX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Nov 2022 14:45:23 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7170186584
        for <linux-doc@vger.kernel.org>; Wed, 30 Nov 2022 11:45:17 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id c26so6565829uak.5
        for <linux-doc@vger.kernel.org>; Wed, 30 Nov 2022 11:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d74Ux9XASnvU3YsAvcNYJRwNMvF0Ld8sCW80w/+NTE4=;
        b=j28NVgl4hCm++QbB7qCOUtkzWy/v59pO1/o+zat2KKRnzaBDA9auy79+yMFyfeHozY
         O8UmY73hAZaYuSwradcNQVtE4HbpFPjTDxkLSMq2YdoDkO1lcoXgQJTyH2fUudSZJgC5
         VBP5QabgJfTAUoei4mABHncJJGGGRi7anWkbVLpi0E+yzvQZdpwDlqKaUa4Q92t4IsZD
         o2C2j/dJoOSZ1dbwUISLxLapwtivpEougXjZlEMs1BWXkT5fhryOWhhCVvL25ogAsvfp
         ruTQESZWjtyVnOb/ieUzCNZaW6+5QIOKKytt/WwI2PjwBI2ERZzex4Em7IVovUebkd4c
         7J2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d74Ux9XASnvU3YsAvcNYJRwNMvF0Ld8sCW80w/+NTE4=;
        b=65Bu118zVmP1OMyeb0uaqLfv6Lc4kdmQtPHWNwyXidzabUiTPs16sDea4sDAkZ/WHC
         WjanRmkvQlATwQIZbIiD3UNeIKQ8/GqeH+26LZ6EDXeHE0Kh6P/P0mmZy2CqsGfRQYZO
         y3ZTKahRFCQryyhmDgY6WFjYLTqdVCJb27ToGo097TjNa3+MCT70yV6IRrYrCzBuEFTc
         OJ0fnBYnWmXo85bO0aRosz/PMsh5n69mNZ5Yi9q0+CRGTBDadFeEKxfZhxqyBtXIQhZT
         PDJSI25sj8qzD3iuX03jfB0ytZtkQZkW2PXJMgOh2eGHRSHNkd2alLcLr7dF4c3kDvrg
         IdOg==
X-Gm-Message-State: ANoB5pmIgjGNpVrycxKTVZwB/YJvoG8+9pTxbLPXPLCsytXVjuEja+hc
        Oa6INO/YWsBETMhHQ+MjMH4QSVCK1klcI2/zcbb4EA==
X-Google-Smtp-Source: AA0mqf5KD4A8huxx7YUTV1uBRe6MiSEHlskOPgRJdmk6Dpy74DbA4bP6E6IUjfKwIreVf8z7VpdE6ptsp6B7u2VZpQA=
X-Received: by 2002:ab0:7283:0:b0:414:43e4:b32f with SMTP id
 w3-20020ab07283000000b0041443e4b32fmr36770854uao.18.1669837516463; Wed, 30
 Nov 2022 11:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20221130020328.1009347-1-almasrymina@google.com> <7c5e0ca5-0ad1-452d-60b9-50dbb63d2dee@gmail.com>
In-Reply-To: <7c5e0ca5-0ad1-452d-60b9-50dbb63d2dee@gmail.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Wed, 30 Nov 2022 11:45:05 -0800
Message-ID: <CAHS8izPdKG0aNbfLK8=oUdsSSZ95i1nCaKs+4s5Kx1vCHMEOWw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mm: Add nodes= arg to memory.reclaim
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Huang Ying <ying.huang@intel.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Yosry Ahmed <yosryahmed@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, weixugc@google.com,
        shakeelb@google.com, gthelen@google.com, fvdl@google.com,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 30, 2022 at 12:44 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 11/30/22 09:03, Mina Almasry wrote:
> > -     This file accepts a single key, the number of bytes to reclaim.
> > -     No nested keys are currently supported.
> > +     This file accepts a string which contains the number of bytes to
> > +     reclaim.
> >
> Amount of memory to reclaim?
>

I want to have the word 'byte' in there somewhere to make that clear.
I guess maybe 'the amount of memory to reclaim in bytes'. Although as
written it seems more concise.

> > +     This file also allows the user to specify the nodes to reclaim from,
> > +     via the 'nodes=' key, example::
> > +
>
> "..., for example"
>

Will do in the next version. Thanks for taking a look, Bagas.

> > +       echo "1G nodes=0,1" > memory.reclaim
> > +
> > +     The above instructs the kernel to reclaim memory from nodes 0,1.
> > +
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
>
