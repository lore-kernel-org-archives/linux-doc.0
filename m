Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10025188583
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734681683; cv=none; b=j4ShR4vBBxeC7sM+V578YjNA2YB1gPDglzTc89cuR6CR9SvdjNvC+JN5VMD6bpjdjh2PkILgnXWz6NKTo/tzUSGzMEXyUMIY6xRXN/72rBpljfrF9g53db/Ie6LEYXYwcmV32tgceeszKakZ5cPJSI9rzAlXePpC3MCRzWZ9XsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734681683; c=relaxed/simple;
	bh=NE5UTe5dL2tgOgREltmleH8b3bpmPCFrFKyTspmMf80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjnrSXdeWlqxzUO5wgHrfcqGb0mqhhS+Lkp1E2q9pJZ/j1b7J3+v1PgloVtuXdV2c9xavF96iQ02Qd5irSzSq8EICP4wvwnvf+t1N8NHqcy6vRa1xBb+BgxCQtO6O4NyB/Ucy5SzDikh7onJIOoi+vU+oZz4dut+23WfR9xpGeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eSmJO+yQ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eSmJO+yQ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862df95f92so850766f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 00:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734681679; x=1735286479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SKyhp6BgensMeRRvZqUrPCxPSGMIyjt3ZLLIV46HEEk=;
        b=eSmJO+yQY3ikfctv/+vARoTLpS+jvxLuxKKJeDrJhxiSb7hdJ+1fSF8rRrPOVj2clx
         QrTWatFfb3IV9cnQpuQlyxl1wsfqnL194XYptUwG3y9261LiEDC9mWJWs8UtTrIpxiU3
         +kTe9sLwEx9NgfDb/nNNIXNR5JteW5o1rCLyKwVRNU2QStpSO3+nU72ehJlcFu4qEWmt
         4mN7cKp2iErz8+cKXD8zwijAdlleqFVq6P1+pMjRoDnuHJvabdVnYRPX1AD3tovZbMfF
         s9SbVyPKtO5/OmKAstUUp9Z+/d9hs1N9tLwOz+z8Dq2CcSJy+QJ1EkB7KfLDQziVoZHl
         wZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734681679; x=1735286479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKyhp6BgensMeRRvZqUrPCxPSGMIyjt3ZLLIV46HEEk=;
        b=HFqrl/78jhYjvflNoshu8GGJCQurVQkEBY4YBVlLoFIjcMA49hIovcF1Z0HMEeAQR7
         olhYdVNQ9Ba75P5xS3d7WbPW1W3+wsvXthCxLh03RNean5WhVqnAJ82lYggV5z62re1b
         Xmmgi8tiJe8CAvYUii9o1mdcGoETrUWq8G1Dy3jBt/ZP2Dpmjy5pf0q5brEwv/IMELfN
         /EgXzE6XivZhmqKETP4SgNl786j4//XEsSq98lBGv88znxLPjkl5nuiE6NpLIx2VbfOZ
         nDEW549ApUfn51P3tsVqXHyMekn1xXzrB5OZo2Me9vv2uORttC9NpBMrBUdGe8Lqgpw0
         6bcA==
X-Forwarded-Encrypted: i=1; AJvYcCWRFFPK8OlQD8uyHCiJw8qIDNGQvWucFAj0CYfO3r9imIW+9AzifV9LA/He/wjzj0bDbgbrcbgRn8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzvaEi1Bd8e6ipzdWjd51byc9eTsRA7pNwGKk9GW4I8CNd4LwI
	rcz5D4YMaglvqHu4JmJeLoigem3MX51AvcvF0Bi6Slun2hwXHMDLF2nQBCDuXaY=
X-Gm-Gg: ASbGncuqxii7+ioRcPu/2TSPFzofIGTAS0Ma8FaSCjeiRC5Q+wXcPyBFH8tL62D77Om
	28nBeMyULQ6bxSBnZYfxQDLTiDIxahmKHWoekqP0T7Ei3q/l2Kj/7K/6bQqrPa5OQhm70K9OCzc
	GYuxsZKH/RXIyXtDsxVo41zK/q0oJthD9xXlfRSsrsYWbVFdVAAzrpwHs+z81mgymfmnb9vxLAN
	ucQdQdsSE2ox9Wemvwa2XgdrCi3c2ee3K1ezarzYpQI68pRd3vMGfM4wg==
X-Google-Smtp-Source: AGHT+IHXox4MGMtqEmaRQepNLJ8T0HqucVd42uEX9LRMu/wtsBIAtfuFnBpMs5FOY09ZQTPXYQQpFQ==
X-Received: by 2002:a5d:598f:0:b0:386:424e:32d5 with SMTP id ffacd0b85a97d-38a221ea939mr1735076f8f.14.1734681679359;
        Fri, 20 Dec 2024 00:01:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm38048325e9.27.2024.12.20.00.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:01:19 -0800 (PST)
Date: Fri, 20 Dec 2024 09:01:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saravana Kannan <saravanak@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: lock in vsprintf(): was: Re: [PATCH] of: Add printf '%pOFm' for
 generating modalias
Message-ID: <Z2UkTMz8bHNN1PMq@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2K_u6jK5aLDqaam@pathway.suse.cz>
 <84wmfxm6em.fsf@jogness.linutronix.de>
 <Z2Q2TcM6QPUIIyLC@pathway.suse.cz>
 <84o7171o9y.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84o7171o9y.fsf@jogness.linutronix.de>

On Thu 2024-12-19 20:17:21, John Ogness wrote:
> On 2024-12-19, Petr Mladek <pmladek@suse.com> wrote:
> > I do not want to revert everything now just because of theoretical
> > problems.
> 
> What would you revert? This has always been an issue for printk().

I did mean the already existing printf modifier which already
take a lock, for example, %pOFC.

> > Well, it would be nice to document the lock dependency in
> > Documentation/core-api/printk-formats.rst
> 
> Yes. If any locking is involved at all, such specifiers should be
> documented as not safe in NMI context or within printk_cpu_sync
> blocks. Also, it should be checked if all such locks are
> raw_spinlock_t. If any other lock type is used, it probably is already
> generating a lockdep splat since printk() formats records with local
> interrupts off.

Great point!

> Perhaps we should create a kunit that calls printk() for each of the
> supported specifiers and see if any lockdep splats appear.

It might be possible to somehow reuse the existing module lib/test_printf.c.

Best Regards,
Petr
