Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62212C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3447F6108C
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhETGyw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 02:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhETGyv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 May 2021 02:54:51 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A44C061574
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 23:53:30 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so14023198oto.0
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 23:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Ns+VpxGz17p6h6biqwMh9xnfnWGEv9mtiqQ0o4rGuKQ=;
        b=E2kgmY/ehIrqLeBhct1fawqLdacuRHwqRv9VzOHSjhoRuCs+gFl0DslCnKxjdi0Fvo
         ihOFnR+5zbM6AsF+n7PuspR46GyIhTfupvvUKpOfHXiJTrOeS25pBfA/CPOvgnmu7Fpf
         +DUu9dGXPm8JHwY1FUt8SY+Sxhqgp5wbIZhcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Ns+VpxGz17p6h6biqwMh9xnfnWGEv9mtiqQ0o4rGuKQ=;
        b=bSR3QCFp29M5bDGdi/uH9h6ZDruIKXF7vAGiKTp/u1Db4MIUQizj9HhPhDZXIPF3Ey
         leQ/1RXpadh5xQrbV6lk49GEz+9nhKVXdftPAMA5Lw7FulWSUffq9bCIogObmQUP+hH6
         imBz4mtHVjrtBlmBKu2/44iYiHFmm+bAyOYyic1LBNVSvN3U2T6IC8tGmJc5a77qU54y
         /uLd3qWCWE/F944fm0WJ8j+Mae0uokjeZyAXDa/5L6YVVqX71jBYuTuh32O0kKH2DWug
         dlezrdfabZRmcnZZH4NPLmygp08Bp8xCQ6ALvGZE1MDcCC1HbY0VAOe6FvaXC5MFuv17
         9GUQ==
X-Gm-Message-State: AOAM533R2M9/Gskzjkd9vIPaBqYgWQANKkqh2bssRh+89FfCFqKQaxKS
        DxFedzB0s0bclQ7CAtCIBoOVg65k0Cm9wm1wh2HroBu/1zA=
X-Google-Smtp-Source: ABdhPJyB2Q398wqP3pj8Thgq5RMtE0ndaZ/BOtobMApD7cGjWqxqgUev3Hy7kwVH8X5YoO/OaWu/wxagi7URzNewoAc=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr2737986otn.233.1621493610041;
 Wed, 19 May 2021 23:53:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 May 2021 02:53:29 -0400
MIME-Version: 1.0
In-Reply-To: <20210520031801.2455665-1-siyanteng@loongson.cn>
References: <20210520031801.2455665-1-siyanteng@loongson.cn>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 20 May 2021 02:53:29 -0400
Message-ID: <CAE-0n50Uve4gEwDfJ4wt-tFBjJkStJ1Eb6jHntjcRML-HCkGUw@mail.gmail.com>
Subject: Re: [PATCH] docs: core-api: Documentation build warning fix
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        rostedt@goodmis.org
Cc:     linux-doc@vger.kernel.org, senozhatsky@chromium.org,
        andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Yanteng Si (2021-05-19 20:18:01)
> commit 821c734b5b073cc2a87fff29f434a8ccffa7db56 add printk formats to add module build ID to stacktraces.
>
> Causes the following warning:
> Documentation/core-api/printk-formats.rst:137: WARNING: Unexpected indentation.
> Documentation/core-api/printk-formats.rst:138: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> So, add a blank line to the end of "::".
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
