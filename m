Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639E6C83F14
	for <linux-doc@archiver.kernel.org>; Mon, 28 Aug 2023 18:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbjH1Smj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Aug 2023 14:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbjH1SmT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 14:42:19 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B1195
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 11:42:17 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 394CD2CD;
        Mon, 28 Aug 2023 18:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 394CD2CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1693248137; bh=6oR1thb6S4C37+okiqXChOyBafKnXVA0eTSUy89h64E=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=TS2HAYJM3jbsLzrCK2YgtNR6wzDQ0AWpkpZ+eUJfPCm/SLUtKnDQanf7h5nfCqJT6
         dJi0OUo9BS+/YkJN4vV/USJOBwdAe1hKIyfmHIg+69BiOqJCn4m2WC/wSWUuMAFIA+
         QPOBHNc5P2IUlkwVGQU5AKl9kdZ11krdJU0PYLtPQYWCZH+CUv8IcIeZ6lG0OS+iFv
         0bjXi78BMAKMK0Co5plbwzy4ENX83qtLhLhNp3bFxR46wie0ugmrqFqr6zeUbiDTdV
         Db6huv5i3fqlDBD45fZ0jSYH/MfUgnOdET5RkrhmDmr5cb7aiWIGqHfPNQJxm9XBt8
         QyB1dEjs56gYg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andrei Emeltchenko <Andrei.Emeltchenko.news@gmail.com>,
        linux-doc@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] Documentation: serial-console: Fix literal block marker
In-Reply-To: <20230825091626.354352-1-Andrei.Emeltchenko.news@gmail.com>
References: <20230825091626.354352-1-Andrei.Emeltchenko.news@gmail.com>
Date:   Mon, 28 Aug 2023 12:42:16 -0600
Message-ID: <87bker101j.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Andrei Emeltchenko <Andrei.Emeltchenko.news@gmail.com> writes:

> From: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
>
> Make rendered text readable by fixing literal block marker, changing
> ":" to "::".
>
> Signed-off-by: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
> ---
>  Documentation/admin-guide/serial-console.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/serial-console.rst b/Documentation/admin-guide/serial-console.rst
> index 8c8b94e54e26..a3dfc2c66e01 100644
> --- a/Documentation/admin-guide/serial-console.rst
> +++ b/Documentation/admin-guide/serial-console.rst
> @@ -59,7 +59,7 @@ times. In this case, there are the following two rules:
>     the hardware is not available.
>  
>  The result might be surprising. For example, the following two command
> -lines have the same result:
> +lines have the same result::
>  
>  	console=ttyS1,9600 console=tty0 console=tty1

Applied, thanks.

jon
