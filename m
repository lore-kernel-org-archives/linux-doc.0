Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A4DC433F5
	for <linux-doc@archiver.kernel.org>; Thu,  5 May 2022 00:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiEEAKX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 May 2022 20:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbiEEAKQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 20:10:16 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A4E562E6
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 17:04:03 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q76so2367048pgq.10
        for <linux-doc@vger.kernel.org>; Wed, 04 May 2022 17:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CqsigwUJFKlnytpQ1Jy6F2ijHqljosWDgLfk+F7d57k=;
        b=YuT85oCYk2g6XazqjmT1dK18Z3DqFlEZrszgqzoA9ArQPHadR4SBvRSW3mEk6Divvu
         E1015XRwDsF5/VgwjMsmE5l8tNlyACTbzNPIZ0MPWp5SUzDnLPGk9ZPN7l+pyAN4uwfk
         L4MTYNV+ED3vxmb73CNAHQhv4wFnVNxoKYnDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CqsigwUJFKlnytpQ1Jy6F2ijHqljosWDgLfk+F7d57k=;
        b=0MmMPXF0NRdeD4n8aTc3hhRgO2fR7jUbYV2ZeBGjslOwUHDwY5pNUkjyGcjEx/1+Ph
         6SEYGjbfYIDwuXNMQw5H4WfDNuDpad+pfPlVy0UeJsz5wYP/hocbwarR+LqmPRsdiMDu
         ElH4UpGBammfcn7kTWkymcZf4GT683EbW6TrZYaQzAPjVb5p+Sp3gr0fwV+p95XRV0Yi
         ljDPAcHuafMLrqZF15FNeyeqRv9j/oMKG1xrj6jplpDjUkI3lWgBJEMGzdUfZ46gdN8R
         2fAYV57loqXwUtA7ab3phqarZiQ1kbt61ClofJbpK4ktZur5LlyIv/iCFntHwpTYlI2O
         7CMw==
X-Gm-Message-State: AOAM531BYJvdkEk+GeatwV0Aq8CfrcYKz9O42tXBgFKYZL4afx+WPb/Z
        Boq+gRkrwaz7RUNDQedWIbD0OyMjRxSNHGiQmdDnVWYNG0cHow==
X-Google-Smtp-Source: ABdhPJwOTwHXqLBFLks7kg9f9lp1vjEit5/A35jklPA5XjIBHhSwNZKb07eOxk4x30s/MsWtpzrzwFp46v68+uh0BXs=
X-Received: by 2002:a63:5752:0:b0:3c2:1c59:666f with SMTP id
 h18-20020a635752000000b003c21c59666fmr13978898pgm.59.1651709043026; Wed, 04
 May 2022 17:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220503102429.48304-1-akiyks@gmail.com> <2146482E-C509-421F-AF7B-C220F8E1614F@gmail.com>
In-Reply-To: <2146482E-C509-421F-AF7B-C220F8E1614F@gmail.com>
From:   Tsugikazu Shibata <shibata@linuxfoundation.org>
Date:   Thu, 5 May 2022 09:03:51 +0900
Message-ID: <CAO+cJp2DOawa0FOjU5nkZo=xnYbEXbpPuKZsP8QkDromZnBndA@mail.gmail.com>
Subject: Re: [PATCH 0/5] docs/ja_JP/SubmittingPatches: Trace changes in
 English docs, take 1
To:     Kosuke Fujimoto <fujimotokosuke0@gmail.com>
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 4, 2022 at 8:05 PM Kosuke Fujimoto
<fujimotokosuke0@gmail.com> wrote:
>
>
>
> > On May 3, 2022, at 19:24, Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > Hi,
> >
> > This is the first batch of updates attempting to modernize Japanese
> > SubmittingPatches.  Conversion to ReST will be done later when the
> > corresponding commit doing the conversion is reached.  Pending list
> > of commits is quite long (about 90) and this effort is expected to
> > produce dozens of series.
> >
> > List of commits for English (then) SubmittingPatches:
> >
> > - f5039935ac68 ("Documentation: update GregKH links")
> > - e52d2e1f25f0 ("Documentation/SubmittingPatches: suggested the use of scripts/get_maintainer.pl")
> > - 755727b7fb1e ("Randy has moved")
> > - 8543ae1296f6 ("checkpatch: add Suggested-by as a standard signature")
> > - 0af5270324cc ("Documentation/SubmittingPatches: Request summaries for commit references")
> >
> > Note: Commit db12fb833a88 ("Documentation: fix spelling error in
> > SubmittingPatches") does not affect Japanese translation.
> >
> >        Thanks, Akira
> > --
> > Akira Yokosawa (5):
> >  docs/ja_JP/SubmittingPatches: Update GregKH links
> >  docs/ja_JP/SubmittingPatches: Suggest the use of
> >    scripts/get_maintainer.pl
> >  docs/ja_JP/SubmittingPatches: Randy has moved
> >  docs/ja_JP/SubmittingPatches: Add Suggested-by as a standard signature
> >  docs/ja_JP/SubmittingPatches: Request summaries for commit references
> >
> > .../translations/ja_JP/SubmittingPatches      | 36 ++++++++++++++-----
> > 1 file changed, 27 insertions(+), 9 deletions(-)
> >
> >
> > base-commit: 81c653659d34ec253fba7f5d0f430813fe0f643d
> > --
> > 2.25.1
> >
>
> Resending the response to this patch due to misconfiguration of my email client.
>
> For the series,
>
> Reviewed-by: Kosuke Fujimoto <fujimotokosuke0@gmail.com>
>
> Best regards,
> Kosuke

Plan of doing follow up chagens at first and then conversion to ReST
sounds good.
I'll continue to review your changes.

Acked-by: Tsugikazu Shibata <shibata@linuxfoundation.org>

Thank you for your patches.
Tsugikazu Shibata
