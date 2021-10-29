Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82357C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 29 Oct 2021 22:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66CDC61056
	for <linux-doc@archiver.kernel.org>; Fri, 29 Oct 2021 22:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhJ2WeV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Oct 2021 18:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2WeV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Oct 2021 18:34:21 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50670C061570
        for <linux-doc@vger.kernel.org>; Fri, 29 Oct 2021 15:31:52 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id l203so10473655pfd.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Oct 2021 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qp6+zjDSd4OOLDe8/BIO29FCy7h5ITgGaqmhvNYsKr8=;
        b=Mv2KXcJNajDF1a5vJiq3Uxo93jSk5UbONlTJlUsFvFkeV3GHwlpi6nzXdgiw8k1L7Q
         Zu+iQ27x4FVnK6Fv5/UuCT7td78f5pK1rdcxZvrMWM1Ft4YQprljfaCJxnyARaijLNry
         ZHH/IOhPaZLk/FAGM8bpNyTZC77eObvLOmHW3QgMJe4OzWEdcefxVaRLckV6qI/jg6mk
         mQLpuor4gB8wvoKBenRn46kuhRE2RC0sLvJND3p41Qoihcp/MVwBfUly64thvbr83lZR
         /nHORyWnTMwMbMNXUUomU26GJyneswDebjRc8nJwtU64yvDvhb0a9KdtwfFSkVltLfSU
         E1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qp6+zjDSd4OOLDe8/BIO29FCy7h5ITgGaqmhvNYsKr8=;
        b=X4VZ1Wl+tWFnT96M4M9xEoyaumtfWoTZs4xrnNHcFKLtxXguD5SiildztAAzruFXxd
         4axfCmG3FpacvTlp/g+nU9tSH+l1qDZhPJx7KCyC5nF66Zk78T12//OO/QIEAotSlYqm
         aVeF2mcc/N/88PtIvF0zEeureFVvXFrKAvfCAGvfmeAxkpOlt6gAGHpWnf9a1Lat9gHr
         JELO4YSIZ73Zh2gQACVKWs4zVLDdcSYUokneZ2xRz2fW7zJxwTHAozlfJbVfaB0iQdsf
         XjN0m5XGOixp0rq+vO2cdjWbJkSL5sXUNmRakQW8ZfwGEEObxZz1O25DH9/nAtZiZye8
         YEFg==
X-Gm-Message-State: AOAM5332tzIf60Ki2yZhRUqW4v2SKcPrmjHuwLAlGjcLV8uW81B/ZEvp
        xaLeTXKcDt+msH2L1ahtB+avN48FLsNDEi6i9nRnXg==
X-Google-Smtp-Source: ABdhPJwVJl6dXdrnjKqah8Re2vFUHtSVD8OCuKxa6TJxFQVkBKSdRQWe3/98ZbQ/w5Bx/AgA+O1LxzcEyqWt7sAUShs=
X-Received: by 2002:a62:7858:0:b0:47c:1cf3:d95 with SMTP id
 t85-20020a627858000000b0047c1cf30d95mr13882255pfc.60.1635546711320; Fri, 29
 Oct 2021 15:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183339.3216491-1-kaleshsingh@google.com>
 <20211029183339.3216491-2-kaleshsingh@google.com> <20211029144524.367d6789@gandalf.local.home>
 <CAC_TJve9OsL5taBN0ckgjG4=HxvmWfP6ULwwqnVsDyRxuQuRkg@mail.gmail.com> <20211029162549.2c22f2dd@gandalf.local.home>
In-Reply-To: <20211029162549.2c22f2dd@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Fri, 29 Oct 2021 15:31:40 -0700
Message-ID: <CAC_TJvfazjdZ=4Y_1YX=R+drsWKRu+faztcFjKEkkD_3Qk6_Xg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] tracing/histogram: Optimize division by constants
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     surenb@google.com, hridya@google.com, namhyung@kernel.org,
        kernel-team@android.com, mhiramat@kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 29, 2021 at 1:25 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 29 Oct 2021 11:53:16 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > > If these functions are only called when val2 is constant, can't we make it
> > > such that we get val2 from the hist_field directly? That is:
> > >
> > >         u64 val2 = operand2->constant;
> >
> > operand2 might be a var ref to a constant, so we would need to resolve
> > that with hist_field_var_ref().
>
> So can a var_ref change? If not, then we should convert that to a constant
> for this operation.

A var ref to a constant won't change. I think we can just copy the
constant value to the var ref's hist field and then we'll be able to
get it from there instead of calling the fn() function. I'll post
another version with this.

Thanks,
Kalesh

>
> -- Steve
