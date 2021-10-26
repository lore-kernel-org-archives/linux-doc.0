Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43F2C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 23:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA07F61002
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 23:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240320AbhJZXik (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 19:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234584AbhJZXij (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 19:38:39 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171A9C061570
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 16:36:15 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 83so1064638pgc.8
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8d3uWZxdzrBP+vl4m4KBl847bLF2nEq/HOn/R3ceq4w=;
        b=Q5NrgZhN893Ji62/KpmU/s0XihJoVAvCozwZOXxNA4AKKViVxUf+8II1xWXtP15i8d
         m/fNJct7ZYeWG58YA7zBxktPNBkec4UanJR5DkRKzhaR7p20AurOtNWSb/6uFc70+zEr
         lQCmhKaQFpOZTA6eGph8FeUYie1nxSyTAiLUTe+MMiP42Q80EcSSXWz3sSiJQN5CQHrW
         IdYNPLvRxvN2NllMXSACf0aB2tFPRv5QbwkLGfaz9q/0QP4fFamyMFcSJ0zcV3ivAFig
         WR8riosRBoWk0urCGnzlaeeEpw3UKDMEwdCJ5A1VmVJTqBVwpgUtiKlfHzAAhELhvHAj
         TbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8d3uWZxdzrBP+vl4m4KBl847bLF2nEq/HOn/R3ceq4w=;
        b=rI/oJVfYEh0bfIi6ne4ONI2UhiReP1a/IfbVO1qoNl1qd6FiMnmrg33Lch++3SaadQ
         rCVy3pDTMV50PNSpw8Nc/pm7wucFrONkLAMsCjwos0CZla8SB4QHkit64vH/s+N52qma
         usqZV+c3nLnCw+3GQTWfa1XMTQLD9JlcbO4onY+jeUkFe+MEuGeRssPJE5YsCLNbRRYN
         Asdqkjd2nvWyvg60OMXUKoYiRGVlTFCZVas0e1zx8AsHhzsUNHtAxnITWvL/7O63JT4c
         ouTo/bc6usCy9JYlRtlQAsXGBsBlCCGI6nfuGK5DjBHbEEmTHj9U7nhavzoPz7Re/Bj0
         iGJg==
X-Gm-Message-State: AOAM531ziTxiNeqdz/HmCnmmX+lXkH39OSH9dQ2TV0snmoYR/6pVrevL
        ElZhTYCrIipSnxBI9dlDnzFe6kB8FYC9vKgZLhrx6Q==
X-Google-Smtp-Source: ABdhPJw9UniSPiWvgzo1wCS2HEoxo1G7FE93fhG5GNjDmDm0dk4ZhL9/ul4eF2JYrMPDF/5k1zAn2lyu2xBglACK8IU=
X-Received: by 2002:aa7:8246:0:b0:44b:4870:1b09 with SMTP id
 e6-20020aa78246000000b0044b48701b09mr29659821pfn.82.1635291374309; Tue, 26
 Oct 2021 16:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211025200852.3002369-1-kaleshsingh@google.com>
 <20211025200852.3002369-8-kaleshsingh@google.com> <20211026214311.583c728d90d41778c38201dd@kernel.org>
 <CAC_TJvfQQCyuSZqjzC0fuAah84uLgHJv5T+WtR8=9h5fN9nrLA@mail.gmail.com> <20211026174420.0056bde2@gandalf.local.home>
In-Reply-To: <20211026174420.0056bde2@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Tue, 26 Oct 2021 16:36:03 -0700
Message-ID: <CAC_TJveMumb=BkGL53d_rS08uQ35fz1B7cM9jp8eKoCz0MUG_Q@mail.gmail.com>
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

On Tue, Oct 26, 2021 at 2:44 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 26 Oct 2021 07:28:39 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > > If this update has any meaning, please make a separate patch for this part.
> >
> > Hi Masami,
> >
> > Thanks for the feedback. The above change is to ensure we remove
> > triggers in the reverse order that we created them - important when
> > one trigger depends on another. I can split it out into a separate
> > patch and will add a README pattern check to the requires tag for
> > these tests.
>
> Also make sure to run all the ftracetests. When I ran it with this update,
> most of the other histogram tests failed. Even with your patches applied to
> the running kernel.

Hi Steve,

On my setup I without any of the changes applied (config hist triggers enabled):

./ftracetests

# of passed:  41
# of failed:  40
# of unresolved:  0
# of untested:  0
# of unsupported:  32
# of xfailed:  0
# of undefined(test bug):  0

Do all the tests pass for you, before any of the changes in this
series? Maybe some of the tests need updating?

- Kalesh

>
> -- Steve
