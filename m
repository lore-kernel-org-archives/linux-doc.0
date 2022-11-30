Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FC6C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 30 Nov 2022 04:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiK3Epr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Nov 2022 23:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbiK3Epk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Nov 2022 23:45:40 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC516F0D1
        for <linux-doc@vger.kernel.org>; Tue, 29 Nov 2022 20:45:37 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id t17so14647563pjo.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Nov 2022 20:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Hp5+nokbDdYXmeHO6l8YHhyQIpP1MoZJd+AqChAXdY=;
        b=A7YLPBgwqI3LKlRDSIarExvCnxRY/Z/n/cUvePTHoIP7Cp08vix7ODXgQ26YFyzD7/
         uS6k8LHazIo+ZbSxlJ6uHZRhv49CiUsJDug0tglJV4shM8McXhzEOynKymIeIUUJOql+
         vTGcZgF4JcnkIJZucv2j8y+KxICagsaXvqvsO5x0sXpX7fGHcQJy9s2lIUWEnRZM6HSB
         LOKLyk4xagb9xSlZox0y2nyYB2DhARXzSTPlRjfxwqW4/r7QEVvPYEcSNer4HjYmLQ/p
         6zMUXACH2/R46EdPMBmKuqyk97kNBXRj9xTP7nTf1fF7MQTTH8bTeQGFkk9ssTVIiFks
         hrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Hp5+nokbDdYXmeHO6l8YHhyQIpP1MoZJd+AqChAXdY=;
        b=HH0fTmfEvi936H+tvbK+UuebhDpPhJZaQf0wVDslFHhjPBV6PigfXrTkTLLV9ExcHR
         y0DoF726hsbtMGhbklDnI3IjVzzSzOxVg+PkF0klRnfXRnJt6KFdUaQ1wmR4vxNQxrwV
         cM/cTlDAj5SUyYXdYtNV4wpf6o/fPKcJXxTaxL9vVL5H/qbPGwsMmSH/ndEwlVk9Mp9h
         C2fBwqkHzmjDbd31tJB9/4w+i/AFfq1GL5/m+H/qzGi80v0LhKMOEj5YR/2UxBq0TsgL
         lorXEmi9Cac1dVQf5ygwmSc30rY1JAsVjhD4aaBUDJxx9qY+lNRdoFbITFRL3kt9n0qP
         hZkw==
X-Gm-Message-State: ANoB5pn5hFKd0PJAj6FAlEqeTaCpaeQCBiebI/kcR3vHNUW5HL0BRNw3
        ZMZ0pXd1RSOf+ydh9wRPGHC2XVRTcW/gvgGtgSWs0g==
X-Google-Smtp-Source: AA0mqf4Y/2dD9r4Ax34JaCVyP8lY70LEm6ZPf1Ide4lZgtW6pWmoThjhpN6O5PaVs7SLlSLu8QxOxQfuqvWgMSZ4NyE=
X-Received: by 2002:a17:90a:dc06:b0:218:9196:1cd1 with SMTP id
 i6-20020a17090adc0600b0021891961cd1mr56371277pjv.230.1669783536628; Tue, 29
 Nov 2022 20:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20221129094732.306449-1-davidgow@google.com>
In-Reply-To: <20221129094732.306449-1-davidgow@google.com>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Wed, 30 Nov 2022 10:15:25 +0530
Message-ID: <CAO2JNKU2jfdTMC2NXeyVdnE=nf5sQe8S7tvORUpbOgN-Ccx7RQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Fix "How Do I Use This" / "Next
 Steps" sections
To:     David Gow <davidgow@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        Rae Moar <rmoar@google.com>, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thank you David. This looks fine to me except for some very minor
suggestions below. Please feel free to ignore it if you do not agree.
Also, I can send out another patch to change the occurrences of
kunit_tool to kunit.py on run_wrapper.rst and run_manual.rst page to
maintain consistency across as they are referenced on index.rst and
start.rst.

Regards,
Sadiya


On Tue, Nov 29, 2022 at 3:17 PM David Gow <davidgow@google.com> wrote:
>
> The 'index' and 'start' pages end with very similar "How Do I Use This"
> / "Next Steps" sections respectively, which link to the other
> documentation pages. This wasn't updated when the tips.rst page was
> removed.
>
> Remove the reference to tips.rst, as well as tidy up the descriptions on
> all of the links (especially given that sphinx gives the page titles
> anyway.
>
> Fixes: 4399c737a97d ("Documentation: kunit: Remove redundant 'tips.rst' page")
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  Documentation/dev-tools/kunit/index.rst | 18 +++++++-----------
>  Documentation/dev-tools/kunit/start.rst | 16 ++++++----------
>  2 files changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
> index d5629817cd72..beec6f847ef4 100644
> --- a/Documentation/dev-tools/kunit/index.rst
> +++ b/Documentation/dev-tools/kunit/index.rst
> @@ -99,14 +99,10 @@ Read also :ref:`kinds-of-tests`.
>  How do I use it?
>  ================
>
> -*   Documentation/dev-tools/kunit/start.rst - for KUnit new users.
> -*   Documentation/dev-tools/kunit/architecture.rst - KUnit architecture.
> -*   Documentation/dev-tools/kunit/run_wrapper.rst - run kunit_tool.
> -*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit_tool.
> -*   Documentation/dev-tools/kunit/usage.rst - write tests.
> -*   Documentation/dev-tools/kunit/tips.rst - best practices with
> -    examples.
> -*   Documentation/dev-tools/kunit/api/index.rst - KUnit APIs
> -    used for testing.
> -*   Documentation/dev-tools/kunit/faq.rst - KUnit common questions and
> -    answers.
> +*   Documentation/dev-tools/kunit/start.rst - for new KUnit users
How about - start using KUnit
> +*   Documentation/dev-tools/kunit/architecture.rst - how KUnit is put together
How about - get to know Kunit's design
> +*   Documentation/dev-tools/kunit/run_wrapper.rst - run tests via kunit.py
How about - run tests with kunit.py
> +*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit.py
How about - run tests without kunit.py
> +*   Documentation/dev-tools/kunit/usage.rst - write tests
> +*   Documentation/dev-tools/kunit/api/index.rst - API reference
> +*   Documentation/dev-tools/kunit/faq.rst - common questions and answers
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index f4f504f1fb15..58c176348885 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -294,13 +294,9 @@ Congrats! You just wrote your first KUnit test.
>  Next Steps
>  ==========
>
> -*   Documentation/dev-tools/kunit/architecture.rst - KUnit architecture.
> -*   Documentation/dev-tools/kunit/run_wrapper.rst - run kunit_tool.
> -*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit_tool.
> -*   Documentation/dev-tools/kunit/usage.rst - write tests.
> -*   Documentation/dev-tools/kunit/tips.rst - best practices with
> -    examples.
> -*   Documentation/dev-tools/kunit/api/index.rst - KUnit APIs
> -    used for testing.
> -*   Documentation/dev-tools/kunit/faq.rst - KUnit common questions and
> -    answers.
> +*   Documentation/dev-tools/kunit/architecture.rst - how KUnit is put together
same as above
> +*   Documentation/dev-tools/kunit/run_wrapper.rst - run tests via kunit.py
same as above
> +*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit.py
same as above
> +*   Documentation/dev-tools/kunit/usage.rst - write tests
> +*   Documentation/dev-tools/kunit/api/index.rst - API reference
> +*   Documentation/dev-tools/kunit/faq.rst - common questions and answers
> --
> 2.38.1.584.g0f3c55d4c2-goog
>
