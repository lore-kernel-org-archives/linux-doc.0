Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D942D3ECF
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284280; cv=none; b=hK1PZ+uCanzT3uIp4DbPKvZEDDbEE7Z231rkhCG5689Zinq61Gag/E6YJHDscRMdVTybdeFm3v+Ib6NsNiIUpbHN/HeErMMkztuGUhWPLfimj+6+rnL9BgbqafEAzUO2Rtwxws4QCnuq6j3dVWtCzbvO7t53RGTErLifMepV+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284280; c=relaxed/simple;
	bh=XH63ct7iIhKeSOJDhAToPMJ7pAUUY4007bR5OMXx2+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Co+TsdpCRXl7pQvW2puyRdwAWhqykEhAMsHwfrrnJnhZrBBirljQe8WMMQ5G0AijyQkOfRh/BEDas0Gf0GXemPsDhvzyGOc/aJIhx/xJT013XII6vLtzpurIXOObtlqtgrTbIGmmgk4PC3UxXcCcALqhTHBGTObB0nA/vTYar3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT/k6g+F; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT/k6g+F"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-303f2fb7225so3038146eec.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284278; x=1779889078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8AkZpbZCTo7d3LdnWMBBV6pSxnl3OrCMz1va21zOtM=;
        b=nT/k6g+FYzyaEatJYQhAFvrc3oHiKf8UfzLfnGZFA7q2iGgesFToZx+Bk492i99mN9
         6ojQBvb7Zuyog18oJyYUk4BKf9Q+mffHwJKMjGx+ePwVEFyG8F2lpsxV5l1VrtnMyOlK
         B25JMTOL7l+3/p5lavppNMvFbzkN1sHi9oQZsMNGPiCP3GXqKQgsbTawjFEeD0tcZUD1
         8+PGTyNYS457M6qXhd/RWB1IqEbCd17c0ZrhH2KzEN6JaepXp9qIxxjtawUuXtenZ7bj
         FyPOkTV+kuMCvGv957s/EakWLqrN9RnARWbp72tZqhxBcpCm6wpXWipEkUdd0FnPDIQd
         yRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284278; x=1779889078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8AkZpbZCTo7d3LdnWMBBV6pSxnl3OrCMz1va21zOtM=;
        b=MKVp/4Zajzmola7dy67bOzmK7dpUeiYTK+IrQVrRGXvFEkqaRf3Uncj9/fL2YhpM5Q
         W1UU/FOWLwfUEhxvIVb6LTm9gbmcBnYWHFZj4mCW7GUm3eQRuo17BTIHz5+IgJEexlom
         EIxSgwAQoc+GuHjf1v+jBmA7pzXE4POdrCu498eJGcdxFPFIp+RFGwzz0VCRvzsjM+Ro
         AAxlB8k/9ToPTihViJM8+2JartSdc+6EIaBABPrA9MN7GPRmAhLkaourK2xw/v9E4b4p
         oUJgnTioqJcKNGO2ska8yO/Hv5Xfz8EGG9eENe/himytXDofYx0Lmwal8n+Pln+kvsp1
         OhjA==
X-Forwarded-Encrypted: i=1; AFNElJ86SaCS9zo5Gt/Ijvsj0WYMlOVhXvUIY3macPsDpxGsrg7Latj+NXDZMe40FW7o4nNIZYd0G64//bU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLgoKO2brcDd3/SCbCZbMEYEgtyifKnozFB9L1Rurve6Kpq0s
	yEZ+FTXPGUYCXELw+ZTgKktJCxYku33RX4jfqkbzwlQNtf089qNAiI3b
X-Gm-Gg: Acq92OGrQUxl04z0oGoeK2eD6DCo4K/Xh8vA4IrhuxeuavmOfJsXft5QzDRqizUsnoH
	HK2VAFGDFWIbK/nBxs13MQ4QB1MGLgIvu2QSWRgCEY8JRAUWVFqW2fDkxnOMaSrsr7gbOaspiRO
	mwlToH+gUtFKHj04X0mHOGwY0X1Vty8W5/3MNLd/zqeFd3L4C1gFPp49Fbb9T5F3bc+opczQvTr
	wsq9JMrMR/kdQanedMdXEoUqgMywSp744ScQt2+PWV6ME8Vp9kaE6ZxEEAu2AU+0ZJnsTSlut6x
	SJKp5wLNM60bhbuCUm4oCwhRtF4U+ERT5rlmomQdwiOqgvPmo0c9nVE6gX9/foP95WZKF16dhGh
	fngQmN+a0/rGs2kbuhMEWdBWeallcgS6d8+BQFP1v4gLLCyVkX+nmxGu/lF+0zBoR6Bbsrbl7vp
	aDdTTrPOxpb5QvfknmevgSrgX5eZyQiWrCA7Hi/imSibpcd0c=
X-Received: by 2002:a05:7300:6429:b0:2d9:2b54:ea9c with SMTP id 5a478bee46e88-3039867e6efmr12060147eec.18.1779284277938;
        Wed, 20 May 2026 06:37:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm19200837eec.7.2026.05.20.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:37:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 06:37:56 -0700
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
Subject: Re: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
Message-ID: <ffaa4944-e839-4de1-bb6c-14008a81cd06@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>

On Sun, May 17, 2026 at 01:34:44PM +0530, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>   - in0_input (core)
>   - in1_input (sdram_c)
>   - in2_input (sdram_i)
>   - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>   Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied, after fixing:

WARNING: Missing a blank line after declarations
#207: FILE: drivers/hwmon/raspberrypi-hwmon.c:74:
+	int ret;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,

Please run checkpatch on your patches.

Thanks,
Guenter
