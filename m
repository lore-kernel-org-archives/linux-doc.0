Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 005C27D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 03:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbeGYFA1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Jul 2018 01:00:27 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:34649 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbeGYFA1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jul 2018 01:00:27 -0400
Received: by mail-it0-f68.google.com with SMTP id d70-v6so16572977ith.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Jul 2018 20:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Rr3MHkYSW9aiKM7ASTwIA8/2DdgLrYSk+6ohTH7Vjjs=;
        b=QRmUWsX8d/WBHFEZF+CZoB2OXAV1NCDQbcQ5RFe3WiPw/N9UqyoHzoaWCKgegs6oAD
         IzUk1EX5WEJ84e5B144Ra2zg9NZp/K8NGx3tGcp8hBucqWdv/d/FXe/3vFVHIGuSucmI
         QPL01A94/Hzu0A8v10Y2KEaYfPwAwfENnuRZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Rr3MHkYSW9aiKM7ASTwIA8/2DdgLrYSk+6ohTH7Vjjs=;
        b=UEH+6kR40FBvPvjLaMXe9wc2cDGVPjD8p1PhpVDZCOESGNhKeMERhN/DkK8yyYf0SQ
         XHbZsBEP28xtWQYWsEcc1YwPH9B1Er5mmyF/BEnQ2CqSnHyeVdyrL8O6AwpaeksaYVbs
         uTuWwUG/Lf0zdv6graqcoOIRqtB4tlcyvg4thf/X/TgBFAD1MAHWFv5xh/sy7ZzGtzmV
         c7dv3TzkB6LFje5GCYCv3qv+93ZfRlxjR+Mnl3gD5+0aTa7pS07vfoDLYWOB7CJ9aWIR
         BM4UuOe/ytnNH/Z0ymVk2ZA8pJLhm8r6uqfJsDLzEzO+43z8gfEVwaLnmZYcUNTvaxHv
         a81Q==
X-Gm-Message-State: AOUpUlH41jt6di0V9N/BrLsFLh++mwPbvScbA4dj1nyC2j2mGQU91KFN
        OHSqYpjDt7GsFrv96PVx6L+YMllFlePhZJZC6QbefA==
X-Google-Smtp-Source: AAOMgpchu2zeA03XUyMwuNMi326GxcjALejxPYxON/d/ZF63bwuzUFPvEsxsacLxxcKn7lo3c6Ku7GpO60zT2H3JVfQ=
X-Received: by 2002:a24:62d0:: with SMTP id d199-v6mr4612162itc.91.1532490645589;
 Tue, 24 Jul 2018 20:50:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:4441:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 20:50:45
 -0700 (PDT)
In-Reply-To: <20180724173544.18876-1-joel@joelfernandes.org>
References: <20180724173544.18876-1-joel@joelfernandes.org>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed, 25 Jul 2018 09:20:45 +0530
Message-ID: <CAKohponm0CbBNLY19B-9ccfe3d3jreSJLDePEROR+w1=1JZEWw@mail.gmail.com>
Subject: Re: [PATCH v3] cpufreq: trace frequency limits change
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Ruchi Kandoi <kandoiruchi@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24 July 2018 at 23:05, Joel Fernandes <joel@joelfernandes.org> wrote:
> From: Ruchi Kandoi <kandoiruchi@google.com>
>
> systrace used for tracing for Android systems has carried a patch for
> many years in the Android tree that traces when the cpufreq limits
> change.  With the help of this information, systrace can know when the
> policy limits change and can visually display the data. Lets add
> upstream support for the same.
>
> Signed-off-by: Ruchi Kandoi <kandoiruchi@google.com>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> ---
> Viresh since I changed the patch, could you Ack it again?
>
> v2->v3: reduce parameters to tracepoint call (Steve)
> v1->v2: correct ordering of min/max (Viresh)
>
>  Documentation/trace/events-power.rst |  1 +
>  drivers/cpufreq/cpufreq.c            |  1 +
>  include/trace/events/power.h         | 25 +++++++++++++++++++++++++
>  3 files changed, 27 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
