Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E61C4743E
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:26:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E405613AD
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhFDR2h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 13:28:37 -0400
Received: from ms.lwn.net ([45.79.88.28]:33534 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230454AbhFDR2h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jun 2021 13:28:37 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 244254A6;
        Fri,  4 Jun 2021 17:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 244254A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622827611; bh=+iVoWpJ/hj/2GTHoNViDlfELcZr75r47/z5IFohWH9Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CbuHVx/7EbAzqWKnIHdgHe2W9TgORhVpzox3SyAZiKCugQjZvFUP9OSC0jw/B3OWz
         ZSHapmk6VJsTzxoyADTKH52rP2Y3JoXDJhXNLGZ39IwnPz8lNP9HjuGV30eSkYexAM
         vVGaaFlCVgdJt0BVtkAnX0tuuRQVdYmJl62zWlwucFORc2LTtTALtxOJh5vjIO/8tq
         MqgBSvEQag1ZyDhNqEJ0g5WinyE4nL2P2KD/iks8WRr9jz5Yo7ZojODsrZYnIl74Aj
         c0UBrAqBBZrZt8oIEASjVIKiX5I0prtSE5IQaGXrL/TAKCDW5nwn7cn2QAaVYX4uq5
         gUgUZMHG53Bfg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Gao Mingfei <g199209@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, Gao Mingfei <g199209@gmail.com>
Subject: Re: [PATCH] docs: block: fix stat.rst document error
In-Reply-To: <20210601085145.3273-1-g199209@gmail.com>
References: <20210601085145.3273-1-g199209@gmail.com>
Date:   Fri, 04 Jun 2021 11:26:50 -0600
Message-ID: <87eedhilr9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Gao Mingfei <g199209@gmail.com> writes:

> There are 17 decimal vaules, not 11.
>
> Previous committers forgot to change this number when adding
> new fields.
>
> Signed-off-by: Gao Mingfei <g199209@gmail.com>
> ---
>  Documentation/block/stat.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/block/stat.rst b/Documentation/block/stat.rst
> index 77311335c08b..a1cd9db2058f 100644
> --- a/Documentation/block/stat.rst
> +++ b/Documentation/block/stat.rst
> @@ -18,7 +18,7 @@ A.
>     each, it would be impossible to guarantee that a set of readings
>     represent a single point in time.
>  
> -The stat file consists of a single line of text containing 11 decimal
> +The stat file consists of a single line of text containing 17 decimal
>  values separated by whitespace.  The fields are summarized in the
>  following table, and described in more detail below.

I've applied this.  I rewrote the changelog, though, to better fit
kernel style:

	Update the description of the device stat files to include the
        proper number of fields.

Thanks,

jon
