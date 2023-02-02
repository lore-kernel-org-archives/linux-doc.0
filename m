Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D7CC636D4
	for <linux-doc@archiver.kernel.org>; Thu,  2 Feb 2023 10:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjBBKAS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 05:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbjBBKAK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 05:00:10 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B468B8936A
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 01:59:57 -0800 (PST)
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 12B5E442FB
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1675331215;
        bh=j6zWA0cmeZq/Pdujw3e8IyUapMEhl5TgQN8H+c5DyTY=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=GTwdiPbSuSaJMT5L0j2KMlY3lcYYOfdk0g0HHFzHp7uoknkeZ7xc81THDSXctGTst
         DIMdDM7BLU33V2o16thXOWjI5xJKNPd400bSA051mAHwkN1aEg2+MqNr+tdR/Tx3mj
         tBLbdoFib9rIGEjljP5fhNFapcdPmoC1yq2qYlOXiwuWIr/TUbhEI77h6D2vdX7H8B
         TE+FYPYqDv7C2rpHy60fSzvDz0wLdbY6t9QWSp1NgjkR1VhoTQfJkc5vQ+TynoqMFm
         6Q/71NXleyahCl6CmS0pxKuQfg6vF2OgKjAig0ZakmEMfnFPyAdgNSgKEpx2hwAgh9
         ex/zNMiI4um7g==
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-514bf89d3cfso15023717b3.21
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 01:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6zWA0cmeZq/Pdujw3e8IyUapMEhl5TgQN8H+c5DyTY=;
        b=n8M6HX7lx2xPHYIJDHw5w9y3GtparhJhcjwsjbF944iVruPHATEuI0iMoeR/NUjXTL
         OIhzf8pmiENrTN90k6DretUroHHko+XxXGk/ARF6u2rMEZc7ee2iHgphVHz32hNrmHjY
         jt4P2d9V8DDhNIm81kody1EIQOtrnechlumjsc+S0f0WGK8cAglIwZCFJ1FaYE6cqR9m
         rG/bC9p/lPKqR1D12Hq/b/x+52lAvTZJN3oEXwDR+6HQ046+BBNZ7VuBpg3pVzlWFOK9
         KQ+fEtz9+kHQyT/q5cC7JRCBIGuRiGQktUnT//VVuT/Jf9w94zxTTpJT0ZgKBM44UpSJ
         ETjA==
X-Gm-Message-State: AO0yUKWpPxlRuiYKYeXew/yX/n3mLqz36/UT37V+sExijDNuB8TcWFvw
        t0UPPk6n79ByVTyk858cn/VjocdV3vh8xP3q4I31MgVop/lpvbT11xpMHoGWKBcp0QTGabLL93h
        GMGlva1atdTqoZ8qT2CLa1mYLdW0KtVABc6wwlthvZcQQ29JxvJOWBA==
X-Received: by 2002:a81:70c2:0:b0:506:6e1a:9b0 with SMTP id l185-20020a8170c2000000b005066e1a09b0mr631036ywc.277.1675331214115;
        Thu, 02 Feb 2023 01:46:54 -0800 (PST)
X-Google-Smtp-Source: AK7set93ZODHHCCQG04l+loQG6KBDQem1oCQB9qjfFasFJzVoB868hVcGOuxhSj0em1uOkSPuerV1TPOuLKFLpPe8Gc=
X-Received: by 2002:a81:70c2:0:b0:506:6e1a:9b0 with SMTP id
 l185-20020a8170c2000000b005066e1a09b0mr631035ywc.277.1675331213915; Thu, 02
 Feb 2023 01:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20230131121608.177250-1-aleksandr.mikhalitsyn@canonical.com>
 <87bkme4gwu.fsf@meer.lwn.net> <CAEivzxfxkWtYP4bqFrmD__3M9WpJNZjTJNx9wp4WQ0_LoGKT6g@mail.gmail.com>
 <Y9tJPn0a/O27SBuJ@sol.localdomain>
In-Reply-To: <Y9tJPn0a/O27SBuJ@sol.localdomain>
From:   Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date:   Thu, 2 Feb 2023 10:46:42 +0100
Message-ID: <CAEivzxdLUy6CKaQg7Go6P892xgQxi_CEk2M4A3TdVA644DSLqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: filesystems: vfs: actualize struct
 super_operations description
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 2, 2023 at 6:25 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Tue, Jan 31, 2023 at 10:12:42PM +0100, Aleksandr Mikhalitsyn wrote:
> > On Tue, Jan 31, 2023 at 8:56 PM Jonathan Corbet <corbet@lwn.net> wrote:
> > >
> > > Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com> writes:
> > >
> > > > Cc: linux-fsdevel@vger.kernel.org
> > > > Cc: linux-doc@vger.kernel.org
> > > > Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
> > > > ---
> > > >  Documentation/filesystems/vfs.rst | 74 ++++++++++++++++++++++++-------
> > > >  1 file changed, 59 insertions(+), 15 deletions(-)
> > >
> > > Thanks for updating this document!  That said, could I ask you, please,
> > > to resubmit these with a proper changelog?  I'd also suggest copying Al
> > > Viro, who will surely have comments on the changes you have made.
> >
> > Hi, Jonathan!
> >
> > Sure. Have done and of course I've to add Al Viro to CC, but forgot to do that,
> > cause scripts/get_maintainer.pl have didn't remind me (-:
> >
> > >
> > > > diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> > > > index fab3bd702250..8671eafa745a 100644
> > > > --- a/Documentation/filesystems/vfs.rst
> > > > +++ b/Documentation/filesystems/vfs.rst
> > > > @@ -242,33 +242,42 @@ struct super_operations
> > > >  -----------------------
> > > >
> > > >  This describes how the VFS can manipulate the superblock of your
> > > > -filesystem.  As of kernel 2.6.22, the following members are defined:
> > > > +filesystem.  As of kernel 6.1, the following members are defined:
> > >
> > > Why not 6.2 while you're at it?  We might as well be as current as we
> > > can while we're updating things.
> >
> > I'm on 6.2, but for some reason decided to put 6.1. Will fix it :)
> >
>
> It would be better to just remove the version number.  Whenever documentation
> says something like "as of vX.Y.Z", people usually forget to update the version
> number when updating the documentation.  So then we end up in the situation
> where the documentation actually describes the latest kernel version, but it
> claims to be describing an extremely old kernel version.

Hi, Eric!

Agree. Will remove version specifiers in the next resend after Al
Viro's and other folks reviews. :)

Kind regards,
Alex

>
> - Eric
