Return-Path: <SRS0=kdU1=EL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B90DC4742C
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 13:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB86620715
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 13:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dh0smW5Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730829AbgKEN4S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Nov 2020 08:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730501AbgKEN4O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Nov 2020 08:56:14 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58812C0613CF
        for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2020 05:56:12 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id f9so2428387lfq.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2020 05:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pWfr6I/1fhJwOoSf0YAlJNTAtwTO7N82LKv6JheUJrA=;
        b=dh0smW5ZHA8/k2JdZxEaAbu1SFaVcaFR8n6fGRx1taylpO7O13Uia0bIG+nyAcp6Ze
         58CH/affcXWzrdXyk7aumyOI6iONzzSyl2VU9uKIzfLQyEIdDWGUpoBZ6j2Zlb3x8uiw
         ahq7w1R4k5Vc39DihoB8D/YnNSiqo22/xAbJauqwpOsGm5WupE6zqadGH8LMzXgbuohp
         2gm/AfDkpazzOa3Z5Sy8hurv0CjN9wdBsdytjBJ5Bm4ecFA9AWSTBD47D+lo/HunH7u8
         5XiE/+LhPEwIRdSZK7UT5liPBytxyoxydytEbZ8b5ehmCjk0xIJn5aGw436meUFwzCcw
         +agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pWfr6I/1fhJwOoSf0YAlJNTAtwTO7N82LKv6JheUJrA=;
        b=mZ4YlfBoTjArDPtLimrLGybNy+Hm3QB5TCNIIARHOa4Etv6e7BA+//U++ePLw7uX9R
         YV/9Qbnq1o6LfiYQba72YutYcdt4kT6PanypJJzYssgJCx7YeBlzTC2g8TRwoAgTTbKd
         AixWnUpidJZrmRr1XA8i1ga/coNgV9KFoywRNP7gfD81+HSP6VC1jEXZB3aCkwYNbNvF
         Fxhpv+6YFa9Rg8JDnHjwMVylwRdONYCOD76N6arPB+qNks4I26/qPGF/N8Nv584W8Irm
         gr89uFcJY5Kbil4zirup4ttdeVRhawKnmPYdiRpM/29cTg0FNnmOoqAN5vj4RZIF67kk
         oq9w==
X-Gm-Message-State: AOAM531UhNJCdI+656Tt03T8v96gVKraDAadoM5Q1oJ2TcVbqAWU9QwF
        EpTDwyHbOKTauWcemDxEycI8ohozDCVR044GvPGo/A==
X-Google-Smtp-Source: ABdhPJz1NkMdVDk2FKVmNqglkouzFOqJK2r6nNAUhTjFtrEgBbtn9xveKMPS3FTyRh2Xf7ZdUcxMmijM8XkJxyAwmCE=
X-Received: by 2002:a05:6512:3225:: with SMTP id f5mr987061lfe.441.1604584570861;
 Thu, 05 Nov 2020 05:56:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1603893146.git.mchehab+huawei@kernel.org> <53f82f9b3c063bb1b928bdea4986f1471ad3ace7.1603893146.git.mchehab+huawei@kernel.org>
In-Reply-To: <53f82f9b3c063bb1b928bdea4986f1471ad3ace7.1603893146.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 14:56:00 +0100
Message-ID: <CACRpkdZMpRvF3OhgPzSnk_qJcMNW+RtcYud8VEhgz2RVzN=ntQ@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: ABI: don't escape ReST-incompatible chars
 from obsolete and removed
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 28, 2020 at 3:23 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
>
> With just a single fix, the contents there can be parsed properly
> without the need to escape any ReST incompatible stuff.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
