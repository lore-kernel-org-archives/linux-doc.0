Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578053CB2C7
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 06:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045938; cv=none; b=douxV38P3WJ65jjtoGrPoc8u5cLZGXGi2pxYI3HIiyi0HAe0Vossq6a6YQwJAVTzCp/jvkwm4OKKqVd2TGp2/LE7st+ErR2h/QHuqbPwr+RzT/2uIh/Dam/Mf+NICSw2Xdd9Lm1mxHQ32yrIg+K81e17aFUVoUhGqwBDV3zvFNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045938; c=relaxed/simple;
	bh=qgNKuCufbexUiNnMd4UFYSMvMNsgy3mLjgSJhp++3Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKyH+78miQ+yXXbNV9039HRdhDm8vMY8Vnp/J4WkHm7Ms0U0f1mEWHJqfYOPos2XcsWISP8Dx+g7Zs6cdaRvTW2b6sjXI+KXwwk32sEcgyZ5s4jRPqks4F1Z047is9xFYm6p0mLXnDuYA/FFd4qjBWZtpsXwHzlL06lvKH31Vps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmsc5zwN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmsc5zwN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c45111bebso3022426f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792045935; x=1792650735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lh/7skka0uDM8NGSUjtaIa1b4/VuTZ55Mdun5RSEQww=;
        b=hmsc5zwNm+F6qlb/FIJYcvob4ZFS7eSMHOTTJz1GMVPmY3ypiENxn9P/sD4bJvWMId
         lhywFXHEe1cS1nUPG2JTSTP3dYjdi4YtZuRedodSE5OyDYCqrhY7izYP2XqmpxCApExM
         3dFaajpI8ZlQmwDNUAe164apIn45eiIdolZGr/QT8Sk51TbQnSD5miAtzehWrMXjoGVI
         MVaK5o02sgOFQErSoJ/+8QAkPyOPX/y0z3LXaReLXxEwI0OWfvDPK3XRGFXeX1MW6SfI
         WgeVID5uDg5ET/+A1NpiuJmhU9WUgYU5v8PIcO3Kofsldy1eVid53Ln0Ww7xCtsN9ej7
         HZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045935; x=1792650735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lh/7skka0uDM8NGSUjtaIa1b4/VuTZ55Mdun5RSEQww=;
        b=U3rds64rN/58BcrHRH+BjrFxOaLAx4ivKlZlQVlXtbQGA3ubY31zNPs937wQ3gAUiO
         opHjgPdaMHX6oVsFKwbclYUOduOnFFQT/MeSPaeGZ+QevGRS2prqH0qO4Fb/fOUM+N7V
         8g4EH4sq+za22PER02GAshcKw6tCgQ8Qk8gNheqoAuruDaJ6q5GnFJbemLX9bQ+bwPXp
         u6q9E0oaa9BJeZZ46p1l9DmR+ZeT+mLJsjLoVnovU6hkMQUa99iyYJKV7/JZZQH2hrfW
         iuVXxS4Z7mQZXOOBGX+jZE2iuMqFkOi0HAZ0O7xv17qsJTty7aX+XxyDBVOgC9EBm+GB
         KNNg==
X-Forwarded-Encrypted: i=1; AKwUvBxb+I/4U9j9zHbwQRsaih/qv+ILVN43vvBsku2/WCWy7HSpUI+Rr5snmefm/JpmPLiXFhLbZaOW1JA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA23rp3VOunNnW2AokyqH9SbgIS9QhctiGSwcp0c8smRtIQ0mc
	sKSekP4JhvbwG2uCFhFnvxNLBNAq68k2TLYoa8VY7Z75ZrGrc1ubTOIx
X-Gm-Gg: AYBFou0ShW7Ds805E4/fbKVtgf+hulNIThF4FZMmBpgQpTX5ke4oYyJeQQMBce2I/d1
	B4aI4eVqjI4kv2jMwZ/yvOz7JUlUAoz1bjLZ4t5tS3t5CwpOuDMtzHyveh9xV4vH1xdtvwXk28m
	zu/QZn55FUeGENKFj9UyEBh1VK/8bEm6ONjVPMIPjey515lNytiYgZxa+OeHivEaHfcVn6S07K5
	87d1lgkYtTZQm7E+tVtcXMSt5Dw/XUOwkcKSiHk1Dg4JyW2X7+IjsPISEymYZHumB3O54Je1qsn
	NnDdU5XnwsTvWRpkiy01Fih0LScizhL2HZa5k30mfGPrH1i5IaJXY3aX9wzl7DRwnRu1GuHNsyj
	VFMiCyt8+O6IdX/Z1ESSLdluEHxDYSvu4Qwn7weNSuBKChrJVpc/eEv3LOKmFg8bJZHJhIg2tjj
	FMsLvqse9+l6/lem4Eoile6iSx5ahLr2XyFU7Yx7DzF0K2MoBwC5T/1ewCQKPjBQkmU+CxALNxW
	8h/BzXjqHPbz2WoxTaeUeo2j4fXSUIiNkxVnvg8lOmeOF7ERXcW2wt1txbjw5UxTH9ZDnqkFJfJ
	idaOZ43KOM2yEuJ25Q1ajeP1ANZC6dVwarx41ZEG7ZS6RjR7FPvoG78q0Ve+ZCunlz7vCdKZLmA
	=
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr376432265e9.19.1792045935458;
        Wed, 14 Oct 2026 23:32:15 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm62999745e9.10.2026.10.14.23.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:32:14 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:32:12 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Bradley Morgan <brads@mainlining.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH v6] softirq: Preserve interrupt context during IRQ exit
Message-ID: <atByy9l7zW4TKtrK@gmail.com>
References: <20261011060742.30584-1-kmehltretter@gmail.com>
 <20261014120524.5e6e6efe@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014120524.5e6e6efe@gandalf.local.home>

On Wed, Oct 14, 2026 at 12:05:24PM +0100, Steven Rostedt wrote:
> LGTM.
> 
> So this handles the transition between hard irq and softirq?
> 
> I wish there was a way to get preempt count updated earlier on entering a
> hard irq so I can get rid of the transition bit in the trace recursion. As
> there's still places that can trigger a trace in the hard irq before
> preempt count is updated.
> 

Yes, this handles the hardirq-to-softirq transition on IRQ exit.

I am looking into whether the preempt count can be updated before any
traceable code can run, as a potential follow-up RFC.

If that works, it may allow the transition bit to be removed from trace
recursion.

Thanks,
Karl
