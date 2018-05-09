Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0857D7DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 15:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935125AbeEIPGS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 11:06:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42486 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935065AbeEIPGR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 11:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mjSPY1uLIyIgTBobYpJZ7rByt1omQpe64epZ0E8/it8=; b=I60ATu3dgQwFKkBcrgW1jQ9Yr
        HJeFYRCqmBzN4bm07o9vyWLQyg/VDTD0LQ38T2QLYeqK+SCv4FEhbTwJ4ICiErKT6MaluD67vM7T/
        BYifFq9ADg0lNp+QHBVAQA3dnpziHZqTV9oWvYw6rIOnDCQrhbBgY3ZBbOY2tzJWzv7y/16nnuQbv
        7uEJqx0TH4WyJ9C/6d0O6Ja5bTFmOQez7PuK8+Y1rVQGpk5N6JHCp73K5A8JaRn4yYkZ7XJmRpq7A
        1IJW3X1p3IkHF8I7sAIRm+xkE7y00f2geo/X59ttAUtcF8Gax50ZWrHwVjrJ107dFkotjlzjfqvRN
        rmbYqyx5A==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGQfY-0005pe-P0; Wed, 09 May 2018 15:06:17 +0000
Date:   Wed, 9 May 2018 12:06:12 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        "Luis R . Rodriguez" <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 04/11] docs: dell_rbu.txt: fix location of
 request_firmware
Message-ID: <20180509120612.6d25580a@vento.lan>
In-Reply-To: <d38353ac67cd5925bcb31bf3ee4daeb433b6e8f5.1525870886.git.mchehab+samsung@kernel.org>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
        <d38353ac67cd5925bcb31bf3ee4daeb433b6e8f5.1525870886.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed,  9 May 2018 10:18:47 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> commit 5d6d1ddd2730 ("firmware: move firmware loader into its own directory")
> and other commits renamed the old firmware_class.c file and split it
> into separate files, but documentation was not changed accordingly,
> causing Sphinx errors.
> 
> Fixes for other files were already applied but dell_rbu.txt remains
> pointing to the old location.
> 
> Fixes: 5d6d1ddd2730 ("firmware: move firmware loader into its own directory")
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Luis R. Rodriguez <mcgrof@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/dell_rbu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/dell_rbu.txt b/Documentation/dell_rbu.txt
> index 0fdb6aa2704c..befeff80e7ec 100644
> --- a/Documentation/dell_rbu.txt
> +++ b/Documentation/dell_rbu.txt
> @@ -121,8 +121,8 @@ read back the image downloaded.
>  
>  .. note::
>  
> -   This driver requires a patch for firmware_class.c which has the modified
> -   request_firmware_nowait function.
> +   This driver requires a patch for drivers/base/firmware_loader/main.c
> +   which has the modified request_firmware_nowait() function.

Please ignore this one. Luis send a patch updating it just removing this
comment, as it is outdated.

Regards,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
