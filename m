Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440816;
	b=ToFPCemC5+3K4LMunvaE0ljbEyUgSGSkNdkkRr10NS2yWVXsZG4esApFK7cQFvX+zw+u
	 8KDFwiqBWrUxV1OvpajQ4LcbEZ6D9vsrbaH0SGrkTPE5AXIWwh5U9+wviCEDM733GwOGP
	 iR+K8SCDUE1A0PNoOE7+ieHzudT4QW6WzLNbjgSU4dN4+P7zfYxEgH6Shs2K7XbM/L1Y5
	 5S5GzGuQYZxO+wnFiwW6Sl7lFryYnIJs4MTISXj6YEcSGeuB0XA0POd4jZR/fJWpm1qcT
	 X/0axPD1jwP9hcJmahs8rqJMURQfkLImdgNVPTifX6Upvg/NQTT0USx9gkVeodDJ9oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
	b=utuEaZgR2FkYJ6nZ0XGucwvlK8lofzOLTYqXEMgapWhneJNxZzxuLgG2SvrSOQxhhoBr
	 4wJIJCDl9Tb5h3yd7d25H+ic8lCEPyLkR3jRYky/Q0hK5XTPTLfcjng4QXmj7da9rsnxq
	 iJbpTrxhZZTOSoEo2e2MsABTTs+vlStur3lvAIvkKIpg+0Leo9DENngLQGnGfK1JDtlBV
	 BSeZzPPxErJYZ8fNdjlVHy3Xazcf6neAX8guZ8pt+ECYnda5wEYLqxMGIiFikXYRcyQyg
	 ZdUHEzfRAhuYJNJssTSnoZAUQZGLzntiSB4fd7vHwcvV7/p4GIHeTdmzJMPyvqHNadA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=dac2R7p9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F42606A32D
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 23:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F42606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=dac2R7p9
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-705cb6cedd5so217997eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794440815; cv=none;
        d=google.com; s=arc-20260327;
        b=pACodp0quzPvp7dMOBAMjEa6bDL1fynJ0zw5tU47Z5wc7PCbE/Frod+F+p1t6rlbwa
         aoWYeeedIqK/gbmDupVOv7G/V1B+S3RQX9Xna7ndYZg3lebk2TGKBgkISIQGvqEtHmht
         AK7QoCpoKg5yUDFwRS7nKZrx5ExIj25crtYrlvmx97dNAs19oVldn7r6EBNOZAGpslSb
         MStU9jPLhwyHXqezHVYXwvdMCarfzlyqeTxTqa5mOAafMbMWp1FEYMibVeIe4l0IvpPV
         3orgwFSIGHvgHTOR101AT/qXx0hPv4UQiCVUA2Djn+LFXgSFcrgG4fw1/hDdQklrE9UT
         6zVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        fh=lp0eSv0NoMK0YK6HXQAAELqLSTwH6QJrUnE9M1PB93U=;
        b=JfDCoKqaLdlbaZqVKDPRauYWEqSphzcoKpOSkUgkGNRaoolvPoHT3eXWBM3X72rEc2
         jy7aZmH0CUR1/bspSRxSJxu/ZZjW6oo9ZxQcs58oc72EG4hBSa884flymk0LBnnG8zCW
         InIvDshesLhiaSaQZ5F4p2Tc9OJzsEcbG281oHLwL/CyWL4cFXD6etdIb+vhwfOnVQyC
         dAfYPNTJqGVeXRLQOmUgs7VkheA+NZuDyKA4BLXs4Qbhz5Ok15OLtVuD85+z0WEcxqGe
         YMt5unKEVW66pHLwxkLfo1fVS1c6k4nS/00EW76ULMtXIuE2nhTwnMWgunR8mUygAz75
         2JBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794440815; x=1795045615; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        b=dac2R7p9+cB5BEzTcZEC4UD5mSqiP31C+zHEerdXQhO9cW04nOmQ6IxCLJoufj2a4i
         lIheF7foV3U82lvP4a7X/X1u109RkXk+aPRqcUGbxlqzgSjw0NEkdBiwN8VRoSfL3BGV
         neWl5celWXwE4ZCMZ0Sd6+YZMf5rgmhZ6Tm8AynGjTx4XoY9jcnbeHlnZXKJzrv82bWh
         hCRsdmnAVPxYyjyboftLO0ldrMfAzyjeiPnkgeGqmWiI3koRt+qdfGCL0+gpKKt39cdB
         JKrXQrL0w3C6Xu2BQAq0yY94+hFUHZUoqt9alAom/ErZsjCUjtrjuTTPTqPWxK+lfu1U
         LGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440815; x=1795045615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        b=CoGy+WZuGEMc3pBQGHk0b9hGl3AvZVRy2JFdgBB3xlnKT0tAgIhIqhbmT76BqOf/vu
         gKa+RdihbTqKU5A372QAeQLL9Cb/oj3PQ0v9MXETUznOhS767w9rwO9Cu9P48c2/MzwC
         gznCtGn9zfs6heKp71DK7LMCfR4f4RocwRgGwgTUwfwzwsM/XYzFlUhsnr7qtIoO+w1H
         PgnSQ/pETeDmDqYPCdOvgzDtwAVXFJkz8OIEkbWB6L76YBDzZGIN/rqSThF/tNjuOfLo
         QInAQjX+E3DXlieoyRi5rd6zecb0Nk5ERaVSSpMnBc38WFC1pUMK6oVvIIE5aTw/CJj8
         TeyA==
X-Forwarded-Encrypted: i=1; AL+hErFLHOaOVC8Lb1un3tHDpTATQ7RFxv5WXK4hHDdKTz3dddY6Qv3Mo1gBZI1D8QyaARWHsmY27DhgwyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ql6ikaY4KxxjeNXyD7g0E+FzL+1TIvGZjiZa7+JDiXSjhtH7l
	ppksOx/dObqMJyNITmM1IliFNxYVepL54RLXbuPbOH/i5QpwbrLf+DYn4PTju9jKWdx+dP0FUgx
	XelcykURakeaMBebNoPydCGhhv4ktaTVUalCndp1yIQ==
X-Gm-Gg: AYBFou2ofnzs3oR16DWERiV0oZy+TJ/IfX80se9yOiC/rHOUX+K8mJUwQAZ3BxefuGi
	ef87dq3rgHImFL2Pbpx4+xjcrnwL6Yh1drLnyznI/y5EhRUhrXgj6svc7FqPYh4XZBrpkeqZ+4y
	9inaRXL7+c3XL1o5nwzHMISYTjpKoTvJ5j9a95s7K3Q5DIxQp4Z/dpF6LugQiGrAMbmJLBrn+lt
	4zPA9Ob8y+JZYiZc4KvWrknCme77izkf6o1jP3K6DIviROeRe1ZWBuofK30JZB1qRCZ14NsFEHC
	+/f+1pKirOvGKMbJxPFLOd1KWn/GDhrZPMh03Rg82pDIoxGnI9eMTp8ap+TLXxV1NzWKJCPKsir
	45nrAKjfYtqYDt+xnb8bsgDkq0P0zp0d4pJlHdMHzItWvLchFBgW9sVN6I5IdJLz8m+SG+mArDP
	K0G/sTOcfmDw==
X-Received: by 2002:a05:6820:f004:b0:719:1627:6c16 with SMTP id
 006d021491bc7-7196b62ab2dmr743911eaf.12.1794440810117; Wed, 11 Nov 2026
 15:46:50 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com> <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
In-Reply-To: <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 23:46:39 +0000
X-Gm-Features: AclHuK98I8l2CyqIug_hRhhYiDHFe7Xrim7_SwhM5rRiI9ms5coKAG0rV8Jl2JY
Message-ID: <CAG4wq-dw8VqiVTbi-fSJTnwj+amkfE_56ndKCYk4v31z2ppcTA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Stanislav,

On 11/11, Stanislav Fomichev wrote:
> My main concern is that we are adding a lot of code and one more
> special way to plumb the metadata (and another metadata area), another
> set of kfuncs

The RX metadata can be stale on XDP_PASS and lost on XDP_REDIRECT.
There are already separate attempts to fix it:

- the RX hash and the VLAN tag [1],
- a checksum assertion [2],
- the checksum invalidation that you suggested [3].

For me, the question is not whether to plumb the metadata, but how.
It is not great to have fragmented mechanisms. The skb core extension
area aims to unify them.

That is my view. What do you think is the best way to solve these
problems?

> and slowly creeping more features into xdp making it
> more and more like skb.

I will leave this to Jesper.

> For containers in general, and for fast af_/xdp, we seem to have been
> moving into netkit with queue leasing. Maybe that's something that
> can help with your veth performance?

Thank you for the suggestion. Unfortunately, it does not fit our case.
Our XDP program decides where each packet goes, from the inner
headers after decap or even partial decryption [4]. Hardware queue
steering cannot do this.

This series also covers cases without containers: XDP_PASS on the NIC
and cpumap load balancing.

[1] https://lore.kernel.org/all/175146824674.1421237.18351246421763677468.stgit@firesoul/
[2] https://lore.kernel.org/all/20260630191510.81402-1-deliran@verdict.gg/
[3] https://lore.kernel.org/all/amEojEGsIGkUjIWn@devvm7509.cco0.facebook.com/
[4] https://lore.kernel.org/all/ca38f2ed-999f-4ce1-8035-8ee9247f27f2@kernel.org/

Cheers,
Tianyi
