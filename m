Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3122EC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 01:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1907F61073
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 01:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbhJ0BSM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237323AbhJ0BSL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 21:18:11 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9284CC061745
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 18:15:46 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 83so1260408pgc.8
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 18:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FOM1t1mdsB+vMIZOqpURx1Aj73if+RCOkMBAhH7ofr8=;
        b=nYQoGCN+iMpFRaTFW/grBCxnwnU7DV72AjYMkfoswZBVwu4VoaMY2zac0p8Uq8mBle
         WYimfrc0mfs9ZHRINzzZM0Yj9Gj35y4ZxRKc2sZaUOw3KfxpnimTiG1aQ6bhc/LK2S7K
         FvOA6hhPr6qgJ8JnXNmXjcit75eqhMPhsiUlEZJn99y+MvC2umdaX1kcQnbgCjP+x+tD
         xu8tEHfou40vzxdTihhE70AUBygBz0M/0fOeb81G34DPNL5ia9hZlFcTTSV5xPXx6fHX
         uxyXCdrpvq7/gSLTwzoGRs6fxeHnYkOIQ5q2bao/Gjt2TXmZF218tmO7U97GRy6Y2DbX
         UWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FOM1t1mdsB+vMIZOqpURx1Aj73if+RCOkMBAhH7ofr8=;
        b=VIOBGL7ZpVW/5tudYKj0k08xVaEnl3bvYyVjSQBMzowY4guMSdkZURRjkLdeARw7i7
         SDlscyOZ/AsV+MZl4+Mw/jQRhLBNnOWvJj4joqMecZ5JY+2bcNrqT4YJvBGst/NwOx7O
         8W2IZV11Q6b6mop+kGw0mFIENpWos5JPGXy1M1EDLOmkJaSjK811KJVw88oAq5KEmOlP
         lSRWVj7jyMtadG4nB0/9i8ee3KoIp5I8mrEwZR7EI3CT/Yp3i/bG4TTbVcsAEgFR5SbM
         OSN3XFYO8B78xYnAIPv9vuHtgh0LXDYnAn3vooyh3sNEblL9BitNx/tDXH5lyJEfpNZI
         3fQQ==
X-Gm-Message-State: AOAM5309MbIThb37V52Fzo41l3K8V+esJx4Ezs03+Els/ZhN0Omy8ZQk
        lsXzCzkOAO7pEHdENsyX38WzWrzMzoUnQTG/D4gAWQ==
X-Google-Smtp-Source: ABdhPJw3HM2ttj24uXzv1jjaRTP+7zt82rESebmzg2uoIpU0RY2pwWx5+jQ2AWdGwdXbHAUl+V/qgzntWNV8ms8J1rY=
X-Received: by 2002:aa7:8246:0:b0:44b:4870:1b09 with SMTP id
 e6-20020aa78246000000b0044b48701b09mr30086990pfn.82.1635297345864; Tue, 26
 Oct 2021 18:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211025200852.3002369-1-kaleshsingh@google.com>
 <20211025200852.3002369-8-kaleshsingh@google.com> <20211026214311.583c728d90d41778c38201dd@kernel.org>
 <CAC_TJvfQQCyuSZqjzC0fuAah84uLgHJv5T+WtR8=9h5fN9nrLA@mail.gmail.com>
 <20211026174420.0056bde2@gandalf.local.home> <CAC_TJveMumb=BkGL53d_rS08uQ35fz1B7cM9jp8eKoCz0MUG_Q@mail.gmail.com>
 <20211026202020.026e7907@rorschach.local.home>
In-Reply-To: <20211026202020.026e7907@rorschach.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Tue, 26 Oct 2021 18:15:34 -0700
Message-ID: <CAC_TJvf8areGd1rQMbJV4r+J6JP2-DWXBLQwKRZEOzNWL_rqrQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] tracing/selftests: Add tests for hist trigger
 expression parsing
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>, surenb@google.com,
        hridya@google.com, namhyung@kernel.org, kernel-team@android.com,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 26, 2021 at 5:20 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 26 Oct 2021 16:36:03 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > On my setup I without any of the changes applied (config hist triggers enabled):
> >
> > ./ftracetests
> >
> > # of passed:  41
> > # of failed:  40
> > # of unresolved:  0
> > # of untested:  0
> > # of unsupported:  32
> > # of xfailed:  0
> > # of undefined(test bug):  0
> >
> > Do all the tests pass for you, before any of the changes in this
> > series? Maybe some of the tests need updating?
>
> All my tests past, and I don't push any code if they fail.
>
> I'd like to understand why you have these failures. Are the test from
> the kernel you are testing?

The results are from the kernel before I apply any of the patches. I
am testing on an Android emulator (cuttlefish) with 5.15.0-rc6 kernel.
The tests clearly work so it must be something on my end. I'll
investigate and get back to you.

Thanks,
Kalesh

>
> -- Steve
