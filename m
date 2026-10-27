Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108848;
	b=uMOsVdWTKGvlRnfgi3ep3FurXQ1zbVoxYAjDYcsYv8rPcKwbcL072GiiuOkVp50sOyfJ
	 +ZyVQDZDx86IRAEtDMcH6vcxn1487XRBECWkfCh1wDUoYccIG0r/dsEZnsRsxKCKJRHVS
	 1Zr98c4kgMvRMuwbh6C5LMrnRGgcfsCuKI7/sezDvT2Jy2ZJCwnJfBn/6kT4D4b1L9jmI
	 ABuwJh+8b7hPPDQSqYTmFo2M6FFs+v/86LXXfKk28BanpAH8kv5NUETCkHCMSwsEzDoSK
	 Oan9tf97AqUDtSGYsn81htQ53a2VsJlVm1N55sD+0uyTtTLOcpr52XQ4ZFOW9ou5FdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vi2VyxWb8hUzIvesy3TGk19mK9cZ4B2w+p8Em2DTRI4=;
	b=QNdZSRRMBihDuDbaiwBmjiC1IKesAHhaGJzOQqM2/kAQvEWJKIrgLv+T1LDWHFA3J55T
	 pKRH7OnZ7/0mye0q466SLI2yb8QUD369GsSCzecZ0FZPRzuBiw6gzgO93F0patjytMVox
	 tytNzL++KaxUwzOMA/gxo9WRsyR0YhI5ClzKlATBYVwnVaiWazaP3TDSAXRkHLz5Z24pO
	 JNJpfgsdIB8miEJZCbAqpj2mjN6VJGQft01upxWk1hYbZfrZVEB9LJ75uUMYqqPWd3WYq
	 20P1Cf9g+aqK9di/0VR6GJdOyjbEFUpuYIT5T0jxealisOWTK+cE1BMwje2/6Ts/HwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B52Xihmr;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACC606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0ACC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B52Xihmr
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c498fa2f365so297183666b.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793108846; x=1793713646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vi2VyxWb8hUzIvesy3TGk19mK9cZ4B2w+p8Em2DTRI4=;
        b=B52Xihmri68zEQvOwl0tik89nRtTdSvySUKtMLXC2dQa/2PIgZ+TqYVkwSGWfj6CLl
         fmUxnQLmnJTCCasfhumf/8XYsj1jH9CNWubsIqmQo37PVxYt/Lfl0aDxbI+Gvl0wgZTV
         vHjLMOphw3xRMpdsdwPxgavAmAb8/neFssd1A1L8ci+yspEuWJtchXTVqEmlLO8XgcQx
         xoCVYSNUqrJMnbEhrgdfdGpf7Y4xJVvf7RX1KVEBrmtM06CSZud3KU4Cq6mJA/aJFF+O
         H/O2V7URqxLCi73ulwpwCjk3aXhqOib2v/f2/2yB8tuRo8IYv9MCuxgh+SrcAofSghCa
         d/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108846; x=1793713646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vi2VyxWb8hUzIvesy3TGk19mK9cZ4B2w+p8Em2DTRI4=;
        b=nZKW8C3A1cNBxEFXV6Q+LDN6vE0RgNqTNHNgE4wu1HyICvomrOeyZdFyZVuLyKWQ98
         MehnmJcvuTv5lzIwTF2dqTT6d5DKgrfkGpNqrJw9nTl3/EWE3hmzuKBMlubGILNN3Yzh
         dGjfk799WPol+x3XeHWMSL116FfRWOwb72AIhlZl7GnLg3fsPfW//BI3+g26YX9ESlLv
         wTq4Ajba2Yh1RUfChJbM5qLFKqapkNPqtZbWaIwOruSnDrSDKzaiIFdtZxQmRJdGa8AL
         Lamfx8IjAPxY+Z312sB6kBvhx1BXLXmBZZ6m9skQUG3PoeC+G+UV83u2Uk34FT0jTE6M
         v05A==
X-Forwarded-Encrypted: i=1; AKwUvBwZq7A3QgZkMJlBRZOWKeAyxRvHY4w1lDXzGZ6BXZDM5aS+5lhOPrK3Byd953p1+Ys6oYLHoHL8BEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYjlpbsBqxJV5nYf6V35prThlzQnwSUC6eYsIIzP49U5jlRINL
	clK7aL2/L0at0QhMkWK0rCn3zwShB5TGdHqrLx5aRL/JHHtVjxMCEqwL8ntA1IybqCE=
X-Gm-Gg: AYBFou23bZYxx9XsV2tkh0Rl4wrF/NFU3RSo5pZU4f7OD+CMlwKS2mVIvkAcvHcRYC7
	pJab92aPumB8BEt34cebeJjauFzHw5oj/vkYscjXNXW8k/F/jd8LfI40yALbDmkIqIS5TVBPQKw
	HVH1iK1j0LMArU0G6VEmjX/8vIvLj7M0+KDfefQ61gUMu8Oxshdk2GdQrBk8Slhk7/3Fy6bYDrS
	Z/qcIadq/ml5kUQP5J7URvbtkJHCCjFlp6PSsnGXmhbbFRd8caZv4/Prd+DjH8p2pOKqY8EUtR8
	+lQxnzYa36pzTPqnyL9uU/9wP9KOzoMEWUevQTDjMwKagOW+p4kDF2O7xwq9m+885Xxqevj2e3m
	e+4oJdpgR1/BT73FXMqg2TQK04pUr3aaanfvQawks3AI2LicYGOZCzLKC0WeoDFp0Z2651MsN8e
	i3eI7kIjQ9FUMuRiuavMvd/NVSI9uHxdl4XBfAD4TngoKzht2/6+DqeiakGvP9fVd3DOhsApcD4
	VySF8dSI111aR9H8cYhB4HI2nu2OuumtMUrpevfaKC+ab4t5fSciYF6H21g+mpcvc10yXKvszj0
	416BuslJiwgyyZLO7rAJC9upKVOr6GZOFKLo0LrqegrB1CIqBaWT
X-Received: by 2002:a17:907:d649:b0:c36:7579:fe6d with SMTP id a640c23a62f3a-c46bddce8edmr1009655366b.11.1793108845951;
        Tue, 27 Oct 2026 06:47:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5206dasm460325266b.33.2026.10.27.06.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:47:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:47:22 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: John Ogness <john.ogness@linutronix.de>, chris@chrisdown.name,
	Sam Crossley <samuelcrossley@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Message-ID: <auCraiuMZApQHiNA@pathway.suse.cz>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
 <87fqxskdpl.fsf@jogness.linutronix.de>
 <at84qygscue8crQi@gmail.com>
 <87a4o0k3qa.fsf@jogness.linutronix.de>
 <at9qgBucVm-QHnye@pathway.suse.cz>
 <87zew0ifpp.fsf@jogness.linutronix.de>
 <at-Ppa86sBw7mO8W@gmail.com>
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
In-Reply-To: <at-Ppa86sBw7mO8W@gmail.com>

On Mon 2026-10-26 10:49:32, Breno Leitao wrote:
> A bit of context on the use case from our side.
> 
> In an ideal world netconsole is enabled from early boot through the
> kernel command line, but in some case this is impossible
> (linux as bootloaders - ipxe/sd-stubs/etc).
> 
> The other way to setup netconsole is to create a new target at runtime
> through configfs. Netconsole then only sends messages from the time the
> target is enabled.
> 
> For this second case, I would like to replay the whole kernel log on
> netconsole, such as previous messages. Something might have happened
> before the target was enabled, and we want visibility into that.

Just to be sure that I understand it correctly. 

Is the netconsole registered before it gets functional, please?

Is it possible to detect that the netconsole is not yet functional
and when it could start working?

I ask because there is the flag CON_PRINTBUFFER which should cause
re-playing all messages on the console during registration.

A solution might be to delay the console registration until
the netwok target is really working.

Another solution might be to temporary block/disable the console
until it gets operational. We already have console_suspend()/resume()
API. But we might need something new to distinguish it from
the system suspend/resume handling.

> That said, the "per-console counter" might work as well, since it would
> start as 0, thus, we know that netconsole target would be behind, and
> try to replay? (not sure how yet)

This is what the console_try_replay_all() does. The only difference
is that it resets the counter to the oldest available message,
see __console_rewind_all(). It is just a small optimization
when the ring buffer is already full and the oldest messages
are gone.

> That said, one way or another might work for our purposes ?!

Best Regards,
Petr
