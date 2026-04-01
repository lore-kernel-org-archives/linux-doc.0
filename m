Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3DE3630B8
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057571; cv=none; b=p46/QIDQoelK0yQ34/VYLeg2H1mh+c5O4EQSU18dEcS/CaPXCf3qcS+LSYhPOrRRRbL0a1KeeFNKCCeDSTNLg5WxAY7+UT3lNUAEDFhzDn7ByvTXz3ZwWzJ1OrypYo28fPWCpOVepie1B0dSbi9rvzVtujSjtWF5apFs87zGuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057571; c=relaxed/simple;
	bh=Ai2/x1kqo80rkpEaKRRyykEK4jbPrETJQvivg8Hd8Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8gklb9l4le+hcegIHNtSdCFh7kFKu/5JiUQhC7xeLF9pSqZSuNCDu7lW+4Mhdy3xE/Pr9P0A5HSm3uKOaIzrTEvyrx9LnU25nLMcwYyeZJRXLoDuewCUsEzTey6/HDFGeEe4St7QWM+A2wUSeRAb3LVIjCiF3eF6m9Qk+7sqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtXA1g8P; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtXA1g8P"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12732165d1eso9786446c88.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775057570; x=1775662370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21I3m8LqYZE/Hogk17E7dwBI5zTNe6gNNbn7uLVQjko=;
        b=jtXA1g8PoZrrOpDYaeJfsEf5yaA4/fX5+gX9LMPMddB8xYiVKy/T4gkrMrSwSTL1A0
         8M/08Vcjj/8P0TES6zm/rvrngzfmH5XBA2eOUvWSihKryOXnBmhmiIsgO+ycUkiMtkhi
         4UbWtCJg/Jw71DcY5lyZqXrfa68ARG0T5fU0kEg8x4SmUrlFIJJWZ8k3vAJdkfiXaUOO
         NQfyA/n5nCO7PwOGMIpy7X0FgcGWFO2nQwRA/xlMR3fXgNknyDLFp9PRSd4ojrrm7IcC
         0aDJlJ6KOqke3nsre35iMeqZQnExGw3yf69wsGdgdX4oyFa8AgMSQpIgqlMRumvdapzW
         eehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775057570; x=1775662370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=21I3m8LqYZE/Hogk17E7dwBI5zTNe6gNNbn7uLVQjko=;
        b=SEXEOZJ5eCIn2d+LRYrEU1Tf6CTH9mwOy0RkGq4h9zOc5YPitip1VasG6yuDj0L/xX
         lgvREo57sonjubTBgSIM3p3t7XxphhtvI+JV7t8EZvt0E4R7P/Icz0K+PVmuYA3dmAEY
         5zyVEyL1fydj8wQeFZVx7QI2tu5+mBu+cCFEXfMiQt8yhfcrSWW717/VM7WETFAGcadB
         FQU+jT9GTWkpeOZUl7VjWbb5k5DyzH3ANTvjqAHLpaVMbkQ67J5suAgcfitqaOz43+f0
         X2kfPZESz8gOoFeUJ62evKiUq+/OT196UC6vY1QV3fHZgQ0r9okSZOrgQqkdC5trlUcN
         Q0zw==
X-Forwarded-Encrypted: i=1; AJvYcCWNOi1AsrFJPF/KCLPql9EJxWMcYQE/7fqjIGuBN1yBpBVUnfB6n+SpdVsztQkWRgmNIe1bUviF/VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6GB9+b5ngq4T6O2lz3f5BxA/Llf23xmg8gpDgX/YFSEeIlDez
	/XteI/jZNJGx961RzcAJMh2wRBfhpDsDfvmd09yRBvTWMtHCgem4ubOC
X-Gm-Gg: ATEYQzxHMZbpChkQYoyzIgTA3kuHCdTQzFNOtoRTPd9W756jYbGl00PF3s8KL/OSZJ6
	ctCcPe0s/7pwU2WneKkj6DovN2szVZ/BAlBIlBE9MYJBtynXwpoRkhpFaWkQd9wbE06JYoXOEPO
	02usUS92JH6/m781UetQOMwd7rlZzIgnlXAu+tCY5P0GlvatQ9b5LEy/YrMa4fZ8MRJ/jIrYf7k
	+zq0KRAefFP6Zgau4FuADVTRbcgcGS5Y8PvlcnEOjiIoKFwKqvF5wLiZQWC4N4YchFy6UHcvp1H
	q6KtSIpPTikzrNTACNDXHl2jANEgc4XuSTquSFTwwipnLtNBYq/QMayxxjcN/NYuLwt6ZnyHUC7
	BkAagnCMUv2BjetkISF1tnclHblUOCxsRu/Oqr9BeR4/AYf9xralq89UveYfARLXKSNR6VBeRZP
	HNDLTVMVbKyIYyJpEKtCc5w2DH6BOZlctOjfZO
X-Received: by 2002:a05:7022:6288:b0:127:15cd:9f52 with SMTP id a92af1059eb24-12be6457e26mr2297000c88.5.1775057569588;
        Wed, 01 Apr 2026 08:32:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd4e4e3sm131752c88.1.2026.04.01.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:32:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 1 Apr 2026 08:32:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <aae8af5f-a61c-44da-976b-55fd684cbaec@roeck-us.net>
References: <20260401112654.60560-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401112654.60560-1-aureo.serrano@arctic.de>

Hi,

On Wed, Apr 01, 2026 at 07:25:54PM +0800, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller, a USB HID device
> (VID 0x3904, PID 0xF001) with 10 fan channels. Exposes fan speed in
> RPM (read-only) and PWM duty cycle (0-255, read/write) via sysfs.
> 
> The device pushes IN reports at ~1 Hz containing RPM readings. PWM is
> set via OUT reports; the device applies the new duty cycle and sends
> back a 2-byte ACK (Report ID 0x02). The driver waits up to 1 s for
> the ACK using a completion. Measured device latency: max ~563 ms over
> 500 iterations. PWM control is manual-only: the device never changes
> duty cycle autonomously.
> 
> raw_event() may run in hardirq context, so fan_rpm[] is protected by
> a spinlock with irq-save. pwm_duty[] is also protected by this spinlock
> because reset_resume() clears it outside the hwmon core lock. The OUT
> report buffer is built and write_pending is armed under the same lock so
> that no reset_resume() can race with the pwm_duty[] snapshot. priv->buf
> is exclusively accessed by write(), which the hwmon core serializes.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>
> ---

Looks like the patch is corrupted.

Applying: hwmon: add driver for ARCTIC Fan Controller
error: corrupt patch at line 587
error: could not build fake ancestor
Patch failed at 0001 hwmon: add driver for ARCTIC Fan Controller

I can not figure out what is wrong, but both git and patch report that it is
corrupted. Please fix and resend.

Thanks,
Guenter
