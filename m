Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 593AF7E677
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 16:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751289AbeCNQGu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 12:06:50 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:45693 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751279AbeCNQGt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 12:06:49 -0400
Received: by mail-pl0-f68.google.com with SMTP id v9-v6so1936531plp.12;
        Wed, 14 Mar 2018 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dsHU5Yn+9HaytdSlEPDxXffexghV7Iari+734OHgf5M=;
        b=kAt2mkRVEyRa2UOLtdVtK2WnhE9fQ3o0iFBA3KtcrEfB8990V3DQabL+ZF1/1SH5ky
         FJWzyLCjtzRCKCAT9QrFhgpnOeMY2+RZLCI48lULmNmMr0P0IBxiD0qdQQYWlG7kwbel
         8Zb9VISGxdm2ICMfW9ozbR+Mr2pwbErX8uGTlbqfknpojCa+nIjthWFMfRsKfcjzOSdy
         brOdDs0a6SD875rVUUUO4Xt/2m+A7B9AlXcFUaGJs3V1oV7VBA6UAAPgn7gnBr3ewtA8
         Y+adna1LcaQFMi2uufwhMsWrstrUXQH2xa85019PfuWkk08whkhCuYh/y8/uvnB6kuwe
         9bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dsHU5Yn+9HaytdSlEPDxXffexghV7Iari+734OHgf5M=;
        b=ADy11pwcpTZWcDhsAVT8dDwltKKKrivUt42zUfG7YCc2jy/SzP1j2kD42JfOCQhnKr
         br9aw2OA8g1TDaKCGOhcoI2HA4Wre9RT5xZiLug0Io1+lOp9l0HksZ9c4LszYGBPSjEA
         PGRqrJzeF9K4IJFV21lOihvxqZOdfd/8KFjG6idxlTE/OpIlRHaFFu8FoclNY4i5nWKX
         b1Q2ZSQQ63bbB3Y/kDT5iIycqk41dRelxUX4tfXOS7Of4rczCQqtzfSZL9aBFvUzoj1G
         ExuPq66doT+UPwiGFPCYBWuaubhpvOrJZXPbZY0abHEYlIqvCHoxMx5ULGasL+At1jJX
         HSBw==
X-Gm-Message-State: AElRT7GJT/eNtrCMXXZ+XOkCAMqCTLDqR3yoGxx0EvjBklteNg387Nn/
        /UT5suNrTvEZ2A7m/7qL0NVVqA==
X-Google-Smtp-Source: AG47ELu49ka3JAVZ9i5QClZ+nUoXAk0S4QP0v5W4bYUsrc8vIyXlK01y5UHptghfmOLZSEt4clcNkA==
X-Received: by 2002:a17:902:5609:: with SMTP id h9-v6mr2876696pli.121.1521043608817;
        Wed, 14 Mar 2018 09:06:48 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id v2sm5223492pgo.36.2018.03.14.09.06.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Mar 2018 09:06:47 -0700 (PDT)
Date:   Wed, 14 Mar 2018 09:06:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 31/47] watchdog: remove bfin_wdt driver
Message-ID: <20180314160646.GA15652@roeck-us.net>
References: <20180314153603.3127932-1-arnd@arndb.de>
 <20180314153603.3127932-32-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180314153603.3127932-32-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 14, 2018 at 04:35:44PM +0100, Arnd Bergmann wrote:
> The blackfin architecture is getting removed, so this driver has
> become obsolete.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/watchdog/watchdog-parameters.txt |   5 -
>  drivers/watchdog/Kconfig                       |  17 -
>  drivers/watchdog/Makefile                      |   7 -
>  drivers/watchdog/bfin_wdt.c                    | 476 -------------------------
>  4 files changed, 505 deletions(-)
>  delete mode 100644 drivers/watchdog/bfin_wdt.c
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.txt b/Documentation/watchdog/watchdog-parameters.txt
> index beea975980f6..6d6200ea27b8 100644
> --- a/Documentation/watchdog/watchdog-parameters.txt
> +++ b/Documentation/watchdog/watchdog-parameters.txt
> @@ -55,11 +55,6 @@ wdt_time: Watchdog time in seconds. (default=30)
>  nowayout: Watchdog cannot be stopped once started
>  	(default=kernel config parameter)
>  -------------------------------------------------
> -bfin_wdt:
> -timeout: Watchdog timeout in seconds. (1<=timeout<=((2^32)/SCLK), default=20)
> -nowayout: Watchdog cannot be stopped once started
> -	(default=kernel config parameter)
> --------------------------------------------------
>  coh901327_wdt:
>  margin: Watchdog margin in seconds (default 60s)
>  -------------------------------------------------
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 098e5ed4ee3d..f89f8869ca2a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -815,23 +815,6 @@ config SPRD_WATCHDOG
>  	  Say Y here to include watchdog timer supported
>  	  by Spreadtrum system.
>  
> -# BLACKFIN Architecture
> -
> -config BFIN_WDT
> -	tristate "Blackfin On-Chip Watchdog Timer"
> -	depends on BLACKFIN
> -	---help---
> -	  If you say yes here you will get support for the Blackfin On-Chip
> -	  Watchdog Timer. If you have one of these processors and wish to
> -	  have watchdog support enabled, say Y, otherwise say N.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called bfin_wdt.
> -
> -# CRIS Architecture
> -
> -# FRV Architecture
> -
>  # X86 (i386 + ia64 + x86_64) Architecture
>  
>  config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 0474d38aa854..e209824541b8 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -91,13 +91,6 @@ obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
>  obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
>  obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
>  
> -# BLACKFIN Architecture
> -obj-$(CONFIG_BFIN_WDT) += bfin_wdt.o
> -
> -# CRIS Architecture
> -
> -# FRV Architecture
> -
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
>  obj-$(CONFIG_ADVANTECH_WDT) += advantechwdt.o
> diff --git a/drivers/watchdog/bfin_wdt.c b/drivers/watchdog/bfin_wdt.c
> deleted file mode 100644
> index aa4d2e8a8ef9..000000000000
> -- 
> 2.9.0
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
