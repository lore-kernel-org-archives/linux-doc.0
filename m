Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626824;
	b=1zzlhji6Nni8wF+wn8ykGFW1ZRzY4u+VIjk5tzM9MRVP5wfnqrD3WNXSaJJ4RVdWL4mB
	 0i0tXZQCpMsTdxEUOLFkGAPXSJKybkrTt88Ic8N9K/FnkXX8GpzB2Z8h5s0fNk/nPSNDN
	 wbGvmkj1lxuQ7QsBIYO/vPzxFUJVd71fRorgCNnsovJ6SbQogz5iGNdFL0dcN4Q+E3BY1
	 AxVwz1NHClTLdYt6duyE5gpBvpWAWMsv5UhG2XNISiqI+TjBbAgWn3JyP5H6Jf1472y5R
	 LT6+5j/lx7Yse4fdZwwDlnn4zXdLcIl30HdKYgQLlPPf6YOuy54+fqAmohEvm5FEHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626824;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=iv+px21u03acEcz/Te2xTvJ8wZ/dIalo57maBeWzen4=;
	b=a3P7/W4Ur/4qT0OJkJF8JXtlFtg/5pjC2dYy0nA3MDYMJL+TUe3la7DEwQvPoStcMtQv
	 N+jhlEnhG6r+Z2NNM8YyhrrgAbuWScPWzHqGCzmnLpL4K2nZ1fhAgoUim1Cp5ZnjGv0X5
	 OmC0Mt4ssUUS72e2JPp86Zn6G6Oslqz9nnbR+7ipgm0rlYKQS/EeZ0svMzeaOyjTmoJDV
	 25excfR2PayxqptUhlJHrD9teUbXpVQj7hREAYOellahBE16rtmpdgCsGApTVzQdRBITZ
	 hL0bmVu3BFR4/BpKlL2B5cdHaVWfyydRXPZuX86Kfp4YBMZ+JEV1Dt0H+vJ0iKq28aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JeG4GVwh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="/tXzigM2";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91641606A321;
	Wed, 25 Nov 2026 17:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91641606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JeG4GVwh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/tXzigM2
Date: Wed, 25 Nov 2026 18:13:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795626821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iv+px21u03acEcz/Te2xTvJ8wZ/dIalo57maBeWzen4=;
	b=JeG4GVwh6hQPbU/WOqM54k0bb0Gs2JHILuryozuHJ4f/TgN4Sv1dL6D2JeUJYhWdZEpBED
	utyyFvciF6exfzHVRSeAfm7eJF/owOT1mUz1tntsM1TsLkaqVLzYnAJ82ieJeQfGo8C6wK
	qP5K7RJjYIWmpfjfV5HhIULdLLVQc+j2qlYuDhHzG8McWUVENv+oTTXypwg/3+owRnPaBF
	epOR2vluDUeeKlf+dKmXuqaHQWdey7BgM9AbUj+vrOzpZJRZkpQk5SP6sD//4jaM835qNh
	QVLx6f9kusviOHJyJmqIdGjjgxwVSI2a7WGkedWAUbI9sSRQUw17yQY4TDnhFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795626821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iv+px21u03acEcz/Te2xTvJ8wZ/dIalo57maBeWzen4=;
	b=/tXzigM2fQGDch4K8anWVS1JgUpnvQjhFWwDLmOId17QOhxAwsIYvDbfwmka4+EcN+xkcB
	CKLe34eqmgdhy5BA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Zixin Wang <w1355457260@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	bigeasy@linutronix.de, frederic@kernel.org,
	john.ogness@linutronix.de, clrkwllms@kernel.org,
	rostedt@goodmis.org, corbet@lwn.net, wagi@monom.org,
	atomlin@atomlin.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Message-ID: <awcXRDKtZJqNrhby@lx-t490>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125074658.33117-1-w1355457260@gmail.com>

On Wed, 25 Nov 2026, Zixin Wang wrote:
>
> v5 -> v6:
>   - Split runtime tuning out of kernel-configuration.rst into
>     runtime-tuning.rst, following Ahmed's review.
>   - Keep the CONFIG_* section anchors so kconfig-checker links stay
>     valid, and link to the new guide from the related options.

Thanks!
