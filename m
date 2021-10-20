Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC99AC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 14:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C68C861374
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 14:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhJTO52 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 10:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhJTO5Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 10:57:25 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0F7C06161C
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 07:55:10 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so699495pjl.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NT+VI0Pymfgi6KrPfEOh2aqPixHFbwmQSZYnbq0Cs8=;
        b=VgKpw9rBhIl9RgSTHOjvXPIBuB/3bKcIuicn3KbBJkWLJC9PScz/RQOUPKGAs2+Wf8
         Lmtc88UjoeFw2ZjzncYMNMq62hYATOHb9LamR82sNaVY6GWzAy4lCsslUBQWmONdEIp/
         um/E6qs9qGGSa55H8O5DjF4uSrQO8aGK4bxZOAqzO/QjnezVR0TDwKJ5qWq+CwSyFnuo
         qkg5qkl1ezQ0tW/XgDQnlouKgBz+uMIKnk4nNV6uMrA6AdMKI321FUFlufT4R5IU0LED
         xu2e61fNfS0wc6F0mGrAgYrISF4LHyvQmIbpAqIjNBo9gaxwPSnXpYXH9oqzKHyg+eJ4
         mEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NT+VI0Pymfgi6KrPfEOh2aqPixHFbwmQSZYnbq0Cs8=;
        b=BQHigJAzoAVlYh4Mc9oLkc6gRuZvjQR//QOyhN12T2wgEeK0tWqippeHFXclNPLHxv
         c2j/Dnmm8sesjvoCNEnCNpUERDdFzm1HjsWIIsh04ypuV03y0S4vOGm9dnIB0ek1guws
         tMiNzwbeHh9Gr7ZYn/7EuU4x3mTNYMwBp04xfRoisy7xhhagjmjuuC+MXKkEKEidGDgq
         9CPVg8Up77LkOcAq7vtuwz5Y3HiKbPHNVqd0tluE0ee/tWdMvMxuaxp1g4+CmxiVsaHv
         nFHC1+zJc0khPWBS4qpBQZWjjlafRAtpVEg3wcWSXCcm0YpFcaBpnzj1E8Af4jKpJe6a
         9hTw==
X-Gm-Message-State: AOAM533GgevJvcvKjCXEBthJYCCxHLF4phCGMVIhNdgjGXSCCweQ8QpM
        hEFCJgMOhy20d6lkItTv4rX/YcxhvhBsaYo2V+8heQ==
X-Google-Smtp-Source: ABdhPJy+/In60vXj7hn1ZIyupFzyRXUdajqsjYN/iP/ZUU37ATuNxBenskG9v8CQW0z7L7jYp7uAxxFe1aq9arYtWs8=
X-Received: by 2002:a17:903:18d:b0:13f:ada:9df4 with SMTP id
 z13-20020a170903018d00b0013f0ada9df4mr39582515plg.69.1634741710041; Wed, 20
 Oct 2021 07:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211020013153.4106001-1-kaleshsingh@google.com>
 <20211020013153.4106001-3-kaleshsingh@google.com> <20211019222756.1fde436b@gandalf.local.home>
In-Reply-To: <20211019222756.1fde436b@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Wed, 20 Oct 2021 07:54:59 -0700
Message-ID: <CAC_TJvcZ4ndpQpsj4ANj9LpzSu6GfPSdxpVc0XShbi9u_bSUyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] tracing: Add division and multiplication support
 for hist triggers
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 7:28 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 19 Oct 2021 18:31:39 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > +static u64 hist_field_div(struct hist_field *hist_field,
> > +                        struct tracing_map_elt *elt,
> > +                        struct trace_buffer *buffer,
> > +                        struct ring_buffer_event *rbe,
> > +                        void *event)
> > +{
> > +     struct hist_field *operand1 = hist_field->operands[0];
> > +     struct hist_field *operand2 = hist_field->operands[1];
> > +
> > +     u64 val1 = operand1->fn(operand1, elt, buffer, rbe, event);
> > +     u64 val2 = operand2->fn(operand2, elt, buffer, rbe, event);
> > +
> > +     /* Return -1 for the undefined case */
> > +     if (!val2)
> > +             return -1;
> > +
> > +     return div64_u64(val1, val2);
> > +}
> > +
>
> I wonder if you should add a shift operator as well?
>
> I mean, if for some reason you want to divide by a power of two, then why
> us the division. Especially if this is on a 32 bit machine.
>
> Of course, the parsing could detect that. If the divisor is a constant. Or
> we could even optimize the above with:
>
>         if (!val2)
>                 return -1;
>
>         if (!(val2 & (val2 - 1))
>                 return val1 >> __ffs64(val2);
>
> Which should be faster than a divide, and even if it isn't a power of two,
> the subtract and & should be in the noise compared to the divide.
>
> Note, the above can be added to this. I'm not suggesting changing this
> patch.

Is it worth adding something like this for the multiplication case as well?

- Kalesh

>
> -- Steve
