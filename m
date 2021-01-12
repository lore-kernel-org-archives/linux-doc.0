Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BE9C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 15:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 353D62079A
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 15:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405287AbhALP60 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 10:58:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405272AbhALP60 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jan 2021 10:58:26 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6408C061786
        for <linux-doc@vger.kernel.org>; Tue, 12 Jan 2021 07:57:45 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id r9so2665197otk.11
        for <linux-doc@vger.kernel.org>; Tue, 12 Jan 2021 07:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ipPU2vUc+BFfUi92jCI9tLYRCUYmdD6X+lgC1SjK0wc=;
        b=N/kJEm00glSMDkxyusQwQrXuK/TuEczkrU13epKkLv4ZujV7CmBMz7zExMyAmD/c8V
         fn4UuIte+aoF6LalD6gqyintU4Sx+9Y/524JjdnFYzLFIXD1OIRHQoZuytPVhhhbEBOD
         cC7OkVGttZF6yeiEnyVnJ+Dirk1yKpLg3XsWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ipPU2vUc+BFfUi92jCI9tLYRCUYmdD6X+lgC1SjK0wc=;
        b=uHdPeGqu1TD+ZeJbuB+jNm0IZNOpDlit0cU4Q9FYCj4pIcyNA/WZ5mRvGT21U0wsy8
         KjTm5DcwEdafWDlQWb0zPKvGQnzfOKZxcKrqNmgqSDZe7BbgsS5xMz3xZMLj8xcrv7rZ
         1Sbn4k9vq43ia15H+wE5xXJsxax8CDoc2APaHmUFyO6iEDT4P30p1uxhb2xCu2vj+E6m
         TBd+7WEtXBfkmuLOzgWq3/lcSCtwiaOsywTYQiBtInpRi7TJzCxSp+DGjO60pptyj8JI
         BxjketHX+tbqOIHsIHBEbWIbCvrjBb+tOqTybLakBBdKOOnocZMQihLp7mBp15na8ewy
         lJXQ==
X-Gm-Message-State: AOAM530g0FY/0BzPr0l/CicKtcUP7rVDjxvW+dbYXPM5nX9kDYpqJlHR
        YsajILgp4IYdtKTuKtNeG1RSKJ+2inJE2tj1ak8RXw==
X-Google-Smtp-Source: ABdhPJzXSshJQKExSJsT5ioLk9EsBQSNfGxfM3kxQUxKh+G7AoddxywtMTAUCL44UVcbxALZuyaFQc/OpgMmBHp1mPc=
X-Received: by 2002:a05:6830:1bef:: with SMTP id k15mr8948otb.303.1610467065202;
 Tue, 12 Jan 2021 07:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20200916205434.GA10389@duo.ucw.cz> <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
In-Reply-To: <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 12 Jan 2021 16:57:34 +0100
Message-ID: <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Phillip Susi <phill@thesusis.net>, Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 9, 2021 at 12:11 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Jan 8, 2021 at 11:13 AM Phillip Susi <phill@thesusis.net> wrote:
> >
> > > Could we pause this madness? Scrollback is still useful. I needed it
> > > today... it was too small, so command results I was looking for
> > > already scrolled away, but... life will be really painful with 0
> > > scrollback.
> >
> > > You'll need it, too... as soon as you get oops and will want to see
> > > errors just prior to that oops.
> >
> > > If it means I get to maintain it... I'm not happy about it but that's
> > > better than no scrollback.
> >
> > Amen!  What self respecting admin installs a gui on servers?  What do we
> > have to do to get this back in?  What was so buggy with this code that
> > it needed to be removed?  Why was it such a burden to just leave it be?
>
> It really was buggy, with security implications. And we have no maintainers.
>
> So the scroll-back code can't come back until we have a maintainer and
> a cleaner and simpler implementation.
>
> And no, maintaining it really doesn't mean "just get it back to the
> old broken state".
>
> So far I haven't actually seen any patches, which means that it's not
> coming back.
>
> The good news? If you have an actual text VGA console, that should
> still work just fine.

Also on anything that is remotely modern (i.e. runs a drm kernel
modesetting driver undearneath the fbdev/fbcon stack) there's a pile
more issues on top of just the scrollback/fbcon code being a mess.
Specifically the locking is somewhere between yolo and outright
deadlocks. This holds even more so if the use case here is "I want
scrollback for an oops". There's rough sketches for how it could be
solved, but it's all very tricky work.

Also, we need testcases for this, both in-kernel unit-test style stuff
and uapi testcases. Especially the full interaction on a modern stack
between /dev/fb/0, /dev/drm/card0, vt ioctls and the console is a pure
nightmare.

Altogether this is a few years of full time hacking to get this back
into shape, and until that's happening and clearly getting somewhere
the only reasonable thing to do is to delete features in response to
syzkaller crashes.

Also adding dri-devel since defacto that's the only place where
display people hang out nowadays.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
