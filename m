Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E48C35273
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 01:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E13123DE5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 01:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394742AbgLKBV3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 20:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404940AbgLKBVN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 20:21:13 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50581C0613D6
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 17:20:33 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id b9so5365500qtr.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 17:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5KxQxi//rfxoPE/5ektxxgnhqEbVJ6umnyWfi6v968=;
        b=oJH929LBreUektQbPNpNBqLSkFRAmuI5XNBMhAjSH/lneoeeQGdAnDTMnjlCqxnV+j
         R4pMmGCV2RUNpvVXb1wvUX4vU7/BC/TYejtCDImuungPaHrBzkYSzuFFrox/NbtC5Pln
         ZN71W1oLYni5V5JvQfaHOoKX7WYRZjYX/fHkiF4EFbOuKdb5AFZg/BAEyoAOp1ISS/Wk
         IjYOX71nvYu8CGtnI1MnHLLp1M6yaFbcCSp+Hqxmt1BgY3lDe6IwOl2MZcPvdIZh9F2Z
         6ipFMp1I9lguPAzNazOLnfVLIAGIQOSzz5JscZ88zDVRW7H8eYYgLqQJtEqUeLuMIRTk
         HMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5KxQxi//rfxoPE/5ektxxgnhqEbVJ6umnyWfi6v968=;
        b=NeXySrbqxnM2AoZFOa/5+wDKSIVRI1YCVfqs6fbcEXpPviNMzxTcMDGUYqtiz4fX19
         Sfa9xGbuQA/gdlsRwO1VGB/90gEc5qVvWXRjY3o+HQ81/XbzSfHXoWE2pxeLcucc7733
         yjFxyu+PKmva65S8L3CnvfuAU7KqJ1p0W2MCLvBliqm4cwoVkEDGyAWgKJYLHfNhOgcm
         UvUH05/0JaQzt8wTOgs8WZb6Svo7h0evTfX3EXyahyW3d6vDbOMsaChad1l97XCCGJhe
         9S8sc+yPRkHf3B1qnq6ItovEPR6i4YZ+BxGzh8QkzAy8Z8e/aA7xOGbJKhQ1vhM749GB
         qeIA==
X-Gm-Message-State: AOAM531LhMnDff/eU4b1YddW+5qpBoym7X84+V9bSobSRDcNPLDllUp1
        7zROkKQyiA2ZyYymUxlmjLcprBSt4uC+Q1hyTg==
X-Google-Smtp-Source: ABdhPJxfi9xhysruzyJ9ZCOKmiLYZsGg1Kybp2bj/mx4L4EsVwJpCwLHrAXxi7f40NrQEOosUtMvk0mJJhUaQZPSipo=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr12560166qte.313.1607649632441;
 Thu, 10 Dec 2020 17:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
 <20201209172903.7990f71b@lwn.net> <CAHdLnN2b5viH--nuqEERePQd47inF9cYqFLaThd3VVAvz5u76g@mail.gmail.com>
 <20201210160205.56bb9060@lwn.net>
In-Reply-To: <20201210160205.56bb9060@lwn.net>
From:   JaeSang Yoo <js.yoo.5b@gmail.com>
Date:   Fri, 11 Dec 2020 10:15:36 +0900
Message-ID: <CAHdLnN2pV6yq0iU7T2FiP8Q6i_kRZpMkVgPU_LCaR0uzdS5Qaw@mail.gmail.com>
Subject: Re: [PATCH] docs: update requirements to install six module
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.org, markus.heiser@darmarit.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 11, 2020 at 8:02 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Thu, 10 Dec 2020 12:39:42 +0900
> JaeSang Yoo <js.yoo.5b@gmail.com> wrote:
>
> > While I was surveying the Sphinx library, it requires Python version
> > 3.5 as a minimum.
> > You can figure it out in the setup.py of Sphinx library source:
> > https://github.com/sphinx-doc/sphinx/blob/72ad5f2a/setup.py#L13-L15
>
> That, of course, applies to current Sphinx releases. We have people
> building with older releases, though, which still work with Python 2.
>
Is this meaning that some people are using older Sphinx?
Then, there's no chance to leave from Python2.
By the way, the previous linked commit ID is tagged as v2.4.4
which is selected in requirements.txt

> > I assume this would be a certain reason to leave Python 2 behind. The
> > Sphinx check script recommends using virtualenv. How do you think
> > about leaving Python 2 compatibility issue in this documentation
> > script range?
>
> I'm sorry, I don't quite understand your question.
Sorry for my poor English writings.

I thought most users are using virtualenv. As you know that virtualenv will
help using the specific version of Python libraries and the Python
interpreter's version.

I'll try to describe what I tried to say.
1. The Sphinx check script recommends using virtualenv for preparing
    Sphinx document generation environment.
2. By the virtualenv, we can isolate the Python libraries and the
interpreter's version.
    (for the Sphinx documentation build)
3. When all the people are using the virtualenv, It will install Sphinx v2.4.4,
    which doesn't support Python2.
4. The Sphinx installation will fail for Python2 users.
    And it could lead to "no need to consider Python2 compatibility"

But as you told me above, Step 3 seems false. Still, we need to
consider Python2.

Thanks,
JaeSang
