Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427838;
	b=tV63JMkP6rPYFTIoeDIL+/2suzMa3Fowd2dEVpwvxWnCJxVsT+XsAZumlV6ePA6xaZ0X
	 rJZGRGIrNrkF1/9P7WiJXFXbob+c/qjZZQxv0OxG0Iql5qHT9OR57SCWJ45J/txLExjDg
	 Kt9Ws8c3WZnwKcV0OHVl3CZCGbRYVl1E85L3nwysM/haXAOz/0HGSSrn5k0PKmejUvK1R
	 XbpfHvX/Hy4o7hyfpCVWPmKmCfxWF3SqrOM7NnIy3xK+UERxopbgfREYtvVVbYUeJfavH
	 ehbVaAQ+p0bsD3ZlhU+mb3011bmZAO2m7h7aW0RjsawQUfpMF8SuKMnSbgyi4LW7uSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427838;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4s8ObVh8aYrx9unOg3Fhb+rodQ27w3kLEqVCY36mwwQ=;
	b=PZbiC1J0s7Wqtf44wB1ckMGeO+fCgmzmyuABUYmy+3d0GWInwVzdA7fnX8xLJvzMWa1C
	 pcTOxE+bvRzabVXYTzmjDoAU/Uz0QRmJBEeoc5mkEVyRPj/lopecwIMrpZjNcLjJObzs6
	 PIqqS07XFsIcYU77OEwMrbjgut/YHH6P7oo11P576dUtzkIMoAyaAkrmJfdVXJ40y8unq
	 zwDA71Q99mnmBDoWjQiE1/8SkkafKG5cxGFoKKgFDF8JihCKrK1U3IgGnk18LXzqbGhKj
	 PdlMsiS1aqapVWIoK8APWsnOOZj099KrI8PVjhay1o8MPOQRZkxP6hYOTUWpZp4Ftig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KhPbG/Co";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F4606A32C
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhPbG/Co
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07B41F000D4
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427837;
	bh=4s8ObVh8aYrx9unOg3Fhb+rodQ27w3kLEqVCY36mwwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KhPbG/CoifjG+/yNpmHATBRMfFPEhDxkvSiMArJ2Io+DP3li+Gfx3z/uGaXDVzLAf
	 z8U7loBNU/h9j9f1uSWcPTK29wLWcsEzD5rE5QenWvJ2BW/1uKxVLRKisUUDd9hoDh
	 6VadaL+BpdddiZrbbFkTy6cU/gy8vVcUotFjjbfOzEYxpN9NbSX2h0Rk2SQKO6D+YU
	 ZFsj7hz5JHcHXYV6Ce1IKcHCylniO4M0uqqGk0/2OqamGelhrV00Hmz2l8XcODXe6A
	 IURHeVHzq+t+jxLrgP0wBlILq3V1kTd0HpaWCQ1HZudIRI+1L5i54NvRKy8sESCLM0
	 OnQAtsRg5DmEQ==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8479f46ecd8so1224284a34.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:57:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHziDArRVlp2ia2m3isd8/7b/DySVScHfghUaIGJMnO8taXkOXS1S6WyXr0JBc6TNbe0XvKooobxz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vnMia6Mw4uZD/G/1MGB7WjPy3iIYyt/dpPL7HL4IIBOBKKtTy
	MffDs+r1j6jE2VSRgU4Oox3uVmD8DBfE5GdN4RQXEXuWQtzJGY7ugG6nmmsjDxzUa5m21dygx8O
	PKLEpjtkEnYS2K/Nh3ZaDJA3N65xMg7Q=
X-Received: by 2002:a05:6808:4f4f:b0:56a:dc07:f218 with SMTP id
 5614622812f47-57a0a10c801mr12163511b6e.20.1795427837069; Mon, 23 Nov 2026
 01:57:17 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795424546.git.x-professor@outlook.com>
In-Reply-To: <cover.1795424546.git.x-professor@outlook.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 10:57:06 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqKAmkvqD+WMms7ZCwGDm3QE_Aw8VfqA=Xc6k1=8O-8Rg@mail.gmail.com>
X-Gm-Features: Aa3M54p7KYmo2scuMtB2OXhhali3YsSnFeJgNMDOhVNqlLJAMAK0n7zrYR_BrAM
Message-ID: <CAL4WiiqKAmkvqD+WMms7ZCwGDm3QE_Aw8VfqA=Xc6k1=8O-8Rg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/2] tcp/mptcp: prevent blackhole timeout
 arithmetic wraparound
To: Yingjie Wang <x-professor@outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "mptcp@lists.linux.dev" <mptcp@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "ncardwell@google.com" <ncardwell@google.com>, 
	"gang.yan@linux.dev" <gang.yan@linux.dev>, "kuniyu@google.com" <kuniyu@google.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org" <horms@kernel.org>, 
	"matttbe@kernel.org" <matttbe@kernel.org>, "martineau@kernel.org" <martineau@kernel.org>, 
	"geliang@kernel.org" <geliang@kernel.org>, "ycheng@google.com" <ycheng@google.com>, 
	"weiwan@google.com" <weiwan@google.com>, "joel.granados@kernel.org" <joel.granados@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 10:34, Yingjie Wang <x-professor@outlook.com> a=
 =C3=A9crit :
>
> The TCP Fast Open and MPTCP blackhole timeout calculations can wrap in
> 32-bit unsigned arithmetic, even on 64-bit kernels. With HZ=3D1000 and a
> 64-fold backoff, 67109 seconds becomes 8.7 seconds instead of about
> 50 days.
>
> Compute both delays in u64, cap them at MAX_JIFFY_OFFSET, and limit both
> initial timeout sysctls to one day. The new input limits reject values
> that were previously accepted, so this series remains for net-next and
> is not intended for stable.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
