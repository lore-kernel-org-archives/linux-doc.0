Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014422;
	b=5Fdb9AdTEzbHOam9QeDQZaZoyofgmld/V5l9oR6hMJI2a5TFSJW3yiniTfaS0F7Tek4s
	 RPNbaiH7NdxHRzvzAkV/kq7yju6L01cztVBGP1S0L5IlWBhYf3/ed6hWl/t0GQLLALjFq
	 aXBoFY475oL0P42xiFbecOcwRJg5u48SzebL3k0S78qoID33rbRxyCGtQ4VJtXmtvKrXw
	 qX3q1lir7V2KSr/Yah+4fGRSi/Jour1Urmh0tyq4qMUvIqV7DRzYr1YkRHB3MBIqtBqMy
	 uo/AkGAvtD9gCNOC1WfiNQTAa2dx3hn9pTt2VyDtaA1KHqJblN7DMWsF8YjS4NEYSAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014422;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FLLgoY4vzpl3VeoTzJ1Eki0KKKvfGT0/D/rtdudkmNU=;
	b=zCzUAQjoTTXw5Bv+S3x3dPfknAhDtK8NRF+uwQP3u93eCyWpjzn2gbOO7UO1svpChEaf
	 0Eq/N3MwNlS29ITkIFSKvNAfPyumaE7pK1sBkuxaJFbfyShlA0LG9Sci71YXficSsLAeo
	 8X3+EM+Em/YqLKpT4rzwMRxhHXwTQYUqFv9YRUACs3EHu4o7GHGu+sRVAbfr6ZwlWmbBP
	 n4vcIBeLPXqxalPYNXHORcOeqF0P0EUMTe2zTbpHdDG4oKuec+02TZXdf6aZxpfn2DX95
	 UhqLN77mOYSTCZhAfF5kug/SHYGE/TasGJxyL202SzTXWjIcWBYbOm/Mc7mWibu72/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiyeB1Fu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8F606A337
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiyeB1Fu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD871F000C5
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014421;
	bh=FLLgoY4vzpl3VeoTzJ1Eki0KKKvfGT0/D/rtdudkmNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KiyeB1FuKANKheiwNKWWrLntCZ1zpria8hiMsmm6kDNS1SSSoDwX8H7ZHpxspvan8
	 7tcL9t3gHcQ2p/hrpQ+hcKKFPT2WUTZH/R6clrP2VI4RALEBLzPNRDXVfM/ioqTbe9
	 hEhRZRLOmSqhCO4neP4vqxMuiEvv0h9lWsFlp8fMJmgyK8+9M2DL6JAJ/p3AIM16r9
	 f1ypW/wBmu8svD0Uhd2ZXj9gaMSqZUuzTYsvFQ4T4139tVjq35t9lUocitpHogmrLp
	 7JyLLQ19e8Lvx7d2unhqZi7zrFIYYV6z5VvE8uU5deD3J624LQbFsP7teaeDnVZYen
	 bUuWX8uVFCu4w==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-702dedeb70dso697100eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:07:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGk/RPcUvtr7EFdQumnkBw+f8y4zyt2N+lIU20YmXl9RSDc1+nwbb+j9/ZNtwFOzSGtCM+ZpFsqb3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MhYNCc+YT2A2Qzwp6LsfNJlmp3lwcpb7C164vo2Amz1bzwjaR
	M3jeXfV6lydxIfMpk+QTX9yvTIlaFJSKufJLhkVIn/CFyE929/V9GYl6KYkiTTRQGUdXlaN0zhf
	xKJHsakx7pNq7H9L83kqgNkF0c0n/Hf8=
X-Received: by 2002:a05:6820:7095:10b0:6f8:fcce:a410 with SMTP id
 006d021491bc7-71b18552c41mr1594981eaf.55.1795014421167; Wed, 18 Nov 2026
 07:07:01 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118144249.358481-1-jiayuan.chen@linux.dev> <20261118144249.358481-2-jiayuan.chen@linux.dev>
In-Reply-To: <20261118144249.358481-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 16:06:50 +0100
X-Gmail-Original-Message-ID: <CAL4WiipSzUmvGxRM5PMBugXJ0qjAnobT6+pNuEJhUqTVrVR1Uw@mail.gmail.com>
X-Gm-Features: AclHuK915aJOXi82aBAcq1O_eeNA6-6Devxm-s0eHQNf5wtCOhOKeEZz0_kjdHc
Message-ID: <CAL4WiipSzUmvGxRM5PMBugXJ0qjAnobT6+pNuEJhUqTVrVR1Uw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Kyuwon Cho <kyuwoncho18@gmail.com>, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 15:43, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> icsk_backoff is used as a shift amount in inet_csk_rto_backoff():
>
>         u64 when =3D (u64)icsk->icsk_rto << icsk->icsk_backoff;
>
> It can go past 63 on the paths of both callers:
>
>  - RTO: tcp_retransmit_timer() increments it on every backed-off RTO
>    with no cap of its own, then an ICMP unreachable goes through
>    tcp_ld_RTO_revert().
>  - zero window probe: tcp_send_probe0() increments it up to
>    tcp_retries2, and tcp_probe_timer() calls the helper in its orphan
>    check. commit 6d4634d1b091 ("net: Limit logical shift left of TCP
>    probe0 timeout") clamped tcp_probe0_when() but not this one.
>
> Seen on the RTO path with tcp_retries2=3D255 and a silent peer:
>

Nit: tcp_retries2 does not need to be changed for the RTO path.
TCP_USER_TIMEOUT and TCP_RTO_MAX_MS on the socket are enough, since
retransmits_timed_out() then only looks at the elapsed time.

No need to respin only for this.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
