Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C375C433E6
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19B7E64FAB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhBDVbv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 16:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbhBDVbu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 16:31:50 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9828C0613D6;
        Thu,  4 Feb 2021 13:31:10 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 516251E77;
        Thu,  4 Feb 2021 21:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 516251E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612474270; bh=JNRmI3mDLLwYiguSVy5hhQI0xsmfVbEYulFu4kjqOJg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=W3bKFCIk/0n60XkEnFYTaR/fzCOS/N9GKWnul7Xh2NtjBmjpJpOg20QcorDhJPAuj
         W3iV0rCf1fezYG1DY8YIMekpkM3Ehk6QLrkP2zPIeAndsreNk/dwh2oSuAYc9A+RRW
         Yk/DC7U8VuL3BtKwxQ/u9LyRr5GCr2OTMQbpzmxgLBqs3OMwNL91Fj9fv+ifoVPXEo
         1hjc4Itj98GWb6c7CAt0KX8MPRvMKEFIlTfDINBcuItfyd9DI+4Vsy+hTAqNVkW7x8
         BG+0wLPdEwRScaI0T7mFUs3y8KlNFtDL9RVECCsM3inMX9DFrEqOSTFEHmTFSp7Wz+
         V336iHN4FVZVg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 5/5] docs: arm: marvell: rename marvel.rst to
 marvell.rst
In-Reply-To: <20210203235305.506528-6-lkundrak@v3.sk>
References: <20210203235305.506528-1-lkundrak@v3.sk>
 <20210203235305.506528-6-lkundrak@v3.sk>
Date:   Thu, 04 Feb 2021 14:31:09 -0700
Message-ID: <87lfc3frky.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Lubomir Rintel <lkundrak@v3.sk> writes:

> This company is not the superheroes you're looking for.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/arm/{marvel.rst => marvell.rst} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/arm/{marvel.rst => marvell.rst} (100%)
>
> diff --git a/Documentation/arm/marvel.rst b/Documentation/arm/marvell.rst
> similarity index 100%
> rename from Documentation/arm/marvel.rst
> rename to Documentation/arm/marvell.rst

This is already fixed in docs-next.

Thanks,

jon
