Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558582;
	b=G7g5MIX3JkLSxZIJ2Gu0H1u/msisN19+2Ejt7mVTjrNA+ikggShMWS34pYoJ2cUjXs1g
	 I5xRzW3zK8FV23kn3Ifu7lgacazYD915Rjt8GRNgf9/xBABwj90AkTbVdwAhoQzrdFoxw
	 wFztZp868K/zReidN4RCunzAaZQQ664Vm3ZbLHDWQfq6eBlrXzfI1Ttg3TEijzq3e5/QV
	 gxkDCQNXZxUw4WJf+foTldbtcm+p1HijKvD9dQ2E0dOC+ztwc8d3We5+pCOU7hxofcRz8
	 eMYXYFG/nytUEFIEj0tRmcr7FYRKrwL8TgW+/5ZMcW4HZsXalZXAQi/inajVTX5zpcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558582;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1mYFa7xxgjAJeyPToTySUaczpeeUgBwhkLFQ6YEU7hQ=;
	b=IAINUPwTsT5lVXfnwibigW1mDI1wquN2MYkukksbDqgoHXc5ILPz1oESO0563Oy0hJpN
	 tNQR7XACVqMvTae653Qf5DeHyAi3hPWeNCEXn9t6GNqdZCLjWsv+9PSmT4wTtgHYNtZoW
	 J04k0wEdxeIMQFLnAwTERCM1B/nY+ylnE5txhZZCK7JXkOJ/U10A+ToC+hFxuqamUlqgG
	 QIHfTpqV0BTZ5UA9vSWBwTqUITIcBS2PY4KZr0l/3BfdPC6EvBAQmxnVEkrOFqNWJIplT
	 qWH6Yy/NqQfli6u4oGbgSsTtffwwgxnSCJs4scVkYOStzRK9N3EJ4vm7sfD4WUsOVmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1g4.org;
	spf=pass smtp.mailfrom=1g4.org;
	dkim=pass header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b=Z4pVlkPr;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9060A383B
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F9060A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=1g4.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1g4.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b=Z4pVlkPr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1g4.org;
	s=protonmail; t=1794558573; x=1794817773;
	bh=1mYFa7xxgjAJeyPToTySUaczpeeUgBwhkLFQ6YEU7hQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z4pVlkPru5cQylQgYvXMOr49LFb2OHKQRpwgqEsPQ8IYOcp5mY86PTpezXkfEXJIM
	 TSWPAC6obDhtBNj8zBxGTMp4LunDoLDgHI8CkgfsnlwI90lWB9o6nf88ZWXy5JTsyJ
	 oyg4WoL4zZxN7i4Q4dYHhxADPMk3sh+uRVhA6rIsjYPzgl+bzhDT/FttGFSsPYvf5B
	 UZxLMtao3ZKqzEClyme06nK7cG5P1Vh00IoMUU72thYfI/lkBUMkmXeqLlIgi6RL8Y
	 GlCImxsZ7xBP1myXhpZBT84h2pzXJ9nbLH4rhzSnwNydeyT9lMMQhmNIm9Y6BzKyC6
	 E8DKtqW7gMFxg==
Date: Fri, 13 Nov 2026 08:29:24 +0000
To: Ding Meng <meng.ding@siemens.com>, "gerhard@engleder-embedded.com" <gerhard@engleder-embedded.com>
From: Paul Moses <p@1g4.org>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Richard Cochran <richardcochran@gmail.com>, florian.bezdeka@siemens.com, jan.kiszka@siemens.com, wq.wang@siemens.com, Jason Xing <kerneljasonxing@gmail.com>, Simon Horman <horms@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] net: mark skb NAPI IDs independently of busy polling
Message-ID: <Fhn2gT70aJ-2_eak73NBZYuXuKtVb64PoD8VQ9jwm-S-K0RhZilAg9iwSBJ0RlaiSrRvM1vPw1aHvGPjcktu9GmdBuvFk9244-q2IVOrFu0=@1g4.org>
In-Reply-To: <4pqljild2fp6eotiicvwbwu2wfw66fzd4qamwt6utirdjxlaok@iiu2f3k7azrp>
References: <20261105071706.7043-1-meng.ding@siemens.com> <20261110134539.12d860ef@kernel.org> <4pqljild2fp6eotiicvwbwu2wfw66fzd4qamwt6utirdjxlaok@iiu2f3k7azrp>
Feedback-ID: 8253658:user:proton
X-Pm-Message-ID: 8667dd8222532892df754a88db7395758801c657
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
Content-Transfer-Encoding: quoted-printable


>=20
> Then, drivers that use deferred timestamp conversion (e.g. igc, engleder)=
 must
> specify a busy poll dependency if they want to obtain the original net
> device upon consuming the skb. However, this dependency is far from
> obvious, and annotating it for future features of this kind will be very
> hard to discover.

The "deferred timestamp conversion" was incomplete is what I'm saying.

This started with 97dc7cd92ac6, 0abb62b68252 and 069b142f5819 were built up=
on
it, so maybe Gerhard should decide the path forward?
