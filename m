Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C0F2F7EF5
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142682; cv=none; b=BmZRr6jNaJXEwg2D7nEpqiOBUujggjQDVk6mI+dP5cH7j6z9BucthmQPwvG4covDgbU5uhMusMzoHrdlD8YnIG5Hi17oj8PlOLPNOd4aZR5sN63pAYBqIk7n21ADzgvTa4GMkaEXMgxTawYDlmNnPXwWPgDT2uRG3w41NaypPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142682; c=relaxed/simple;
	bh=rwy9AaB+YZ2TxWZYUbWBAN5RIBxXVW8FYgve6/rXKyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMv0HthtDwonaj9srAJ/RALR/TUBGDBjiCg9NR5rXRcRU27A/KAiUDklkyFRZU/l30eDWuSh6I6wZ6XkT/geCK3g06Ez6Mbnocd8hKDM6TG8I9GchAKgBVmonK9L5ATO9ekyEb1QAzrMos4+Kp2R+goC7SyeuA5kHMLPUUzaXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3Q3KQm6; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3Q3KQm6"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso2906204eec.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 15:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142681; x=1779747481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvAeM3G6bmkfm6f0wgfGcfgEROVq1lUgw+e1xbuFGjg=;
        b=p3Q3KQm6XaUwQa2NUL3KVOdeuTe3LAxUmXMs3Y0Xc2kjPHWKWn+Q9dqpXCvc3HaATH
         XnvbDLJMSOiIsyN3pHPgbU+LBSLhMlK2wGOVh4wGOm4yW1zhOxE7kQAMqCwbfRNHBTvR
         KMlL0yNOw4KXvCI3bd16RziOhhFcQNfUPWtxaQa+Oj+cgmKEdfJNN8eLJfrZT5lV9QKj
         VEFWqE6PQn6Ttj4R3HkXD79D34OiuzwWY5rV4vNSP5EQj7X8jslBQtzZiT+yjlmX5nR7
         +Z+o04RtoGX6k7v2S7g9B/MKLbYwCAqC2Goy/w/0aw3G9N/5C+yd2iZNmDKQ4Va0z3ve
         0BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142681; x=1779747481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvAeM3G6bmkfm6f0wgfGcfgEROVq1lUgw+e1xbuFGjg=;
        b=iNLs86WRjN5DIybiRluFMnN4nCGzIe/HZtOXoQRRuadGduakrH407tikCImiXCMWA7
         nRKvMV9O/eMGLXuPh7Rp7nbORKptnTfw6ZUMqhF9L4cQHH51RbVC+7+UjjRWm5Agnt4n
         yM4zilfm1Uq1b06ZOPAW6Dj3f3etSt40V0r8QBXZAfprKNBjJAe+h/agtNIgEdxHsnNy
         iQEpjns0QRiQ/2XuAZGGKyw01EgrRI+tT8hk3/h4CFov9jiMFkLpzvn2WErtSmsE8Yiy
         WjWCZNiIThw9DZ+/vCuOjYCqIw5QEKPjP0eq+RH9G3f0EyFtc03AzP0smbBgtUZKtw7U
         mbAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9biR04Tm6FVA5Xu+FW6q12PtQy4NQY/9syKmMg6E2Kv2fX01eGux1VVbCmc6+B8ZAVFSxIEbwISw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bOSyOMTlO2+rt2+5sbjLVLWCRiSaHIrP8rMvbNz4oJ9s3lFz
	6LU0PbQJzCQgkFV83rhAyMeSr6/HTLN6i/hE127S+IVRiyHWWQuzz0ek
X-Gm-Gg: Acq92OGqJx9BEIfVhRMsc+Ffcg8zfSwEJg4+2gIg/b21wvFzrBsQlpAcXPdhObiwqHU
	FIrUrGiVTdnTr+dXMqoLDDRRKx59DaOkGfz5ibZvyuGNi+KY+XmstQApNh9SfvgqcX5LA9luf+R
	yGANEjlFtxKikH1aiOxGkH9ZH877qRMG8GUeRGv1e0JS8toF4QIflHkTUwSc0jzVcU0yHKCGIXM
	7ovr4ZWKDoi5igr9nsXdp/TnaXXWfigDfmEr3qDp/oTbwDWUl5td9DPLOS12cEpQPCmXkuuKDHr
	1xUKZuOmMQ7UU/Hs/deDSCTcdLOxTXbPibqxy0qzUlvJp1pGxw9X2lJYA6mZemCmEaZX6qcEGkY
	frrKg9NCdPfhoTjWO53fgK8g9KhwcMbuCLrLxOqOjUIRNynjOUXbABs3uw33cs+Cz+/0AfH/2Nh
	URxurusf/5mE8NE7fl4oyKt7ivzUkCHIXzGcq7nbsBrIoSwxo=
X-Received: by 2002:a05:7300:fb83:b0:2ed:2942:34ab with SMTP id 5a478bee46e88-3039818afb2mr7606381eec.3.1779142680596;
        Mon, 18 May 2026 15:18:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6c3sm18171998eec.19.2026.05.18.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:18:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 18 May 2026 15:17:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
Message-ID: <a3eba071-d969-4498-baae-77cee9b2ed78@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>

On Sun, May 17, 2026 at 01:34:43PM +0530, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

I'll need an Acked-by: from a maintainer to apply this patch,
or some other maintainer will have to pick it up.

Thanks,
Guenter

> ---
>  include/soc/bcm2835/raspberrypi-firmware.h | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index e1f87fbfe554..975bef529854 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -156,6 +156,31 @@ enum rpi_firmware_clk_id {
>  	RPI_FIRMWARE_NUM_CLK_ID,
>  };
>  
> +enum rpi_firmware_volt_id {
> +	RPI_FIRMWARE_VOLT_ID_CORE = 1,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 3,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 4,
> +	RPI_FIRMWARE_NUM_VOLT_ID,
> +};
> +
> +/**
> + * struct rpi_firmware_get_voltage_request - Firmware request for a voltage
> + * @id:		ID of the voltage being queried
> + * @value:	Voltage in microvolts. Set by the firmware.
> + *
> + * Used by @RPI_FIRMWARE_GET_VOLTAGE.
> + */
> +struct rpi_firmware_get_voltage_request {
> +	__le32 id;
> +	__le32 value;
> +} __packed;
> +
> +#define RPI_FIRMWARE_GET_VOLTAGE_REQUEST(_id)	\
> +	{					\
> +		.id = cpu_to_le32(_id),		\
> +	}
> +
>  /**
>   * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
>   * @id:	ID of the clock being queried
