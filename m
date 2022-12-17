Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D11CC4167B
	for <linux-doc@archiver.kernel.org>; Sat, 17 Dec 2022 05:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiLQFPQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Dec 2022 00:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLQFPP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Dec 2022 00:15:15 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8F66E9E0
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 21:15:00 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso5369138wme.5
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 21:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LG/OBjlQoR5hXNhPlSspTsGRVUXAxaICxjQTgjnwTCE=;
        b=ZOgSGSbnbCCmH+dhULrSoz6lDA5Nuf4ClRGWoR2ZhtZtnQreXd9UiP4HuBSHG2YExF
         gfrQ8rYD2GIcdS2ikly5DJA05Ic10lgzOAWMwwDx5a4KICFTQ93BZEeizol0SCXPaTcv
         yfo9ERgf/Nk+O2ytzHXbWMtcempjiUXNHeSwQ2PEhjN5nBuCnaPpciDQ/O4fSvkaXAEl
         C5mzMcF1SQuN/ZeO3bSETxH9py5oaCjSPweGC7BKWMaGFW/nObkK4XX2XluNpOmr1J70
         Bhc6YzE8zDv8Y6jT0CUUlnWidpK3Oi7aCuv+ixIbdvTtUh6qhqKpQ+xXKXV9QJs3YJmg
         6mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG/OBjlQoR5hXNhPlSspTsGRVUXAxaICxjQTgjnwTCE=;
        b=Qofd7UBhrLxMK+3DckDXJPv3/nTqk7IWZiFMN/opq9DEC2wr5JKPZTPfF0BKKun4t7
         fVzT7QTREaAhxo5bcfGu9Ddy+29j2bmHv5524L7vrDcUPCqDLTD9tG/t6c89rFHAlExl
         xQ1Osb3elxXJrYWSJNucpJqzECbWMWkDh5tuSJ1JuYMCxj/6XuIJ9jdvOyW7lI0Zskl5
         R1+ff/ydUPr58wCZHcuBaHvD9ikWgvfEc+jd5+CgJStWzCpJDumHh4D/otLeQ3pl1R7b
         5EF8a8jsMDtKe42rfPkKd1Pyj825MdYCQZ01J7IVvLwQGOfA/Bsc3Mn/kM4OqttN+zWy
         woOg==
X-Gm-Message-State: AFqh2kpeZixrI0YcGfdJmvXRGg1SjwesYhiswWyIZwJq6oVhIIgKkcnz
        7vkgWJhiNcEqMijfIj5A1q7MagKKL2q+NlLHe/3dJQ==
X-Google-Smtp-Source: AMrXdXuERKqHdWiURqQGzD7/QlAGP7/gOUi+J/zxdBXaAinHz+JCo70giVGEQQ+CgLhETQ80zddp9F7swSbLmgOfzTg=
X-Received: by 2002:a05:600c:1819:b0:3d3:4be7:fba4 with SMTP id
 n25-20020a05600c181900b003d34be7fba4mr35885wmp.58.1671254098992; Fri, 16 Dec
 2022 21:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20221208061841.2186447-1-davidgow@google.com> <20221208061841.2186447-3-davidgow@google.com>
In-Reply-To: <20221208061841.2186447-3-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Sat, 17 Dec 2022 00:14:47 -0500
Message-ID: <CAFd5g47EMW0B6_0mjk_UVZ7oeMJes-c8aoQxpz0o4jO_WB+8Zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: Add Function Redirection API docs
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Latypov <dlatypov@google.com>,
        Kees Cook <keescook@chromium.org>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Fradley <joefradley@google.com>,
        Steve Muckle <smuckle@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 8, 2022 at 1:18 AM 'David Gow' via KUnit Development
<kunit-dev@googlegroups.com> wrote:
>
> From: Sadiya Kazi <sadiyakazi@google.com>
>
> Added a new page (functionredirection.rst) that describes the Function
> Redirection (static stubbing) API. This page will be expanded if we add,
> for example, ftrace-based stubbing.
>
> In addition,
> 1. Updated the api/index.rst page to create an entry for function
>    redirection api
> 2. Updated the toctree to be hidden, reducing redundancy on the
>    generated page.
>
> Signed-off-by: Sadiya Kazi <sadiyakazi@google.com>
> Co-developed-by: David Gow <davidgow@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

Aside from the comments that have already been made, everything looks
good to me.

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
