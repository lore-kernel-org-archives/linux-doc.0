Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DD635F180
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344984; cv=none; b=m8wMPYXcNV5Gv6QfKZowlmNr6yC7g5RPuAwVS7vEDR5lKC0sBr/66ctXtpiHDRx63COlMb0yvQPDI1fBZDggzR8YHiBZulcVFHdZoT2QUjvyO3uXmN3qHHB/u778XOxXfPI8oIVKOgQwydxQqzksp1BDAMPqis9Vo/LKlh0xfzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344984; c=relaxed/simple;
	bh=VUC4l/F1r1/YFXEL1xQc8lU297sWblxuhQWuv6JfZsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPjb//QhCZhoXYw4g9l+Si7SRapCpNQGJhU5zbMQPUB+srMR8B1fugvczMxX3qEIDXJPf1J3vK4lljPGIY0INYZds58HAwu7HMG7yVYjjBMge8Q4oHcjsIWSPDFBlNvoIN4qT/6upLZCz5rZugZ7My9wVMvSBe8Zp06jQVS+BC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC/3K7+H; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC/3K7+H"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so6669975ad.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344983; x=1790949783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N69Zh7bBqUcbkkYmaE3n3pY4onWHGYP614jgtDR5fU8=;
        b=FC/3K7+HDVAKxtYKO+IDw5puanf3pRgXRags9DMJmmQ5ZS/nK+9bde5EVuamXfVyK/
         m4rLstN1GUWm+VvGv3WcCN0wcsKf3da/jKHfxTmjTCTCjpgGqk80/PZR5b4xwxWkAVEN
         BWtepbraY2Shv9kV3C4k6a4BFTFYlJ4QK/wvZ58UZNEIfspnmPcvWxKo4uxNVVZPOX1Y
         iZLUMp5PoSpZF9h5ANDkRLu3lVE7FUMCaUNn4/dQsRKYH5ohAzsbdT9HR5NDaT5HKxkd
         D1TFVSvYet4XRUEUD+JYd2BA/9VG2fKYeQtJsimslNZ12EOaWpXoWzpEaa1k9mxxDJCQ
         K5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344983; x=1790949783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N69Zh7bBqUcbkkYmaE3n3pY4onWHGYP614jgtDR5fU8=;
        b=xxJe3q+s3ykF1pm28pNJYbG7ym72NIRJxGlBDkuVaxUaQaDEFDcS+huG11tVPXAGXz
         ubxV9k7P947QNTzEuf5Pj6H0PHu0n/j6co/ZAKpuwpnGgm9tTJcM4uEunmLhZEW/cVwx
         EVThtaigAaN1xTxGYutI3vPRdbB2mw1K8Ga5Hc8fJqlmeH4MaZhuR39sVkaP5qmQnpwL
         UTWOTmSY6Qze7tQIm56ylV+lRUTM8n3WPCughTLzKX05VX8TeNpZspGQJv3ACAXyvRrz
         EXsAQlbVMGyUl9S93qAoPNkTjXrTiIx6aD5B+K14MvH6Mk5iHNNVN5BoZa0kvMeYe/za
         l5gA==
X-Forwarded-Encrypted: i=1; AKwUvBzej4qgiWYeGoToeI6F1GpWHOaEgXw5b1oq2lqSUEhnaYnMcEMHN9EeKMPrBrokGhUfj7d2NImb66s=@vger.kernel.org
X-Gm-Message-State: AFuF++nbWr4xblf7YRNUeD8l/LaRQ3eUFeH415HWqQ6w9lixMBtTPQf6
	wptwBwMeUI55KRokfsEVHPwxOp+OEPrMsOB2PXQNfQKwqaQcOTi2eHlQ
X-Gm-Gg: AYBFou3Bma/hyQ+RKeVQdlXKL+xdtWj6oXA30hgeWqJHZ9wDP9wf4mNh94lf8Xb1Ubq
	vZHaywL2Yd9425ZJ5gEOg1/Qhhuc5+JqIjn6YMfofTC7scSCSTD2tBvz7XT/d9ci/WH7wEOonLR
	fiT37J6sIBfJuSkRzYfnBfR9RNjUfGxaxLG48bMYjD8zxzoGAp2IqyPgph76ybQI8dPBgvJ+3mq
	XJP0ALB6HfNOJwm4MtNTqAlfKkPTNeDErjsJBaSWkMI8ZfLgHSu1MP7Psk5MXX6RlCVL4ESQjhQ
	wCv5gJIUuZuZWwPhiMVR6HL3FVFlzGzTcNiiUJUvk0unpR3b4cCLMQabwLpTcsJyq3w+4CFiCd8
	KeaU6D2zQYYo/Owjy5B+UX9lNB2JVGDqoAHFfe2Q32hug+uLutsJpflX7IAbymCHhX8YQ+l/5d2
	q8W+9dftunytPDeGucRChdfIhwS9hr0CFEwy6brAJVP9gHBWQZ/8shgpx7Awxz5BUnxHLjFIrtd
	QLIGXBs0qOYBg==
X-Received: by 2002:a17:902:e751:b0:2dd:ad73:c936 with SMTP id d9443c01a7336-2df7da9e288mr44860965ad.23.1790344982378;
        Fri, 25 Sep 2026 07:03:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913ff226sm11074415ad.34.2026.09.25.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 07:03:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 1/3] hwmon: (coretemp) Refresh the temperature on the
 first read
Message-ID: <486339f3-8516-4c88-b823-25f567c14f3c@roeck-us.net>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <20260924-coretemp-temp-fault-v1-1-1884f0ff97d5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-coretemp-temp-fault-v1-1-1884f0ff97d5@linux.intel.com>

On Thu, Sep 24, 2026 at 07:33:20PM -0700, Ricardo Neri wrote:
> show_temp() reads the status MSR only when the cached temperature is
> older than one second. Commit 5c0e64dde80f ("hwmon: (coretemp) Remove
> obsolete temp_data->valid") dropped the tdata->valid check that used to
> force the very first read, leaving that comparison as the only trigger.
> 
> A never-updated temp_data carries a zero timestamp, which does not look
> stale on 32-bit kernels: jiffies starts 300 seconds short of wrapping,
> so the comparison stays false until jiffies wraps and passes HZ. For the
> first 301 seconds of uptime temp%d_input reports the zero left by the
> allocator rather than the CPU temperature. 64-bit kernels are
> unaffected: jiffies starts at a positive value there and does not wrap.
> 
> Backdate the timestamp when the temperature data is allocated. One jiffy
> older than the caching interval is stale under either word size, and the
> first refresh overwrites it.
> 
> Fixes: 5c0e64dde80f ("hwmon: (coretemp) Remove obsolete temp_data->valid")
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Applied.

Thanks,
Guenter
