Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2761770F1
	for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716391877; cv=none; b=dtidDfUgs9nptNEo64lT/UrI0+SjJLuFkko3aBpaBMjRp0OYlsoW8RY7H9OJDmmqhRsurngkdBC0jRi/QgP/9EAFMrkRY3TZIKnVeuClwLWcF2SBOVJkGkuwa48AkE00zjtdE23Zux2lJAb9nk+hrGpj8XIEfZg2cAcjyKZ+Bxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716391877; c=relaxed/simple;
	bh=DblYs+ScPiYd2IWFS83ByHnJTeIt6Z6vSH1U1R5ojrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTow7tzGdVYLauHUZX3NipmTji1zRdal3DR0GHGv/vBGEOK5W80TJ/0udgH5xJbaVL3BiPgwCIgvnu7RWcmTbxPVNqZxB44iG4LXGFbVd163zLEL0C3Iy8sbbVhRazz7nD3UCg6xfwoIoRQV+swgkep79Zdi/yudEl5MDS7yRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZybNjzWp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZybNjzWp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-578338936cbso1461112a12.0
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716391874; x=1716996674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOnW/DfLA3xJXZ5u+WZq3O9RUUMYHYU/muej88lDrWk=;
        b=ZybNjzWp/+wwasCT5weeIL7CIV9zPVbn/53q2/YeEdPzrRjUVaUi6s0hooWjaQLh57
         ACf3NUu8vvJM+BtTMi3VwOKEaH8/xzva6JDJhFguY2xOMmQkWY8mVSBuTJb8+kL3Ei1W
         QExy+8Tuw35gz8NEzePbjK1dM3BrB2q/Z+UR/BQ+r/jm5kYPftj0YT9d/Ur07hyGyh54
         hI41sihIJIAG7qRRB0mU6h5b3pAP6phowMoKSrV/UTCd152tc2nq4KqRYI6/TqAoTCm/
         0KdqR8UQVKLk5iHuh57Z9UHegna2I+Y+MfgeiDBIb/jwskkZSqtLHNXTUXP/p3II5wyJ
         FsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391874; x=1716996674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOnW/DfLA3xJXZ5u+WZq3O9RUUMYHYU/muej88lDrWk=;
        b=oeJPuaPQBWhgRSjOyJVhQef++iaUiuLrgwsOrFvHG+ydRAcrx0lKM/RzRH1sQy/89Z
         YimRZUqcfP5ny3aAnvgzqEtXw0l8OprivTfEOLoHBKJIj21zLBTqEISLuCvIz17wQJzU
         FXRr+en9SNYfeyhC9TLvl6iiPseoepnFJg/Zhsz68HjNruldd5+BDKCgQNlLpKazm39T
         ZiT5C5ZPpd/ZCgAoWamMyM4q1kafoHLbqgbZ1qF7+GDGsye2AeKCSalU0b5feoPXh9GG
         pxFHIwP0EHmFa7djYyOfZiYEQQQY+Myfj5EuNGer/4doEkoHsXA9WK4hQQqPpsWkXgv8
         Qodw==
X-Forwarded-Encrypted: i=1; AJvYcCUe6bX62XSyXD6rRPAPOIk0GQDZZ967ZuP9+GR0cyX9UpxI4r+Xfae+p4EViOconVonCcSHww71DO1g/QnZ65pxzdBoc7NDh9OZ
X-Gm-Message-State: AOJu0Yxfc+OQtDxIDNIraJE0vDqQiaVqPpzGPtjif2brWj8mSqCgOLaX
	p96FMPlTw+5kUm/afVJZVGKXHG9Ye/UmnSLDEju3FjdSYrLvOxbWsh1/j6ZBmfWe9lS7U4/lmed
	m
X-Google-Smtp-Source: AGHT+IGqVvLYq+kT50O7GsSXXYDLUBYlTXLfwZdhz5s8zKLbBgML4M/AO44hf5zj4i1wkF2z2CAoEg==
X-Received: by 2002:a17:906:3cea:b0:a59:9f88:f1f1 with SMTP id a640c23a62f3a-a622314c52dmr217055966b.19.1716391874015;
        Wed, 22 May 2024 08:31:14 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d40sm1781965366b.75.2024.05.22.08.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 08:31:13 -0700 (PDT)
Date: Wed, 22 May 2024 17:31:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sreenath Vijayan <sreenath.vijayan@sony.com>
Cc: john.ogness@linutronix.de, corbet@lwn.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, rdunlap@infradead.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	taichi.shimoyashiki@sony.com, daniel.palmer@sony.com,
	anandakumar.balasubramaniam@sony.com
Subject: Re: [PATCH v6 2/2] tty/sysrq: Replay kernel log messages on consoles
 via sysrq
Message-ID: <Zk4PwD2ZLldFAqEE@pathway.suse.cz>
References: <cover.1710220326.git.sreenath.vijayan@sony.com>
 <cc3b9b1aae60a236c6aed1dc7b0ffa2c7cd1f183.1710220326.git.sreenath.vijayan@sony.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc3b9b1aae60a236c6aed1dc7b0ffa2c7cd1f183.1710220326.git.sreenath.vijayan@sony.com>

On Wed 2024-03-13 15:52:52, Sreenath Vijayan wrote:
> When terminal is unresponsive, one cannot use dmesg to view
> the printk ring buffer messages. Also, syslog services may be
> disabled, especially on embedded systems, to check the messages
> after a reboot. In this scenario, replay the messages in printk
> ring buffer on consoles via sysrq by pressing sysrq+R.
> 
> The console loglevel will determine which all kernel log messages
> are displayed. The messages will be displayed only when
> console_trylock() succeeds. Users could repeat the sysrq key when
> it fails. If the owner of console subsystem lock is stuck,
> repeating the key won't work.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Shimoyashiki Taichi <taichi.shimoyashiki@sony.com>
> Reviewed-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Sreenath Vijayan <sreenath.vijayan@sony.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
