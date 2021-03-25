Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB861C433C1
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 17:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 901F261A2F
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 17:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhCYRsx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 13:48:53 -0400
Received: from ms.lwn.net ([45.79.88.28]:44806 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhCYRsn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Mar 2021 13:48:43 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 81581381;
        Thu, 25 Mar 2021 17:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 81581381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616694523; bh=dSiZ9WpbH6o5PpPH+JZs6hsMtE8EOaozrSsU3F4QXm4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=p8knMaD7MJkMURknqdxLgw09A6O8jjHKJcgS8GWt5XPxd2EM4iaVKA+ZIz0LnKlhv
         Xds3laI1PxKxoqo3QqQFoM9p+a6gTVjXwdPsY6kp28fUxNykaXAfvJo1JEJSkEw3VR
         iMbSmXAB8sLW1Z9JlpLYFDztU553e0QjM0zOe6JWf0vg63Mh7uZBHMhTkX7z7e1/0w
         aLaumMWZMrkN5whRYJLWGuY7jh1UTvDVOpgyigeYgZe83w37AnMlNBR8tKKRBeboB6
         JVJb4E4h1j731EaYcRd9Mh0ge6aT2rHI3ouQSXvw3mvPUBUjvCod9tjimXbkVE+Hin
         ZeOHormm5CmuQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] docs: powerpc: Fix a typo
In-Reply-To: <20210322062237.2971314-1-unixbhaskar@gmail.com>
References: <20210322062237.2971314-1-unixbhaskar@gmail.com>
Date:   Thu, 25 Mar 2021 11:48:43 -0600
Message-ID: <87o8f715vo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> s/struture/structure/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/powerpc/firmware-assisted-dump.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
> index 20ea8cdee0aa..6c0ae070ba67 100644
> --- a/Documentation/powerpc/firmware-assisted-dump.rst
> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
> @@ -171,7 +171,7 @@ that were present in CMA region::
>                                             (meta area)    |
>                                                            |
>                                                            |
> -                      Metadata: This area holds a metadata struture whose
> +                      Metadata: This area holds a metadata structure whose
>                        address is registered with f/w and retrieved in the
>                        second kernel after crash, on platforms that support

Applied, thanks.

jon
