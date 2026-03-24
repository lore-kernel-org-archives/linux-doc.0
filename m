Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F13E0224
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356070; cv=none; b=Ef698ZWGR0VTuby3WHEaUHOK3sAQUIme7H0YRUNaHEgCSO3S2qZ3jIswcICjx0JXdlWVZCG75xpqnE5L4tsq1GEx8WxBP5aRatDX/aKXpiQYVc4Q4txgKQrnitgJtVBMykJBCwYgJraU05fKEl76r9aWN5pisAI+tCm5r020cO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356070; c=relaxed/simple;
	bh=bHsqkffR9nN5dimOIdRFPxaUCA87shbFhhQWaEGYRxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cPGuIrM40hrZQhUg08FsbVxXD12J5ouyI73sYOXQmYmF09qA9F/RF/tWTbj/5zzMgsAToPUJWXrBMGI0VkfO8VFAbTS1kIiCs2FW9K3M4GSbWPXc4vNaluBOeI39HJg5bjSD3Or1pYktam1EqiiYv8FHeHfssOnqjG6I6kQ67eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzcLBl/Q; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzcLBl/Q"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c1092cc08cso290067eec.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774356068; x=1774960868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OJeNQnZA7CoGP/YHWM8mHyQRW5SiQkbtHGkl1A3bBSQ=;
        b=IzcLBl/Q8ZAiUAS1JS8/KHSYRJ87p5DjLDyK09JnQISL8V95j4kKRMTARZ375gk4DX
         kT+89YWEjXt24Fd2iIGTTGy/MbIT84eLFDvTpPVCpdKnmHHO2sjVz7Ssk70otxbtGV7A
         mC3HCOdUPPni5kpxjT/sd0X4TDhAWT558ZyWTMnF0XPQTfmKSFtFnOqSFVv7O4oo4vxA
         P6qrY6BaXL9FQSLyoSFKX7miJ4Q6ZxPkqtDkEQHEXkLZir7sdsHIEau58aZBBhe/Xtut
         t3as9LAtBIybAfq9Iz9OZ8FmZ2+7Ju5bW0FBVxO4c8d8tYVvOHUtmwley9xve8w9xeGE
         F0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774356068; x=1774960868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OJeNQnZA7CoGP/YHWM8mHyQRW5SiQkbtHGkl1A3bBSQ=;
        b=Po4UaMCnHYvA5l/KnEnqFxrUi+Pvso0aoW15hhsz/6ExvTeSNMQqkflkPav3q6E8u3
         7ntU1YmMTxpgEJI9xSL4Dh7E7nR4K2wXoFf8oP+vkO8a4wruSkQ586gBI6vath1bCG7y
         3BEpht+7hZ7G80bHJCtxDDC/m0TlQiwCcizeMkEkc9JTDa4ZxMwo1Y0d8Z+0T0W0WfE/
         OBi9ZM33XpuBL36quCSBhsphIitVNTovA6nCkku+yCVSP45n2T5aOd23vIR8pzuNWTJ+
         VAzZDy6nq+ITmJ3IaohD2BEdR4bG9dz1khi8WPpnersDw6kBy6pDjuC5kPIDoyR2X8hz
         5YNw==
X-Forwarded-Encrypted: i=1; AJvYcCVFzVXjfR5Wb2qLKxPwRykKgqDzx3mMsItxj2p7eWe1Af1wYuRysrq7/pzu/nCGQj2AdKYIPCiGB8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nXNUudpieTapP/XmVIh9S2VPfG4lSzXS0g5031wPqaVPGOpg
	tBcgoCejog/JvAG3Qm0ENZL24Jj/T09sQFy0yN8za+xrgZExr5TLOc8m
X-Gm-Gg: ATEYQzzOTHyNEeJQ6oQ5xNba9N7vIhePfFCBHxTHOHHgEsblj8IPHZdHirGXAIrCxzV
	/TuEsVBINZ3cfrM2PuHhFXu5NKf4NDj1awNgqZ++QNablUKhC0hRGbxSWT9AiJhQl0yTiV2tEsc
	yQSZJ2v+tKECRUHOxjZDJiqttnwwvHiweEOMudZfzbHU+uKwsQ4whikDckCWjTrD8ZKyCo4Cfx5
	8W0oF5hCDoNjDI+GMzV10SpraaDs1/HAeiybNf2oTWOhE1PwRle2IwD5+3nEACzNALxBTxOmCNM
	u2mqTKIbN4eHQEbeoooqq5xXvOTm3sRq+olgqotDabE5hg8N0yteHN3/eD0VSS8lUZyncEanM0C
	hwpUePx+/P9WAtjkTviW7PQEaYAQplZksetzIaomqmy6pG7uQa/Nllq+a+XYNplIgGbpCeXPram
	u2rH+v7PTjlqa0fSkVng+DwG9gDb97HgmDdMrQbOFvc495Q7yy+hSN3krdYK7BKZFb2c0lVsQ3
X-Received: by 2002:a05:7300:8ca6:b0:2c1:778:d897 with SMTP id 5a478bee46e88-2c109752f8dmr7772833eec.21.1774356068254;
        Tue, 24 Mar 2026 05:41:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm19110428eec.26.2026.03.24.05.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:41:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6245c03f-6321-491c-8e9f-be66945ed1c5@roeck-us.net>
Date: Tue, 24 Mar 2026 05:41:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: watchdog: explain watchdog API options
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-watchdog@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260311121602.139967-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260311121602.139967-1-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/26 05:16, Shubham Chakraborty wrote:
> Replace FIXME comment with proper documentation for
> WDIOS_DISABLECARD, WDIOS_ENABLECARD, and WDIOS_TEMPPANIC
> options.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/watchdog/watchdog-api.rst | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
> index 78e228c272cf..984f7362d5fb 100644
> --- a/Documentation/watchdog/watchdog-api.rst
> +++ b/Documentation/watchdog/watchdog-api.rst
> @@ -268,4 +268,13 @@ The following options are available:
>   	WDIOS_TEMPPANIC		Kernel panic on temperature trip
>   	=================	================================
>   
> -[FIXME -- better explanations]
> +The WDIOS_DISABLECARD option allows you to stop the watchdog timer via
> +software. Note that this will only work if the "nowayout" module parameter
> +(or CONFIG_WATCHDOG_NOWAYOUT) is not set.
> +
> +The WDIOS_ENABLECARD option turns on the watchdog timer.
> +
> +The WDIOS_TEMPPANIC option is used by some drivers (like the pcwd driver)
> +to trigger a system halt (typically a kernel panic or power off) when the
> +temperature trip point is reached. This ensures that the system is halted
> +immediately in case of an overheat condition.

