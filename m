Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF3677DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 14:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752319AbeCZOmT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 10:42:19 -0400
Received: from ms.lwn.net ([45.79.88.28]:54540 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752109AbeCZOmS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Mar 2018 10:42:18 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 90DB22C7;
        Mon, 26 Mar 2018 14:42:18 +0000 (UTC)
Date:   Mon, 26 Mar 2018 08:42:17 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: magic-numbers: Fix typo
Message-ID: <20180326084217.34a19a55@lwn.net>
In-Reply-To: <20180323073231.5826-1-martink@posteo.de>
References: <20180323073231.5826-1-martink@posteo.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Mar 2018 08:32:31 +0100
Martin Kepplinger <martink@posteo.de> wrote:

> This fixes a little then / them confusion.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  Documentation/process/magic-number.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/magic-number.rst b/Documentation/process/magic-number.rst
> index c74199f60c6c..00cecf1fcba9 100644
> --- a/Documentation/process/magic-number.rst
> +++ b/Documentation/process/magic-number.rst
> @@ -14,7 +14,7 @@ passing pointers to structures via a void * pointer.  The tty code,
>  for example, does this frequently to pass driver-specific and line
>  discipline-specific structures back and forth.
>  
> -The way to use magic numbers is to declare then at the beginning of
> +The way to use magic numbers is to declare them at the beginning of
>  the structure, like so::
>  
>  	struct tty_ldisc {

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
