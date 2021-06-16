Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED4CC48BE6
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 20:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B856661075
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 20:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbhFPUjG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 16:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbhFPUjF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 16:39:05 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE2FC061574
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 13:36:58 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d62so1184258pfd.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/iyaCYOVFTgGt+uLyKcOuwMWraHntMrfp9c4Wvuygsw=;
        b=ozk9b/x9ThmBWrjEaelNW21eP5a7iRJdlV2CCTgf37kQf96+3dtQlK8fT5gDAJUGD6
         DoqqU7iPY42js1IrnSrZAs51SNZuE4YSBqwhCxLJqI0SUQbSmx0EocnWZal25Y2uLaeX
         y8FlJ2epoAYw8VrTJ6c+mPu0L0TXgM6AbaiAlF3dUaO+oLja5SbAZ860YmGZ08ORSYW8
         /Yxsv4BONI8sHpeOSt+G/UHUfbJA2nGZYzZFtoxiGnj2N/jSJkYdrVPKaXKK6zPKlzFK
         nIKVKwGUESHVozEVHgVuoh0FX58K/8UmjfspgpbSLXKOzp3ETt7SlylUjuG+xWOLzVZR
         YmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/iyaCYOVFTgGt+uLyKcOuwMWraHntMrfp9c4Wvuygsw=;
        b=n7iJZxDbK0qHh4bRQMx1HliSkgfQr7+Vv0x6H0wL6fruBfr8KQH6YTQeob5JiFsAGB
         bs1nF05AyxDW4kAHQdzlM1W7S0O2A2S18P3Ir9OPzsItWlFeusBfxGYh9+GC8wb0hjqD
         nkb+WH8SuXmHeqrLXtwQ13OHIgjfn/INN7XUcugyT2eA3PX1pCACkEcLLtRWgqIMCVA2
         HCj8kL300DgsBcoJiAYPHLDHBdFIXktM4Xbo7gpOuYT7INOqR2M8x75JXlg1r0ilVGHE
         XHlLeURS1zQkPudoHu9H8hKYMm99YEuBzlOvMbNZfDPvfpkE667VJFCMqPT+fA2NtaRg
         GG9A==
X-Gm-Message-State: AOAM533F6G1V63mYy5itRS46wt5K+0PyFLSSQTlB2r69rDGryFMeCSZh
        yrFkBRq/6zBi3ePDzVB14IclWWBN5oZFnUHir0EfhQ==
X-Google-Smtp-Source: ABdhPJxjnJLJ8Cv1ZHYaqWXR3wF9ISnILfK3oF+Xc3ZEJKCH7abCZfLs1EX3lq0+oyQVuxYpRaebxpvKs51I4p7cy18=
X-Received: by 2002:a63:485a:: with SMTP id x26mr1427134pgk.159.1623875817786;
 Wed, 16 Jun 2021 13:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210522044241.2763088-1-davidgow@google.com> <20210522044241.2763088-2-davidgow@google.com>
In-Reply-To: <20210522044241.2763088-2-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 16 Jun 2021 13:36:46 -0700
Message-ID: <CAFd5g44-zP7VWwBMxSMv=PNPQWNHB-y90kQ4E8WVqs2mWCE2dQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kunit: Move default config from arch/um -> tools/testing/kunit
To:     David Gow <davidgow@google.com>
Cc:     Shuah Khan <shuah@kernel.org>, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 21, 2021 at 9:43 PM David Gow <davidgow@google.com> wrote:
>
> The default .kunitconfig file is currently kept in
> arch/um/configs/kunit_defconfig, but -- with the impending QEMU patch
> -- will no-longer be exclusively used for UML-based kernels.
>
> Move it alongside the other KUnit configs in
> tools/testing/kunit/configs, and give it a name which matches the
> existing all_tests.config and broken_on_uml.config files.
>
> Also update the Getting Started documentation to point to the new file.
>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
