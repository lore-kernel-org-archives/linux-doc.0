Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD96C433DB
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 23:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A518423A60
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 23:12:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbhAHXMf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jan 2021 18:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbhAHXMe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jan 2021 18:12:34 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0123C061757
        for <linux-doc@vger.kernel.org>; Fri,  8 Jan 2021 15:11:53 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id u25so6050922lfc.2
        for <linux-doc@vger.kernel.org>; Fri, 08 Jan 2021 15:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLt4ztLxzVBHshNZl1/x/vV1CQvxUEjisAgP7AfDZBo=;
        b=XIehVx9ar1bvUZcK9N6s3NjOLf3uSoE6MkC8KWzFKBDSbgSLvAQkiBmrpp2iNPGCf5
         vUcdf0Fh236uTTrTWIV9fUYOOhbi3ClgEeI/M4xmmWYlV1So+s+pfRj3HNU944AGelrC
         ltMwAtMkw4tk+3hYWHD4AeNYY1/ZLuk6SREco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLt4ztLxzVBHshNZl1/x/vV1CQvxUEjisAgP7AfDZBo=;
        b=jQ46YTo/pCqHnLa06mxMbVBjSVYgD2ozkABzNa6ARu1rAHMOe6R8IVHHT/4M9mWTmA
         RGGKE+vJZhvnNUN9HwQD5uSa7tWuMrXTNbt4MtHSzTVEMS+BU9X7OEaJ9zew1qc2Q6Fh
         1yq7MwcW2pRaFFUjeqBq7kt2o3wzjs+d31nbxN5od8qGE8BVOnnioBMLd+qQn+zp0czd
         DHUKry54PWy4BZ4BZyIqnWjw3zKlNQAlI1lUdgpEPSv5xpbw2skqFp17wLqZFKYL0G1J
         DLRf3x6VRgSsv77BG0BWZ5K++qRPPIhTk/XQgFf9P+1SBbHTcWVjANgxWp+Ze6Yw7Agx
         d4gQ==
X-Gm-Message-State: AOAM5336N/D2GvlYEW+H58wjfCvGjQSY69WsEwQyv4A9UAuCVE2H36vu
        lUURgt7fSZ+MjdWBM0TdlIj6O8QRNBx6QA==
X-Google-Smtp-Source: ABdhPJxFZ6Y/G9zPZ3hO8075tAOkCQjJOp6sId2uuxB7XxEG1MoZW9FqJM2T+KV0S/47GtZR/CUH5g==
X-Received: by 2002:a05:651c:1107:: with SMTP id d7mr2403081ljo.10.1610147511744;
        Fri, 08 Jan 2021 15:11:51 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id f27sm2167622lfk.293.2021.01.08.15.11.50
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 15:11:50 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id m12so26801941lfo.7
        for <linux-doc@vger.kernel.org>; Fri, 08 Jan 2021 15:11:50 -0800 (PST)
X-Received: by 2002:a2e:9ad7:: with SMTP id p23mr2320850ljj.465.1610147509949;
 Fri, 08 Jan 2021 15:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20200916205434.GA10389@duo.ucw.cz> <87czyf5jjp.fsf@vps.thesusis.net>
In-Reply-To: <87czyf5jjp.fsf@vps.thesusis.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 8 Jan 2021 15:11:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
Message-ID: <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To:     Phillip Susi <phill@thesusis.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 8, 2021 at 11:13 AM Phillip Susi <phill@thesusis.net> wrote:
>
> > Could we pause this madness? Scrollback is still useful. I needed it
> > today... it was too small, so command results I was looking for
> > already scrolled away, but... life will be really painful with 0
> > scrollback.
>
> > You'll need it, too... as soon as you get oops and will want to see
> > errors just prior to that oops.
>
> > If it means I get to maintain it... I'm not happy about it but that's
> > better than no scrollback.
>
> Amen!  What self respecting admin installs a gui on servers?  What do we
> have to do to get this back in?  What was so buggy with this code that
> it needed to be removed?  Why was it such a burden to just leave it be?

It really was buggy, with security implications. And we have no maintainers.

So the scroll-back code can't come back until we have a maintainer and
a cleaner and simpler implementation.

And no, maintaining it really doesn't mean "just get it back to the
old broken state".

So far I haven't actually seen any patches, which means that it's not
coming back.

The good news? If you have an actual text VGA console, that should
still work just fine.

                 Linus
