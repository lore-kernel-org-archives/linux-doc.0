Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA57FC4363C
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 15:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8557C20795
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 15:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1VfqE7Ih"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387984AbgJBP2W (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 11:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBP2T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 11:28:19 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D564BC0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 08:28:17 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id nw23so2552532ejb.4
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qLBFqOLPIIeVNrecDqmKe5pDCo6M469dtuJMB6uozXY=;
        b=1VfqE7IhuhjWt2NxSpY15JryJ4J2/wHwj6pro6Ab90rqqm8/jnAVHYuhYtDTCzQj27
         qCVkiPCKG0thGXfpo43leTkloWXb4f+aSyC/GcOJlqBMlYqh+AGg849MK067CQU5ldCf
         y7tpVFmABANjpGYnFo5WLqmYQ41qC+ME8ppKzuX3BRgQSNWxZ0GJ9CEMFB40/B1wXST9
         n23jsNHX38mqMVu5SbLFKT0BduDAckW26cEGXunyhSdVex7tpB2jYLTevLOdJEkx6aFp
         ZszJ9hK9yZsFo8UmiOMKW5ggGe40u1a3gIBFv2GPKBSZ3yIKQdfnYDCIHMrxaA9ZVlK3
         xXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLBFqOLPIIeVNrecDqmKe5pDCo6M469dtuJMB6uozXY=;
        b=kuUTDLMZ35M33jC5+UJmJwrR1s0XVz3gGFB+V88TOk7LZ10ozODhYdReqUEyOe0XWI
         h4LlIBFT5jkRm8F6CHPxKO45+Owo1BCWtQAKudaHeXQRXGw0gTreQcKkM+WETq0KwCQ7
         0+i1ZVFFtH5usNlT0HRMvJzjMvPbZUkyHsWk7G+vmo4NfBdtn9PyqI3TQ1ItjH7t7KHg
         i4inVecfoW05dosMtcLOugrGpKtPjBGreje9jMCpuJFT0ANZcBpa2BC2y9CtL5h18SPV
         uUCuObjGaQ2uNJUqHa+HxOJrRcgBo80eesCIbfH3uE/2N9h0dVkjNIc4+dFeyNMRCAXn
         uiyQ==
X-Gm-Message-State: AOAM530fzfPGAPWDEeah2x5f/YBy5Y9eKzA6mYtHny0eEAy2R7Afeicz
        aDiaGEmglsic3n732gAWrS/5kVNlpqQk+3/pB+8XGQ==
X-Google-Smtp-Source: ABdhPJyvVLldlJNq+Qx04LRovUfTW9uBVrkIrXj2nd3NucyIIBNdVg8NpMeAvgfX8qFLTRRUYxH+2khsTnKfRz5NXLI=
X-Received: by 2002:a17:906:d159:: with SMTP id br25mr2948371ejb.155.1601652496574;
 Fri, 02 Oct 2020 08:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1601616399.git.mchehab+huawei@kernel.org> <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
In-Reply-To: <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 2 Oct 2020 17:28:05 +0200
Message-ID: <CAMpxmJV8jkktBuHB=1r=twm2QhxT+DaB0DaCJ=0A3sBi2huQgg@mail.gmail.com>
Subject: Re: [PATCH 6/6] docs: gpio: add a new document to its index.rst
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 2, 2020 at 7:49 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There's now a new ReST file. Add it to the index.rst file.
>
> Fixes: ce7a2f77f976 ("docs: gpio: Add GPIO Aggregator documentation")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/admin-guide/gpio/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
> index ef2838638e96..7db367572f30 100644
> --- a/Documentation/admin-guide/gpio/index.rst
> +++ b/Documentation/admin-guide/gpio/index.rst
> @@ -9,6 +9,7 @@ gpio
>
>      gpio-aggregator
>      sysfs
> +    gpio-mockup
>
>  .. only::  subproject and html
>
> --
> 2.26.2
>

Good catch, thanks!

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
