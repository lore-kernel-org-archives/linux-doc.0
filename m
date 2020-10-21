Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E24EC388F9
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0FA82419B
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KMdjtGlH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505822AbgJUVM1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 17:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505536AbgJUVM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 17:12:27 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD35EC0613D2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2020 14:12:26 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w11so1868468pll.8
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2020 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OCU6tWIdopaiVv+58WWDommA6fymksvXM1Yi91pMvd4=;
        b=KMdjtGlHNR2a7z7DBuzUrrpqyNnWfv/OEsmeDLlwn+7pzE+rymVcwPM+k/TwonlLha
         js6srf9Ss9b+kDHCUWBOLnEWDWIwpVmoBpnTvFAWFGuvcoFMx0iCmoYytHb3zDufSmrR
         keqggjQIJzKflNiV0TaUJ6k8qzFC3e4BXC2RfDC/hKZB/r9w3h9OYuipkWkHlwkE65nN
         1Xfy6iH3GzDfjplGS4M1qcsh8n7dmPzS1YWKTsmCmpgZL8W4E2osUpQSI9biZHKv8QHa
         rCnjtnSW0ELtdukpDZRDtuW0kc1e5ZSi61i4v6GWDpZGsFCkfxqGFoMjbR25nXhTWE5q
         98LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OCU6tWIdopaiVv+58WWDommA6fymksvXM1Yi91pMvd4=;
        b=RC01EoJZWysoYlEz8yBuZmhqjZvkhn1r/1/jreGSSmfmlaimTZ9c/Ncc1BDpN0jobO
         N3m180Ekvu8QWOGFu/S9djS7/uWWPM2UGSlnfzjLoKI6zMUBSsLFruH8iPN9/siWwk2s
         BydODWHPK3o214UDRJoUNEFjFzUbv6iJO15dDcNiPxMPsRyGXouzpGZmmFK2pcdhAPBJ
         4j7TsR+KRnCRlK4DJOnE+/xo3W8HuaPVtlaA5o/T+LtRwN6SfH7TF5dkWH0ab6oX5uPF
         +iOOiepHs/eXOWO7xNKYvFyclVTH7nnHNMumxjVCbKF3DNitvIAgLdOf79+q8rnhWZaa
         2QvQ==
X-Gm-Message-State: AOAM530/xjJ0D/NVOY0Zrl0zsDzFRaS/XRHryYsQJckyMtr8G4s1Y2q2
        NLB0jZ61OU2dvlkq0bujY3ns3qym4nAi1XjZXoPZHA==
X-Google-Smtp-Source: ABdhPJxr5dOe0lFEswg9i4kcGmddMd7ptohz6vXxVGc5KE6gmcsXkRzZ90TFtTcjP59cf+I4hsAgsT+HlQMx9cd6xBY=
X-Received: by 2002:a17:90a:3e4e:: with SMTP id t14mr5069350pjm.217.1603314745961;
 Wed, 21 Oct 2020 14:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603282193.git.mchehab+huawei@kernel.org> <1c36d295423c5c20c21a7edede0eb29e338dd62a.1603282193.git.mchehab+huawei@kernel.org>
In-Reply-To: <1c36d295423c5c20c21a7edede0eb29e338dd62a.1603282193.git.mchehab+huawei@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 21 Oct 2020 14:12:14 -0700
Message-ID: <CAFd5g47ZbyiXLMNJ6-BZH1rVpsjK4WSuUph4wS=W=3dVoLeSFQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] kunit: test: fix remaining kernel-doc warnings
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Maguire <alan.maguire@oracle.com>,
        Iurii Zaikin <yzaikin@google.com>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 21, 2020 at 5:17 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> test.h still produce three warnings:
>
>         include/kunit/test.h:282: warning: Function parameter or member '__suites' not described in 'kunit_test_suites_for_module'
>         include/kunit/test.h:282: warning: Excess function parameter 'suites_list' description in 'kunit_test_suites_for_module'
>         include/kunit/test.h:314: warning: Excess function parameter 'suites' description in 'kunit_test_suites'
>
> They're all due to errors at kernel-doc markups. Update them.
>
> It should be noticed that this patch moved a kernel-doc
> markup that were located at the wrong place, and using a wrong
> name. Kernel-doc only supports kaving the markup just before the
> function/macro declaration. Placing it elsewhere will make it do
> wrong assumptions.
>
> Fixes: aac35468ca20 ("kunit: test: create a single centralized executor for all tests")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
