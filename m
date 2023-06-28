Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BF7EB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jun 2023 11:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjF1LgT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jun 2023 07:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjF1LgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jun 2023 07:36:18 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E902D62
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 04:36:17 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-635ee3baa14so13594816d6.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687952176; x=1690544176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=skyq5jJecX8gUzH/HELKhPjfwUeihuLQSPsIi6eg0Xg=;
        b=nIS0UlARyFAuCW2qzN87wbOXLlUXoB5UUaCDASFT2QFcOUJ5dAClbAzVKhizUmxCjy
         mhVB/WHlMOZrDwgO0nOyfXLYxhb8Y6E3RT7IBLLMojQ7nsxzAdiOs95KTO1EuPEklMxR
         N21rifgjXEp9ZhY2ZwTzV9GjGBDmlVapq99mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687952176; x=1690544176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skyq5jJecX8gUzH/HELKhPjfwUeihuLQSPsIi6eg0Xg=;
        b=WavtPOzVRWfuclO1REWGNHNSUyAUJpsvfV7VfHGRcheSWw95m2eg9svvC0ObwXTCpG
         FxvwUfyru+QnTfslNXuFFt6ZV1J0I21Pfr0Jof7YzTIIaGDBon42Kc2mGQpmMnNrkyaF
         jSYuZvRQfEboikxvBRjaoV/3AfdqZYgxv9ZFqJKlMuiQJcUR72JV7sOcYSzqxTv9NdLr
         T3D7a5vTNHHBXQrnax9uoisOTo2SFcO0YbsWEpr7sk7uJ8uPNe0v6L+3f3MGZGhnydOs
         d+hc3WxMcB8Censwe8cWQhyvrFjejsoLJRMMPXvQhtnBMK0mOzImgRC5coCpt+NCx8sv
         ttQA==
X-Gm-Message-State: AC+VfDy/8YAVjSF8J5of42jg+OdEE4VlAxhTS5nUYfDfGr0JWCUWPXd6
        Ux8jOBPoe5bo6/PzcTOzZkKKWrODMuaROwj8FSpTRg==
X-Google-Smtp-Source: ACHHUZ4IEzaRbQ/s3KwUKBHlhNHcU2oq4JyVEiZ76CtPV3USf6RyD9Ofkc9Bwn5vmNG4dXhigMYn2A==
X-Received: by 2002:a05:6214:1cc5:b0:62d:e8a2:4d36 with SMTP id g5-20020a0562141cc500b0062de8a24d36mr39930277qvd.61.1687952176250;
        Wed, 28 Jun 2023 04:36:16 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id ne5-20020a056214424500b0062df126ca11sm2744749qvb.21.2023.06.28.04.36.15
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 04:36:15 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76547539775so449138985a.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 04:36:15 -0700 (PDT)
X-Received: by 2002:a05:6214:c63:b0:62b:6999:ab7b with SMTP id
 t3-20020a0562140c6300b0062b6999ab7bmr36306952qvj.16.1687952174945; Wed, 28
 Jun 2023 04:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230627120058.2214509-1-matteorizzo@google.com>
 <20230627120058.2214509-2-matteorizzo@google.com> <e8924389-985a-42ad-9daf-eca2bf12fa57@acm.org>
 <CAHKB1wJANtT27WM6hrhDy_x9H9Lsn4qRjPDmXdKosoL93TJRYg@mail.gmail.com>
In-Reply-To: <CAHKB1wJANtT27WM6hrhDy_x9H9Lsn4qRjPDmXdKosoL93TJRYg@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 28 Jun 2023 13:36:04 +0200
X-Gmail-Original-Message-ID: <CANiDSCvjCoj3Q3phbmdhdG-veHNRrfD-gBu=FuZkmrgJ2uxiJg@mail.gmail.com>
Message-ID: <CANiDSCvjCoj3Q3phbmdhdG-veHNRrfD-gBu=FuZkmrgJ2uxiJg@mail.gmail.com>
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

Hi Matteo

On Tue, 27 Jun 2023 at 20:15, Matteo Rizzo <matteorizzo@google.com> wrote:
>
> On Tue, 27 Jun 2023 at 19:10, Bart Van Assche <bvanassche@acm.org> wrote:
> > I'm using fio + io_uring all the time on Android devices. I think we need a
> > better solution than disabling io_uring system-wide, e.g. a mechanism based
> > on SELinux that disables io_uring for apps and that keeps io_uring enabled
> > for processes started via 'adb root && adb shell ...'
>
> Android already uses seccomp to prevent untrusted applications from using
> io_uring. This patch is aimed at server/desktop environments where there is
> no easy way to set a system-wide seccomp policy and right now the only way
> to disable io_uring system-wide is to compile it out of the kernel entirely
> (not really feasible for e.g. a general-purpose distro).
>
> I thought about adding a capability check that lets privileged processes
> bypass this sysctl, but it wasn't clear to me which capability I should use.
> For userfaultfd the kernel uses CAP_SYS_PTRACE, but I wasn't sure that's
> the best choice here since io_uring has nothing to do with ptrace.
> If anyone has any suggestions please let me know. A LSM hook also sounds
> like an option but it would be more complicated to implement and use.

Have you considered that the new sysctl is "sticky like kexec_load_disabled.
When the user disables it there is no way to turn it back on until the
system is rebooted.

Best regards!

-- 
Ricardo Ribalda
