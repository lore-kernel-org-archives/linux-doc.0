Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF7CEB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 17:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjFTRXm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 13:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjFTRXl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 13:23:41 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC11F1AC
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 10:23:39 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3112d202363so3340312f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687281818; x=1689873818;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s9mWYfGROnySR6uue4WG7vLMYCpdaHNd7ovm5oIrCjM=;
        b=sjjrqJuC8PtXRZT+5ho8yuTY2RZb87MRMx42D91FylA8zy7UMk2YpWvEyJCAJal1b6
         Y0kRm37nwj9f+T/Cwqsz7krNQ+i18PGH0LOxj66r7TJDy5pxVw26z/VEwlKYSSx+XGE8
         wz52XXQJ0/e2DhlkqGFyt3J/IpFe3JqZYjQcDPuAl2kKymDu/0qNz8mtv8eQcxpW5zG8
         24z2T+nHBY7ld2xxKWJ8JG1i8kE8bhe3wVd8Qz2ZrjdA3E6JYa3r8DJWfpR+pS6tyiNy
         lrx7viRfFKHW0VGpHt0RRHaVrX3ZOI5wjftMsTv0O6/Y0YpVNMX6yElyJK2957vFOC4M
         qxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281818; x=1689873818;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9mWYfGROnySR6uue4WG7vLMYCpdaHNd7ovm5oIrCjM=;
        b=AphVXP56P/gZcmUatoKm8iw+oh1JEPDPp9+GlRmq3ZelfCdDBJRVAWKHJOJ2Kv4h5v
         uSm8NuWm2wxcWxPQ4FliQeYKx8Jf2JhDtFf7m8d9nMe4vgbYdkQg5+AQwhl++kkSJN53
         Jh10P3lk+WbUqpwnegUJnVBiw3lyKsBeVTQEHxwu58HjmMK32XeVtIr5YLI1P0KbQ5dN
         Y/QmSIejL86gYrWpnjUeUEb4ryfcVcxmPnSHbMgmCI1V0cM7Bh8ss4die+WJVXcErl9s
         D/kMp7PHEaddpPK7D2BqY949EDVTqAoEKH+S07oH7oBCNPtCpr1q8lQ1Qua4+aB0pa41
         pUnQ==
X-Gm-Message-State: AC+VfDwOfiHHc2g04ymAkYOxQ6h0p4M0e5m1ZmIkkYeBiU2RTWfkj8Ai
        gjCgMJibnRRvYTmOytabrYFO0g==
X-Google-Smtp-Source: ACHHUZ6wW1/zMPhc3JJbi6ECRYVjtyECOJO389GeUQGew9ZCiR6IuKO24ckak353ubn1mfb8xc+nNA==
X-Received: by 2002:adf:f004:0:b0:311:1df7:3e05 with SMTP id j4-20020adff004000000b003111df73e05mr9335340wro.22.1687281818234;
        Tue, 20 Jun 2023 10:23:38 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:9c:201:8530:a6a3:373f:683c])
        by smtp.gmail.com with ESMTPSA id g18-20020a7bc4d2000000b003f8d0308604sm14028860wmk.9.2023.06.20.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:23:37 -0700 (PDT)
Date:   Tue, 20 Jun 2023 19:23:31 +0200
From:   Marco Elver <elver@google.com>
To:     Andrey Konovalov <andreyknvl@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Taras Madan <tarasmadan@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] kasan: add support for kasan.fault=panic_on_write
Message-ID: <ZJHgkxdnlSXfXLkn@elver.google.com>
References: <20230614095158.1133673-1-elver@google.com>
 <CA+fCnZdy4TmMacvsPkoenCynUYsyKZ+kU1fx7cDpbh_6=cEPAQ@mail.gmail.com>
 <CANpmjNOSnVNy14xAVe6UHD0eHuMpxweg86+mYLQHpLM1k0H_cg@mail.gmail.com>
 <CA+fCnZccdLNqtxubVVtGPTOXcSoYfpM9CHk-nrYsZK7csC77Eg@mail.gmail.com>
 <ZJGSqdDQPs0sRQTb@elver.google.com>
 <CA+fCnZdZ0=kKN6hE_OF7jV_r_FjTh3FZtkGHBD57ZfqCXStKHg@mail.gmail.com>
 <ZJG8WiamZvEJJKUc@elver.google.com>
 <CA+fCnZdStZDyTGJfiW1uZVhhb-DraZmHnam0cdrB83-nnoottA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZdStZDyTGJfiW1uZVhhb-DraZmHnam0cdrB83-nnoottA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 20, 2023 at 06:27PM +0200, Andrey Konovalov wrote:
> On Tue, Jun 20, 2023 at 4:49 PM Marco Elver <elver@google.com> wrote:
> >
> > On Tue, Jun 20, 2023 at 03:56PM +0200, Andrey Konovalov wrote:
> > ...
> > > Could you move this to the section that describes the kasan.fault
> > > flag? This seems more consistent.
> >
> > Like this?
> >
> >
> > diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> > index 7f37a46af574..f4acf9c2e90f 100644
> > --- a/Documentation/dev-tools/kasan.rst
> > +++ b/Documentation/dev-tools/kasan.rst
> > @@ -110,7 +110,9 @@ parameter can be used to control panic and reporting behaviour:
> >  - ``kasan.fault=report``, ``=panic``, or ``=panic_on_write`` controls whether
> >    to only print a KASAN report, panic the kernel, or panic the kernel on
> >    invalid writes only (default: ``report``). The panic happens even if
> > -  ``kasan_multi_shot`` is enabled.
> > +  ``kasan_multi_shot`` is enabled. Note that when using asynchronous mode of
> > +  Hardware Tag-Based KASAN, ``kasan.fault=panic_on_write`` always panics on
> > +  asynchronously checked accesses (including reads).
> >
> >  Software and Hardware Tag-Based KASAN modes (see the section about various
> >  modes below) support altering stack trace collection behavior:
> 
> Yes, this looks great! Thanks!

The patch here is already in mm-stable (which I recall doesn't do
rebases?), so I sent

 https://lkml.kernel.org/r/ZJHfL6vavKUZ3Yd8@elver.google.com

to be used as a fixup or just added to mm-stable by Andrew at one point
or another as well.

Thanks,
-- Marco
