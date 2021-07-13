Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FBEC07E95
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 16:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4965C611AC
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 16:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGMQWe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jul 2021 12:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhGMQWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jul 2021 12:22:34 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DABC0613E9
        for <linux-doc@vger.kernel.org>; Tue, 13 Jul 2021 09:19:44 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id t25so10401519oiw.13
        for <linux-doc@vger.kernel.org>; Tue, 13 Jul 2021 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dp68kZ8Q63rdtMpfnAuQFhGyVZFwXtaAN9MVU2dhJVw=;
        b=s2qdVmQAPUyIBQcU3gCySim/cqyPncxJAVDUWDUvCgsIEL+CQ1ZkQehIXEZJxuY0F+
         X4qgCZkoVkznKYHOxjxy9r284xl3LpkqXYyw4hJs1eHnvd2s36b3AFZWLddq/BY+orVp
         gjAUDeJVmGjC+iw2uEPJFhfPbm1IU1jdO2BZOdiCwMNfSaJgUHh7gLc0/ID/r2qK3qPB
         4xLUlZU66ARXHNShMS3KvakwXv23Wl+UgjNefUR1JT6MzYfAX3oIwZhihmBq7i+c/g0s
         keZc2VhfQVdvQTNMpOVtDvmYA/J+h5xV5pHr94Dq5zp+OERqVerbwiIfmaCCQKp/3WsM
         Un/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dp68kZ8Q63rdtMpfnAuQFhGyVZFwXtaAN9MVU2dhJVw=;
        b=Rv1a42O1+dL2Blo919pj8JossiEICehrpwg9gz5ABGWdwT8oNtNVi7AkLEoaecXhWc
         1lUJFNeGXnT4Mj/Myit7mRgsZYjzOehTSO8HppwCHcsPdvCvmqau215YShmYGko8dTIl
         iQY/tD+cJBIpSfZT012FfGZtMEqoXcds59w1//WKAl8jY8hZLcqPAdT00+zTp3rbOiDg
         jdZYs7eTMhUEaPe3Olq81Dh8RmSW/ra7+ffV8bIsZWn2EfTZE2ZKExlQswiU64ZbuGHc
         Dp3iTXHiijIX8CsBsDjvuMZ5SBFmSsXAnIh/ri0dDsBqVaaleNBJvI6D/tswVzZoZ0IH
         A08g==
X-Gm-Message-State: AOAM530PMLaq+G86p3GoDxQwmUTl1vTvij5/qtSp1KTbyfEky2o4nZGV
        2GIoX8a5NfQ8jaqJjeVR83cs5xpmwefYp2NpH0w+BQ==
X-Google-Smtp-Source: ABdhPJw/q3Dy4tg96XptFz5EoeVdiGFEQ3Tnai+h5w17+Fq3JI7KCm873IrohB6qpItS4PKvWiUqNWIzaJAelsRIhj4=
X-Received: by 2002:a05:6808:1286:: with SMTP id a6mr3772723oiw.121.1626193183652;
 Tue, 13 Jul 2021 09:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210629113323.2354571-1-elver@google.com> <CAG_fn=V2H7UX8YQYqsQ08D_xF3VKUMCUkafTMVr-ywtki6S0wA@mail.gmail.com>
 <YNsGnyHJL6i1OZFl@cork>
In-Reply-To: <YNsGnyHJL6i1OZFl@cork>
From:   Marco Elver <elver@google.com>
Date:   Tue, 13 Jul 2021 18:19:32 +0200
Message-ID: <CANpmjNOif53i2zx5hZCN97U9Hb_BPv15dchSTfg9qpJa8iZ3rA@mail.gmail.com>
Subject: Re: [PATCH] kfence: show cpu and timestamp in alloc/free info
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Potapenko <glider@google.com>,
        =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, Andrew,

This patch is ready to be picked up.

Many thanks,
-- Marco

On Tue, 29 Jun 2021 at 13:40, 'J=C3=B6rn Engel' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On Tue, Jun 29, 2021 at 01:34:27PM +0200, Alexander Potapenko wrote:
> > On Tue, Jun 29, 2021 at 1:33 PM Marco Elver <elver@google.com> wrote:
> > >
> > > Record cpu and timestamp on allocations and frees, and show them in
> > > reports. Upon an error, this can help correlate earlier messages in t=
he
> > > kernel log via allocation and free timestamps.
> > >
> > > Suggested-by: Joern Engel <joern@purestorage.com>
> > > Signed-off-by: Marco Elver <elver@google.com>
> >
> > Acked-by: Alexander Potapenko <glider@google.com>
> Acked-by: Joern Engel <joern@purestorage.com>
