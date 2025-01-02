Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0751ACEB0
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735823205; cv=none; b=VOfwbvZw0ZahRLrrpBnjuVfXO0za5RA25E+VUNYpDWZc4cUAtdjmfEpfRq23IbbxWeUCEmoxAX1bQg7j7BiaBzqoMzkRqLxq5rO5HuactxG7FTxyB9kNnl8iPfF3U0n1DTaHOdDdLGPOzwwIqfvh9BIMhqAcNOruUTwewEoDN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735823205; c=relaxed/simple;
	bh=okPhzHKZwSnBnr+JyEP/BuCmjowStk3XeeC8NmwJhmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn/WJcH+Er/TEBo6Q0trpNMUvFYodVWPa95bYffZoicW0imYfhxqD8zR80LGt7ugnF/0aqZ4HawUQTSOaSMrHmzMC+hLksVx1VzJG7GLnZdvEPcReozc2MinBUfYE9FQw+ZbKW14eP7G/lN4IFWYvHl6FESq6Xdv+piqQ5j7R5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TqvMD0+V; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TqvMD0+V"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436a03197b2so29675895e9.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Jan 2025 05:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735823202; x=1736428002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwWQjY7eg9shlfr3qhPfsf98UOxBUnEIZuJxINmilJo=;
        b=TqvMD0+VUZVlFklR+7vnMQIIxjk2N9LX5nY2WgIu7XZRATJhSRv8JKzOz3nV4JN/45
         VV6Bw0gI/fWOY4kiPUKu8RoTdpQRApn9/Z5DZ7/qJzlY8GBodjkwZ4yzefQURVgJU9kd
         d05k1caPIff+n5oFD+2T5cJ01i+d2tTWJU9s8PWZnqumlGOrJwIf4JyBsHFLl7qvgcaA
         wlfswBmA4zi6b8xxkTjrcJ34KeoXPc/w2DN+3FfOk5jhXYzvMVn67BuSPH3WxcWUwPIn
         U7ui6zMgmpzLONL96mXC1lOhkU5XkdE7WdJKBUFHaGqE5KzM5KdSpA9uCX/cHvrawkWQ
         YtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735823202; x=1736428002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwWQjY7eg9shlfr3qhPfsf98UOxBUnEIZuJxINmilJo=;
        b=LHrQbEIafSLO7DS7soYT3qVakphqG5ejwwtsKXa3o6PDU+0knDbWRrACyg1EOW2sGd
         LOaS19u0RYrqK3IPyI6xajcunpnDZLg9e06gGysP+WH0+ERKna/+9HI30QSat9UUqdX4
         gwuTO1W4de/TsQ9EJpZwhrsZPioYuSaeWlGPryhkvv6LEGOiPM6o6vzfutFKeLuuzJK+
         UK86VbS2BYC+BkoT0EWoCCfixcoiAN0ZM3AGbV7Gou1OiI/L9E0qnrKXViP1A0H2UdlI
         xJ8QTl5gg0whTTHEXsGwhL/6gaPOBXelAWJJNKT9lKxY4+U5GuXaS0H0dZrlhH6BaVhi
         PsdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVutuBdLnVou/nBZ1x+0/XKzUgjgigp9Hm/T7Q+isk8WRNMU15msPaVFY6a/tlmsr83YMzwhwh+eXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXah/FC6xITCdRgEEbdMVaZ++LCtXYLdKDuLyaMCIU1c3nbAv
	c6HGBJQ5K6haMXTrfGEB46S9DT4lv+uz3Y6p5SEmjcTmD/PsTgu9ayPepkfNslA=
X-Gm-Gg: ASbGnctSS7dfM9TvNIYOc2z7QIPjS8Xy9dUHXhW9KZfctZU8I2V3iEFmO9zFulzwWdz
	kDy/9oZzsvzsowKVLdhHGQHFD0sR6P2v4QHuhhgDftPiqoB+zZL5sR/7D0mcaHmiwTPnXlAszzP
	T0ImUonhiqo/FThuy5Xr7DqG6DIoscVtZUknyNeZLF1j1uKx6TBm2XsV7j1PZm6mSr5L7S79xM5
	+U+Kn+rJFqhC0nmQM5tb1B7dyDAMZNvKnKU5QKN+Rj7WTxz4g/WI09XCg==
X-Google-Smtp-Source: AGHT+IGbAPNnwVSa4laD20KJjG9xXhqX/JBOhxU0k/AK/PW0K07dro8G76+BCLcrFDNvyKXd3AGGyw==
X-Received: by 2002:a05:600c:1f85:b0:434:f2f4:4c07 with SMTP id 5b1f17b1804b1-436686464d9mr422782235e9.15.1735823202011;
        Thu, 02 Jan 2025 05:06:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm493767545e9.33.2025.01.02.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 05:06:41 -0800 (PST)
Date: Thu, 2 Jan 2025 14:06:39 +0100
From: Petr Mladek <pmladek@suse.com>
To: Rob Herring <robh@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
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
Message-ID: <Z3aPSwnbUhqvp59v@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2K_u6jK5aLDqaam@pathway.suse.cz>
 <84wmfxm6em.fsf@jogness.linutronix.de>
 <Z2Q2TcM6QPUIIyLC@pathway.suse.cz>
 <84o7171o9y.fsf@jogness.linutronix.de>
 <20241230202643.GA2488017-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230202643.GA2488017-robh@kernel.org>

On Mon 2024-12-30 14:26:43, Rob Herring wrote:
> On Thu, Dec 19, 2024 at 08:17:21PM +0106, John Ogness wrote:
> > On 2024-12-19, Petr Mladek <pmladek@suse.com> wrote:
> > > I do not want to revert everything now just because of theoretical
> > > problems.
> > 
> > What would you revert? This has always been an issue for printk().
> > 
> > > Well, it would be nice to document the lock dependency in
> > > Documentation/core-api/printk-formats.rst
> > 
> > Yes. If any locking is involved at all, such specifiers should be
> > documented as not safe in NMI context or within printk_cpu_sync
> > blocks. 
> 
> For the folks that don't read documentation, should we bail out on 
> in_nmi() for these as well?

I like this idea.

Best Regards,
Petr
