Return-Path: <SRS0=GBzO=6A=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A8EC2BB85
	for <linux-doc@archiver.kernel.org>; Thu, 16 Apr 2020 08:56:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46B572078B
	for <linux-doc@archiver.kernel.org>; Thu, 16 Apr 2020 08:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZB0SB3T3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502985AbgDPI4u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Apr 2020 04:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503037AbgDPI4D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Apr 2020 04:56:03 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03571C061A10
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2020 01:56:00 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g14so2424112otg.10
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2020 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCt/25bZqDvJVBbS2T/nSkaf4i35Ayu5fc8C9w+DSHs=;
        b=ZB0SB3T3b/D2aou2Jlt1WAGRUEG6DPFL8ORrU5aJDGvS4RRldCBtGq2u7ipF43i5+e
         m/n8V+goLmrO0pw+8cjm6JNzoJXnwPETMIFcZ+HOgQKONpKf2OP/Px6JmiJdtlW6Sikt
         E3E3/GJMs9fYI7obYF+mrWBKiHyFnQ20T5a6caWaCncQ5gNuRPc+kBFKK/F10B5w47KA
         XAe6XDI71mypF0rmtCrEAH5exDprf+LakqHYHxw/kMhdR3F1XHquGELfQY2VnTq3M5x/
         f0+zXtyA5UD23Mhql3kdSSsqXZ4unrLQGx8xVdKvGxAjOycZ13qziMAOsaemXu4l2ASR
         QbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCt/25bZqDvJVBbS2T/nSkaf4i35Ayu5fc8C9w+DSHs=;
        b=uVomFmkI9dJEHMwYwSZ9JEFwe87Wq3vGeGYuLC1LT689zzcWyNE4iuc0HAqjsSoTQh
         ZqdaaKNKK6tb2v8XtIwW3VntvgFQsCd768Io447XOoo2MwYVpiL7fcOh0AnBK7vPDwWP
         SIMqYcjPi3ccHBnBZHwA+FG/KkIaThXqw2JWy8ESjCmZgsyQroXMlSZWBQc+xJcEr4Ik
         OSrwBrpk/qLjXM+ycWF2VYPFIU8ow0hYD4Ey/9d8JD44Bn/ByNKr48HE8HOSmW9AfWFu
         YV+IHRyM69wXG5XKf+XLQDCCvZP7Y45hhQNTSuMhMuTsO+0QbJCiR2YpmUyhzrIveHAC
         zYsQ==
X-Gm-Message-State: AGi0PubMfzXempU5y2LERDJFFwYwEhS3hHZfgacdmNbdlIr4DVmkp0qG
        4L/WdSTn9mmdeVIaYeIvUA9kgovKjCLlSIsppeD3dA==
X-Google-Smtp-Source: APiQypL2lhwIWiAZBB0Q4t1XxMP5gwqrnEPMEO5qsx7kwPdeLMRsCyvcU6J1wF1QmqGUwY3+rdRxCitBqx9DG5FCrOM=
X-Received: by 2002:a05:6830:1f39:: with SMTP id e25mr26276595oth.135.1587027360244;
 Thu, 16 Apr 2020 01:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200414143743.32677-1-peter.maydell@linaro.org> <20200415151132.03cad507@lwn.net>
In-Reply-To: <20200415151132.03cad507@lwn.net>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 16 Apr 2020 09:55:49 +0100
Message-ID: <CAFEAcA8igL7L8D16shd6KoVH8Yvu0SwyxcShKoGFgLmDhnSrNA@mail.gmail.com>
Subject: Re: [PATCH] scripts/kernel-doc: Add missing close-paren in c:function directives
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 15 Apr 2020 at 22:11, Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 14 Apr 2020 15:37:43 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > When kernel-doc generates a 'c:function' directive for a function
> > one of whose arguments is a function pointer, it fails to print
> > the close-paren after the argument list of the function pointer
> > argument. For instance:
> >
> >  long work_on_cpu(int cpu, long (*fn) (void *, void * arg)

> Interesting.  This appears to have affected well over 100 function
> definitions in the docs, and nobody ever noticed.  Good to know we're all
> reading it closely :)

Heh; I think my conclusion is "function signatures for APIs which
don't provide and use a typedef for function-pointer-arguments are
sufficiently hard to read that people don't notice simple errors
in them", but then I prefer the with-typedef style to start with :-)

thanks
-- PMM
