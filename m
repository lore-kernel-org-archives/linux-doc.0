Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8446C48BDF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 17:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5BD7611CD
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 17:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236095AbhFRR2z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Jun 2021 13:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbhFRR2y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 13:28:54 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC59C061574;
        Fri, 18 Jun 2021 10:26:45 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 48BBA9A2;
        Fri, 18 Jun 2021 17:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 48BBA9A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1624037205; bh=09oYYdW1hZezx5tjmKQezNJ3L4WiSkZd4lmL9Z+LwtY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=pXy524DJQB8OobdxnK3wy+d6XeFFbH3vMf8O7eszDi35BWyFN6oyDzHdm7PE9ONRr
         sh29ToMUQLGth8Vow1gqtTFT/FeD6q9c1wlADasbNnkubReAy/Xs9LCtTVM7E0dVnx
         ou9I+jTobQOO05mGcrJJn9SHj8cs3wmoUo4Yz/+YBoBpsXkd/nw8CRC9Ph8cZJ5bl4
         EAG1WjpLRtW1nJWrgRpxMhKqSMrLnkUysb9qOebljuZ+hEwjjheNtnppBDKE4/K43I
         3jN/Ab1S8Hjrq1ibLe0BHbcLGyPAGAXQMjEazt7DcZVjDTNU65xdAIN1h+PsZXhBEc
         wwRqhgDpMDdwg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     Kees Cook <keescook@chromium.org>, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Makefile: Use CONFIG_SHELL not SHELL
In-Reply-To: <20210617225808.3907377-1-keescook@chromium.org>
References: <20210617225808.3907377-1-keescook@chromium.org>
Date:   Fri, 18 Jun 2021 11:26:44 -0600
Message-ID: <87wnqrqe23.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kees Cook <keescook@chromium.org> writes:

> Fix think-o about which variable to find the Kbuild-configured shell.
> This has accidentally worked due to most shells setting $SHELL by
> default.
>
> Fixes: 51e46c7a4007 ("docs, parallelism: Rearrange how jobserver reservations are made")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 9c42dde97671..c3feb657b654 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -76,7 +76,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>  	PYTHONDONTWRITEBYTECODE=1 \
>  	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
>  	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
> -	$(SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
> +	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
>  	$(SPHINXBUILD) \
>  	-b $2 \
>  	-c $(abspath $(srctree)/$(src)) \

Applied, thanks.

jon
