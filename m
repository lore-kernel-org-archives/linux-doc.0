Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACA3CCA473
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jun 2022 15:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348790AbiFAP3v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jun 2022 11:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345782AbiFAP3u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jun 2022 11:29:50 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5114739F
        for <linux-doc@vger.kernel.org>; Wed,  1 Jun 2022 08:29:50 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CEDDA7DA;
        Wed,  1 Jun 2022 15:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CEDDA7DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654097390; bh=MVekBVVRIgqn1zxTsMa0dpX2DKtzgMuAQMigj4XYj8U=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LE+T2acNpeyWGQznz8X7qAy9g63m+7dKCYHcnBfnRW94xQ0cxt6GsXEYKR5eOdiQG
         nSjYIM9KTLHK8rgJKYp/XUg0DEl3bP5JHD6gDfCUDbb9LaCEqVHgMq+YeeTJjZXKZ4
         iR74ri3jpNNX7Z7+YiTHv6qMGjJaqFez+mqoU1z+abuaY2GA3R02ISvrqNlId1LKrG
         DNr4CkvYZfdLBbsErgmhV6kO3Q4GbvIccnV3A1uZDtL1WPD3vaEQ4Hbkd4cR3axvL7
         g+B2tPTf+VvKntYWpbtDwYV89k4DZIsuPHrx/CuydLLDWMY0HD0gb/+/IQPe9GV4Rc
         oVmMatJg69WoA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs/conf.py: Cope with removal of language=None in
 Sphinx 5.0.0
In-Reply-To: <bd0c2ddc-2401-03cb-4526-79ca664e1cbe@gmail.com>
References: <bd0c2ddc-2401-03cb-4526-79ca664e1cbe@gmail.com>
Date:   Wed, 01 Jun 2022 09:29:59 -0600
Message-ID: <87a6aw5rm0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> One of the changes in Sphinx 5.0.0 [1] says [sic]:
>
>     5.0.0 final
>
>      - #10474: language does not accept None as it value.
>        The default value of language becomes to 'en' now.
>
> [1]: https://www.sphinx-doc.org/en/master/changes.html#release-5-0-0-released-may-30-2022
>
> It results in a new warning from Sphinx 5.0.0 [sic]:
>
>     WARNING: Invalid configuration value found: 'language = None'.
>     Update your configuration to a valid langauge code. Falling
>     back to 'en' (English).
>
> Silence the warning by using 'en'.
> It works with all the Sphinx versions required for building
> kernel documentation (1.7.9 or later).
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/conf.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I really was going to get around to trying Sphinx 5 real soon now,
honest... 

> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 072ee31a301d..934727e23e0e 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -161,7 +161,7 @@ finally:
>  #
>  # This is also used if you do content translation via gettext catalogs.
>  # Usually you set "language" from the command line for these cases.
> -language = None
> +language = 'en'
>  

Seems to be obviously the right thing to do.  I've applied it with a CC
to stable, thanks.

jon
