Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BBBC2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 21:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91A1C61949
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 21:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhFYV3i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 17:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFYV3h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jun 2021 17:29:37 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1F8C061574
        for <linux-doc@vger.kernel.org>; Fri, 25 Jun 2021 14:27:16 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id c8so8469944pfp.5
        for <linux-doc@vger.kernel.org>; Fri, 25 Jun 2021 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xRxE71rC/IWPeumP7C1MZE8K9Wv2pifNDPEqkqJ42DQ=;
        b=fRwIMlDaWV0fntevPeIwqIuwZA9SOE+D3GJyYH4A5O3MEchBAxYKHVqyzp+eXW4VT6
         wkaJlszvY8HnkF2duefyJC1I3qVf+p1ig/BgstcUWTRUVWul6Oo3rP7bs9ApaUaWR57a
         i1sqycmWuqiX4+9R/GcLQAbrcWSMKP3JcKrGbbxKYF74XMqLPxckIlosyP1sfnD5unHM
         G4t5VwXQ0Z91lF1lVVeeYJGmplujg8vw5ac9Uczs83849SpRl9uKdLtYz6IAxTGck7vD
         yGl4xBs5TFy7nkqOqJEwPi/srgDSom6k7oU2oYvhoXlul5zFOmjkXkOvhoEoTQXSC1dN
         Xxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRxE71rC/IWPeumP7C1MZE8K9Wv2pifNDPEqkqJ42DQ=;
        b=lZDTWSKbrnjuQ3/EM5xTRM+dWoGpzpaGTonW1/RXBTDXyMBkBFU5ZWLesq6oS4QqRx
         g5tFw1mOtplbWDdw2CnNZTB1spiGgDIO2H3IZ/D8IEdUfcSEWO+3m8G78L/vOScuZ2sB
         OoiRMopfOK5IQp0j7CZHWmZd9SyC9J7AmDlf/qRAK99X4jMQEGY2efOgLMvQfvUTWX/4
         Mr4MRNxh7AzwTkPWTw2wcaJqKqScfotdbZe9HnXgubqFezgTuf8yY008YBMPzxIfHJIB
         PuVlxucJTpVY/1LhawyfxiWxrqnIZ9UAIw9hTFOsQP59ZcJwy9qbAfkacaVVDFt3jXDf
         4Ojg==
X-Gm-Message-State: AOAM530w0qNZKAyWI6aLw/Dgt1ZK9irb8Y0VePowm5crn7UldKPRljIe
        mBWcQ8YPUdH5exw5G+C/21A1bRh1757i/0IfufOsxg==
X-Google-Smtp-Source: ABdhPJwCGwSk6BZTuRmUOtwJhakAAFLWcIBXw8yjzjt+AT3O/BJZ7dHeP6UboGbcWP27Q9QqLf2aHP6UNR6pscUXNeo=
X-Received: by 2002:a63:d0d:: with SMTP id c13mr11573133pgl.384.1624656435782;
 Fri, 25 Jun 2021 14:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623824363.git.mchehab+huawei@kernel.org> <6fde409079959a95b62b9b2692503608d7ff0dbd.1623824363.git.mchehab+huawei@kernel.org>
In-Reply-To: <6fde409079959a95b62b9b2692503608d7ff0dbd.1623824363.git.mchehab+huawei@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 25 Jun 2021 14:27:04 -0700
Message-ID: <CAFd5g443AK+vxaupGiBQC5wB-5PG+5vV11y1NjevUh8don+VJQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/29] docs: dev-tools: kunit: avoid using ReST
 :doc:`foo` markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 15, 2021 at 11:27 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
>
> Reviewed-by: David Gow <davidgow@google.com>
> Acked-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi, can you please rebase and resend your patch on top of

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=kunit-fixes
