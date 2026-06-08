Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E429B78D
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924938; cv=none; b=LJqN3XQUi0wlH4YhxnuX/87bM0zSv5QtB8uyjmYVh3+OEFi459vilRX4+z7io1BnVdRxYSYCcE4/lGh00rLeflBNncGG1VhJw6t7aK5VKXOQHd0gXBX7Tb8qKr/rbmQYQOKGA7kdq+Bs9PEoIAuef82jA+6Ed8AFif/QNmRKbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924938; c=relaxed/simple;
	bh=ZIApfaH7NuRnxk6bMvuZQfq4q8wrE8tUVpPJT96zo/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYdB2cb9OSLNo86E9rMFSX7NaI7VghHA3UEa/36E0qpoChiSWkRwDwiyMJrNbQF2EFI/TqbK/Y6Mg7aRyySqtJNLNPU6mEMZLJApiKG1UgNExkaeKx8MTUlxPoiBBJHFvGmW07YTASkiixqneB9YrcuPQay7g6Kqtaam8JUSnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bzSvElCz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bzSvElCz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2236768f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780924935; x=1781529735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUEnvDqz1SSyEKVvs1pgOac32s1g7LZkjL1zUnxDxK8=;
        b=bzSvElCztRc/E63b+u+Tgk4iLiqt4Vgy397WL01wPf7DHOH0DFuZSJXA/z9gjljHKm
         XIaHzSvnPu0tw3QYZt8sVoj0GufAtUPWT/kqnc47X6Pgl+nLSJIoo1emprF5ItUJDRcL
         LVs9Y4vAi7ex+DbIQIzyQ5TilchDvtMAqAjKOVtx8z7UN6VGZS1cXsgIW/p+Q7MnuSS2
         Er6+kT6gGcvlLC2bztZ3gvcgK3OQkD8d3rIP+k8pBj6xN3MIq3MoE5XTSr06DHDG35zV
         wuZ8A84mVm/+8GjmCFpMmBF6lhwQrdywC1yjTE38X37X5gzHzChPbXOZWVzGvltX54NY
         gGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924935; x=1781529735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUEnvDqz1SSyEKVvs1pgOac32s1g7LZkjL1zUnxDxK8=;
        b=RtwuD4FUvNuXjlcbcqDRTTMNo5LF2YjV9zIvEXzj/KX2DELIhy5uYfoMvnxwOwQnqw
         vhcGVfwlnYvIGxY8vtIEU7V8tsdln8/baoEwMcsookhxdTbNRORy05wLKtZjKNJvMa3e
         w8CHv642sT6ls1NZZRNPBmsKvWQRxPCfPIJrrozOUpRTU+Ufy6DCuF4LxdefEz+s6hyn
         kT3b7UkWb0Nn+G1Bmz5AnL5b3REC7/IqT5qRjmoYg9UKN9PG7chlQQ6UXRayv0zcY8id
         UeZp43kn/aJkkwM2spvvtFjPmpbfatL6gfiQXdR1XBsWA8DlyXeVlwSIucnup6DN3Ist
         uApA==
X-Forwarded-Encrypted: i=1; AFNElJ9/WZdsPw+iXP+FF9weKNJkY1fQNlKxPdwS2gCKjHTjzs3wGRgnOtJpZ00epc2RsyYZP2hM7GzTPa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YypmkU2jFRTX9I5bJi7dWZ6XYB5gbeEYv2jsoXxCOibgdNEDKvV
	X/bNylDi7+MOjTJIBfIndprun+yTJpAhHqF/5DeDfSkFKuRyad7Xi8LKhPYEllXN0HY=
X-Gm-Gg: Acq92OGwL1sdBkBgQ01SYcAOhpAdehGLJluEoFSkV8rya5f/T8//KjDaWcgAUUe0loy
	bVgb6875DLWObYMNTr6+LhAcqS09ludc+u6UvCExmwAUImNfO1Iysyu/9gJqG/EFTnZ0GNvpkZu
	DBmJ7VyJCuzy4EkHK9KK++wcdcCpJu34Q3Vy689LHlLZ4Nho0wcHPn6WY05Ql0K4nbyRFd6qPRG
	8rUP8y2gcwXyJsbxnqCZ0gCk04d2Za9HQaBo8wP+5BYvUjsT/3a3Kb+D0xruArGpwBIuR7KLBzV
	tx9CE+on4itH72T5cTvHLL89kETX5HqUOmq5aw3/KLqOAakG3RJyjPpFY9TLCukF9wnp8Y95U9q
	MoMVc8eKeY6Rv3AQrtvVD4Z1CG62HtwXgz4rbVtc6rg+W+Zh0UPxgM8ZmSiLAFBsRXpHHDffmKe
	QsyBBBUpFuNab4/yOaQgvS5DJD5pZTryFKxz17
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id 5b1f17b1804b1-490c2508a5emr287463765e9.0.1780924934875;
        Mon, 08 Jun 2026 06:22:14 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm428671945e9.8.2026.06.08.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:22:14 -0700 (PDT)
Date: Mon, 8 Jun 2026 15:22:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] printk: remove BOOT_PRINTK_DELAY config option
Message-ID: <aibCBGjVk4yqtYyT@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk>

On Mon 2026-06-01 00:17:37, Andrew Murray wrote:
> The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> are two distinct mechanisms for providing similar functionality which add a
> delay prior to each printed printk message.
> 
> In preparation of combining them into a single configurable feature, let's
> first remove the kconfig option BOOT_PRINTK_DELAY.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

The option allowed to reduce a bit the vmlinux size when people were
not interested into the functionality. I am not sure if it is worth
it though. I am personally fine with this change.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
