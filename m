Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603487;
	b=QPjePhIoi3SxFW4MZvKwqRZqRv8MMQWQ96Y8WEidx1J7HKaXwoxH3qkF1kUbiry45RaR
	 OrAxv8eSaHQDmGq970HY2NRHpGD6wBDiql4gLtxjcyZDpSj5Ds8Nep5BFxVBzUDkrcJ+i
	 xXyddiWZ0YbUilfufEJ5VHU5hLqhXSMGlCZfnc0rwhbJ3WRwwoq4h3Pr7qhtB7aqkWsl9
	 bdNmkbHlJA0Ba4cENDl6Y0flUx8rJbKYP0T0uCvUhozvnsdqyyWQuzYp79OQVhSkRi5lm
	 mc5QN/79e0P/TuYB0pwS67N/lVpnHtuYIPgHuKB1kCOu+yINTGRTAphncqAeCFvfUYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603487;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=CMyK6mMobUrcy0EM1NOvK36Vw9GZCvCYDQpUoqbxDoY=;
	b=cu13aV8l37uqNkCWBcIaO7wqTc212iiu8+MJPFYEtQMrA+SlmdO9f3TZf51caZKkU84N
	 43TkQ3IPiYUXM8B/YaOfzt816tbHzKHyRQFnJvaPqaM4c+7APEuRgW1gRotfqSZfdSQSm
	 neZOmo1v8UkL0gFgeqC60OqF64t6Ns82ENw9IsLZMSnwNGSKWjnRaSTLHoM3RjD0hpQa6
	 ZpLJQVKFxKKqafoQQnPggQEI6HAcX74VaQ7DkBinHjkuuNsVUAHuKK8b1D/GxwK7ZIWDL
	 y9qWwarAEWF4fogAHeZuLuM5ZQc7mNKtnvRQ5F1Pb5i0dh/FzirkYZH4C6aSGaZkKWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ODecRjVN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ljn4WTxk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B481C606A31E;
	Wed, 25 Nov 2026 10:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B481C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ODecRjVN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ljn4WTxk
Date: Wed, 25 Nov 2026 11:44:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795603484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CMyK6mMobUrcy0EM1NOvK36Vw9GZCvCYDQpUoqbxDoY=;
	b=ODecRjVNdI7BuGrM0sYA4qblRE3XKZlm+eV5380OTLybeDGlpWtV7aCPxK7Qm87gYwPD/B
	S7OPRgWxE9BBMewGcbkGj+FcbR824dQOzsCiuTXaS2EklxC8+o+V8tQIk8rG9VqKCNWcK5
	RajfIXx9arE0vcNx236Q6IwaiLG11ZPQPtQDgxhAGigyQBpchRnlh4bceHdvlbS7g6crHD
	rS1Pqa8ii9S7GU/jU2hJmuxa5GLSgZRjYPZ3yBxeiPu2yIP1E98QcF5EYkPSmGxwXZD4D0
	6fgJUguiB4WBxcrhCj5heXpABYa7i/gD3m5aPaFH/ErMtjpLGrMOUW8HMikkhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795603484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CMyK6mMobUrcy0EM1NOvK36Vw9GZCvCYDQpUoqbxDoY=;
	b=ljn4WTxk2IVa51CmiQbV6bDPcpU5jnkhvsmfmn/M1cxv63RHcKQtiCWhXNcfTpq3qUSSEq
	IpWOavTryMXMbyCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Zixin Wang <w1355457260@gmail.com>, frederic@kernel.org
Cc: linux-doc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	darwi@linutronix.de, john.ogness@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org, corbet@lwn.net,
	wagi@monom.org, atomlin@atomlin.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Message-ID: <20261125104443.X1l7Oy7s@linutronix.de>
References: <20261125074658.33117-1-w1355457260@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125074658.33117-1-w1355457260@gmail.com>

On 2026-11-25 07:46:58 [+0000], Zixin Wang wrote:
> Runtime tuning options such as C-state limits, EFI runtime services,
> CPU isolation, RCU callback offloading, and interrupt affinity are not
> kernel configuration options.  Move them out of the configuration guide
> into a separate real-time runtime tuning guide, so the configuration
> guide stays focused on Kconfig options.
> 
> Keep the existing configuration section anchors in place and link to the
> new guide from the relevant configuration options.  This preserves the
> documentation links generated by kconfig-checker.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220633
> Link: https://github.com/elisa-tech/wg-aerospace/issues/222
> Signed-off-by: Zixin Wang <w1355457260@gmail.com>

This looks good. We don't have too many copies of the content anymore.
Any objections from anyone?

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
