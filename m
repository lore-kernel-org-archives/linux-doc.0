Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B02BC43460
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 19:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F08F6134F
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 19:33:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbhEQTeR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 15:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhEQTeN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 15:34:13 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C707C06138A
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 12:32:56 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v12so7625520wrq.6
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 12:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NI7fG+Iz42tCTRW4FnFZEbmA6acgFeQJ4sXoAsYOays=;
        b=VPCiE/4FqXs81DF9CoNcuueDHeNNUjkvCfoCRnWBVPQjLW0j0pQz5y5NaRVERJMCpf
         B1DwT4s6SLMGXniu9FL9gxnGwYyUUM2smZUQvt2Qb1gXnj2J8YcJovyJWWPR0mD+OPsa
         UdPanHaQSl/KBZuSjumBEvbmgDHeFdUFZ1Zw8HAdGciyhOpy9GsqxNApeCXuh+jyv3yA
         Uvd69dvTrhNJosq/Y4Z/wTfokI0qDtUWTcFL2CObaB4e6cQq0wMs4pDqCcH+o5doJSFT
         vFNyRl4SS/PCni3LqTTPlsjiRG6H0yExQJtvROhJjO+ODsPp7FcMZMNTUONnclFrr4qG
         2Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NI7fG+Iz42tCTRW4FnFZEbmA6acgFeQJ4sXoAsYOays=;
        b=TwQ0cDzplJFdzhghXDNZc2NEgqqy1UT7AssQF73mNBnu5BrNiMXFweHSFvIo5tYrqn
         pDkn7DdVDWxL3x9PZanxmLAnt/lpmmCmhw64DQOyo8di/aMa2+w9CYB/17twDH/i4j+E
         bEPxwJHPwXkMuYMSCylE9YoE3x2b/l/P+4rN7lUN+qrCHRpKNi+UYhQN1fiyeSg0TE90
         j5c1sYVblCKbwQVcMlJH3n8vrzJuX0+nXys0CxkHukc2hsvKhwUsNlBPppQKQD+0+vOj
         gVAYtTD+SbT14M91lg02HYUasDV8A+BEEh+gXcD8XIHx47MGs3j6AHczHjA/zbWXmu42
         IQrA==
X-Gm-Message-State: AOAM533KWVvWugZXZbqivdCXXTmchREVPgF+fdMCoK8AOFzkL9qT3WrF
        9UKnxGP5cu1S9p1Y7Pt7Nq/0NyRGWpNPj3Es4nOORg==
X-Google-Smtp-Source: ABdhPJw13Z70zQiULTMByvvk76vtGj/6H/7RaAlGaSiPA1JN5oUYA3Uxd1gKghjbNVX4S49IhfOKd1J6WUKFBD1aB8o=
X-Received: by 2002:a5d:570c:: with SMTP id a12mr1526197wrv.354.1621279974949;
 Mon, 17 May 2021 12:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com> <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local> <503d101d-7273-757a-2809-e272db93c45d@suse.de>
In-Reply-To: <503d101d-7273-757a-2809-e272db93c45d@suse.de>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Mon, 17 May 2021 20:32:43 +0100
Message-ID: <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, 17 May 2021 at 20:12, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> > We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> > think G as in General, not Graphisc.
>
> I hope this was a joke.
>
> Just some thoughts:
>
> AFAICT AI first came as an application of GPUs, but has now
> evolved/specialized into something of its own. I can imagine sharing
> some code among the various subsystems, say GEM/TTM internals for memory
> management. Besides that there's probably little that can be shared in
> the userspace interfaces. A GPU is device that puts an image onto the
> screen and an AI accelerator isn't.

But it isn't. A GPU is a device that has a kernel-arbitrated MMU
hosting kernel-managed buffers, executes user-supplied compiled
programs with reference to those buffers and other jobs, and informs
the kernel about progress.

KMS lies under the same third-level directory, but even when GPU and
display are on the same die, they're totally different IP blocks
developed on different schedules which are just periodically glued
together.

> Treating both as the same, even if
> they share similar chip architectures, seems like a stretch. They might
> evolve in different directions and fit less and less under the same
> umbrella.

Why not? All we have in common in GPU land right now is MMU + buffer
references + job scheduling + synchronisation. None of this has common
top-level API, or even a common top-level model. It's not just ISA
differences, but we have very old-school devices where the kernel
needs to register fill on every job, living next to middle-age devices
where the kernel and userspace co-operate to fill a ring buffer,
living next to modern devices where userspace does some stuff and then
the hardware makes it happen with the bare minimum of kernel
awareness.

Honestly I think there's more difference between lima and amdgpu then
there is between amdgpu and current NN/ML devices.

Cheers,
Daniel
