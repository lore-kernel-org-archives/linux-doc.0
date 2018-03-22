Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 25A997D0F4
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 20:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751811AbeCVUMU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 16:12:20 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:43359 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751765AbeCVUMT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Mar 2018 16:12:19 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id C3B6221A96;
        Thu, 22 Mar 2018 16:12:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute5.internal (MEProxy); Thu, 22 Mar 2018 16:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :content-type:date:from:in-reply-to:message-id:mime-version
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ic0uRG2nFv/Csp5y/MUAi1/8BhIzLOFQiSvbjYseUps=; b=hAr/a9hu
        Z139KznE0bqf5DR5bkrZbOBv3ZP7XUYDSMf5fB0ieOw3cuPfol1PfMQC50ZVobKl
        k+nq63HxV1AoDCH6/e2EEFiNmSeWmw59rwJO5jogTiMuFMyqnk27h3qqi4wB7PHY
        sswZanX71mckIp6Al90RmojHI2gRvxoipBB1iPOvGBO69DRHYC+BkEzFg4JxWFe8
        VfLT9RU3Ha7pcnGrsGROaZ02dChtrSBjlIiBAr/y2zZChTIGSgtycFEYqhsuDimC
        1zPf6YG31G2+IGh8lM7nTbNZTF7QNnWM1N4CcLE/P1/KGceVvPUOdnR5Re41jHRn
        n/CDYE2U7F4IQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=ic0uRG2nFv/Csp5y/MUAi1/8BhIzL
        OFQiSvbjYseUps=; b=JnOvZ742FqSzO+mdW4o9bKkM0DSAyrkpkY+7/uVYvmK4Y
        MqtM2+rRn39Iw1BSGAHzlYAF1UQKp6Xi3XKR4ROcx3pnosJG2YRqXDOrGnIzUzBH
        5nE3cor7rRRyod70/uMXvxFrnV5ISVhJndJxTW9CWb0zRsakikeS1W7/RlPC0kuJ
        GpfOu1FEzuxMcEomaLSQ9K/0GkX+DJehVFLNwn7Uq/wc+k/MFJyvFi/HXOqOXM0h
        42ekVtv66ACaESZtUmeXxlYDpujweY9UjyL8PEwfmeRIKs2tAluwnGqqQW8waTiQ
        49vzg0yJ2xisEC9ZK3DaFkwnywQRkmCCBNqlTHeaQ==
X-ME-Sender: <xms:Ig60WvRKsGjuALTFAFrDLpOcUKu5315IrTOtogjOffDw1LFn32v53A>
Received: from localhost (202-159-180-96.dyn.iinet.net.au [202.159.180.96])
        by mail.messagingengine.com (Postfix) with ESMTPA id 11D0D24108;
        Thu, 22 Mar 2018 16:12:17 -0400 (EDT)
Date:   Fri, 23 Mar 2018 07:12:14 +1100
From:   "Tobin C . Harding" <me@tobin.cc>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Mention why %p prints ptrval
Message-ID: <20180322201214.GE3305@eros>
References: <20180322052336.1001-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322052336.1001-1-joel@jms.id.au>
X-Mailer: Mutt 1.5.24 (2015-08-30)
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 22, 2018 at 03:53:36PM +1030, Joel Stanley wrote:
> When debugging recent kernels, people will see '(ptrval)' but there
> isn't much information as to what that means. Briefly describe why it's
> there.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/core-api/printk-formats.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 934559b3c130..eb30efdd2e78 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -60,8 +60,8 @@ Plain Pointers
>  Pointers printed without a specifier extension (i.e unadorned %p) are
>  hashed to prevent leaking information about the kernel memory layout. This
>  has the added benefit of providing a unique identifier. On 64-bit machines
> -the first 32 bits are zeroed. If you *really* want the address see %px
> -below.
> +the first 32 bits are zeroed. The kernel will print ``(ptrval)`` until it
> +gathers enough entropy. If you *really* want the address see %px below.

Acked-by: Tobin C. Harding <me@tobin.cc>

thanks,
Tobin.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
