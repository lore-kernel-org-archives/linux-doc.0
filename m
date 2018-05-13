Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C63E97D043
	for <lwn-linux-doc@archive.lwn.net>; Sun, 13 May 2018 08:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751293AbeEMIvT convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 13 May 2018 04:51:19 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:57415 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750862AbeEMIvS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 May 2018 04:51:18 -0400
Received: from 79.184.255.167.ipv4.supernova.orange.pl (79.184.255.167) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83)
 id 0cdb2f4e18ef5b24; Sun, 13 May 2018 10:51:16 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] PM: docs: sleep-states: Fix a typo ("includig")
Date:   Sun, 13 May 2018 10:50:48 +0200
Message-ID: <4601374.GrrhKEzYAE@aspire.rjw.lan>
In-Reply-To: <20180425100715.17235-1-j.neuschaefer@gmx.net>
References: <20180425100715.17235-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wednesday, April 25, 2018 12:07:03 PM CEST Jonathan Neuschäfer wrote:
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/admin-guide/pm/sleep-states.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/pm/sleep-states.rst b/Documentation/admin-guide/pm/sleep-states.rst
> index 1e5c0f00cb2f..dbf5acd49f35 100644
> --- a/Documentation/admin-guide/pm/sleep-states.rst
> +++ b/Documentation/admin-guide/pm/sleep-states.rst
> @@ -15,7 +15,7 @@ Sleep States That Can Be Supported
>  ==================================
>  
>  Depending on its configuration and the capabilities of the platform it runs on,
> -the Linux kernel can support up to four system sleep states, includig
> +the Linux kernel can support up to four system sleep states, including
>  hibernation and up to three variants of system suspend.  The sleep states that
>  can be supported by the kernel are listed below.
>  
> 

Applied and pushed for 4.17-rc5, thanks!


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
