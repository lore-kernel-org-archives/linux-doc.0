Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4ACB47D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Jul 2018 08:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbeGQI7r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 04:59:47 -0400
Received: from smtp1-3.goneo.de ([85.220.129.32]:40665 "EHLO smtp1-3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728420AbeGQI7q (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Jul 2018 04:59:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 6EC7923F4D8;
        Tue, 17 Jul 2018 10:28:17 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FbrA-UTWhb7I; Tue, 17 Jul 2018 10:28:16 +0200 (CEST)
Received: from ryzen (dyndsl-091-248-070-004.ewe-ip-backbone.de [91.248.70.4])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 0DC4623F4CC;
        Tue, 17 Jul 2018 10:28:15 +0200 (CEST)
Message-ID: <1d7a309eb7561b9bb4c31f5deb9a0b63b6263232.camel@darmarit.de>
Subject: Re: [PATCH net-next 1/3] docs: networking: Fix indices heading
 indentation
From:   Markus Heiser <markus.heiser@darmarit.de>
To:     "Tobin C. Harding" <me@tobin.cc>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 17 Jul 2018 10:28:15 +0200
In-Reply-To: <20180717042906.17308-2-me@tobin.cc>
References: <20180717042906.17308-1-me@tobin.cc>
         <20180717042906.17308-2-me@tobin.cc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am Dienstag, den 17.07.2018, 14:29 +1000 schrieb Tobin C. Harding:
> Currently the 'Indices' heading is not aligned with column 0, it should
> be.

Hi Tobin, thats not correct. The 'Indices' heading is a part of the 'only'
block:

  http://www.sphinx-doc.org/en/stable/markup/misc.html#including-content-based-on-tags

-- Markus --

> 
> Fix 'Indices' heading indentation.
> 
> Signed-off-by: Tobin C. Harding <me@tobin.cc>
> ---
>  Documentation/networking/index.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
> index 6123a7e9e1da..a4bbde70bcb9 100644
> --- a/Documentation/networking/index.rst
> +++ b/Documentation/networking/index.rst
> @@ -20,7 +20,7 @@ Contents:
>  
>  .. only::  subproject
>  
> -   Indices
> -   =======
> +Indices
> +=======
>  
>     * :ref:`genindex`
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
