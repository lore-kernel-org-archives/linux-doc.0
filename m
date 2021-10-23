Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC55C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 23 Oct 2021 07:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29A776101D
	for <linux-doc@archiver.kernel.org>; Sat, 23 Oct 2021 07:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhJWHDv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Oct 2021 03:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhJWHDt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Oct 2021 03:03:49 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7633EC061764
        for <linux-doc@vger.kernel.org>; Sat, 23 Oct 2021 00:01:31 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id z126so7889504oiz.12
        for <linux-doc@vger.kernel.org>; Sat, 23 Oct 2021 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3XNK8/G5+03RpD0j7S3Gnth3OiCNUfmJqhs9h8ooGSo=;
        b=OhhKJKYrQv2NReaxw4cm/Scx8uvk7T8c/UtJ4+TgQyHQwehrzn0IEa7aZ3IuOFY5KV
         htMmxSTP6og8HYaIgwEpCpEAyeLrvZ0yfSEo1YW7Ps25tC3+Ft3FslUZPYZb2Jq8QwcD
         /x5zpO4OkHKtILpME0y9/K0r8EjZf3s5Uf5zzn7WD7NoYLC1t8ksECAKHvVL/pl43j/i
         m7B8SxNuvXpSdJ7J0hkGK32jGUCSkgDaYM+ONY4QV5X5mlIHgCogFwGMUKBxaS27W1yX
         87hicmmVrqENF/YZbp7jiBMJodinxWOqDmDx+sQ9tHz5L827wHilSzAAPAwSaTA9N761
         0zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3XNK8/G5+03RpD0j7S3Gnth3OiCNUfmJqhs9h8ooGSo=;
        b=pthpXGrCHNDC/K2nLoFkj8ltq6dKAGH9CE4be4JwoZECWjIrRPSRG5Fgv3WLWizK+m
         Buwa/1O2oX0imVIaFIJ5wlauOgXLUKosGjFvk0AOxm47xtExdy/P3LDnBRdVD3Qb726t
         4RmOaHRXYtQyaH0Y2vCPLi3RnAZT9XjrJhq58Pw236gjh8Qq36BNWidRF8Ug4nDvtQI0
         EZQMaLaiQXJhkBeQ+5ZGWLQQ4sJffwKnodoVEOXxSVsObIrtrmi8G36fmMTfyT0bfvTH
         ohIR+tJc1ujTwvUMwD4CZrrR260EnEKWks4ZjaQUTBmotrD/I6J1LAc3muNMij+9pMvQ
         FzAQ==
X-Gm-Message-State: AOAM533AEx9r3seQS5rkUXTAqC54fWJHepWCerIL64ig2p6VhWlFkTpg
        AsxXUG2rE+oPNEiHrr6hJLAE8XwO0c/b3DU8CO8Uew==
X-Google-Smtp-Source: ABdhPJwqjlmr9J6papGjZZdJkxgKQ8pcBdronrFAgFi4Gj7VPd8fHvjCUvJ/r3u7L7WJiohVGJLwV8tiuzu5W95dT6E=
X-Received: by 2002:a05:6808:d50:: with SMTP id w16mr13922075oik.128.1634972490639;
 Sat, 23 Oct 2021 00:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210927173348.265501-1-info@alexander-lochmann.de>
 <YVQkzCryS9dkvRGB@hirez.programming.kicks-ass.net> <927385c7-0155-22b0-c2f3-7776b6fe374c@alexander-lochmann.de>
In-Reply-To: <927385c7-0155-22b0-c2f3-7776b6fe374c@alexander-lochmann.de>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 23 Oct 2021 09:01:19 +0200
Message-ID: <CACT4Y+aH5dZTSw7+59GTDQyikP6CqXCD7AAhjciaS_MQSbrV6A@mail.gmail.com>
Subject: Re: [PATCHv2] Introduced new tracing mode KCOV_MODE_UNIQUE.
To:     Alexander Lochmann <info@alexander-lochmann.de>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Ingo Molnar <mingo@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Aleksandr Nogikh <nogikh@google.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 23 Oct 2021 at 00:03, Alexander Lochmann
<info@alexander-lochmann.de> wrote:
>
> Maybe Dmitry can shed some light on this. He actually suggested that
> optimization.
>
> - Alex
>
> On 29.09.21 10:33, Peter Zijlstra wrote:
> > On Mon, Sep 27, 2021 at 07:33:40PM +0200, Alexander Lochmann wrote:
> >> The existing trace mode stores PCs in execution order. This could lead
> >> to a buffer overflow if sufficient amonut of kernel code is executed.
> >> Thus, a user might not see all executed PCs. KCOV_MODE_UNIQUE favors
> >> completeness over execution order. While ignoring the execution order,
> >> it marks a PC as exectued by setting a bit representing that PC. Each
> >> bit in the shared buffer represents every fourth byte of the text
> >> segment.  Since a call instruction on every supported architecture is
> >> at least four bytes, it is safe to just store every fourth byte of the
> >> text segment.
> >
> > I'm still trying to wake up, but why are call instruction more important
> > than other instructions? Specifically, I'd think any branch instruction
> > matters for coverage.,
> >
> > More specifically, x86 can do a tail call with just 2 bytes.

Hi Peter, Alex,

The calls are important here because we only use PCs that are return
PCs from a callback emitted by the compiler. These PCs point to the
call of the callback.

I don't remember exactly what's the story for tail calls of the
callback for both compilers, ideally they should not use tail calls
for this call, and I think at least one of them does not use tail
calls.

But even with tail calls, the callback is emitted into every basic
block of code. So it should be (call, some other instructions, call)
and at least the first call is not a tail call.
