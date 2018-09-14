Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B3377D581
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 08:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbeINNqx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 09:46:53 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:60325 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbeINNqw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 09:46:52 -0400
Received: from 79.184.255.178.ipv4.supernova.orange.pl (79.184.255.178) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.148)
 id 3c7f6f14e0647de0; Fri, 14 Sep 2018 10:33:26 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     "Vladimir D. Seleznev" <vseleznv@altlinux.org>
Cc:     linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: fix image_size default value
Date:   Fri, 14 Sep 2018 10:30:45 +0200
Message-ID: <3538927.sr2MrGZP7D@aspire.rjw.lan>
In-Reply-To: <20180901045115.18338-1-vseleznv@altlinux.org>
References: <20180901045115.18338-1-vseleznv@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Saturday, September 1, 2018 6:51:15 AM CEST Vladimir D. Seleznev wrote:
> This commit updates the default value of /sys/power/image_size in
> the documentation.
> 
> Since ac5c24ec1e983313ef0015258fba6f630e54e7cn the `image_size' value is
> set to about 2/5 of RAM, according to kernel/power/snapshot.c:
> 
> 	image_size = ((totalram_pages * 2) / 5) * PAGE_SIZE;
> 
> but this change was not reflected everywhere in the documentation.
> 
> Signed-off-by: Vladimir D. Seleznev <vseleznv@altlinux.org>
> ---
>  Documentation/ABI/testing/sysfs-power | 2 +-
>  Documentation/power/swsusp.txt        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
> index 2f813d644c69..18b7dc929234 100644
> --- a/Documentation/ABI/testing/sysfs-power
> +++ b/Documentation/ABI/testing/sysfs-power
> @@ -99,7 +99,7 @@ Description:
>  		this file, the suspend image will be as small as possible.
>  
>  		Reading from this file will display the current image size
> -		limit, which is set to 500 MB by default.
> +		limit, which is set to around 2/5 of available RAM by default.
>  
>  What:		/sys/power/pm_trace
>  Date:		August 2006
> diff --git a/Documentation/power/swsusp.txt b/Documentation/power/swsusp.txt
> index cc87adf44c0a..236d1fb13640 100644
> --- a/Documentation/power/swsusp.txt
> +++ b/Documentation/power/swsusp.txt
> @@ -56,7 +56,7 @@ If you want to limit the suspend image size to N bytes, do
>  
>  echo N > /sys/power/image_size
>  
> -before suspend (it is limited to 500 MB by default).
> +before suspend (it is limited to around 2/5 of available RAM by default).
>  
>  . The resume process checks for the presence of the resume device,
>  if found, it then checks the contents for the hibernation image signature.
> 

Applied, thanks!


