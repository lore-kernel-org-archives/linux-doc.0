Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3155C77B61
	for <linux-doc@archiver.kernel.org>; Thu, 27 Apr 2023 13:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243510AbjD0N1G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Apr 2023 09:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243323AbjD0N1F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Apr 2023 09:27:05 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDED449E;
        Thu, 27 Apr 2023 06:27:02 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3A229379;
        Thu, 27 Apr 2023 13:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3A229379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1682602022; bh=SSNo45l7KalwFwPxQWlP3l+W4npj5muDBIelMX7dDRY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nr5eFNBD1QQJf3EGN10RdF9SHMVZa7XO/YSTXcMbvmw3ytRg2PzWdh6sxo4xo6EmL
         zpZhyebv9UnWYv9eAwM15wy/BdRa7QWQjj+aC7EEFTQsyZSb5u/0nJ7J2Iq6VhemHR
         dO/NpAeY3u6UEIpdnMe5Q5StIiJdVFLXsUvRRxhA1PeH/jhFwoHyLf8HTfhIwpzJ3m
         Uuvt+HOT93y5yyKyYv3u4DLHvwJwFYkdx0kLdJmxBUHYSJjJ82716PF1p9WXWZTaZT
         hMeoEw6bz0tLiHeH/QUyyhej8p8a4hBapeoBPwIhXeHSistwNr33RcvpuBe9M2WEsP
         E0FzEw5fbY2xg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Costa Shulyupin <costa.shul@redhat.com>, linux-doc@vger.kernel.org
Cc:     Costa Shulyupin <costa.shul@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: redirect from old arch to the new one
In-Reply-To: <20230427101241.1273752-1-costa.shul@redhat.com>
References: <20230427101241.1273752-1-costa.shul@redhat.com>
Date:   Thu, 27 Apr 2023 07:27:01 -0600
Message-ID: <87ildhfobe.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Costa Shulyupin <costa.shul@redhat.com> writes:

> Due to a recent reorganization of 'CPU Architectures', the links to
> the documentation from external resources were rendered invalid.
> This is a common challenge when attempting to make changes
> while maintaining backward compatibility. To address this issue,
> a commit has been made which uses sphinx extension to seamlessly
> redirect users from the old location of the page to the new one.
>
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/conf.py                 | 8 +++++++-
>  Documentation/sphinx/requirements.txt | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 37314afd1ac8..514bfe6a8166 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -55,7 +55,13 @@ needs_sphinx = '1.7'
>  extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
>                'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
>                'maintainers_include', 'sphinx.ext.autosectionlabel',
> -              'kernel_abi', 'kernel_feat']
> +              'kernel_abi', 'kernel_feat',
> +              'sphinx_reredirects',
> +]
> +
> +redirects = {
> +     "arch.html": "arch/index.html",
> +}

I am not generally opposed to doing this, but:

- It only solves part of the problem; links directly into (say) the x86
  docs will still break.

- Is there really a problem?  Are there to-be-broken links out there
  that you can point to?

Thanks,

jon
