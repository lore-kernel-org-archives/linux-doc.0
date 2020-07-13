Return-Path: <SRS0=GeCk=AY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE25C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jul 2020 15:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D64E20771
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jul 2020 15:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgGMPc5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jul 2020 11:32:57 -0400
Received: from ms.lwn.net ([45.79.88.28]:35520 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729846AbgGMPc5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 13 Jul 2020 11:32:57 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9B2A62E2;
        Mon, 13 Jul 2020 15:32:56 +0000 (UTC)
Date:   Mon, 13 Jul 2020 09:32:55 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     bbrezillon@kernel.org, linux-i3c@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api: i3c: Replace HTTP links with HTTPS
 ones
Message-ID: <20200713093255.0a181730@lwn.net>
In-Reply-To: <20200713112657.33694-1-grandmaster@al2klimov.de>
References: <20200713112657.33694-1-grandmaster@al2klimov.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 13 Jul 2020 13:26:57 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

>  Documentation/driver-api/i3c/protocol.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/i3c/protocol.rst b/Documentation/driver-api/i3c/protocol.rst
> index dae3b6d32c6b..02653defa011 100644
> --- a/Documentation/driver-api/i3c/protocol.rst
> +++ b/Documentation/driver-api/i3c/protocol.rst
> @@ -14,7 +14,7 @@ collisions are prevented, ...) please have a look at the I3C specification.
>  This document is just a brief introduction to the I3C protocol and the concepts
>  it brings to the table. If you need more information, please refer to the MIPI
>  I3C specification (can be downloaded here
> -http://resources.mipi.org/mipi-i3c-v1-download).
> +https://resources.mipi.org/mipi-i3c-v1-download).

Applied, thanks.

jon
