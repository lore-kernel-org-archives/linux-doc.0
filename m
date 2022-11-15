Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C47C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 15 Nov 2022 21:53:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbiKOVxd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Nov 2022 16:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiKOVxc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Nov 2022 16:53:32 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210A863A3
        for <linux-doc@vger.kernel.org>; Tue, 15 Nov 2022 13:53:30 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CD12937E;
        Tue, 15 Nov 2022 21:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CD12937E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668549210; bh=1fgfnuZx/AzJ3OHqbAISQ6gSVq0qTRuVJp4+nuAvvhs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qOGjjHQ+aBL1hFGqmsXb/S5MP5r7UpB47AeUI3fDMFwvk5dlRsArPts/K9U05PFJE
         oXAQv8WyuPKe6sO6uIdS4plsX1f6QZvO7eaKcAv79O/lGdSSmxfSghkSlcMIOreM2D
         F/QOAod4swqSLHMuS9K4vYPjGDaUsWhQWlLm++OEybwgb8g2LW3E/udOvikV0btA+a
         Fa1w3dmavYGkqciA1Ey1OVrtzqHz3fk5VS4lH40rSOS6tQ/CIp+Nd/bAAnGkMEpM7X
         xuliGwu6YAxyjpND7yBJKkj/Cc510J5tpr3gfJuWV5HRryRQGi8o9ktW3ldfVd/AE0
         c4T4mTiunoH6g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Albert Zhou <albert.zhou.50@gmail.com>
Cc:     linux-doc@vger.kernel.org, Albert Zhou <albert.zhou.50@gmail.com>
Subject: Re: [PATCH] Documentation: eisa: Fix typo
In-Reply-To: <20221105080653.4741-1-albert.zhou.50@gmail.com>
References: <20221105080653.4741-1-albert.zhou.50@gmail.com>
Date:   Tue, 15 Nov 2022 14:53:29 -0700
Message-ID: <87cz9nanqe.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Albert Zhou <albert.zhou.50@gmail.com> writes:

> Fix a typo in the description of the kernel parameter
> eisa_bus.disable_dev within eisa.rst.
>
> Signed-off-by: Albert Zhou <albert.zhou.50@gmail.com>
> ---
>  Documentation/driver-api/eisa.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
> index c07565ba57da..3eac11b7eb01 100644
> --- a/Documentation/driver-api/eisa.rst
> +++ b/Documentation/driver-api/eisa.rst
> @@ -189,7 +189,7 @@ eisa_bus.enable_dev
>  	initialize the device in such conditions.
>  
>  eisa_bus.disable_dev
> -	A comma-separated list of slots to be enabled, even if the firmware
> +	A comma-separated list of slots to be disabled, even if the firmware
>  	set the card as enabled. The driver won't be called to handle this
>  	device.

Applied, thanks.

jon
