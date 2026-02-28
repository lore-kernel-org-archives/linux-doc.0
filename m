Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069BB23AB98
	for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 01:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243653; cv=none; b=X9G5CjLEScKxLhCeu7eg5x3JpWTtndVpLGE9TYq8GKXUNRdztneQ3dsDMMzl+eV+yxC2OffFklu+3/Fpo/HgSSXJ7Nn54o5roTnmZz7XVsJAKiAKAuxz22EtASFysChWlltGpRv0LsIGjvvf0FVPGeHZBCfgrMgoFPFL/zu6s8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243653; c=relaxed/simple;
	bh=+nVea+1LEhc7u1RV0hreJFi+NiRMUkXwmpuRGxuDlD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohCJDQtD3c882FPvKcSR18xHJtUCJJVLPTSJ064zr83N+JKdVH062S2yb75PE2O7EU+Zt3W2NPK9NqXEwN2DGXVBFH3YxM4Io7+ultz3gSpiegWwaeER5Ex4jLaeqvKJYxFMu6kbtdqMclmwklYlny0V4a4f4BCrMQE0gx8BCpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZAwnWUb; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZAwnWUb"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2508761eec.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243651; x=1772848451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxQavnKskrdCHrZOEdg/KgmOqoLnQplqpgSz9FhP/tE=;
        b=JZAwnWUbJkZecHj2JUwxuXKnd74bOc7ZTCuWpqEDb5lq1SXSeabsBY6Uqa7fFFHNAi
         0r2eaelqc5zRqDu3eQf2U3o3/Z0Rr76TV7wwMiXe/eL/ioclBQkWiU5MRmr99N43c5tH
         eaTspbqR1eX9/G2kdqVQ2wnBP8tlsEkIbP/RVqgTpvItVzzrgxDZtvsdgqGO7nG9/bWX
         vuftLB/ZQ+GxRMU/DUaLrem4nYh84NMbId7JS0wIDCNlh2B8Kd9JFBKiywFdqaneLPYC
         xomRhAM1HwJ/RLUJ4HHLwcolfrYd5hJ8mK3VK16/AavinBUMcbeNTB0+CHhuUIY69W3p
         fzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243651; x=1772848451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxQavnKskrdCHrZOEdg/KgmOqoLnQplqpgSz9FhP/tE=;
        b=k8qZspM4ZENwxXJkcxIGIlhSFicBxcFSb1jXIrTHsGdhqUNLsNhULP/PS/tQVx2/DQ
         jy/cpgYXu32WGKn6nFPq+F05DCckvVM9uKt/xYPlbV+yWkx76YtpQ7WiEjqC2vOpkrQH
         w/mVICW4w9Dlw0XZD433tLMd+SR3+l1HjMP78vED1CFmOh6o5was8c2sScm4jswoG7KJ
         lcIBqhhOXmU2pc/nu4NRDAM+gw8RDJGsJnHAcw79OoZU1L9beljMsF0ulU2IM7x3dlbz
         ybcYcoAig9UzlRHViANkizuCCc5d8H/mvBXYgDRaE6X8TthbnGoZTImRlS8wTrbGpOQZ
         zexw==
X-Forwarded-Encrypted: i=1; AJvYcCULrpiU5eH3jiAQ49eEtIYRxQeQQ2dh7bNPYWJxyqYt3tgg6IFmTDFTbFfxOR21//gXbNWUTAm19rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZh+J/HSHHMZ3elEl6d/JXB81jv15Ui4h23WXqLho1UxFkKgX
	Vwx5Rqzg5jBH44+SLNZIRyssdHLr7/YYD4WxcOe2ZYma+8/VkAH3ZHls
X-Gm-Gg: ATEYQzxaGGUfRW8CMQ0byjAn8+aU3p1WdW2vEj3iyJN+FzKvNnuMCEMD/WjSW3PxuP5
	1MaoUPahlqPtLfm7a6fawGNPDOe5Z3xzLYUnTwf4KhHosEdfz7zHW/XZvtIL/sTH8FI4q66Oa4i
	byfhwUDt6AQH3YWBs6ChJpE6QYbGq+vcnEKuSIN8BhMKTg3zQ/SVvY9wN1mmCdKc8UQfSk83vQK
	xyYl316M+w4LFVgn3N6GBvlqZT3TSguoeYh0y/MLe5N0lwqaJVsaI5FX8r8MQa6WZ0QApcHiIGN
	EYgvBxeJ1PD8xwP35cuOhs9K8NuiizL7wmtkmzU9AWQWHfFqo7lqxW14yGqs/2JNS4ttiR2grP6
	aYQu9oO/yEaac2jp2GJaCwjGmga2AHh11Rn9Z3El7CnShoy42l6xHM9G2pJRHvOEKE6G7yysGOC
	UInwv1j5VD6J1FuGGI/7yPKI1ZtsctAOhKQCbe
X-Received: by 2002:a05:7300:ec17:b0:2b4:7e6b:9c00 with SMTP id 5a478bee46e88-2bde1efba9dmr1980138eec.23.1772243651044;
        Fri, 27 Feb 2026 17:54:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1e02f95sm4977756eec.13.2026.02.27.17.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:54:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Feb 2026 17:54:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: watchdog-parameters: add missing watchdog_core
 parameters
Message-ID: <35acf767-986c-44f7-b167-ae9aec2449de@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <20260228010402.2389343-6-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228010402.2389343-6-rdunlap@infradead.org>

On Fri, Feb 27, 2026 at 05:04:02PM -0800, Randy Dunlap wrote:
> Add missing watchdog_core parameters (handle_boot_enabled and
> stop_on_reboot).
> Add default values for handle_boot_enabled and open_timeout.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> 
>  Documentation/watchdog/watchdog-parameters.rst |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> --- linux-next-20260227.orig/Documentation/watchdog/watchdog-parameters.rst
> +++ linux-next-20260227/Documentation/watchdog/watchdog-parameters.rst
> @@ -14,13 +14,22 @@ modules.
>  -------------------------------------------------
>  
>  watchdog core:
> +    handle_boot_enabled:
> +	Watchdog core auto-updates boot-enabled watchdogs before userspace
> +	takes over. Default is set by the kconfig option
> +	CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
> +
>      open_timeout:
>  	Maximum time, in seconds, for which the watchdog framework will take
>  	care of pinging a running hardware watchdog until userspace opens the
>  	corresponding /dev/watchdogN device. A value of 0 means an infinite
>  	timeout. Setting this to a non-zero value can be useful to ensure that
>  	either userspace comes up properly, or the board gets reset and allows
> -	fallback logic in the bootloader to try something else.
> +	fallback logic in the bootloader to try something else. Default is set
> +	by the kconfig option CONFIG_WATCHDOG_OPEN_TIMEOUT.
> +
> +    stop_on_reboot:
> +	Stops watchdogs on reboot (0 = keep watching, 1 = stop).
>  
>  -------------------------------------------------
>  
