Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E24C4727C
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 05:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E514F221E8
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 05:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cm3qXwMN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgJAFJi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 01:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgJAFJi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 01:09:38 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47632C0613D0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 22:09:38 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id m13so4165672otl.9
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 22:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6KOBJvHBicR0VoRRtmGhxc4kN/+VGebNPC7Evs4tF4=;
        b=cm3qXwMNswUF/liZPf5zMwhmh8GyH5J8ViJ70KxfUs7yhhVYXbCaon/m0ixBKyvtaA
         DHW1hKffN8HrskAwfnGEMN8iPg4MKLhY9VVD+L21T1W6x9VljZ7yudIj8AproT57ytv9
         gHSNS89B9H4W5REGOxuK7w9WGMo5OPkLpZBy6fqX6aa6b7TzZEEMaJK9UZc0c889QEbE
         0M1rpi9cmeeCTsaBNuizNXKVZBksVhtff5r7dAUNUaj5VFfi+fpzV1z6WFj659rdZIaC
         QzKCc9z09at1Sj8sWPvD524hGLrD79PDvpP02W4IOLLALVL3QcoJdeH27iHhx5vsGwGH
         EDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6KOBJvHBicR0VoRRtmGhxc4kN/+VGebNPC7Evs4tF4=;
        b=FNaTR9TGEba48wBbNN496wWE7UIjWibS/cH42WBrlFxKZY/ktpV0DL6BIolKTDWyrr
         CKvLjudjoCzopvlJ/T12fORXoFQ72sjo1qJY4De81ZxN6o1qNPBwqB2RWr5L9l3Bc3QS
         zftIm9artuOKTegk0cbXfZsoLEwxzAgwqTIrbubIWWHVmzHc/OOYxzjA9Y7EIf2OEiws
         DBFvwRRsIKJx0vmlQXv2jwnWbIThL0Sugs7ZX/9QGX+fV4vS1Aw03I79XvrODhSqgscY
         knu2SWNPS60vuoO75GdElC7GUtbc6I6jMJZ7tXaCYBMHgIM06W/u7BLvJwLFiqReRbow
         tRvw==
X-Gm-Message-State: AOAM533wtUgni12gkdVSlFNyFooWgAMdD3Ec2vbX5NsESuVT+i0h6Vj7
        DxUMQ/uDQX6TJ1eB48/rfj/MNa+ysIqeGEM9U2Zseg==
X-Google-Smtp-Source: ABdhPJyiR313uHTtIPf7OufasmFIaSMpBW4yu1rpoIB4XegXsDLsrEUYH3jEZhxSCK1w300SRNjGUNOE3soN7DimF7Q=
X-Received: by 2002:a05:6830:22ce:: with SMTP id q14mr3666913otc.72.1601528976723;
 Wed, 30 Sep 2020 22:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202650.2530280-1-keescook@chromium.org> <20200928202650.2530280-2-keescook@chromium.org>
In-Reply-To: <20200928202650.2530280-2-keescook@chromium.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 1 Oct 2020 10:39:25 +0530
Message-ID: <CA+G9fYvwJM20+0Td24H9reeiQPkak+uq7TL1cugufkUxFthWFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] selftests: Extract run_kselftest.sh and generate
 stand-alone test list
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
> Instead of building a script on the fly (which just repeats the same
> thing for each test collection), move the script out of the Makefile and
> into run_kselftest.sh, which reads kselftest-list.txt.
>
> Adjust the emit_tests target to report each test on a separate line so
> that test running tools (e.g. LAVA) can easily remove individual
> tests (for example, as seen in [1]).
>
> [1] https://github.com/Linaro/test-definitions/pull/208/commits/2e7b62155e4998e54ac0587704932484d4ff84c8
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
