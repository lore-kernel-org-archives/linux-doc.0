Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3F9C4743D
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15CA56141A
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhFDRWw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 13:22:52 -0400
Received: from ms.lwn.net ([45.79.88.28]:33320 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229926AbhFDRWw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jun 2021 13:22:52 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EEB754A6;
        Fri,  4 Jun 2021 17:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EEB754A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622827266; bh=dxVUPmB9AxnsZ9gQ7oZKK/Nc07Awh3o1zHXscFMdk/I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XksI3pVkQ7L/SPFTEnICe4UnumNGjZzvhhsL5xmwSv9ZAb7ValZ+dgiFHTvO9VWKI
         UdzOZA9KD+lnVA1Y2OVAB5AVdGJuE5gLokG11sYDbJmncvzUWUmIN3SoDktWjub0RS
         2L2PzGHhUa8ePHv4yVgD+j6apwtCBVDbaihcSk+XQnfFSFAYd9/3Rc5D2nh1PLFk4S
         Y3cfcjg4rkMrgQqUKPGc3l9TIwmvx1fGZt5tP7Uj/ZYeHUSBN+Y101IWS526S+vIJF
         sEFjMAUEC+Yx12n9IPgfJsOvKjHI4RsCrpIxHJx26tgAyt1iGAejKYQfNQI3OBkj7O
         UQDOE4eCElCHw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] documentation-file-ref-check: Make git check work for
 multiple working directories
In-Reply-To: <20210603012806.331132-1-robh@kernel.org>
References: <20210603012806.331132-1-robh@kernel.org>
Date:   Fri, 04 Jun 2021 11:21:05 -0600
Message-ID: <87mts5zgu6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> With multiple git working directories, '.git' may also be a text file
> linking to the actual git tree instead of a directory.
>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  scripts/documentation-file-ref-check | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
> index c71832b2312b..7187ea5e5149 100755
> --- a/scripts/documentation-file-ref-check
> +++ b/scripts/documentation-file-ref-check
> @@ -24,7 +24,7 @@ my $help = 0;
>  my $fix = 0;
>  my $warn = 0;
>  
> -if (! -d ".git") {
> +if (! -e ".git") {
>  	printf "Warning: can't check if file exists, as this is not a git tree\n";
>  	exit 0;

Applied, thanks.

jon
