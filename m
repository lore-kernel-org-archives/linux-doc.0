Return-Path: <SRS0=cTBG=2C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA72C2D0C5
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 01:17:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F02E205C9
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 01:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LUw50vEO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLLBRb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Dec 2019 20:17:31 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40912 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfLLBRa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 20:17:30 -0500
Received: by mail-pf1-f196.google.com with SMTP id q8so202178pfh.7
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 17:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o9boV3Hg7emjeyUoekMzbEkEybPyhPn+8n735mHoCvA=;
        b=LUw50vEOj3BhWqCbIUbgX8ki5Vxlrc7te2m0hHZCilkluhkZlnh/GkOzqWJxDb3zV/
         /ZUELgAvbVzxkwGkuip2yFdzIbCG1GnGI6EKAXlm4KqjP2yOdhKhBnix4IdQ84LKTh8f
         dbeoWkQt50mdgf5d0IK5950WS5qFUn6r2DaYBsu1jabxJD6xU6VD+WG2fnSitB6Ts/s5
         gFxl7ImMAYZhpHfIbUyW+9r031qaB/BAUnldyMxCzLZQg7NQ+iPK8WflCmtWIe5BsIBm
         jw4rWE65xM78tSwtI2SHKyw4LYU5wMHQZCYcJKRbiPJST+9i69pLZcJ+7Ks4O9U0CDN2
         q1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o9boV3Hg7emjeyUoekMzbEkEybPyhPn+8n735mHoCvA=;
        b=Iv5g3+HvrGVj7b1UFVKwAGumKPrSldR2vCZXLN2yBOQ1culc84mLuHRz3qmaUTDRK7
         k04ybmvyjnVQGfE3+N+Bax1Xrdf7h3HX7PreTpWDyolAmow+NOiYxh0I3QTnKqRFyanc
         5tMxMrlD2xS4i/rnfilh52Tt7RepYC2X8G5PFb7yv+tAXyeLyxEjE+PQealoZCLllh69
         znPPydqlFKoYmCGaq420QXiXcuJVpAY7Jy6NQUeD1QPBc83hnFnlQM7oGLcPl3ncgLao
         45cfzTzftPjT+NHe8+C2w0+tPnSZL7Z10wnswBdzsVPXxj1im2QcxbtFDM/STzXGY+aT
         wlQQ==
X-Gm-Message-State: APjAAAWRt+tOHxDQD7sjvVAJwcWn/++DkhliZYmeNrfQ2E72PuMxINK2
        5XvlanYpe9l0KtbKDsZqYKnsSYiYUUg6Okh1G/dlaA==
X-Google-Smtp-Source: APXvYqzwKtBT8eiw5GuI3onlZz20uo+ZdmqbenynXPURvRO9f7Mcuh9oJQDwIhCknNgHXBLKYn7wQBvqXUgpWpWN8Lo=
X-Received: by 2002:a63:cc4f:: with SMTP id q15mr7630209pgi.159.1576113449800;
 Wed, 11 Dec 2019 17:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20191205093440.21824-1-sjpark@amazon.com> <20191205093440.21824-4-sjpark@amazon.com>
In-Reply-To: <20191205093440.21824-4-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 11 Dec 2019 17:17:18 -0800
Message-ID: <CAFd5g453HrF-P9K8gCWKhTmCxoSODQ9RP3t+7njeHovT-_wpYQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] kunit: Create default config in '--build_dir'
To:     SeongJae Park <sjpark@amazon.com>
Cc:     SeongJae Park <sj38.park@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, shuah <shuah@kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 5, 2019 at 1:35 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> If both '--build_dir' and '--defconfig' are given, the handling of
> '--defconfig' ignores '--build_dir' option.  This commit modifies the
> behavior to respect '--build_dir' option.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Suggested-by: Brendan Higgins <brendanhiggins@google.com>
> Reported-by: Brendan Higgins <brendanhiggins@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
