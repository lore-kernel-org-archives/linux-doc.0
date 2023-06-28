Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E49FEB64DA
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jun 2023 16:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbjF1QI0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jun 2023 12:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjF1QIT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jun 2023 12:08:19 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054DB198D
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 09:08:19 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3ff24a193dbso60631cf.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687968498; x=1690560498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GPpb/2tnOaLvPcmNVC1FnQTKYAdbc3TLfcGD1phxugk=;
        b=c/v2TL/3f9Y6eB2vZAd4sMe0hQAYl3q/BOVJltpcJxfDKLnmZLSgNzNic4MaPFv0Q2
         c0wprO3nfhZn3EMjKu3JkpqDR+LCcLeDevVPEivlFkDb5fbKi+L8HoOF83r0R5xfD5CT
         fvldo1C4WfpBcQmVMFXemCg/O9WlJCuW6gTko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687968498; x=1690560498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPpb/2tnOaLvPcmNVC1FnQTKYAdbc3TLfcGD1phxugk=;
        b=VN0Vi5/a4SF1l+A1wzQwvctFabcegnQ9iQFBaT4XGebTNbtV3TIDsWoLCFgVRHhRuB
         Fny4u48QIHtU3IN6vKYUlI/jVlcKRyKttDfxCUCr9+W+rcVOEsjw5XXdxP/XfpS9AkFl
         HobAPqtKBwWWlNzWmOl7kL9qxS9n2v7xuEnZ4cOU8DdvUmucWfWMfLtHNICb1oMqL4MB
         91Q3MmUJNJdIUwlbcDFc/OkgilrhiTCBMgRLja6S7AVHkPMgS9r3tFFtcefYp/mhCyLi
         yMDuBPXLQweLxvIhD+K8NgCM4+wE1dnBgvZ06zR0bQJdWPHg4wV4oz+aQXOhR2uwpWoT
         Rffw==
X-Gm-Message-State: AC+VfDziFE671pmqtEbDB+q/4gbWktQRAd7CbG6DW10uTnqcnPvHXHX1
        EkkN12Y8rrQni10EC8/4PsQ+r2FI3wPWGrJuZAN8cQ==
X-Google-Smtp-Source: ACHHUZ555XP1uIpN296h86vTbk70RPCZ1V68Sq9Ajrh7wX0MHXorbDCrhDe/+XBnndE97f+xQcTgWw==
X-Received: by 2002:ac8:5954:0:b0:402:9cff:4573 with SMTP id 20-20020ac85954000000b004029cff4573mr6005377qtz.39.1687968497930;
        Wed, 28 Jun 2023 09:08:17 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id f7-20020a05622a1a0700b004008286c1casm3203873qtb.88.2023.06.28.09.08.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 09:08:17 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-765a5d31d0aso309836885a.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 09:08:17 -0700 (PDT)
X-Received: by 2002:a67:f998:0:b0:443:6ad6:7915 with SMTP id
 b24-20020a67f998000000b004436ad67915mr5063977vsq.27.1687968010482; Wed, 28
 Jun 2023 09:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230627120058.2214509-1-matteorizzo@google.com>
 <20230627120058.2214509-2-matteorizzo@google.com> <e8924389-985a-42ad-9daf-eca2bf12fa57@acm.org>
 <CAHKB1wJANtT27WM6hrhDy_x9H9Lsn4qRjPDmXdKosoL93TJRYg@mail.gmail.com>
 <CANiDSCvjCoj3Q3phbmdhdG-veHNRrfD-gBu=FuZkmrgJ2uxiJg@mail.gmail.com> <CAHKB1w+UyOnC_rOBABVhmzG+XeePaWYgPJWxX9NUeqnAi9WcgA@mail.gmail.com>
In-Reply-To: <CAHKB1w+UyOnC_rOBABVhmzG+XeePaWYgPJWxX9NUeqnAi9WcgA@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 28 Jun 2023 17:59:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCtu1OvoRe0ReqBVctzd8euZDt-h7dyx+xACWzdQeHkxBA@mail.gmail.com>
Message-ID: <CANiDSCtu1OvoRe0ReqBVctzd8euZDt-h7dyx+xACWzdQeHkxBA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Add a new sysctl to disable io_uring system-wide
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     Bart Van Assche <bvanassche@acm.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
        jordyzomer@google.com, evn@google.com, poprdi@google.com,
        corbet@lwn.net, axboe@kernel.dk, asml.silence@gmail.com,
        akpm@linux-foundation.org, keescook@chromium.org,
        rostedt@goodmis.org, dave.hansen@linux.intel.com,
        chenhuacai@kernel.org, steve@sk2.org, gpiccoli@igalia.com,
        ldufour@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

HI Matteo

On Wed, 28 Jun 2023 at 17:12, Matteo Rizzo <matteorizzo@google.com> wrote:
>
> On Wed, 28 Jun 2023 at 13:44, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Have you considered that the new sysctl is "sticky like kexec_load_disabled.
> > When the user disables it there is no way to turn it back on until the
> > system is rebooted.
>
> Are you suggesting making this sysctl sticky? Are there any examples of how to
> implement a sticky sysctl that can take more than 2 values in case we want to
> add an intermediate level that still allows privileged processes to use
> io_uring? Also, what would be the use case? Preventing privileged processes
> from re-enabling io_uring?

Yes, if this sysctl is accepted, I think it would make sense to make it sticky.

For more than one value take a look to  kexec_load_limit_reboot and
kexec_load_limit_panic

Thanks!

>
> Thanks!
> --
> Matteo



-- 
Ricardo Ribalda
