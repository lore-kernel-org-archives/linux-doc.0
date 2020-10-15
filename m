Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47585C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 09:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D179322243
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 09:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RddR1mJz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgJOJ1r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Oct 2020 05:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbgJOJ1r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Oct 2020 05:27:47 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164C8C061755
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 02:27:47 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id l16so3277941ilj.9
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U/oWxjxOfWlAIEhqMrrUligmtkGSiaLafGJiqZMoZ+A=;
        b=RddR1mJzacpz//w0bbpREDVk2eN/vNgniNb6ER0bp7XU7rzMAGfibxLc8KB+4j3HgM
         VxyYVpeJhgZOKcY0ck8LDt6tJeKzoIA94Hd8AKYNqZT+edFGr1QkFWLwtRcZtYD7c1bR
         qAOadY/5erawCDQQ6KuuFjyTJkKCObwnTNJJXS/jEr+gDKIywgWypFwcnyK7dPNJcQ2r
         9bE8icpeivGjjlj0wsJ2OsgYsbBESIRVaSt9rfmGq8V+cvo23lVYsXIDVHwvMo3G4SOP
         5Tt++WXzi+2GdCwWS4bk+Ku5SyYY4gALETMT5xiWsEmDCJjIxrvSfZhkly8S+YSTG6gM
         3Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U/oWxjxOfWlAIEhqMrrUligmtkGSiaLafGJiqZMoZ+A=;
        b=oG4Vr6bxppo619jdxMPmnpHFC9YbiBgywY04xdLsyU9cySgXvckIl9ZGzPNATjaw+T
         8DG6+ZGoqL7JfpweHAO/m9JfKWkJay+RAUf1HZnGOlPXZCo1Tlk0s+khdELGypK9RD6y
         KjkBtquJ++EW8hiP0xm/qxvDLXGX2iYhMGd9KZcmKvbOTqPv0XORj38j0YgM14o3IV8D
         87mWghqStMF1nOABYwuW8P9WifSZw1/lwjnNpcfAerx/q+7F1BzHHvWd+8xYMHfkwosK
         LeZIotYXhIFNi4jVCqAgZZPW6Uw8Y6wbV5lNRVX36IVJrvtHwdmU7hVjuQsgJsDJlNWz
         vo2Q==
X-Gm-Message-State: AOAM530W2sA6rPiDz1fuMc3swhpvligumjpl2HG4HJXFu1BEUsFkdyau
        U1t32HD4GFzc9vbYYNpUnb8DW91stx/zyh+sQCACkw==
X-Google-Smtp-Source: ABdhPJzuNZ0EsyUKZ4jMeEV+MX1ryS5DfGZLElWyD4suz6V11o4XlTjjxwTv/CKJxtg/UqmVK5HZyB7EdzngW1pF0s4=
X-Received: by 2002:a05:6e02:5ad:: with SMTP id k13mr2483422ils.71.1602754066287;
 Thu, 15 Oct 2020 02:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202650.2530280-1-keescook@chromium.org> <20200928202650.2530280-3-keescook@chromium.org>
In-Reply-To: <20200928202650.2530280-3-keescook@chromium.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 15 Oct 2020 14:57:34 +0530
Message-ID: <CA+G9fYtqqzWtb65pk8J=-Afv0KZ9iy3_bA-WmiJjbe5Y6qXbAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] selftests/run_kselftest.sh: Make each test
 individually selectable
To:     Kees Cook <keescook@chromium.org>
Cc:     Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Sep 2020 at 01:56, Kees Cook <keescook@chromium.org> wrote:
>
> Currently with run_kselftest.sh there is no way to choose which test
> we could run. All the tests listed in kselftest-list.txt are all run
> every time. This patch enhanced the run_kselftest.sh to make the test
> collections (or tests) individually selectable. e.g.:
>
> $ ./run_kselftest.sh -c seccomp -t timers:posix_timers -t timers:nanosleep
>
> Additionally adds a way to list all known tests with "-l", usage
> with "-h", and perform a dry run without running tests with "-n".


While testing this patch set on LAVA the skip test functionality is not working.
We may have to revisit test definitions kselftest skip logic
or else
may add one more option to skip a given test on run_kselftest.sh script.

ref:
https://github.com/Linaro/test-definitions/blob/master/automated/linux/kselftest/kselftest.sh#L196

- Naresh
