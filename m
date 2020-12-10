Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5BBC2BB40
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 03:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D285523A6C
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 03:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbgLJDp2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 22:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731260AbgLJDpT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 22:45:19 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E07C0613CF
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 19:44:38 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id z9so2771529qtn.4
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 19:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6DUkYPbW0IN3lTsbZs8Uo7hHVX/7SDc2/qPX9m0gHOs=;
        b=mgMtqKvuzXyZqBcjm+2cJshYiEqIxJXcjHgPp25DIgAZnq+dvYQDiPACAeRsbCr7Ok
         QiBRZ2Jqi7zso6AGv0bHSI3mC73ASY5ZXJFzoYoR7Dk1vF2bqOotOpoP6cWYeVE5WalH
         FREzONqAyFZckNzGLdMmXFNhrK0mvTPPvloHbkZaqBqjgptBjgBwidbPVdmdmlf8CzoB
         i54/L0gL+ZvZpC+h9j4yM+3jOlxpEcPdJbUOXdVzx2hyhahkWzWtM73o1QYrRdpCMIku
         sMHuQhUj4O2oyP7dCPWNvDU/QziD6jKelJmqFQmgFAfp1zSq4d1G0hoaHVZKLhwZvde6
         4khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6DUkYPbW0IN3lTsbZs8Uo7hHVX/7SDc2/qPX9m0gHOs=;
        b=oSnD7hxjFh6N5o3A4uwZSXGadrsy8dPWi1AuId1+Bp2G7funJlFEpuTyYE25GZG/Ex
         8CB/yuL3SRlALSLA6GO15j2rSZa4ZId4eGwFiqhpUyeJ2gc6JxqATqrNgbHQMte/wQOa
         9h7Yy5NCNturzpz+cZWtHJyJ7BW6UDi72eeyLwNPB+FreNNaWcc6YJ2yMCol9uyoVT8Y
         rX04HeiJdZhfeIdZXXB3iaYMWC3GKlCbYi5CBF0RMo0Y7PjfYxId/DwV1ZgRKJ6naoK7
         rC0lEG3ZSldbhTk7MV0mro6fBn0j10mlLujXCVOGY3ilszVmRDmCjNcXwBhyWKCaPqn7
         ssSA==
X-Gm-Message-State: AOAM531S9UTp1GSoV9YeVjGj4pf0qVg0bDdaa08OHou6i8e/BOhATupJ
        oKuXfgEllKoxMC9AMLKkEvpAKQ6s5bZZPq/yiQ==
X-Google-Smtp-Source: ABdhPJyemRVjVACAUJoERFJbH5lG6R2s1G8VjrXHoL4eXyHF+ClXQnKT06oLqhperDLgQulQMKMcdlnQs/QTIhpp5dk=
X-Received: by 2002:ac8:44a1:: with SMTP id a1mr6897969qto.186.1607571877892;
 Wed, 09 Dec 2020 19:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20201208014628.GA1361@JSYoo5B-Base.localdomain> <20201209172903.7990f71b@lwn.net>
In-Reply-To: <20201209172903.7990f71b@lwn.net>
From:   JaeSang Yoo <js.yoo.5b@gmail.com>
Date:   Thu, 10 Dec 2020 12:39:42 +0900
Message-ID: <CAHdLnN2b5viH--nuqEERePQd47inF9cYqFLaThd3VVAvz5u76g@mail.gmail.com>
Subject: Re: [PATCH] docs: update requirements to install six module
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.org, markus.heiser@darmarit.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 9:29 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 8 Dec 2020 10:46:28 +0900
> JaeSang Yoo <js.yoo.5b@gmail.com> wrote:
>
> > On the update of Sphinx version to 2.4.4, the "six" library won't be
> > installed automatically. (which is required by kfigure.py)
> >
> > Main reason of this issue were occurred by the requirements changed from
> > the sphinx library. In Sphinx v1.7.9, six was listed on the
> > install_requires, but it has been removed since 2.x
> >
> > The kfigure.py uses six library explicitly, adding six to
> > requirements.txt seems reasonable
> >
> > Signed-off-by: JaeSang Yoo <jsyoo5b@gmail.com>
> > ---
> >  Documentation/sphinx/requirements.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
> > index 489f6626de67..5030d346d23b 100644
> > --- a/Documentation/sphinx/requirements.txt
> > +++ b/Documentation/sphinx/requirements.txt
> > @@ -1,3 +1,4 @@
> >  docutils
> >  Sphinx==2.4.4
> >  sphinx_rtd_theme
> > +six
>
> Sigh...what we really need to do is to leave Python 2 behind.  Until then,
> though, we need to install "six".  Patch applied, thanks.

While I was surveying the Sphinx library, it requires Python version
3.5 as a minimum.
You can figure it out in the setup.py of Sphinx library source:
https://github.com/sphinx-doc/sphinx/blob/72ad5f2a/setup.py#L13-L15

I assume this would be a certain reason to leave Python 2 behind. The
Sphinx check script recommends using virtualenv. How do you think
about leaving Python 2 compatibility issue in this documentation
script range?
> jon
