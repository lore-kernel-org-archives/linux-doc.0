Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3929CC4338F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 06:19:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09E8D61042
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 06:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhHTGUM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Aug 2021 02:20:12 -0400
Received: from mail.thorsis.com ([92.198.35.195]:40187 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231761AbhHTGUM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Aug 2021 02:20:12 -0400
X-Greylist: delayed 480 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Aug 2021 02:20:12 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 2E16710F6
        for <linux-doc@vger.kernel.org>; Fri, 20 Aug 2021 08:11:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gNjHor621N4t for <linux-doc@vger.kernel.org>;
        Fri, 20 Aug 2021 08:11:31 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id B54C4334C; Fri, 20 Aug 2021 08:11:27 +0200 (CEST)
Date:   Fri, 20 Aug 2021 08:11:18 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     nick black <dankamongmen@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] serial-console.rst: break up code chunks
Message-ID: <YR9HhhyDc9bjfQoh@ada.ifak-system.com>
Mail-Followup-To: nick black <dankamongmen@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
References: <YR1KmVfEmAZVGXIE@schwarzgerat.orthanc>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YR1KmVfEmAZVGXIE@schwarzgerat.orthanc>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

Am Wed, Aug 18, 2021 at 01:59:53PM -0400 schrieb nick black:
> Trivial: there are two code sections here, not one.
> Break up the RST backticks.
> 
> Signed-off-by: Nick Black <dankamongmen@gmail.com>
> 
> ---
>  Documentation/admin-guide/serial-console.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git Documentation/admin-guide/serial-console.rst Documentation/admin-guide/serial-console.rst
> index a8d1e36b627a..b8c803afae2f 100644
> --- Documentation/admin-guide/serial-console.rst
> +++ Documentation/admin-guide/serial-console.rst
> @@ -96,7 +96,7 @@ Replace the sample values as needed.
>     open ``/dev/console``. If you have created the new ``/dev/console`` device,
>     and your console is NOT the virtual console some programs will fail.
>     Those are programs that want to access the VT interface, and use
> -   ``/dev/console instead of /dev/tty0``. Some of those programs are::
> +   ``/dev/console`` instead of ``/dev/tty0``. Some of those programs are::
>  
>       Xfree86, svgalib, gpm, SVGATextMode

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

