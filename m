Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32670386C17
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798225; cv=none; b=RE4HhyeLlHeIsXvS0fURJxNscYlZbzHdS78+8Y8fhiJHRYBWmQLx7o+w4caJ35UpvnQeOlXvJc7e06STxuuyvACyeMSkZj25nKLONIVKs3or8RmKQrhITCp7e5yepW+Ac8NvmuPv5WKxNP87U7nneTcp8f7m65H98fK0fa58fwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798225; c=relaxed/simple;
	bh=dFwgFPuzFxBUZeReAaLX8aBZFKtQA/VwSCGW8XQm7CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIsZfU1YDvMjHr+5cnri+XFu9it5omyx+fnSvKjqSyA3HDKMyh5/Nj3/3QcgmZuZ9oE8N6tDYKMVjvQqrfszLCau6Zyb8h/C1RdXA23V5llX3mwjmPtoFGI7Zp2ZkiLEmKspQisaIwqMrr7cHH+jkrsvjxn6Tf7ijAB/X+eiSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRPPx1jX; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRPPx1jX"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-133466cf955so4255527c88.0
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778798223; x=1779403023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhaSN9ERrIyHjcMV+iPCLsSLUQdYptx69pkUzMqeyJ8=;
        b=XRPPx1jXJlRDABZJ3Onmof8S62f4QbyHjK774aYydiaXdqUoM8rKxR1Dsg7LG38Xco
         HXuQAF9PnR/GV9djF8sqPJxpzFCPP/Ioy/FT1zrEU8sNcnLVid4XTT67lXU6ccPAeVgK
         hXYx6uS6jwOQ6m++hrsaaYdDuF5QJwDRgLqPLKJzuRsMDbzR2yPAy1TndFviT7RtmdWm
         6HssU5ZE1W/FE6nqNcwLl0/dI0YVZa3LH1zuOZ3fUr5o5tns7EJD51CFggzWbliM0ghJ
         75rz/MW1DEBS8tgxmfAiWO35gAXuVYK6NSLswOZHCp/35W6m9Cbv0GY965wGLpGlj2Pz
         1gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778798223; x=1779403023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MhaSN9ERrIyHjcMV+iPCLsSLUQdYptx69pkUzMqeyJ8=;
        b=bFiNESoIq16O5VqifNAyI4Jf1uZN/ZU2Ooqx/25x0NXfwcWMJPxICfBMpQlFHYSWDK
         xCYs0kKmFAejoI9bbGGlPy0F3Tc+7sU5Fiit6b4Ca3l7IDk13Pm4CN/KfX+in7hd/6ZG
         bTyXw3AahF86F/b4cT6Qa87hzIPO6WqtGc+M2W+rti0mnlbI9+0vbWAN7aAmXgXPqEjX
         2FGYp2scGoJK9IWxIrldbg9/oWyGXN7aPJRrYZm3f5A8ADigw8ok0wIHGlcy5txgVmo5
         LL6DUzEi44FsPHNjDODYIYAHVRKQt7k2BaYDV7VfBsBFkntykJpOIaokG3ZbcbIs0YJc
         Xakw==
X-Forwarded-Encrypted: i=1; AFNElJ9tlLZtazizwlcErqxSKDql0Ay8/agKOJjHarIrjxtvqUumfyfZWpvgDAZ69p6uLJBxssjB5Fifm1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7w/MPMdcwKvRSmzbVJY7DFgHhVI+6KQsoeXYgM5EHAu6qnAlC
	P/9HNDekhuzoaSjk/iVndMPwsHA6DcDOEsFmEQ4QJWR79cUls/7mCbuqKEjxMg==
X-Gm-Gg: Acq92OFU4g/JBg7l8OWhZHrv2AY1BNOMXo0ZwBf/6Ovm65Iq9nhMowQHIULy5d3Devm
	J5T8OEIuyN9BzR7Awchg6jyXnsdjg3twrFWWnYbG2kOB4dFj8jJfijtKl/gixmrBR42b/mLO2di
	ysPcRvVq1Y6IOfTQaobbTRYnwCX1Emc7V0Wv/xHc5KyNMZKhabWGEkmheQfBfhvgbajcMHAcs41
	VuItT6tW/3SpRfXPa4l5D5VpmRDvwbE8DRWnoKcNSc0iq/HZpdRaAEI5YbTO5ZLamr/mrJ5JO7P
	VdU2FJh0vRouxZG4rYeLDJtNyGO/eFBRuYJgFt6efJIHezP+sECCwolsUR3rdnn0iuvXBwp71ch
	A5A3J9Fr7OwbDa9W3y/Mddkh1XJ+ENzi9aLJyyY2J6icewwwJDDGSlvlVyJwakY1k1sdR5GJlnw
	/D3Z0crjFcWWrq7jLoJ3x68YQIb9we41DweHCK
X-Received: by 2002:a05:7022:1e11:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1350484ce0emr540377c88.28.1778798223299;
        Thu, 14 May 2026 15:37:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm6777201c88.3.2026.05.14.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:37:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 15:37:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: sy7636a: fix temperature sysfs attribute
 name
Message-ID: <896bd515-1a05-4204-851a-5285959803c6@roeck-us.net>
References: <20260514154108.1937-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514154108.1937-1-eric039eric@gmail.com>

On Thu, May 14, 2026 at 11:39:13PM +0800, Chen-Shi-Hong wrote:
> The hwmon sysfs naming convention uses
> temp[1-*]_input for temperature channels.
> 
> Documentation/hwmon/sy7636a-hwmon.rst currently documents
> temp0_input, while the driver uses the standard hwmon
> temperature channel interface.
> 
> Update the documentation to use temp1_input.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/sy7636a-hwmon.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/sy7636a-hwmon.rst b/Documentation/hwmon/sy7636a-hwmon.rst
> index 0143ce0e5db7..03d866aba6e8 100644
> --- a/Documentation/hwmon/sy7636a-hwmon.rst
> +++ b/Documentation/hwmon/sy7636a-hwmon.rst
> @@ -22,5 +22,5 @@ The following sensors are supported
>  sysfs-Interface
>  ---------------
>  
> -temp0_input
> +temp1_input
>  	- Temperature of external NTC (milli-degree C)
