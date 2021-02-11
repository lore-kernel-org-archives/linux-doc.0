Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6742C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 16:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 871DE64DDA
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 16:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhBKQqp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Feb 2021 11:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhBKQpP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Feb 2021 11:45:15 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96DBC061756
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 08:44:34 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7F9955F42;
        Thu, 11 Feb 2021 16:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7F9955F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1613061874; bh=4X5DBjAvRGiTLUZXq1G7Ajzj0wYKhbg2QuQPZNAA31Q=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=pv6DQ3mFVrMUWBGuLAti6RT6ZZXKnls8VL3YCtS+OPE7Y+EpMK+yuEp6SVm3I9C55
         4k3qwEMJj4ca3p2VRwJTrI0eJG+YTQBiF1kVIKobWG/EbXe2m9U/tYfsMg7lrGV00U
         1yFr9Xrzha2V8+UmorNtB2g8cR4HHYX44DnpUahjYXgy4xcn8cKsTi1czUcVHkQcr6
         yyjRlpi0jByZgejWdJrTHQJk1xJwmKwEvMaDk+WGlMA5QHljl0HiiLqU9Y8QmXFQb8
         /pIcuiWM7oIVKR6PLmRFXGfUIUKT3KL6ftm2NF22OFBQEZ5pTbjRaS7V/yabrw7xnU
         3Oss1NnUJeA3A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yorick de Wid <ydewid@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Remove the Microsoft rhetoric
In-Reply-To: <20210208150447.87104-1-ydewid@gmail.com>
References: <20210208150447.87104-1-ydewid@gmail.com>
Date:   Thu, 11 Feb 2021 09:44:34 -0700
Message-ID: <87wnvepn9p.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yorick de Wid <ydewid@gmail.com> writes:

> From: Yorick de Wid <yorickdewid@users.noreply.github.com>
>
> There is no need to need to name Microsoft. The point is clear without that context.
>
> Signed-off-by: Yorick de Wid <ydewid@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 98227226c4e..5608ed2931f 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -306,8 +306,7 @@ that counts the number of active users, you should call that
>  
>  Encoding the type of a function into the name (so-called Hungarian
>  notation) is asinine - the compiler knows the types anyway and can check
> -those, and it only confuses the programmer. No wonder Microsoft makes buggy
> -programs.
> +those, and it only confuses the programmer.

Yeah, the time for that has probably passed.  Applied, thanks.

jon

P.S. This CC line in your original:

> Cc: Yorick de Wid <yorickdewid@users.noreply.github.com>, Yorick de Wid <ydewid@gmail.com>

Seems sure to create errors; maybe that could be left out in the future?
