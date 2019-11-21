Return-Path: <SRS0=s6Rs=ZN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3051FC432C3
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 17:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10A7F206CC
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 17:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfKURK3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Nov 2019 12:10:29 -0500
Received: from ms.lwn.net ([45.79.88.28]:34182 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbfKURK3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Nov 2019 12:10:29 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E965D6D9;
        Thu, 21 Nov 2019 17:10:28 +0000 (UTC)
Date:   Thu, 21 Nov 2019 10:10:27 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Robert Schwebel <r.schwebel@pengutronix.de>
Cc:     "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: networking: nfc: change to rst format
Message-ID: <20191121101027.3c060dbe@lwn.net>
In-Reply-To: <20191121155503.52019-5-r.schwebel@pengutronix.de>
References: <20191121155503.52019-1-r.schwebel@pengutronix.de>
        <20191121155503.52019-5-r.schwebel@pengutronix.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 21 Nov 2019 16:55:03 +0100
Robert Schwebel <r.schwebel@pengutronix.de> wrote:

> Now that the sphinx syntax has been fixed, change the document from txt
> to rst and add it to the index.
> 
> Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> ---
>  Documentation/networking/{nfc.txt => nfc.rst} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/networking/{nfc.txt => nfc.rst} (100%)
> 
> diff --git a/Documentation/networking/nfc.txt b/Documentation/networking/nfc.rst
> similarity index 100%
> rename from Documentation/networking/nfc.txt
> rename to Documentation/networking/nfc.rst

It looks like you didn't actually add it to index.rst?

In general the changes look good.  I'd do it all in one patch, but that's
up to Dave (who I assume will pick this up).

Thanks,

jon
