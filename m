Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9C4ECAAD8
	for <linux-doc@archiver.kernel.org>; Wed, 21 Sep 2022 20:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiIUUFk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 16:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiIUUFk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 16:05:40 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21967A00F7;
        Wed, 21 Sep 2022 13:05:39 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D0C8E536;
        Wed, 21 Sep 2022 20:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D0C8E536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1663790739; bh=u14fgRgMkkiwOLD10xSCZEwAd8j/HfxpBhhIHX+IJLs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=OnCzCox+tIxEqUmfUVI+Cu3YKQ3R8Dv7OQX0V+cHckmjGahM8tg3sT3Q9Zu+cdjmM
         FTUvumScc+c/vbZle3BKM/Mq+0saxgwRSZ+DncVzCimk4d3d32vYe5gf7C+Kr5BfSy
         B1NwZyjHj9pbXZN9NpMQa/+yXKgqQm6xPEzLRwceqdNYDMqpvaFO44wcSVlJS8QTb6
         12Iz8pSUDSx/7orTAeLAavMc95tWZH5cLKjBRM0O/2qd6aWMX5vc0dCQC9zZkhKDd1
         joaDaQIYtbjZYgItrdFTfbHx0uI4UIf6mfcmqJGgTMktJA/9+PFQsKdR49O5jSmKg6
         O3sUwhNef9oAw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: [PATCH v3] Documentation: stable: Document alternative for
 referring upstream commit hash
In-Reply-To: <20220901184328.4075701-1-carnil@debian.org>
References: <20220901184328.4075701-1-carnil@debian.org>
Date:   Wed, 21 Sep 2022 14:05:38 -0600
Message-ID: <87pmfov6gd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Salvatore Bonaccorso <carnil@debian.org> writes:

> Additionally to the "commit <sha1> upstream." variant, "[ Upstream
> commit <sha1> ]" is used as well as alternative to refer to the upstream
> commit hash.
>
> Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
> ---
> Changes in v3:
>  - Revert to initial version as not adding the code-block:: none will
>    reformat the block differently than the first variant.
>
> Changes in v2:
>  - Drop extra RST markup which just only clutters things without any
>    advantage.
>
>  Documentation/process/stable-kernel-rules.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
> index c61865e91f52..2fd8aa593a28 100644
> --- a/Documentation/process/stable-kernel-rules.rst
> +++ b/Documentation/process/stable-kernel-rules.rst
> @@ -97,6 +97,12 @@ text, like this:
>  
>      commit <sha1> upstream.
>  
> +or alternatively:
> +
> +.. code-block:: none
> +
> +    [ Upstream commit <sha1> ]
> +
>  Additionally, some patches submitted via :ref:`option_1` may have additional
>  patch prerequisites which can be cherry-picked. This can be specified in the
>  following format in the sign-off area:

Applied, thanks.

jon
