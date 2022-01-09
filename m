Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20900C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  9 Jan 2022 06:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbiAIG27 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 01:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiAIG26 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 01:28:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DD8C06173F
        for <linux-doc@vger.kernel.org>; Sat,  8 Jan 2022 22:28:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E11C6B80BAB
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 06:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA074C36AE5;
        Sun,  9 Jan 2022 06:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641709735;
        bh=6jFKFNFbgDkZ2sy/TNPuf4cYj1b6cyT5mXX3zPVEzok=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JXtzWWrLcB06n2oiiQIZcvnqiLPn0ONh0c3XDthv/36SOQPV9mSAQdkA/e9LvRExc
         wYHmzyfwsXRt+D/6smQ0JGd17ZZpuI1uqFuBTa9W7y4Zqt0DAFDGhE/BCDZRT+d8hX
         pnDH4OwiSHNMflT4AoJOOKNsFcxQnPpwNdfAVYWFOdWm7LieAOy25H5a5lhnbMervJ
         bMkVEr1/5/1dO6veVmwR9QqenxlQ89kaC+SitHj6QwbKuEXrPnQDOXtlXcaurjkgv7
         2SbFdZ5FvXUI73kS8Nv2c5GzpT2WuQCPti4YKi2YYI7zErO5amJO2U15dxrwTcH8w7
         oVhQatCEwKoUg==
Date:   Sun, 9 Jan 2022 07:28:51 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] scripts: sphinx-pre-install: Fix ctex support on
 Debian
Message-ID: <20220109072851.172675c5@sal.lan>
In-Reply-To: <370ffe86-864f-5690-7304-cd4ea24aac9d@gmail.com>
References: <84f90b41-7a18-d83c-8739-1d394175f74a@gmail.com>
        <63882425609a2820fac78f5e94620abeb7ed5f6f.1641429634.git.mchehab@kernel.org>
        <15aa5e03-8aac-af55-badc-b905ca91f281@gmail.com>
        <20220106043707.0d40cd11@coco.lan>
        <370ffe86-864f-5690-7304-cd4ea24aac9d@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Sun, 9 Jan 2022 13:09:19 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi Maruo,
> (+Cc: Jon, linux-doc)
> 
> On Thu, 6 Jan 2022 04:37:07 +0100, Mauro Carvalho Chehab wrote:
> > Em Thu, 6 Jan 2022 11:00:08 +0900
> > Akira Yokosawa <akiyks@gmail.com> escreveu:  
> [...]
> >> Longer term (for CentOS stream9 or RHEL 9), we might need to ask
> >> EPEL maintainers to add texlive-ctex.  
> > 
> > Longer term, the script is actually fixing a broken dependency issue
> > on distros. So, bugzillas for Fedora/Debian & derivated ones should be 
> > opened for "texlive-xecjk" package to also select "texlive-ctex"
> > (or whatever other name those packages have on distros).  
> 
> FWIW, I asked Karl Berry, who is the chief maintainer of upstream
> TeX Live, to add a dependency on ctex to xecjk [1].

Thanks for forwarding this question to him and to address it on distros!

> 
> [1]: https://tug.org/pipermail/tex-live/2022-January/047648.html
> 
> Karl has added the dependency to xecjk as of rev 61529 [2].
> 
> [2]: https://tug.org/pipermail/tex-live/2022-January/047654.html
> 
> On up-to-date vanilla TeX Live 2021 (>= rev61529):
> 
>     $ tlmgr info --data depends xecjk
>     ctex
> 
> With xecjk < rev61529
> 
>     $ tlmgr info --data depends xecjk
>     (no output)

Nice! Yeah, this is the long term solution, but still won't prevent
people/distros based on older packages to keep using packages
without such requirements.

> This dependency is expected to be reflected in the TeX Live
> packaging for next Fedora release.

Yeah, Fedora is usually keen to changes.

> OTOH, as I mentioned earlier,
> EPEL 9 (for CentOS stream9) doesn't have texlive-ctex at the
> moment, so we need to see what happens there when RHEL 9 is ready.

Yes. RHEL/EPEL is usually a lot more conservative.

> Note: the xecjk -> ctex dependency is already taken care of
> by openSUSE's TeX Live packages.   

On both Tumbleweed and on Leap?

> As for Ubuntu/Debian, it looks like TeX Live/Debian packaging
> maintainer, Norbert Preining, has no intention of adding
> dependency of texlive-xetex -> texlive-lang-chinese as can be
> seen in his responses to a Debian Bug report [3].
> I think this is a reasonable choice as most xetex users don't
> use xecjk and texlive-lang-chinese is large in size.
> 
> [3]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=961703

Debian package maintainer could reconsider it after the upstream
dependency addition, but probably only for SID and yet-to-be-released
versions. Debian is very conservative on their releases. 
Even if SID gains such dependency fix, I would be surprised 
if they end porting a dependency change like that to Bullseye
(which should be the latest version for ~1.5 years - with LTS
extending it for ~3.5 years).

It sounds worth mentioning about the texlive dependency decision at
the Debian bug.

>         Thanks, Akira
> 
> > 
> > Worth mentioning that the script dependency-checking is should be smart
> > enough to not break once texlive distro maintainers fix such issues.
> > 
> > Thanks,
> > Mauro
> >   
