Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B4DC43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 16:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbiFIQBE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 12:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbiFIQBD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 12:01:03 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55BF4D6BB
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 09:01:02 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7D4C8732;
        Thu,  9 Jun 2022 16:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7D4C8732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654790462; bh=W0LXVL/j03AjTfqBK0Dic+p7arFX6JTKpnb4JwAgM2s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Au2ZuqQA94FkXAwd/hs2HPRRVbTWIiKyTWVXkQYHayXpcMb2s5yas0O7g5X4it0UZ
         1Er+2O/2d7J1K7wJ8CfLTk8LfPcCT5pbWGjbOdIEYSpWcUyBp6TM1Ib7zcaDzqEHPq
         WOqVPATjxwg/5iiL2X3w2nx8c+N8gkaUgco8E19ox4UoB48wRJnvTZzn8UDG1yQcNn
         Ao6e2aR/SHLNt0xQQ9rB5WScbyAIsP/0/3L2EUq0xhNytXCxh+mfwpxHHdiUz0zwkn
         kw/3hDKIRHNVj8FFLdbK5pyDsWP6fEUMMNylB3zAQaL7F6JF6Ht3cD+lCGdgtqMxUR
         1IHnKO+k9YgCw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: Re: [PATCH] docs: arm: tcm: Fix typo in description of TCM and MMU
 usage
In-Reply-To: <20220603112729.222398-1-simon.horman@corigine.com>
References: <20220603112729.222398-1-simon.horman@corigine.com>
Date:   Thu, 09 Jun 2022 10:01:01 -0600
Message-ID: <87fskd4yiq.fsf@meer.lwn.net>
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
> Signed-off-by: Louis Peens <louis.peens@corigine.com>
> Signed-off-by: Simon Horman <simon.horman@corigine.com>

Here too I have to ask: what does this signoff chain mean?  If two
developers were needed for a single-character typo fix, then a
Co-developed-by line is appropriate.  If you are forwarding a patch from
Louis, then a From: line to get the authorship right is indicated ... ?

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

Thanks,

jon
