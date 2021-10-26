Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DF9C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 23:39:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8510360F56
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 23:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbhJZXlu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 19:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235398AbhJZXlt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 19:41:49 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CEDC061745
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 16:39:25 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id v10so59506pjr.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 16:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UGc8wLx9Y9uYc1sV+rqKsRejtsRqKlqZmOxOwdL9dxo=;
        b=lgak8A5JAimuhKaibtc98+IZJupYTHZrci4KeklKbTahRGCywHv/kh8spzrzks3Ooa
         4kzviyAyUN30XjNWTMniYD6ih/SqpaSMNLQvaeV9p67QG3C85mEimzInwQ05N7bTrp0H
         rzfAhb1xGIZUS6zH5aePLgh6GholdaqTq1NhMvZyWaDsky9Itxn29QRavydkGf9S4kap
         uVxLTLJGrX3vnCrnPa3IxRGjorSjJGA6pSQ7njDn4munlyhfqS8BNwRCXAwmQCQ4AlgG
         kRYlI4hyqIyCRWl2+HhbEbncIWQrGrH83LsQfvEykfHOVARGERXHzpyB+iv0aNBSwU9Y
         mY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UGc8wLx9Y9uYc1sV+rqKsRejtsRqKlqZmOxOwdL9dxo=;
        b=l0nCNTNDUocfZsimnxGQ+F6YGr8oa9G0lSCslqNPvaNf3vtaJAslQpgzNv9lJhxKkp
         lM6B+0k1sIzLTMf+ofEs7JOrvOQ3yhjehHREX2T3jWqW2w1VE6m6JEH053DmsTOCEw1z
         lZjXL7PWA2lh2sReKNo7E5lnPhjtTQsK5J7Sq1qFa43NVchcKXvVdaE9GShUYgsYaJ+N
         4cAqAjkdKR3j8v593cbKFKw1CqxNBOxhLg2tXRvzpb7vgUynhISCFbO+JKTJVtvAQ5fk
         YaTCgdi8q64D46yImjNqlVyH+M27OS8rtZFQCORaAnVnA2xmKiTK0cYqD+aPP3HM6U6g
         iUAw==
X-Gm-Message-State: AOAM531FRJ9TZoC2n460IJtH/X3Y2kNc5pxZKXUSGAKd4ID7wZegiJ0D
        SDpWsdDC3ePD4QUtgLi/bZLBrdBqz01lNl9MqsdYiA==
X-Google-Smtp-Source: ABdhPJzeAmpt6HrgmDoiSxmoSMQGtLPDR45n0ttxg8f33uar4tiH2S9UcjbIbifjly/2KDpzcF4Fp20BBPVzc7588+0=
X-Received: by 2002:a17:903:183:b0:140:47c1:1f2e with SMTP id
 z3-20020a170903018300b0014047c11f2emr17151977plg.69.1635291564597; Tue, 26
 Oct 2021 16:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211025200852.3002369-1-kaleshsingh@google.com>
 <20211025200852.3002369-7-kaleshsingh@google.com> <20211026151451.7f3e09a4@gandalf.local.home>
In-Reply-To: <20211026151451.7f3e09a4@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Tue, 26 Oct 2021 16:39:13 -0700
Message-ID: <CAC_TJveHgsPZw7p7BWOgQw6h8GNU_Pv_WUjNmw3AUq+wnSzk6Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] tracing/histogram: Optimize division by a power of 2
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     surenb@google.com, hridya@google.com, namhyung@kernel.org,
        kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 26, 2021 at 12:14 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 25 Oct 2021 13:08:38 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > == Results ==
> >
> > Divisor is a power of 2 (divisor == 32):
> >
> >    test_hist_field_div_not_optimized  | 8,717,091 cpu-cycles
> >    test_hist_field_div_optimized      | 1,643,137 cpu-cycles
> >
> > If the divisor is a power of 2, the optimized version is ~5.3x faster.
> >
> > Divisor is not a power of 2 (divisor == 33):
> >
> >    test_hist_field_div_not_optimized  | 4,444,324 cpu-cycles
> >    test_hist_field_div_optimized      | 5,497,958 cpu-cycles
>
> To optimize this even more, if the divisor is constant, we could make a
> separate function to not do the branch, and just shift or divide.

Ack. I can update to use separate functions for the constant divisors.

>
> And even if it is not a power of 2, for constants, we could implement a
> multiplication and shift, and guarantee an accuracy up to a defined max.
>
>
> If div is a constant, then we can calculate the mult and shift, and max
> dividend. Let's use 20 for shift.
>
>         // This works best for small divisors
>         if (div > max_div) {
>                 // only do a real division
>                 return;
>         }
>         shift = 20;
>         mult = ((1 << shift) + div - 1) / div;
>         delta = mult * div - (1 << shift);
>         if (!delta) {
>                 /* div is a power of 2 */
>                 max = -1;
>                 return;
>         }
>         max = (1 << shift) / delta;

I'm still trying to digest the above algorithm. But doesn't this add 2
extra divisions? What am I missing here?

Thanks,
Kalesh

>
> We would of course need to use 64 bit operations (maybe only do this for 64
> bit machines). And perhaps even use bigger shift values to get a bigger max.
>
> Then we could do:
>
>         if (val1 < max)
>                 return (val1 * mult) >> shift;
>
> -- Steve
