Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7261C43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 18:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiFIS5E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 14:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344738AbiFIS5D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 14:57:03 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090AF4FC54
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 11:57:01 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 621335CC;
        Thu,  9 Jun 2022 18:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 621335CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654801021; bh=Q4DCh04XpO/N7sm2CFbgcU6JHMSdBAvhaaFl0Cl3NcY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Jxcvb+imebtplIJfT+xAgJD1NM+lC8OIcQ3b0ZFimodHkUlO7raD35WpKu02Pb7et
         7zpHyts7NaMZH9kVJljqGcksKa9CyXre44dELXwo/d2bd2KGarRi12X3ZNSfWu6e/e
         GJGoHYyuL8Wtizwr1hrK2UUhoJeZzXRqzeIKksMI57myBoIFm43UCROOK32lbs9AIc
         jNzNsKXBiafqO1wbkyBpBqGyFfJyuuHwEKcR2YA2IXThyF22D91NZhcGf41W6Zx0Jj
         Bon1vznga+mYyMf86Aco4tjqBPiETL0pZz89M1AG4+RRPE+MQlSf89dDOzgPol+avp
         wOleg59TqHs7Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: Re: [PATCH v2] docs: arm: tcm: Fix typo in description of TCM and
 MMU usage
In-Reply-To: <20220609184230.627958-1-simon.horman@corigine.com>
References: <20220609184230.627958-1-simon.horman@corigine.com>
Date:   Thu, 09 Jun 2022 12:57:00 -0600
Message-ID: <87y1y53bsz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Simon Horman <simon.horman@corigine.com> writes:

> Correct a typo in the description of interaction between
> the TCM and MMU.
>
> Found by inspection.
>
> Signed-off-by: Simon Horman <simon.horman@corigine.com>
> ---
> v2
> * Removed non-author signed-off-by tag
> ---
>  Documentation/arm/tcm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arm/tcm.rst b/Documentation/arm/tcm.rst
> index b256f9783883..1dc6c39220f9 100644
> --- a/Documentation/arm/tcm.rst
> +++ b/Documentation/arm/tcm.rst
> @@ -34,7 +34,7 @@ CPU so it is usually wise not to overlap any physical RAM with
>  the TCM.
>  
>  The TCM memory can then be remapped to another address again using
> -the MMU, but notice that the TCM if often used in situations where
> +the MMU, but notice that the TCM is often used in situations where
>  the MMU is turned off. To avoid confusion the current Linux
>  implementation will map the TCM 1 to 1 from physical to virtual
>  memory in the location specified by the kernel. Currently Linux

Applied, thanks.

jon
