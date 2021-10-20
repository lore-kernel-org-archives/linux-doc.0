Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B176C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 15:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6485261359
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 15:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhJTPIw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 11:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhJTPIw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 11:08:52 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E3DC06174E
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 08:06:37 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c29so3221860pfp.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 08:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tA5LDMLmQNAk4mwbdEDR73f2u+dlkeGRsK+VXTs6ThI=;
        b=qw0BgtZf/0TzG5SWIZCjab5Al2kESh2kxIpGfkr6TDKXJZU6o/MsqgiR7dsR84o5CD
         zNojPvHgJOdIPYTtXIczvYFyhqVQsH0cpLBzqOEa2AB+UeC2GyoYaabJ/xohhIendpuC
         +diUEFPxJMiNRN+OZrTkpY0as7zQcor4Cz4dKD2hYCR1oUbUE5z5wKzNLgjbNLBSD9Qs
         gLKdzvEwnevqbfqOReLyXugBaxsi3q4ie4OGwhOWF15zfHLaIOaeWaIk2cAMA89ju1Dr
         2Gg+lu0sOyewXKe/TWhFIwBHcaSzsu4gLVqlLA2HUptThhmpgsMx3evpjdII3cW4jvu1
         19Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tA5LDMLmQNAk4mwbdEDR73f2u+dlkeGRsK+VXTs6ThI=;
        b=zIg2PG5IjmOZowpEmBKE/2uy/kwC/oMdOt7CjVU38NiaZh360RvSe//PjXqmoFtHwc
         y5oqCP0t9+xKfXHwcE3r+h5lYztAevCvtd5qqpwThL9UQ+DYcuYWJJvbfxluIa5QYwZb
         fL25ZIjECAERbRJg737e6iItxVKEqJ4SEOMRngeFIOoknsxHs7mQfVaRgmlRcgqpa7E+
         exrYnDCKs9nlgNW7Y1p3Zh08g/ORgK6bCU+lWyWkQu2RWtTXsPlr8QI9JGP50aNp3K/s
         N3JuSA1UQx20AO2G3EHkZ5nvHGQ5vSZphbyx3UmsklDddRRTnlFW18LPFrueX9DI/SLf
         AXkA==
X-Gm-Message-State: AOAM533oJiW4fPPspE5PSqgYeBE+ejNMfNS1j6GgWWbLdMDI8fOSOId2
        fO3M3elHcdCRhpeD+0U5+rt5LfmRHPyGK3choxP3Lw==
X-Google-Smtp-Source: ABdhPJx2ufcue5ufHjxLV9BXDHmvvqB9AgktcirsLSNc4Zb83OhPq/SFmJcQhb4c46ewzF3bn9I+pN4OZXyqUA0BkcM=
X-Received: by 2002:a05:6a00:17a6:b0:44d:df1f:5626 with SMTP id
 s38-20020a056a0017a600b0044ddf1f5626mr274186pfg.59.1634742396800; Wed, 20 Oct
 2021 08:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211020013153.4106001-1-kaleshsingh@google.com>
 <20211020013153.4106001-4-kaleshsingh@google.com> <20211020102807.0b07bc81@gandalf.local.home>
In-Reply-To: <20211020102807.0b07bc81@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Wed, 20 Oct 2021 08:06:26 -0700
Message-ID: <CAC_TJvfQCjZPS50-k2Pxo0jCcfxQ7oa1MZxQdADyjnwQ_TBzRA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] tracing: Fix operator precedence for hist triggers expression
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

On Wed, Oct 20, 2021 at 7:28 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 19 Oct 2021 18:31:40 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > +     minus_op = strrchr(str, '-');
> > +     if (minus_op) {
> > +             /* Unfortunately, the modifier ".sym-offset" can confuse things. */
> > +             if (minus_op - str >= 4 && !strncmp(minus_op - 4, ".sym-offset", 11))
> > +                     goto out;
> >
>
> I was thinking about this, and perhaps we can add this later, but we could
> just replace all ".sym-offset" with ".symXoffset" after receiving it from
> the user. Then it won't be an issue during prasing.

That's a good idea. It would clean things up a bit and avoid bailing
out if the user has a sym-offest in an expression string. I can send a
separate patch for this.

>
> -- Steve
