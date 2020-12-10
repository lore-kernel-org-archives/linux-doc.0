Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5836EC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D38623D25
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgLJA3o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgLJA3o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 19:29:44 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89314C0613D6
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 16:29:04 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1541D301;
        Thu, 10 Dec 2020 00:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1541D301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607560144; bh=98nZP3Dz+y2Yl2EeKFbX2T3nKqNROBgG1fWLjO5rxZA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ItnswFGdvjOQ8NQl9OGSZR8SesNL0Pru2dFNlPAcBzaceqLZZkOZ0hctJD08SZ1ty
         6s7BrWCI8SRFUnwuqyEsXPhwJcpueiQi4rkjSZzUsetBQftu3PEwy9Libdd3QJEBYw
         0TI08UdfV6e3NMfVp8w2KA717u9rHDfU01HGMcL+/OcAAQpeHGXAmShF5XvxFXYoX/
         8hhAAR0f7aOl2S7jkOT7yeugtWy36nMLFJUo7Az9POSe4RwFMjcJ3lb8aQ71D0sgOK
         ZzBXuUHXaPBxtpY9C7RCfnp8+Tyz0sThNXEFgKP0687zN+rieIeUc4e5bLGz6OdB/A
         iSaPA10bGO+rg==
Date:   Wed, 9 Dec 2020 17:29:03 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     JaeSang Yoo <js.yoo.5b@gmail.com>
Cc:     jsyoo5b@gmail.com, mchehab+huawei@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.org,
        markus.heiser@darmarit.de
Subject: Re: [PATCH] docs: update requirements to install six module
Message-ID: <20201209172903.7990f71b@lwn.net>
In-Reply-To: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
References: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 8 Dec 2020 10:46:28 +0900
JaeSang Yoo <js.yoo.5b@gmail.com> wrote:

> On the update of Sphinx version to 2.4.4, the "six" library won't be
> installed automatically. (which is required by kfigure.py)
> 
> Main reason of this issue were occurred by the requirements changed from
> the sphinx library. In Sphinx v1.7.9, six was listed on the
> install_requires, but it has been removed since 2.x
> 
> The kfigure.py uses six library explicitly, adding six to
> requirements.txt seems reasonable
> 
> Signed-off-by: JaeSang Yoo <jsyoo5b@gmail.com>
> ---
>  Documentation/sphinx/requirements.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
> index 489f6626de67..5030d346d23b 100644
> --- a/Documentation/sphinx/requirements.txt
> +++ b/Documentation/sphinx/requirements.txt
> @@ -1,3 +1,4 @@
>  docutils
>  Sphinx==2.4.4
>  sphinx_rtd_theme
> +six

Sigh...what we really need to do is to leave Python 2 behind.  Until then,
though, we need to install "six".  Patch applied, thanks.

jon
