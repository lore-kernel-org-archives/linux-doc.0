Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D10537EC
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631693; cv=none; b=neTmyrrqp+wmInP0EkPyC6DiJ+lJMa4Trmj1bbQPmbd16KWtOWWw4W+XDbM4CSmL5loPTw1RkZp2kvT13QQrNHFVIqZnoZDzoiguMwhPUkFarqpZvTw1mHblZ20ZKZ7+XtZXDnC8ZwnEmAv9XX7iOJ4pDMC/Gaxj6BjVPEepz24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631693; c=relaxed/simple;
	bh=yNMRaUkoBUGzMo4lYC++zBwXHqvVQ2SDiAjTQi1KynE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNNySTYa5e19Qml8g0omh79i0/f1MRKEfDfCum6LloLbgoHDKpMCTRcqyY07D+6ZLTvK/q4orQnw6EEP4vLL9CZ5kIX7M+gWTU/0UexqF4MUivKwKrkYoCJt1msQUOBqJNEdetijyGCXvZ8W4i5j1EA4SCKJc1M/SJ5TRBdL81g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RskWlH7X; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RskWlH7X"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5ce942efda5so4455934a12.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 01:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709631691; x=1710236491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=as9+lE8KnefmxAuKs+ZS/mXcrbxKlrRRgGu9dYI0Ql4=;
        b=RskWlH7XdjX4qeIQWlvvNpjHTHq0o33PhnA/rXe58565YvM0zbizX0EACWfdw9sq45
         kiTI44oQqKdLorR03MzTBG63Di9n4Zio+lzOVOGnlRZY0ejH5nudNqjCygIAcR+Ha+lq
         WXxm8AI5OPheLbJAUvW1MnQDAP08WbmcINil0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709631691; x=1710236491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=as9+lE8KnefmxAuKs+ZS/mXcrbxKlrRRgGu9dYI0Ql4=;
        b=Y44XjwAQc+ocBTTFQDwGlFfVEfkOYyEXGBfWHvrjOP8/3xLuLJCdPIEt+dS4/9n+fm
         4Aveh2Wc0xEISk/hULtOMbSJyvS6D8xYl6GkIMgGehY4L/7DZEv064tON1HsoGHIOD1M
         SHrmkhJwyqsta/nwvM1RsyKvpOfLQ+cizoDpKg03Vxucgpz1rECJecUc4KxL7vcqzszj
         oRskXnR5F0wUdikJvlFvqCWFAjnh/qtS5a/mB6l25LpvhExVmi4bE3RyPffI/4GWkAZU
         pZcwxHGyycCaPxZHsKjJVhirxGkFElJD706aw5XtpEZQpjmGSNySpMM1/ysVm4igQrcA
         SXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUClmtxURDLloNoQ7OZAIyIdwmeVo9/VABMIMXr9Cft0C2+f6pTitn4xMOBo16dPYU0zjXCAyJC8h3Gj+CEP2ekNiIw5Doe0uuE
X-Gm-Message-State: AOJu0Ywp7DVhJdGt7OBZdxGZns55gnURiZ/kQ73nDYk3a5548A5DfASp
	iyiD5K+tof6TzbtEgwZ3JwaQYST6lkm8y4RpDOaXOhquMlQTAaj64uSfBjMsng==
X-Google-Smtp-Source: AGHT+IHLWDn0ImiexmZH+l62XkhFStqZ8wnEDf2Edq3sxo8a271Wx6ORwR5cKmQu3cOMJO0RH2ld9w==
X-Received: by 2002:a05:6a20:7489:b0:1a1:4b3f:5571 with SMTP id p9-20020a056a20748900b001a14b3f5571mr1546542pzd.13.1709631691058;
        Tue, 05 Mar 2024 01:41:31 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fb32-20020a056a002da000b006e6253bbcb7sm2882057pfb.61.2024.03.05.01.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:41:30 -0800 (PST)
Date: Tue, 5 Mar 2024 01:41:29 -0800
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Adrian Ratiu <adrian.ratiu@collabora.com>,
	linux-fsdevel@vger.kernel.org, kernel@collabora.com,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
	Doug Anderson <dianders@chromium.org>, Jann Horn <jannh@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mike Frysinger <vapier@chromium.org>
Subject: Re: [PATCH v2] proc: allow restricting /proc/pid/mem writes
Message-ID: <202403050134.784D787337@keescook>
References: <20240301213442.198443-1-adrian.ratiu@collabora.com>
 <20240304-zugute-abtragen-d499556390b3@brauner>
 <202403040943.9545EBE5@keescook>
 <20240305-attentat-robust-b0da8137b7df@brauner>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-attentat-robust-b0da8137b7df@brauner>

On Tue, Mar 05, 2024 at 09:59:47AM +0100, Christian Brauner wrote:
> > > Uhm, this will break the seccomp notifier, no? So you can't turn on
> > > SECURITY_PROC_MEM_RESTRICT_WRITE when you want to use the seccomp
> > > notifier to do system call interception and rewrite memory locations of
> > > the calling task, no? Which is very much relied upon in various
> > > container managers and possibly other security tools.
> > > 
> > > Which means that you can't turn this on in any of the regular distros.
> > 
> > FWIW, it's a run-time toggle, but yes, let's make sure this works
> > correctly.
> > 
> > > So you need to either account for the calling task being a seccomp
> > > supervisor for the task whose memory it is trying to access or you need
> > > to provide a migration path by adding an api that let's caller's perform
> > > these writes through the seccomp notifier.
> > 
> > How do seccomp supervisors that use USER_NOTIF do those kinds of
> > memory writes currently? I thought they were actually using ptrace?
> > Everything I'm familiar with is just using SECCOMP_IOCTL_NOTIF_ADDFD,
> > and not doing fancy memory pokes.
> 
> For example, incus has a seccomp supervisor such that each container
> gets it's own goroutine that is responsible for handling system call
> interception.
> 
> If a container is started the container runtime connects to an AF_UNIX
> socket to register with the seccomp supervisor. It stays connected until
> it stops. Everytime a system call is performed that is registered in the
> seccomp notifier filter the container runtime will send a AF_UNIX
> message to the seccomp supervisor. This will include the following fds:
> 
> - the pidfd of the task that performed the system call (we should
>   actually replace this with SO_PEERPIDFD now that we have that)
> - the fd of the task's memory to /proc/<pid>/mem
> 
> The seccomp supervisor will then perform the system call interception
> including the required memory reads and writes.

Okay, so the patch would very much break that. Some questions, though:
- why not use process_vm_writev()?
- does the supervisor depend on FOLL_FORCE?

Perhaps is is sufficient to block the use of FOLL_FORCE?

I took a look at the Chrome OS exploit, and I _think_ it is depending
on the FOLL_FORCE behavior (it searches for a symbol to overwrite that
if I'm following correctly is in a read-only region), but some of the
binaries don't include source code, so I couldn't easily see what was
being injected. Mike or Adrian can you confirm this?

-- 
Kees Cook
