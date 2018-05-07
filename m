Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 635347DE79
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 18:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752781AbeEGSr6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 14:47:58 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:30525 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752693AbeEGSr5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 14:47:57 -0400
X-Greylist: delayed 342 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 May 2018 14:47:56 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1525718875;
        s=strato-dkim-0002; d=hartkopp.net;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=+jWRDt/lsIvRWLoOoW2ujdLfusnGZs0FrBsgjPNOOzg=;
        b=hAoFa15Yc2ZlqXAmfY+UFFUw3zxHPbIoLKD3j9+zRUuT/KI6Notjj2Xxneq4h4MBVf
        61UCSGrJmlx25g1UOTRA6yq2Ql5y64uN7nKvHjf/wF8SOZGA5KJM90Vj41y1BE/IhGy5
        6wOcB9lm7HHNXbZf9w78oyQ6daNBjvw/a+M/wxt7TdilqyJX6k8ceD7KYd3zkLur74E+
        KWMHbZxtigORDDXeLP+Rht0bURb9vTXoFGLKLPrTRYc2j8JGBCSX4FFT16cnDo+RhMdS
        l9/X78PDeuR87dCLfxgFGsiCutG0gEGtadmlBGWQBxXxAIvOL+Xik8rBtJFg/cnmUyqm
        axjw==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1rXnMaV+PPADNDJE4R+7S"
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.220]
        by smtp.strato.de (RZmta 43.8 DYNA|AUTH)
        with ESMTPSA id 602bb2u47IfhG6d
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 May 2018 20:41:43 +0200 (CEST)
Subject: Re: [PATCH 01/18] docs: can.rst: fix a footnote reference
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Robert Schwebel <r.schwebel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <2a04ab24f302a0802572c4c80c4d416b953f213d.1525684985.git.mchehab+samsung@kernel.org>
From:   Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <8e12e344-0b16-fd92-8a5d-d40aca501c7b@hartkopp.net>
Date:   Mon, 7 May 2018 20:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <2a04ab24f302a0802572c4c80c4d416b953f213d.1525684985.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

+ Robert Schwebel (who thankfully did the txt -> rst conversion for can.txt)

On 05/07/2018 11:35 AM, Mauro Carvalho Chehab wrote:
> As stated at:
> 	http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#footnotes
> 
> A footnote should contain either a number, a reference or
> an auto number, e. g.:
> 	[1], [#f1] or [#].
> 
> While using [*] accidentaly works for html, it fails for other
> document outputs. In particular, it causes an error with LaTeX
> output, causing all books after networking to not be built.
> 
> So, replace it by a valid syntax.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>

Thanks Mauro!

Best regards,
Oliver

> ---
>  Documentation/networking/can.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/networking/can.rst b/Documentation/networking/can.rst
> index d23c51abf8c6..2fd0b51a8c52 100644
> --- a/Documentation/networking/can.rst
> +++ b/Documentation/networking/can.rst
> @@ -164,7 +164,7 @@ The Linux network devices (by default) just can handle the
>  transmission and reception of media dependent frames. Due to the
>  arbitration on the CAN bus the transmission of a low prio CAN-ID
>  may be delayed by the reception of a high prio CAN frame. To
> -reflect the correct [*]_ traffic on the node the loopback of the sent
> +reflect the correct [#f1]_ traffic on the node the loopback of the sent
>  data has to be performed right after a successful transmission. If
>  the CAN network interface is not capable of performing the loopback for
>  some reason the SocketCAN core can do this task as a fallback solution.
> @@ -175,7 +175,7 @@ networking behaviour for CAN applications. Due to some requests from
>  the RT-SocketCAN group the loopback optionally may be disabled for each
>  separate socket. See sockopts from the CAN RAW sockets in :ref:`socketcan-raw-sockets`.
>  
> -.. [*] you really like to have this when you're running analyser
> +.. [#f1] you really like to have this when you're running analyser
>         tools like 'candump' or 'cansniffer' on the (same) node.
>  
>  
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
