Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F12EC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 01:42:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 434DA606A5
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 01:42:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhDUBmt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 21:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbhDUBmt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 21:42:49 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D6CC061763
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 18:42:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a25so32558293ljm.11
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 18:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UczsTWIr8+6VGiM8h97MiUANVxQ4dEWzhNFeeY1J0DQ=;
        b=cZLLvzHjL6Dq4J/0YCjfOBoiNTj7ewYzT1U23fS0KzQTjaU8mQUilogtZrIJ7+42GC
         xJOaS/vJ9R4ip+jJO/7/VkfvKeZ1N19VH6bMk6p3sJvJ/8MV9k6b1Uhtuu5PnrTxoyuC
         p3jJPx9WUIzvA+JNn1nRDIxk8RfPKu/c1iC52DBvnfnRH+ZjIXyN/LA4ViClEYddTO2v
         DzcWFH1YGZZlpLMpxWHSPUOq3ln7wsmS9enK8A3069UZaL/Wge0m9zM81HBYTdf7wvfs
         WHzZiDUmbadFm7ksECr9cHgRIxsyMVAJHfTTOpG3pD8KhUQTU49hOJFnr7JwSkjAva6H
         qjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UczsTWIr8+6VGiM8h97MiUANVxQ4dEWzhNFeeY1J0DQ=;
        b=Vvs5ty57XGJRdn/teJy0ceJOyK2f1PpycNPdN7hBv7Z35rDB9vXDyRjRN7c2n8beZ/
         kwSlqIirn4UGDpIEAuh6q67XtJq0hGdg1qSqnO6EP2L3723D1xa0gxSoJjfn7WnEcuns
         bv8wASV19Llrp2N10exK8/7MEMSMRrkJJgDZqHmN/0U0XAMpkv5a5eIp9Y0F164KqU9R
         ZSjzE8Ahz01YqK2ru14driJEfTQxMYoj2hwoVY3Pn3HXYHP1ltEaAPj9N4Rz+QlgUsBF
         aU6kQE1X06vSr1MLMZB234YH6/8ofgzFoSukNSUG4Omg0fAr1sLamBpL6wLn3rgDGmbI
         2+VA==
X-Gm-Message-State: AOAM532mYsL+qG6GSukkoPbpy1mxKtj+zuR6pXe5Cy5tdFr6gwZIff/S
        jkr2UWFsDkAonmZIYces3hcObUIuGL1D/C8wNbxQBg==
X-Google-Smtp-Source: ABdhPJysu1OHhax+Ts9VQYHrJtlutyWAr60vpOpiyXjGPssUyyiGMaeV1ncpertHo98xbqHHp0y0CZsctY3Bm8Fe/CA=
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr17035527ljj.490.1618969332659;
 Tue, 20 Apr 2021 18:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210415054036.581117-1-davidgow@google.com> <2a35b57e-3261-8ebe-d9f3-66b3dedff756@linuxfoundation.org>
In-Reply-To: <2a35b57e-3261-8ebe-d9f3-66b3dedff756@linuxfoundation.org>
From:   David Gow <davidgow@google.com>
Date:   Wed, 21 Apr 2021 09:42:01 +0800
Message-ID: <CABVgOS=2iYtqTVdxwH=mcFpcSuLP4cpJ4s6PKP4Gc-SH6jidgQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: dev-tools: Add Testing Overview
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Thank for you writing this much needed document.

Thanks, Shuah: I hope I haven't misrepresented kselftest too much. :-)

> Looks great. How about adding a section for Static analysis tools?
> A mention coccicheck scripts and mention of smatch?

Good idea. I agree it'd be great to have such a section, though I
doubt I'm the most qualified person to write it. If no one else picks
it up, though, I can try to put a basic follow-up patch together when
I've got some time.

Cheers,
-- David
