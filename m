Return-Path: <SRS0=MW2i=3C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E98BC33CA8
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jan 2020 08:52:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1B2920678
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jan 2020 08:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="iUMNVIah"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgAMIwI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jan 2020 03:52:08 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:34122 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbgAMIwI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jan 2020 03:52:08 -0500
Received: by mail-io1-f65.google.com with SMTP id z193so8958754iof.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2020 00:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WguZovr7w2m2X1zQC6+qX9nLM78GMuCabyk3ve+En7w=;
        b=iUMNVIahZJ+iYbyruFJTQpGPwrHA6AbG3SEi1ryfNGcBbqSZhlOZ972H5JVFhpaJu3
         SuxTyCywmNR32/JAz023KaCvReKJ2xvTMZkEU+2+rGlm/PxbAHWugOvhz1JzW5YAkn7w
         X1Y9vVnN8ThfKMFcwdJLuJhJhmVOchINsZaxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WguZovr7w2m2X1zQC6+qX9nLM78GMuCabyk3ve+En7w=;
        b=sjfFAI1rnxFFLpgKQx9DWjddoRj0PfBFZWeVirRG0gbOn7ME3dDj5aF3ipp7jz2DEY
         2bblVCPAIdEtWloXtuBQIK5xXHb0kYYUI82ulHtmfSzj+WC/8rZSvPxlqtKoHcPXT85U
         I71MuYwxCbde2+WJiuC4MyPyP8mK3yhiREu794uIUAIOUTBQiNKAVZp6XbkoWh16HEHl
         OfRpYNa/2qQHtrkGsXl3lLICzc7uCUNxIyZ+q9h1ZfdOYElS8GVvCN6GhRfAH75yR3pL
         Wuax2tHB4gPnjWgB9UNRTfrZ5LQXa3p7kjMb4Kk1uMikwMNdDc6Iba4veWmYi94dheh9
         Kvvw==
X-Gm-Message-State: APjAAAWNN2mktQZgS6Tm49QPWHYGiLx504LQ/AV7C6nkt0JcXGznE/9l
        TljGDQcz3Xtq3lw6RZK8dhRSRHSVmdAwRsbZg5ITUw==
X-Google-Smtp-Source: APXvYqyD1z3AhO+BunsjSlb7c6IJA/YCCugP+yTkUD3iDk7YUduoV/eRTFouDc06SaotaswtXWIGMt+FAjQFrWE+B0I=
X-Received: by 2002:a02:6a10:: with SMTP id l16mr13056335jac.77.1578905527652;
 Mon, 13 Jan 2020 00:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20191231185110.809467-1-dwlsalmeida@gmail.com> <20200110110923.31fc56e5@lwn.net>
In-Reply-To: <20200110110923.31fc56e5@lwn.net>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 13 Jan 2020 09:51:56 +0100
Message-ID: <CAJfpegsBbLWaF43WtyTo8y-_sUjLi=60sQoXHDatsSVg8m68PQ@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation: filesystems: convert fuse to RST
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        markus.heiser@darmarit.de, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 10, 2020 at 7:09 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 31 Dec 2019 15:51:10 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:
>
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> >
> > Converts fuse.txt to reStructuredText format, improving the presentation
> > without changing much of the underlying content.
> >
> > Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
>
> So I note that the last non-typo-fix change to this document happened in
> 2006, which leads me to suspect that it might be just a wee bit out of
> date.  Miklos, what's the story here?  Should we put a warning at the top?

The document seems to be mostly valid still.

It would be good to have more documentation, though...

Thanks,
Miklos
