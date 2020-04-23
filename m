Return-Path: <SRS0=PsPG=6H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131E6C55186
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 11:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBA7820857
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 11:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NXx4YPgv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgDWLqs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Apr 2020 07:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727088AbgDWLqs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Apr 2020 07:46:48 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB046C035494
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id j26so5496132ots.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soBENWxtv1Jx6Q4M8NjC2VsgjFKXOfQejEBroBd8f4g=;
        b=NXx4YPgvtOlyiKjB650mQVqamk7mwKi2f5oD1cAMtY5EWRnaThyz0h+QPOfwI1jQ9w
         6Nx1NeQyKFKmVdgwiYV71tS6SUDsNJ+4BS5yWOt41z7u06V3K9qAR9zAsV0eciBZ82NB
         MVwTigSQtl3NWsR6OlpVgGl3p8JXDydOI5XDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soBENWxtv1Jx6Q4M8NjC2VsgjFKXOfQejEBroBd8f4g=;
        b=jlJDsZld+59hj5nrJejN3PRPl/+5jmnvA4IIkyKSZGptaCkJbiCbGx0112CqRLvZ1m
         9EzihfLc9xiImAIzEd4WQs92Q/cV7SnilmERjN7sP2CzYStmhZF0hjvD5rqQDUQ9AhRo
         qfqXdnApaYCu+PKv10Jt8TyC9iNQZKh4MOQPrSWcx17p+ZYLShiTHiti56bhy+JuKlvb
         ohjRRTxCAJ5gghVlO9fOrxiBVeIRC/UhDMtF8p3OFV8iS1gHBtFqLtYmX2rsmfEYukKY
         kQ4vty2PR/RzMXcCoNuXVIx/6LOrdmlr+vEaU94s4x4hl5CBgqVIM3etpRwkB0KDdDU6
         bYKQ==
X-Gm-Message-State: AGi0PuZN9xlKfWMY5eN740LRcdl51bOg7g0h1eWRmszN1TcKLLdvp+ao
        GN1EiLPCsAhysG5yKNnjJ2Q9+GsvuC5N5n/7fHypbQ==
X-Google-Smtp-Source: APiQypKhOGBw+yldUeb3d73cJTyCIRTooxDShKtfsXpDubxWoQUNatT4V7/wpGHO6fgRNhipZQ5IOE3srpPVZe4TbtA=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr3147281ota.281.1587642406180;
 Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200420074115.23931-1-galpress@amazon.com> <20200420170059.5a42693e@lwn.net>
 <20200421123837.GZ3456981@phenom.ffwll.local> <20200421103236.4b64155c@lwn.net>
In-Reply-To: <20200421103236.4b64155c@lwn.net>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 23 Apr 2020 13:46:35 +0200
Message-ID: <CAKMK7uGTP93tbpsZhc1On2ka+YiVhwHk32cWHEdvS5O5DGODTg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Gal Pressman <galpress@amazon.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 21, 2020 at 6:32 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 21 Apr 2020 14:38:37 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> > > On Mon, 20 Apr 2020 10:41:15 +0300
> > > Gal Pressman <galpress@amazon.com> wrote:
> > >
> > > > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > > >
> > > > Signed-off-by: Gal Pressman <galpress@amazon.com>
> > >
> > > Applied, thanks.
> >
> > Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
> > drm. And maybe I actually get around to doing the doc polish for all
> > things dma-buf that I've been promised to do since months :-)
>
> I actually looked for it in linux-next before applying, but didn't (and
> don't) see it there...?

I only spotted the patch after I've seen your notification, so it was
indeed not there back then. But now it should be there:

commit 776d58823a60c689816972b51100cb322a0834ce (HEAD ->
drm-misc-next, drm-misc/for-linux-next, drm-misc/drm-misc-next)
Author: Gal Pressman <galpress@amazon.com>
Date:   Mon Apr 20 10:41:15 2020 +0300

    dma-buf: Couple of documentation typo fixes

drm-misc/for-linux-next is included in linux-next (we have some
special branches for linux-next because of some different rules than
usual for our committers). Latest linux-next also seems to have it by
now.
-Daniel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
