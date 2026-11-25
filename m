Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642669;
	b=chplgtTqtlsz8uKqacqYa+8wmNvqjseyLmqjLtMcvyR7XW3L45UnF7tTi888cxZgESu2
	 /cS/TVOjNU6ERaB0oQfCzOs+ejJLPY/lJCFiHS+JKuS7xwqlLoT5IIxTnM0bR67DW5Ups
	 JutX44wjM1GZcg3OBIgNMbVeGInUupWy/W5hIwgDl/ahUyg3Am3Ag48JTVeq3F6cAVwm+
	 lrkG/BVeRAxWuqKWy0qw+lcnfYTNId9ArW+dM3GimliG5l58bVb7G76JGaQNwpzSzZQk1
	 ylfeJPFcc5uNYeVr3pC33uq31XPvbdW1/j1I/K9WzaMjhzY775NNt8AmYfI66k84A4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642669;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GFtOy/DkrylhTwGRcpVBffMCTS+bYSp5H2q2JU6u3Ac=;
	b=slZRcWxT4FznaP+vnNntagpfSFYeqVaYSFguIFp9rxViNPfyjvy6PAQG6YjpH1aqLrLf
	 I96myNpN4FqGUwttvit8hhxnqE0c5IaMXok7CVQrd8fLFkZjTKTzIvjP4oq9ZzK49r8IJ
	 K/TpcHleO9uo+fQVppGLCC+uLhLfKl7WAcxCk3h5Vo21idODEV8OCdL2dmbozW1tcEzNJ
	 A4KfvKcvVI6ePsF0gI8vCWOsOHDavg4FiQR1VXO+bAyRbF4bR9iDZ4mygysEuGMss2Axh
	 7wkfS2qlonOSWuQX2Jq8EI19NgOTyGR3llHF4fGPsMOUR9EdFeXqSeYeBmuWFDJ3SyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZhsBhbnS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E6yYTzPs;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A790606A31E;
	Wed, 25 Nov 2026 21:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A790606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZhsBhbnS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E6yYTzPs
Date: Wed, 25 Nov 2026 22:37:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795642666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GFtOy/DkrylhTwGRcpVBffMCTS+bYSp5H2q2JU6u3Ac=;
	b=ZhsBhbnSy6OkZaVsPb0JseyqVhTB5KlsqiksEeR+vwKRrl2QomZEtQoVF6UfyFOu8/qnVZ
	043Ana96Uw/w5pQxRSna19e51hJOn4ab3NxawO8S10l+0luOdk+bYTkJAwsuKAqro4JwuL
	yMR/xOwFwkd1DNJ9XxZaThlhlMLBYbLMfhJ+f7U1m+z1e/lQ8mEjLd7JXzs3nAi1Rh3Tzp
	fA1XIheFPf6rN3Bfza9uSoXarMgd9WDvNG8DJp7mKDzuLHzdQQI+hx13zql+8YhpXeruxj
	FfL9DGA8bSoC/vdXLLhWVYgZDo7uOFlWeEXOodSzKYZMGVJmblBAIcLcMTgOJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795642666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GFtOy/DkrylhTwGRcpVBffMCTS+bYSp5H2q2JU6u3Ac=;
	b=E6yYTzPsC23VhwTsjyLHfO2d++T00aLB5vOrjUOjujvEL1vgYq/6QQbGivMXSRmAplmjjL
	UPb5VuFXQCCh7NBQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Zixin Wang <w1355457260@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Ogness <john.ogness@linutronix.de>, linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, clrkwllms@kernel.org,
	rostedt@goodmis.org, corbet@lwn.net, wagi@monom.org,
	atomlin@atomlin.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Documentation: real-time: Add boot parameters and
 task isolation section
Message-ID: <awdVKGXEXJ94CQYE@lx-t490>
References: <20261124163202.56921-1-w1355457260@gmail.com>
 <awXN9RY3x5xEGFe4@lx-t490>
 <20261125075037.33630-1-w1355457260@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125075037.33630-1-w1355457260@gmail.com>

Hi Zixin,

On Wed, 25 Nov 2026, Zixin Wang wrote:
>
> Hi Ahmed,
>
> Thanks for the review and for pointing out the scope issue.  I have sent v6,
> which moves the runtime tuning material out of kernel-configuration.rst into
> a new Documentation/core-api/real-time/runtime-tuning.rst, and keeps the
> configuration guide focused on Kconfig options.
>
> The existing CONFIG_* section headings and anchors in kernel-configuration.rst
> are unchanged, so the documentation links generated by kconfig-checker remain
> valid.  I ran the preempt_rt rules from your v1 checker (reconstructed in the
> 7.3.5 tree, since the tool is not merged there): all 12 generated
> documentation URLs resolve to anchors in the built HTML.
>
> The C-state, EFI runtime, CPU isolation, RCU offload, and interrupt affinity
> content from v5 is now in the runtime tuning guide, and the configuration
> guide links to the relevant sections.
>

This sounds like copy-pasted output from a Claude agent ;)

In any case, thanks for following all the feedback!

All the best,
Ahmed
