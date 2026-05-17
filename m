Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3C1C01
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 16:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779035713; cv=none; b=JNBH3af7AElKSIFhnjC/giyW4XZeM4AnoK6jpEuLoC7eDFzm16dKmJM3Qsg2Jm9j5/D1c3htxNewMnrnbFz78gWC9BLp6+xyW6ingPJYqtCOHTH8Ifhu5i4V1Z/kfpeVBNMmw24Cc+G+pIMA9QZY6XT6Qul/ykwyF16sIvdSwcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779035713; c=relaxed/simple;
	bh=8Q8zRJsr3+iz+++U2Aj5mXnSDaVqsx2OYsA5zkLvM2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK6WWDerKBy752nPee4mKxGvmkUez0jsykBXWX6QmFs6/COs/mIX8DiD5SBOlSqxe/NN6lZx/kAi3P3Yn2BUmVkXjvNIXZwVlvnyFl1tmNDXutcpsjQKDmcHhRHav5xYlTLcYXP3KTYq5uoaf9I654WlrYVl+f1XKX/w70uMv+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbvjsM33; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbvjsM33"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12ddbe104ccso895066c88.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779035711; x=1779640511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFwrZB0BzatPRzM1lAAxsiBWokBxwZaQG7cDqa9uKvQ=;
        b=fbvjsM33NiM5TEfhunXI+ge+CueIKtR4xJSksvoDnaRnHTkbMc+4GcDorIMo61E1Pl
         2vH6kaM7roQCJoFU7ext/WBV1+qJSXkh+H8jFiCX0ChdtuPEan3Kp97KI1P4MpWkgBSN
         QUL/+3pxHyM64BOALA9wc9EFt5DtXnNxPIhBMA8pBWFcdlAk2AhLAdlXStk5YdqYf2SO
         +ZPfDc7B5XwK3OmX3gd5bOYu+ePSpXOHXbL07QsGbIm7ZrOAAUS2yyp/yd/nMqcN3PcT
         5pU4MD3Z0yvl53BFwOrM845hskwI2DbTtEZggybfEDzWdGJN+lBpYHOhBBsK5EFX1+nV
         k1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779035711; x=1779640511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFwrZB0BzatPRzM1lAAxsiBWokBxwZaQG7cDqa9uKvQ=;
        b=iWEltei+szjVI7Ys+Bm5S5Bl4bKZanwZxeu/1Ru6RX1YjAh6ovsaNy5f2ODrxXh6Me
         uPJBbG5ALiZIL4rDXdRT5taA698DLtapa4v6GXgXy8nKpaiSwZTzPaJ7vfP8SEw4X1CA
         8HnwbL3PP6p3yam/ai4eTW/+cX0pJp8hP7z0eI3yha1egl26t7udHIBZ0pzfAcq9Q7yB
         5YoX9V6+A0oYbGaJMjYoLHBrr3IUn+qZ5/1VwBqyoLknN70BzVSSjRJxnYqzRoNyeGPk
         4lKNHgP986IghPu0SDm9bjDWq9OsQ2couzJvUN9i0lRyjR70mk6F4VbxVhk+opnSjlWa
         MAHA==
X-Forwarded-Encrypted: i=1; AFNElJ/RHC6lKLrBOCJS2CYlH3AWWSkjv9IKnTWlHteIG+Lw750KVwStb0ojgg2cAYTr2a3dsTd+BgAKcaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzfieqIl3bimI6NFh6lM4PFMv3SLr6/GZK8S5SXgdl28bDVdpC
	DQwVy+ePSm1qsjCwTOWNwB6GCxOKDoect/n2+RR/p/2hkG5k01YQJEhC
X-Gm-Gg: Acq92OFqc1WgxG++snSuXHX435Iy+PIOKj8F2kfFSHjGUtqqntsQVMKVn7AtT4SywJf
	HUSro/661rLddD5Vq5X+rbU2LH2/Cb7oIWaze8Lw4kxUVb28W43oH4mv9XZYFq9ZLvy9oBAq6jF
	XWmWg8dk2JkaiwOTHR4KPe5UKGNtPFa/Tp2YdumdQ8/QZOD8hZuDZLG2aKMlbzTfMQm31/JJvU0
	TARCxjq08tCjUZ4PjZtqF1LsD6I+KxXb2aAExUcuG6dLk1PKg9CtYvHx72RtQpbWEymy11xFQS/
	rrMA74XIf9Zyfcie1M8/Z81BGo5Zjkpqq/nFRY8OON4eU1UqsvmLtWPHiX2UtcCB09GwqSwrWr0
	1JAZ/abkqQ3vTFHYHK/vsoQ7GmL+ecTncZPSo02DJT7CngG+aaiDW73gGsxAj1bpJrIWzl8ActG
	TQpxOMXGQvrcXdq9KIido3gBi8vZ228j5oSYWXItBWf1+Sat8=
X-Received: by 2002:a05:701b:2410:b0:135:1a72:571b with SMTP id a92af1059eb24-1351a7258afmr1939567c88.26.1779035710747;
        Sun, 17 May 2026 09:35:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm18862718c88.11.2026.05.17.09.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 09:35:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 17 May 2026 09:35:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: htu31: document debugfs serial_number
Message-ID: <8f436695-28b9-442a-a3bb-da023eeae270@roeck-us.net>
References: <20260517125320.2196-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517125320.2196-1-eric039eric@gmail.com>

On Sun, May 17, 2026 at 08:52:21PM +0800, Chen-Shi-Hong wrote:
> Document the debugfs serial_number file exposed by the htu31 driver.
> 
> The driver creates a debugfs entry for the sensor serial number, but
> the documentation currently only describes the sysfs interface.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/htu31.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/hwmon/htu31.rst b/Documentation/hwmon/htu31.rst
> index ccde84264643..9ab774dcf65d 100644
> --- a/Documentation/hwmon/htu31.rst
> +++ b/Documentation/hwmon/htu31.rst
> @@ -35,3 +35,10 @@ temp1_input:        temperature input
>  humidity1_input:    humidity input
>  heater_enable:      heater control
>  =================== =================
> +
> +debugfs-Interface
> +-----------------
> +
> +=================== =========================================
> +serial_number:      unique serial number of the sensor
> +=================== =========================================
