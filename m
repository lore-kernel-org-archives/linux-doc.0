Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD3547D57F
	for <lwn-linux-doc@archive.lwn.net>; Sun,  9 Sep 2018 20:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbeIJBki (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 9 Sep 2018 21:40:38 -0400
Received: from ms.lwn.net ([45.79.88.28]:38312 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbeIJBki (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 9 Sep 2018 21:40:38 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6E0DE2D0;
        Sun,  9 Sep 2018 20:49:42 +0000 (UTC)
Date:   Sun, 9 Sep 2018 14:49:40 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add i2c to the excludes for
 Documentation
Message-ID: <20180909144940.171ee7c8@lwn.net>
In-Reply-To: <20180907103022.2258-2-wsa@the-dreams.de>
References: <20180907103022.2258-1-wsa@the-dreams.de>
        <20180907103022.2258-2-wsa@the-dreams.de>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  7 Sep 2018 12:30:22 +0200
Wolfram Sang <wsa@the-dreams.de> wrote:

> I'll handle these myself but thanks for providing the fallback!
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2698ee553008..39c39dd6fba6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4487,6 +4487,7 @@ F:	scripts/kernel-doc
>  X:	Documentation/ABI/
>  X:	Documentation/acpi/
>  X:	Documentation/devicetree/
> +X:	Documentation/i2c/
>  X:	Documentation/media/
>  X:	Documentation/power/
>  X:	Documentation/spi/

Both patches applied, thanks.  Looking forward to less email! :)

jon
