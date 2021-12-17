Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D1BC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 04:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbhLQEwL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 23:52:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbhLQEwL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 23:52:11 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF740C061574
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 20:52:10 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id y23so2149650uay.7
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 20:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y5RW7ZUVbaW1xt4DSsGYXlmkkv0aaury/az9rjo88rQ=;
        b=AcbECCl5W+iJcoeEX9FIu60m0tCdhkfVRAF3HAJTn+NxVr7QRUADbwLjT+qgVHrpb6
         tCBI0nnaPO7948JJrkV8oBkPRqSU2LCtBgCRLjigyCpWxUQzh3Prq9o+1TBhjwj261Lc
         qSWQ+OKGAI0+fnjmGRW/Ak57uUNYOxe3AkZe0q4YMDMPEsz94BU6gBSxUdfQzuRUegAQ
         XaT/dnz3S7tYq5IF0Kn7vkdLbSNP8TiIUKH1PrzlMoyE3g8n4ZMUddLHOfdhqLWBYw8W
         GeZKwi6cF+ccZ9J9J9kHqioZJWnyrdvrEyqzEEs+UlrQC9WSCZgbpAsdmufqvvuxVR8G
         g5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y5RW7ZUVbaW1xt4DSsGYXlmkkv0aaury/az9rjo88rQ=;
        b=Kik5tu4fxepKbuoOHiEtRXPR89UWF0LhGDmOE05rT/q8vluhi6gEwSjBMKg42ExK+L
         5P4Rp4ZuFKiip81ep+geSrHsY36TjntfKpJ8zcVbAQwKMl8w/t4DAv5hO1cMjhhgH8F3
         +GVsQydfRqkm4ogl68OX/eB5H17Hr4subvI7gfb74K8fjqe/c1V9Yrr20e5OmKHv3qUN
         oFPYGHXaWk5HDPe4Cjtf6wAgipsi2Yg8uwJ2a8tXTtjiJ52q4r5tNK6ADN/zhSQBITSw
         OYYpfhfJ3+RKqOSEXvAVeIjTVbbFW4vojtXclZsiJSIahsgStv5JYQXI+U2cdC03Kxtz
         Vqfw==
X-Gm-Message-State: AOAM532ECvheeWvGheSo3Bggdd/N4sCPCeDdgnTnePU/bRIbuH7dAwzp
        ie9v5/joKS5cL598QUOMiOkqry2suyf2L1o6gpZjZg==
X-Google-Smtp-Source: ABdhPJx920oHsUTLppR43w/JLw/FJqLK551xzCyXYDKmbtRpPIdBeDFBdXwZl3cGmlroCc0/HNDcLm1HQiErigYja/4=
X-Received: by 2002:ab0:c10:: with SMTP id a16mr367306uak.51.1639716729930;
 Thu, 16 Dec 2021 20:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20211217043716.794289-1-sharinder@google.com>
In-Reply-To: <20211217043716.794289-1-sharinder@google.com>
From:   Harinder Singh <sharinder@google.com>
Date:   Fri, 17 Dec 2021 10:21:59 +0530
Message-ID: <CAHLZCaFNhkZy7z+o_x7hPazKffituLH0UHwxqt4fEfUF_rL1nw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Documentation: KUnit: Rework KUnit documentation
To:     David Gow <davidgow@google.com>,
        Brendan Higgins <brendanhiggins@google.com>, shuah@kernel.org,
        corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tim.bird@sony.com, Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello all,

On Fri, Dec 17, 2021 at 10:07 AM Harinder Singh <sharinder@google.com> wrote:
>
> The KUnit documentation was not very organized. There was little
> information related to KUnit architecture and the importance of unit
> testing.
>
> Add some new pages, expand and reorganize the existing documentation.
> Reword pages to make information and style more consistent.
>
> Changes since v4:
> https://lore.kernel.org/linux-kselftest/20211216055958.634097-1-sharinder@google.com/T/
> -- Replaced kunit_suitememorydiagram.png with kunit_suitememorydiagram.svg
>
Oops! forgot to add the new .svg diagram to git. Please ignore this patch set.
>
> Changes since v3:
> https://lore.kernel.org/linux-kselftest/20211210052812.1998578-1-sharinder@google.com/T/#m0a85e6a36f13c66470844d92553d19c19239ebed
>
> --Reworded sentences as per comments
> --Replaced Elixir links with kernel.org links or kernel-doc references
>
>
> Changes since v2:
> https://lore.kernel.org/linux-kselftest/20211207054019.1455054-1-sharinder@google.com/T/
>
> --Reworded sentences as per comments
> --Expanded the explaination in usage.rst for accessing the current test example
> --Standardized on US english in style.rst
>
> Changes since v1:
> https://lore.kernel.org/linux-kselftest/20211203042437.740255-1-sharinder@google.com/
>
> --Fixed spelling mistakes
> --Restored paragraph about kunit_tool introduction
> --Added note about CONFIG_KUNIT_ALL_TESTS (Thanks Tim Bird for review
> comments)
> -- Miscellaneous changes
>
>
> Harinder Singh (7):
>   Documentation: KUnit: Rewrite main page
>   Documentation: KUnit: Rewrite getting started
>   Documentation: KUnit: Added KUnit Architecture
>   Documentation: kunit: Reorganize documentation related to running
>     tests
>   Documentation: KUnit: Rework writing page to focus on writing tests
>   Documentation: KUnit: Restyle Test Style and Nomenclature page
>   Documentation: KUnit: Restyled Frequently Asked Questions
>
>  .../dev-tools/kunit/architecture.rst          | 204 +++++++
>  Documentation/dev-tools/kunit/faq.rst         |  73 ++-
>  Documentation/dev-tools/kunit/index.rst       | 172 +++---
>  Documentation/dev-tools/kunit/run_manual.rst  |  57 ++
>  Documentation/dev-tools/kunit/run_wrapper.rst | 247 ++++++++
>  Documentation/dev-tools/kunit/start.rst       | 198 +++---
>  Documentation/dev-tools/kunit/style.rst       | 105 ++--
>  Documentation/dev-tools/kunit/usage.rst       | 578 ++++++++----------
>  8 files changed, 1047 insertions(+), 587 deletions(-)
>  create mode 100644 Documentation/dev-tools/kunit/architecture.rst
>  create mode 100644 Documentation/dev-tools/kunit/run_manual.rst
>  create mode 100644 Documentation/dev-tools/kunit/run_wrapper.rst
>
>
> base-commit: 4c388a8e740d3235a194f330c8ef327deef710f6
> --
> 2.34.1.173.g76aa8bc2d0-goog
>
Thanks,
Harinder Singh
