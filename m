Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2F2C433C1
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A69C61A10
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCYSvv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 14:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYSv2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 14:51:28 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199E4C06174A;
        Thu, 25 Mar 2021 11:51:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A51DA381;
        Thu, 25 Mar 2021 18:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A51DA381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616698285; bh=6GKuaafSwLMS1TJYKxk/ezj6pnyWddz/+K+ur+K8pX8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=r9gSjsEaDiboV/qK7sdQmcylTWRf1daiGELbPNJXk6CIdL1QeFQgY6047du4//Phd
         USgJ5loUsLkY2XYcwb4QPhSNvpbEcFgCjGX9gL3rhyd7RaBDM60tKvUgKcDGlQhbtC
         NE3rwR2ZGykNVLwjkZJYNM946kdZy14q1uzyJBVdZ7c4Ur5i196UwFC2f6HcaABPeA
         JV9Tarq/hrCR1Txo25ykPB0N63g0DCkUmGGivzUrneO5kOewlopMqIBCguTfeddD56
         a5ZNcqa9Upad/hkdFZ1lXU5JWJgovUiuNLmwdvwqd3Soj6MTleRRHgjf/XgyiIXFIr
         1xZE87Zk7io4Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel-doc: better handle '::' sequences
In-Reply-To: <2cf44cf1fa42588632735d4fbc8e84304bdc235f.1616696051.git.mchehab+huawei@kernel.org>
References: <20210325184615.08526aed@coco.lan>
 <2cf44cf1fa42588632735d4fbc8e84304bdc235f.1616696051.git.mchehab+huawei@kernel.org>
Date:   Thu, 25 Mar 2021 12:51:25 -0600
Message-ID: <87tuozyslu.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Right now, if one of the following headers end with a '::', the
> kernel-doc script will do the wrong thing:
>
> 	description|context|returns?|notes?|examples?
>
> The real issue is with examples, as people could try to write
> something like:
>
> 	example::
>
> 		/* Some C code */
>
> and this won't be properly evaluated. So, improve the regex
> to not catch '\w+::' regex for the above identifiers.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ah....wouldn't it be nice if kerneldoc comments had just been RST from
the beginning?  I don't think we're fixing that at this point, though,
so this makes sense; applied.

Thanks,

jon

