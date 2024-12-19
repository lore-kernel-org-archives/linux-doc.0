Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC322576F
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620757; cv=none; b=OY3M+0BzY5/w5hnjZWAD5JSnWNtIR6neT/xPaq0cUKFvfAw9JtA652HWFpOCmx+ZdUHE46WTHmeFhO512XEC9mOssCSENIwWuhOwcqn70sLzKYWS1XCbdSCBu1bYTKLNMdzbpZxg5rVPKP0DZIhpOK8d3qTLQ6VeHkb1dth1iQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620757; c=relaxed/simple;
	bh=2DPBNwwFtCXNNQDYKOGB3DV4olRZt8JVKj5PKNltAVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGhlpTaMOjZ0zSXeL89AdAoPvxV4Rh1Z4sqDjvW0DkjxhnOBV/RYYe6EVS+3pU6nXnN1CDLsI3DugDmhRjS/938VFcUqF0lZKUNkcvNsahrdCXwmKmuCd/e8qQ0K/mRH6ErEmnSgyW3YdnGiuvaRcvLmsm+iMGD95nu4/BKmg9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P/GE/P2N; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P/GE/P2N"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385deda28b3so635481f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 07:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734620754; x=1735225554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNh1srzTDX7fxdOhME+7XNw68M3lxtK8g+1pB5Q2QFM=;
        b=P/GE/P2NDBVatZvg3z1z5H4y0xuNakDxqdxd0Y7D2hiomhf+dx209+Y7rlhG+B/S38
         yZNjnBkx6kJa2nl84l+477P1zsPpFbUtVnfYIx8vjI43pfNETOFNGr78AO0Y5uImeRzo
         Zh3W684zrEqx35cLLRgTSSUP3ba0QLSGeKwndc6f2kckgTRTjSKATSurktz4emmKuuUX
         0yTPZ9X0PzkWUhA0ZT6aJPyv52mS2H/w+JlrqWX3wYruNG+rpLlMX7YxcIqxbypg7mY7
         kbtPSsUIyyIgG2d8/sMQxG93AroyNejGn8KvtofEIxoEsrwXMyuD+UArgOJv3r43B4yD
         FhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734620754; x=1735225554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNh1srzTDX7fxdOhME+7XNw68M3lxtK8g+1pB5Q2QFM=;
        b=sAF4tYJqT0fkkbZKmT3wOuCzZJdUVh7As1OSAGGxyAbnGT/I2HluRd677HyKcF6mnl
         5GX/MoWiMkPMPhu0GyKdB9GmYGPvq+mI4HkdPTRfIvC39Ibo30hYqnA8ZiMszc26OQgR
         9RLwc5+gphvCdHdPkcFhoZPQtTkIGyiqyfxemy+uy2KYVfNftqUfqrZ2NOnfKhgaNAA4
         NZcalMZIyquMVEOQl+o/rqixhpYvpK+lVg7HPaCQfoOKmkqFSiAO6DdsIkBNZJffdUHN
         OZs34YBIU8SM7Wa8Kq8dyWhyDrrqhZ12RoeczrJfHA0L4c8QKHnvq+6vN5w/nmFM1iIC
         cpxA==
X-Forwarded-Encrypted: i=1; AJvYcCWOW/4mZZKGgXye5H70LcY0hctFJ24oKGzoMQKB4g0bzRpolTqToGEzlAOitt8pWR5x5KhAIN/d530=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRP9TNKopByEdZXXoIfXdAKxCPJsBszudfdxayqUS6GAyiiMgJ
	3x9ojlfaRDuWWSomjnSlm66gF9QE2MMBBd6v44YF8giKRoy2XhbbkZb/RprLFR8=
X-Gm-Gg: ASbGncsw2dqbREjZOrV8zQSb7nOkRznwTdHCtWIwBL2FZfbf+MUPEpQh/AAW5BsBUWE
	c3jCDJqeC/z+cEOf6C1ww7k0jx46TZ/DNJSkMUm9orUVR3kqrF2CF74ML0K9MyGvm56TAhRi1u3
	xRLHH/+cSo4Ehaft1eC3ZLiH6rcYkxS2OF7OIwo+FkgBfpCaj1IosrYjt74yvQ+m9x71jVWa4Ye
	AoTHcUeZnI4SJtAx+UmNZNdGyScSpDvulTaIy7+ngFgPgQiZSJSbXx3dw==
X-Google-Smtp-Source: AGHT+IHzx2qjZN7y/wo3WxF3dR8UgNgswDbrl63Ur+zGOBiu2f0uIz455D6W2JRIyhSeVVWesAFhZQ==
X-Received: by 2002:a05:6000:4012:b0:385:f44a:a68 with SMTP id ffacd0b85a97d-388e4d67acfmr7090660f8f.35.1734620752494;
        Thu, 19 Dec 2024 07:05:52 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8b830csm1752376f8f.108.2024.12.19.07.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 07:05:52 -0800 (PST)
Date: Thu, 19 Dec 2024 16:05:49 +0100
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
Message-ID: <Z2Q2TcM6QPUIIyLC@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2K_u6jK5aLDqaam@pathway.suse.cz>
 <84wmfxm6em.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84wmfxm6em.fsf@jogness.linutronix.de>

On Wed 2024-12-18 15:13:13, John Ogness wrote:
> On 2024-12-18, Petr Mladek <pmladek@suse.com> wrote:
> > My concern is taking a lock when processing a printf format, see
> > below for more details.
> 
> Your concern is valid! printk() uses vsnprintf() to format records for
> the kernel log. printk() may be called from contexts where locking is
> forbidden (such as NMI). If vsnprintf() can take a lock, then either:
> 
> vsnprintf() must be made to be lockless
> 
>   or
> 
> printk() must take another approach to string formatting

There were the ideas to introduce a %pX[1] or %pf[2] formats. They would
allow to pass pointer to a custom callback and parameters which
then would be used by vsprintf(). This might allow to make it more
obvious that the given vsprintf()/printk() might do some locking.

>   or
> 
> we accept that printk() can deadlock for certain format types in certain
> contexts.

I see that %pOFm does not add any new locking dependency.
The same lock (devtree_lock) is already taken, for example,
by %pOFC format.

I do not want to revert everything now just because of theoretical
problems. It somehow works because people use these formats only
in dedicated subsystems. Also lockdep is able to catch a lot of
problems.

Well, it would be nice to document the lock dependency in
Documentation/core-api/printk-formats.rst

Best Regards,
Petr
