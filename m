Return-Path: <SRS0=kdU1=EL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C39C00A89
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 05:57:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D126E20825
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 05:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="es3AODzU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgKEF5V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Nov 2020 00:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEF5U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Nov 2020 00:57:20 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938AFC0613CF
        for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2020 21:57:20 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id n129so622432iod.5
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2020 21:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nlTE+5QXS18sXrL6D4KQC5d2Bo1EFlNxgmWgYZ7DFg0=;
        b=es3AODzU2iUwcMpdIoRei0G4xKF+9OIyQfwllwFlnnpZE/XGBckaMTNLqvyff3OMfh
         7fL5m4b7S5cqyUKDD2Sz636oDz0+VI4byMjn+0Juv9bMu4gAGckOrRbgjEEti1efFylk
         dM6xxdr7/56jwpUQjHYKF8577HHYmC9h5DaNkOdYgnUXso32u9Zyd/bDyzT4FIXZYSpR
         MyoSgTWB2GokYpPKlN6T73/VFFo/o4HXWCd61mxB3RafmWXJo40GECeT0ySAtWFxpR70
         PHoPq0QLbtHPOzkRAbufWD6odojj6Q9NWQAjeqILM2TRX8LZPXYPeAs7F9B8QGbV6DUq
         1Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nlTE+5QXS18sXrL6D4KQC5d2Bo1EFlNxgmWgYZ7DFg0=;
        b=JKfLBZoGRMZScIz8NtNBJ1i7l33QSnn+UHSJbIHPr+SJ4NYv6TbGLk7d7+1hVf3V4T
         8bsy9u3M+FNNiS5HzJR6+G5LzA5tXM7XEzov9XCqlmgoAIcQ4Y0B7X6eqM+ZRPH5yHY/
         bCX75sc8Xi8FcMrEQdB1yVr5demAic4HMri9NR5NZO2Y2RkRm6wHXpCNTb8kyZPdhyad
         5XJKu0XRBdDjLXAgmRIYr9LQ61Jnq81xpWjvzrvQol/BPrroVwEnIJZwQUlp4+9F2z2n
         oZ+PtwxxRZFX89u8x53Uq5Zau5/L8TzZ1XOV3m5qta4LyqNlp+iVQcAmggCi6StUp9ZD
         ib2w==
X-Gm-Message-State: AOAM532aRV31wjMn2xgJfxl0iskLj3piHCUzheKU6IH/+sgPjA7VS+Q4
        YEvGxc/bzJXxVlRFmfiHKxytNUwA6Yem/AJFc/bOJQ==
X-Google-Smtp-Source: ABdhPJxmVYMswfSGq3abwHWr8OWtR+XmTNccSp+mhngdMAcZJpwmHM1rpLcO04y2HGg5FimcvElwEHdVqk+r1UwxiTg=
X-Received: by 2002:a02:c952:: with SMTP id u18mr817380jao.139.1604555839634;
 Wed, 04 Nov 2020 21:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20201030172731.1.I7782b0cedb705384a634cfd8898eb7523562da99@changeid>
 <20201031130546.d2b94345008e807f548dc068@linux-foundation.org>
In-Reply-To: <20201031130546.d2b94345008e807f548dc068@linux-foundation.org>
From:   "Anand K. Mistry" <amistry@google.com>
Date:   Thu, 5 Nov 2020 16:57:08 +1100
Message-ID: <CAATStaNeQAQgzwCwENJwSEQ40x0aTaBvSnoi860MVSL9wBw8fQ@mail.gmail.com>
Subject: Re: [PATCH] proc: Provide details on indirect branch speculation
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-fsdevel@vger.kernel.org,
        Anthony Steinhauser <asteinhauser@google.com>,
        Joel Fernandes <joelaf@google.com>, tglx@linutronix.de,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, NeilBrown <neilb@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 1 Nov 2020 at 07:05, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Fri, 30 Oct 2020 17:27:54 +1100 Anand K Mistry <amistry@google.com> wrote:
>
> > Similar to speculation store bypass, show information about the indirect
> > branch speculation mode of a task in /proc/$pid/status.
>
> Why is this considered useful?

For testing/benchmarking, I needed to see whether IB (Indirect Branch)
speculation (see Spectre-v2) is enabled on a task, to see whether an
IBPB instruction should be executed on an address space switch.
Unfortunately, this information isn't available anywhere else and
currently the only way to get it is to hack the kernel to expose it
(like this change). It also helped expose a bug with conditional IB
speculation on certain CPUs.

Another place this could be useful is to audit the system when using
sanboxing. With this change, I can confirm that seccomp-enabled
process have IB speculation force disabled as expected when the kernel
command line parameter `spectre_v2_user=seccomp`.

Since there's already a 'Speculation_Store_Bypass' field, I used that
as precedence for adding this one.

-- 
Anand K. Mistry
Software Engineer
Google Australia
