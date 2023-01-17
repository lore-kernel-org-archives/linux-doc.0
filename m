Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1CBC3DA78
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 18:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjAQSy6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 13:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjAQSvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 13:51:52 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BB14E539
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 10:16:13 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id o75so35150234yba.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K71xX/cWRCOszSsUEA3IJIhyWSHXMIZjKFhy6mle9xY=;
        b=en3ViOZMbrP4Uikiu/2WpjFPDaZ2MZS9XnYFDx8yBKisaQvRWhuGkY3AQtNSZWJHp8
         6EnxnmGlDMk/9pR/VaGa4iIQ9WFlTPAbfZ/4AKQlT/Xw65J7J1FzOXXk1nWpgnZVVcNp
         x4X4thpG4Fbgxx4oEisVqBmtzK5ufcFlWQWLWjN5Vfv2vrOmhbyyYJF/5O/xhmtrgFWl
         lsYuIOLzrkT5PVQsvvbAzBdSOQASKeD6FLA+DX0AxT+gqRNdl7iSwrTub/eEdRv3adX2
         1bB2gCzIYjz8YogEyIjqgBcQoeGGygQrI5vqYVF6+yOzR227dycqOllDNroYlFWxP1LQ
         oMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K71xX/cWRCOszSsUEA3IJIhyWSHXMIZjKFhy6mle9xY=;
        b=5cNG7vag5/F3zRr9z6VMskm1kJF5XKILs9ZZ/4tSC+9onNKm1MVcBf6kRpY3nvEIpu
         KmwzfTkZlaNQna/UqeDToMD5UcqrjraitzE6B2EoCZwBN01YG3zI/mzoEdP02whZzQRb
         IlUseujU+k50XKJa2l8+fLVupgfaqvb0P478azQixafqyRhZHVBC65hwVMgKgxhML2xn
         24V84ehF3uw/80J1AcJCfY9A4NphG00bAMoBXMbnTmVPt2OyYZ26L2EIdqUWzIw/FGCq
         9OibVUvwSEJLlSl0syCP55Pm6DaXIR0QFAP8n+LVUPfxURtDr+wbmlJHnnQuf3G2QyRj
         QTYA==
X-Gm-Message-State: AFqh2kpCqlAAaS2TgiovuuZ9GMupnWBcHvw5KiWa8B3mySM5NvJYqFes
        D/GSMIxjq6O1iej9ZekFK1d5s1OVJ5m46i3mVjAo8A==
X-Google-Smtp-Source: AMrXdXvYCBByr7y1fdbMzgX8r0rcQIT1xBf6yzo2htNPvKO5M4emG6u4gj4DL+7oQzTyzr5I28cSrbvcw2ebDzkVUgk=
X-Received: by 2002:a5b:9d2:0:b0:7d0:afc9:d194 with SMTP id
 y18-20020a5b09d2000000b007d0afc9d194mr546110ybq.341.1673979372493; Tue, 17
 Jan 2023 10:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20230116153347.15786-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbVa3XEDzcuy7iCqx0cvj4trzPe7N0B5PswA1mQ7O+GtA@mail.gmail.com>
 <Y8avtfifZpy89rS3@smile.fi.intel.com> <CACRpkdYTFDsU7xhu812Lh1mA1Hs9kGeid+akR84ervAsaxVYkg@mail.gmail.com>
 <Y8a4BAotZAax9Zx4@smile.fi.intel.com> <Y8bCBMoeNHlBG97a@smile.fi.intel.com> <Y8bCQ9QlhMpFdTiC@smile.fi.intel.com>
In-Reply-To: <Y8bCQ9QlhMpFdTiC@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 19:16:00 +0100
Message-ID: <CACRpkdbn+UWU-dzp+MXSVB+JkpsFwENyi+5Eq+GV1zPaaaf3rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Proofreading and updating the
 documentation accordingly
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 17, 2023 at 4:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Jan 17, 2023 at 05:43:00PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 17, 2023 at 05:00:20PM +0200, Andy Shevchenko wrote:

> > > > > Actually I have missed the repetition of the comment I put in v1,
> > > > > i.e.  that this would be good to be attached to my PR where the
> > > > > struct pinfunction et al. have been introduced. Can I have your
> > > > > Ack?
> > > >
> > > > Sure go ahead,
> > >
> > > So, which tag to use?
> > >
> > > "Acked-by: Linus Walleij <linus.walleij@linaro.org>" ?

Yeah that's fine sorry for being unclear.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

> > Added this tag and pushed to my tree, thanks!
> >
> > P.S. Tell me if I should do somehow else.
>
> Note, I have slightly amended couple of lines, and if you keep the patches
> in your tree as well it may be a minor conflict.

I pulled them out now!

Yours,
Linus Walleij
