Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903488;
	b=FO0lvjWUdTqSCZkUJOFS3qwg3otVC5ULxyd7TQ6arxu+VvIzcaR2Sz9x3dc9Fzpmgg0B
	 WjzJSifWheLxgFlg+jaFDoHazmrjcOHh97w1Z509XFnNUlPCG+opzwgCSS41V9CBrxwbC
	 OBa6t4uzDoGgeIaEGdnj/sH9SxB4UAK8nUdPFfs7kEF6UiEfoOvny2vXhamHR47qfss2R
	 pp1TsF6ENXCpPnFqeeUKzd02oa3u9IXWwDf6QQ0KprNy35xWmYZAj5zG0ydqJF07z1FdP
	 I5Vi52pMO/ZHw2bLNDBeTHAys+oABljSOpODk/lR0tus/nA6B2taJ6hp+mvPa85bz4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903488;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jY+9TWBtAeF2CFQwS+xjxt4ZJ04a32EQCLLfMF6sC9o=;
	b=EFpX3JKnzMIoimsJb9asQbqUg9fSL1599sFrqZZmVCZYYcn7r4E3ImC0hqAb5pRg39KZ
	 iydmrNUJAbtHJXhNoIkAQwbfJS4cYj6D8iWqFyqeSiNfPA9JTCm1t8acp7/qLfVMGejAj
	 SNPVcRgvVXtbAkEv3oQ8OnOlFYIcbnJSQaJ0fP+bAwofiTU4/d37NkK3J1MkxG02rtedv
	 GEvH6Ypy2D0OQkzZJ88F+SF/eRDld0JsBQxL4UfBghjfl0qKkNlrhHvbsIadF1UWheOYU
	 4A7QrqqQaZLWXg8ek0iKDlH18pVmeWUdRUAArog2x3Wf/s/E15ywG8USGZnlmMli8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0F+SFTQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAFD606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0F+SFTQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EA81F000C9
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903488;
	bh=jY+9TWBtAeF2CFQwS+xjxt4ZJ04a32EQCLLfMF6sC9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F0F+SFTQzuYttdly0uM6MzzLasG95AmEGRDXvibMqR8tsUbmZ4DYCQxL2OQoq4PhC
	 OMMTv/DjuQGYu8ez39GaP74iMDBDbWoxVXt7CbHstA0dxW6wr5qOa0HHKEdE9lFydt
	 3l5Lpt2/Kq2OWgUE9HeiRupFevUZYS/AZo+ev4jexdL5m6SJtYdZz7UN4Z51pE67xt
	 2Q6n2+FwzHXM/AzQQqbTrZcjlupf1D7/10cXmxOP2IMdNBiKlX8N6BehBj7AotyR76
	 tF1w8qJqFi8KGVMr9ubHi8AG0qugG6vpLvdrJ9IzVLlbybNJfhvqq1ifeJZnK/oY06
	 pNikoNHVC/kxQ==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71acdd32a53so1248021eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 00:18:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFWp90+3k3ctTQY0XDY7ZQ2KgQncCWTe+fEy/2ubEyGfXpHPsH/KS6gVfc0OAmQyM9CPtia0i5rF7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z93LlWBgeu+Jd+mkSqiafgDqvyGLOKf9a+bC0e5C2S+gP7AP9Iy
	cNRxpNBCTGiQxnQ7k/8ia1trYxqtj/X1xP9zG7gGtCWMQiCG+zEhsOc5lsy7yCPzrXEFJUvtpsC
	DaWBr7evF2Z7hTeACoJ/6w0rLAWMa6Ew=
X-Received: by 2002:a05:6820:2219:b0:71a:dd74:1ee5 with SMTP id
 006d021491bc7-71add742771mr5182800eaf.43.1794903487596; Tue, 17 Nov 2026
 00:18:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcp-mtu-probing-doc-v1-v1-1-552ae04de4ef@gmail.com>
In-Reply-To: <20261117-tcp-mtu-probing-doc-v1-v1-1-552ae04de4ef@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:17:56 +0100
X-Gmail-Original-Message-ID: <CAL4WiirGY0a-ybU9YQF=DUwvT=LwYQ3T-Xum69m1jvUJZgmAbw@mail.gmail.com>
X-Gm-Features: AclHuK8Gl49qsnZUNoWiS5IYuX-GT6usEXRrdpt-iZywYA4rtgmzbRoXuglD4fw
Message-ID: <CAL4WiirGY0a-ybU9YQF=DUwvT=LwYQ3T-Xum69m1jvUJZgmAbw@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: document black hole detection for tcp_mtu_probing
To: echoowall@gmail.com
Cc: corbet@lwn.net, pabeni@redhat.com, davem@davemloft.net, kuba@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com, 
	rdunlap@infradead.org, horms@kernel.org, ncardwell@google.com, 
	linux-doc@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 09:09, Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> a =C3=A9crit :
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> ip-sysctl.rst says that tcp_mtu_probing=3D1 enables MTU probing once an
> ICMP black hole is detected, but not when that happens or what TCP
> does then.
>
> Describe both, as implemented in tcp_write_timeout() and
> tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
> and tcp_base_mss.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
> This describes the behavior checked by the black hole detection tests
> added in commit 8a83f21ad75d ("selftests/net: packetdrill: add TCP black
> hole detection tests").
> ---
>  Documentation/networking/ip-sysctl.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/netwo=
rking/ip-sysctl.rst
> index 0b7bfbd98a92..a11baf04758c 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -412,6 +412,8 @@ tcp_base_mss - INTEGER
>         Path MTU discovery (MTU probing).  If MTU probing is enabled,
>         this is the initial MSS used by the connection.
>
> +       Default: 1024
> +
>  tcp_mtu_probe_floor - INTEGER
>         If MTU probing is enabled this caps the minimum MSS used for sear=
ch_low
>         for the connection.
> @@ -711,6 +713,20 @@ tcp_mtu_probing - INTEGER
>         - 1 - Disabled by default, enabled when an ICMP black hole detect=
ed
>         - 2 - Always enabled, use initial MSS of tcp_base_mss.
>
> +       A black hole is detected when the retransmission timer fires afte=
r
> +       the handshake and retransmissions have stayed unacknowledged for =
as
> +       long as tcp_retries1 retransmissions would take with the minimum
> +       RTO, which is 3 seconds with the default tcp_retries1.

"minimum RTO" is ambiguous in this file: readers will think of
tcp_rto_min_us or the per-route rto_min. retransmits_timed_out() uses
the TCP_RTO_MIN constant here, so I would spell out 200 ms.

It might also be worth saying that this time is counted from the first
retransmission, and only checked when the timer fires. For a flow with
a 200 ms RTO, the detection happens at the fifth timeout, about
6 seconds after the original transmission.

(The 3 seconds also assume the default tcp_rto_max_ms, but I do not
think this needs to be documented.)

> +
> +       With value 1, the first detection enables MTU probing and the MSS
> +       falls back to tcp_base_mss. Each later detection, or any detectio=
n

The MSS is only lowered: tcp_sync_mss() uses
min(mss, search_low mss), so a connection already below tcp_base_mss
keeps its MSS.

"Each later detection" could be "Each further retransmission timeout",
since tcp_mtu_probing() is called on every RTO once the threshold has
been reached.

> +       with value 2, lowers search_low to half its MSS, keeping it at mo=
st
> +       tcp_base_mss and at least tcp_mtu_probe_floor and tcp_min_snd_mss=
.
> +       Once MTU probing is enabled, the connection also probes for a lar=
ger
> +       MSS, as with value 2.
> +
> +       Default: 0
> +
>  tcp_probe_interval - UNSIGNED INTEGER
>         Controls how often to start TCP Packetization-Layer Path MTU
>         Discovery reprobe. The default is reprobing every 10 minutes as
>
> ---
> base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
> change-id: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b
>
> Best regards,
> --
> Yongjian Wang <echoowall@gmail.com>
>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
