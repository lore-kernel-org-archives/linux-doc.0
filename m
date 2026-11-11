Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367657;
	b=be16EXPrmhS1pr9ax8ykUZIgbJ1oxQ1TC0VjSGXRrnv28nFM6pYawPYP+osYnYOnRn41
	 Y/VxX3GROM55KbX7kO3GltaybUgvK2j5hUFt0bIO0c1mCwa5PIzKHsY+D+i9VCqiO6ufI
	 k5yP7mzFWXn/+BiOI556hZkchoFsM5DV4a/jwxtWt7oqr02A0BhFen1QLIgl+7/R11hSf
	 9AC/7e4Z6Dc9Zfg0I1pMvcj6hFTWCw7v7DbDJ06yqING9Nz9JbuYTAqtcgertOqIeLFzh
	 WzxPsYi83Snj+Ycebff1Zh/TzhoaEp3X810qOGTvMPkIkOWl5vFZyD1zDANl2r2vv3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6ftcOiAn6XPDtcpJvCuZr8LxfA1KHRDI2fDlQ+L+wc4=;
	b=sz60XOgDDmBLxuk8ioQGqQGg156AyPp3yM/Lap8VoqFjYuxtsG2ncXOK3CcM39ksACFB
	 l1KynXbjPq5NDW3FP6uei1kF9I953UMhOOOWUzo7Xnn2E4JjeZkpWMjJ/E6X1qKim9xEY
	 n5484N0R2AOOj+LOsZpk6ZkaJj7F9tmXtt3Hj5q9tgUuI4NcKDuCYkdSbxBdBcFCZozvK
	 nLvyjWjg1oWb+ZpKumhwjahhkiagSVGyPMqgQAXxIv8Gtwh1piJ8/ZD/Jle2BNrXgV9qu
	 iw4cJUcX2Lw0S6E4sNktOWyehJ8dobSXqiMpoKzgBDCoUIIz1g3c660X/JjB4AT8GXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gs27mUwN;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6859606A327
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 03:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6859606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gs27mUwN
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac01ff101so971713e0c.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 19:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794367656; x=1794972456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ftcOiAn6XPDtcpJvCuZr8LxfA1KHRDI2fDlQ+L+wc4=;
        b=Gs27mUwNykVEwrA3DiBS2V9/b/rXJOS2VWp/xhCQT45S5oHsdWjcVvPPEmcibkVEcX
         na3SoKaPijfWx2N9UFDA2yfziwAl6fpEKGH/vOh1kVLenaKb3p+ykPWwpQOtvrOEOm/k
         /KkK1qVt+6PHvR/r2W3Ob8i7A+odPqqB3vjp6vJq3ytQHQiJnj+7j3ZBhGKGc5+YOAFY
         YRJ3z/Q0EqrPUeIPp9SWqMfUStLMPadMe6AYvgA5OJ6ihREIlvcv8V0AFPI8roljyJ3P
         uYBniZ6b5vySVHJru0SEN1GymH6mYPuFJNDFQmOFEPxmjQxLk2VzEw45P2j7ghjS/kT6
         w9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367656; x=1794972456;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ftcOiAn6XPDtcpJvCuZr8LxfA1KHRDI2fDlQ+L+wc4=;
        b=05rTstqZHWLjfqOaBtal+gZyrRSnpNSO8QHr14LqazvoHlSjQ8ZoaUCt1QhrKQnevD
         +F5cQzxQRHc1k1I7QZhBFlv/Lzpp/PokFXpCatr2x6A7FkjsJgaEyyZYgKjRUGjKIvXF
         mXBpU1WinJxaqB0afDenlSAl8tZEwOdJ+ZIXpS16tqaoc+6DGdkvBbgExKoMA2jiR58c
         AOebKwjnyOT9kxUHwlbBLv5FhEwb7TeA38qrb9BciBSbOXFLg0adAeW1UM3wXtuG8MYu
         IOlfotAfUM8IYNOzGxl3PI4kU0GPh1qnzY3e3Ry4bup0L7piC64a6VjHra4Nrkbb57OM
         zDDQ==
X-Forwarded-Encrypted: i=1; AL+hErF+iH5CdMx6lljTxiHBYF+BHsUUFmp3Rc5KbXdHuHNHYmnrjiLrt02LgRRqPHLmttdQr5Jb9QMa6Ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z//AUnzY5+sYf1P9pHJuPyZPonI+urPk7xxDtooOyaAmtZbrFzJ
	JAxX7v+hedpI3RK7bC2mWW069sH4sUEn+A+n8e/cSAkS48BkCTVlKm4R
X-Gm-Gg: AYBFou3rqtbuazIqtOhapUt+taTWLDSLRGdbsfgkwtPztmSyzyoJpe78gaAwR/2flCB
	CXKD59/DoJ1PUey48u/q85TKz9dg3NqDfX/z0RofKtFUnofqGavbmSdDmcccQ2tT6oWxhnqtcbO
	L6899YEhfhjzZPe/9EV7drwnEzyG0Xi0a/hlf4HJB0iKXO0gKpCoyMxBbk/7cAEou1PlwaulftR
	KA00S0WkBojFxbDwtLoun8SnXMCDg8pw9Fc/LxtfQ+km/4uHQJhH6Vy6Imv2n5gfnFW7gssqkQ0
	BHgd0NlaaxDlrx3uzdJ0UlHIyaroAl5xAQdBYenzS53D3lyWNlGsAduOX1eRLWxpOasDlrOTVRa
	d1VnEZkyFUv+b4/e3dbL/lYrnawxkrOFZc0UMTmN1v3vFp+hReVJh/jHsVosOvL0pl3rybBjkOB
	3ALPQIJ8UyqDaL7CbqL62BoPK8G9HbAJapzLolGkotSM5NpuSu9WGovqr0ROuzKxd5RKaAce4VC
	TzFol+RJkOapEyedTh/xBQCUKckkNkH/Uxi9Buw8PkOzsMSVHL9X75fGGx0z1xsTDv1sXG0QM3T
	F+D2BDyjBPYqBQgTWbXXJ2ES0n1K/A+BTjC1SyNgT3jZJi9o09sdGHWAiI/1coO/3bpFQLv0Tp2
	AWwOSBrhxseauEFYVHyUS9gwOADHt4IYUDMpYO+MdTvAXAf7alq0TnJyfivK4MO/oLUk9qO4=
X-Received: by 2002:a05:6122:3d0b:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5ee1c29a86amr335477e0c.2.1794367655542;
        Tue, 10 Nov 2026 19:27:35 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5afeb2sm3174383e0c.9.2026.11.10.19.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:27:34 -0800 (PST)
Date: Tue, 10 Nov 2026 22:27:33 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, 
 netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Simon Horman <horms@kernel.org>, 
 David Keogh <dkeogh@amazon.com>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Dragos Tatulea <dtatulea@nvidia.com>, 
 Nimrod Oren <noren@nvidia.com>, 
 Alasdair McWilliam <alasdair@mcwilliam.dev>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Breno Leitao <leitao@debian.org>, 
 =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
 Danielle Ratson <danieller@nvidia.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 kernel-team@cloudflare.com, 
 nh-open-source@amazon.com
Message-ID: <willemdebruijn.kernel.37fb7add3354a@gmail.com>
In-Reply-To: <20261110201250.95225-1-tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
 <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com>
 <20261107182526.69543-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
 <20261108190831.3f991a13@phoenix.local>
 <20261109154909.32748-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.935b9bf7f1a1@gmail.com>
 <20261110201250.95225-1-tianyi@cloudflare.com>
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and
 LL_ALLOC_SPACE()
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Tianyi Gao wrote:
> Hi Willem,
> 
> On Tue, 10 Nov 2026 11:23:09 -0500, Willem de Bruijn wrote:
> > I have some hope that if there is sufficient reason, this backlinking
> > to the originating netdev (or socket?) can eventually be addressed as
> > well. Rather than work around it.
> >
> > The skb_orphan and iif issues are well know. But not set in stone.
> 
> Thank you for the suggestion. I looked at what backlinking would take.
> 
> For the socket, ip_rcv_core() orphans the skb, and after that skb->sk
> holds the receiving socket, for tproxy and early demux. Keeping the
> sender's socket there would break that assumption.
> 
> For the netdev, skb_iif is the last receiving device, not the
> allocating one. So keeping the origin needs new state in the skb,
> such as an skb extension.
> 
> Even with a backlink, the kernel still needs to know when to adjust
> tx_extra_headroom of the originating netdev. This brings back
> auto-tuning, with the problems from my earlier reply.
> 
> Taking a step back, IMHO it is more natural to set the extra headroom
> indication on the netdev that the skb is allocated for, than to have
> other devices raise it through a backlink, which can get messy.

As said, the problem with that is that an admin has to do it, each
time. Whereas the kernel has this information.

> For v2, I would prefer the narrow VETH_INFO_TX_EXTRA_HEADROOM UAPI,
> following what has been done for IFLA_NETKIT_HEADROOM. I will put it
> in the last two patches, so the rest of the series can be taken
> without it if you prefer.

Ok. I don't expect this to be solved in this series.
