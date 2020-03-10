Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B46C10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:31:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8004E2146E
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJRbT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:31:19 -0400
Received: from ms.lwn.net ([45.79.88.28]:44180 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbgCJRbT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 13:31:19 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B3BC2823;
        Tue, 10 Mar 2020 17:31:18 +0000 (UTC)
Date:   Tue, 10 Mar 2020 11:31:17 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Joakim =?UTF-8?B?TMO2bm5lZ3Jlbg==?=" <joakimlonnegren@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: driver-api/usb/writing_usb_driver.rst:
 Update documentation links
Message-ID: <20200310113117.4fc9632e@lwn.net>
In-Reply-To: <20200303225552.142778-1-joakimlonnegren@gmail.om>
References: <20200303225552.142778-1-joakimlonnegren@gmail.om>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  3 Mar 2020 19:55:52 -0300
"Joakim Lönnegren" <joakimlonnegren@gmail.com> wrote:

> In writing_usb_driver.rst:
> Remove link to https://www.qbik.ch/usb/devices/ since it seems to be inactive since 2013
> Update link to linux-usb mailing list archive
> 
> Signed-off-by: Joakim Lönnegren <joakimlonnegren@gmail.com>
> ---
>  Documentation/driver-api/usb/writing_usb_driver.rst | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Documentation/driver-api/usb/writing_usb_driver.rst
> index 4fe1c06b6a13..5987762f5c3f 100644
> --- a/Documentation/driver-api/usb/writing_usb_driver.rst
> +++ b/Documentation/driver-api/usb/writing_usb_driver.rst
> @@ -314,11 +314,8 @@ http://www.linux-usb.org/
>  Linux Hotplug Project:
>  http://linux-hotplug.sourceforge.net/
>  
> -Linux USB Working Devices List:
> -http://www.qbik.ch/usb/devices/
> -
> -linux-usb-devel Mailing List Archives:
> -http://marc.theaimsgroup.com/?l=linux-usb-devel
> +linux-usb Mailing List Archives:
> +https://marc.info/?l=linux-usb

I think this is a good idea, but can we put in a link to the
lore.kernel.org archive for this list instead?

Thanks,

jon
