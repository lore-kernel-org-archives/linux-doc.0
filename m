Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794325561;
	b=v9IMFpHig8B9J6DVL+aPefcU4UHpmrxprIcR9x218n38DMNFgxn7Ny7pYyj1HaMKmZoS
	 WFtzVDvBvBY3aJ4ANKTVwyg/1qv8aFH01xL6PL1h0Pu8JooLCPetXZusD8MkumIYXtFab
	 Vd1A/H3DmhjUZRECHPastzbVFxVyPiRj+3nrlmGNAQpSdLze4L6pYZi9ez0plhv3cbJBc
	 EO0R5IsBYEJ73irxHpVj7huPnI5hbNRYoCh5w1WTJkNYT2jWCq6J18RejNj78MCpoNz3f
	 nwQ7qYqQkGG+j1sQ5T0DhAnQahRrJY1nQ0pDeNEeT49gUEZLInJ54FeASa8HHBA9JAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
	b=gDDbFA6/4XJj559xlNf3UYWQ2nKWhBr08WEWk1fnzAGq9ckXf79omLMhwouH59EEXuK3
	 qLUhHeHNTlcFseU+pwMPdBIvmi6r2PBqJq8IGsKb1CHr7DqJLinWIOsf/O1BHUzDVcs2H
	 Z8/rPy8L+NrXjsDLu2WaKcRkTNv9f02AtM6ypcYn/HLB1+sZK7QkYaT2q3LjEWPxoo24q
	 4ydXCgHd4AM8sfGovbz4cuVkR5yF22m353A1QE2pIs2TqL+ryHvy71q1Km5KSA0SRB7DX
	 RzlGgae7biSD0Teu91GPqRbEEKMoV4xMRepvsBLZjGiStlvyxZwrQosl9IogoiSoxrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eZLW2NkF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807C606AB55
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3807C606AB55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eZLW2NkF
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-702dedeb70dso1098743eaf.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 07:45:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794325555; cv=none;
        d=google.com; s=arc-20260327;
        b=BjGWrZHv/IZdxIpuflEvWsN6GztziVs21YgoeykynZIg9X/dN2KcOwAcVtBM7xr0bn
         KJrVY3BCRyn+Vbs/eJ9XexVCLSbRXzGsU61DO9BhNIHBr+0NFu1ieD61dxMHqoSznoc8
         SsNNN2HQIz+UpOHqjnkWdAmabA4FEyHCtv8fG4M2UtREdCP14CqAesc7oXiKVu/k18Kt
         CNFOaK5FJVJF4VVm9LfixkIVm5qP1iQorlsYTGOtc77bq97KCDUzXD9jka545ZDOUxJe
         nJjsYJTAeKFo54ryE7GElh98G6GC56doQHNnwshoLcwzx8+ble8iYyqg32r8HN31NFRo
         NDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
        fh=nbLeNt9T2zNYZq2KLD+FGWfMY8GCPppn2nI4Mdwo8uM=;
        b=rsuWqKBBxbjGQNwDFE+DDp1pztTzmJVlxDoH6LTciGByJ00JDf0nIaZbdziMWZkNnC
         +3lsr6YNlbpvWS9gLkcHNTw/+i+6Aua2GfUttyzqL+GGN4AXJHeHRghmK/tYyAPNgkgt
         tzsu5uSNgIXY6N1cmx8ViJ9O2JLKwR0yaGZhL99d+M0Tg/sgs7EaBZRMw60bTtnVsNHq
         ZtKu/PkNk0D+Qvi0bA52d682jY8On7YCiLlI+lJBX0KbDaS4vgHofol1vHlo65DzTls7
         bnH2p4nmEz2zTUuIBFoSf++dOtcREgmvbKZexKd5To+0VcRY7n7axYI+Zug/1nzkmZae
         87+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794325555; x=1794930355; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
        b=eZLW2NkFr/j9icFxNcvCAM88kGStK/E6aBuXF8X9PTB/TJstGOhvTD+oxnr2K/CFip
         LcDYPep9GKsBbabgbijJK8fW8Ri7k+AQgTpbE0lfmYbq++4uEecMHCP8cJy+ASy5Fn1C
         Z7cmYFLcw+cxPvYec6ZFIcz9h0hx9GUCZQNC8nte43cm5qiHbXRbnTNHTBl1+VeMbkIY
         uqoY4pDGStIpFAnESbzX/o6nCQkRdYtqB95sCYlkXriJV8MXiOEX4NtIJW6wkeAwE2IJ
         9SnQ/rTMEtIWDIXK5bSkmaqWrqOPx8mk6cdC7zj82UixmIlP+udjnEbIS9a3pHbUWS7o
         nsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325555; x=1794930355;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
        b=Hbo3TqoisWs3JyJxDTlcYFP0XX3rqAIvsia1Wydbczfx+Kk7vY9/Z9RzvV8xG9RkHC
         2x70gyH8gUDIWo1haaBohiM6B1/Hhj23aPchEYNfmTBE8fMEeh4yHvvGPdyTRHZjt3P/
         m9heltd//pw+sBJ3O1UwEmmCJ7b01aq2xTIbv8n1+H2pAmd2D/lC9jzKLFSpVk0QWmu3
         gDyNLdQpD2IyObtFFuKGYVFmhMf0glmiUoqxeWpCb6tomWEA2fvMCgPScDdCJcr+iuKz
         ET62gr4WKF9Jt95v+GQUJWUblUy/7PiQlAjPu1UXzwjzh1yD1+kzuRtNIVWJMd8m4ip5
         FKjA==
X-Forwarded-Encrypted: i=1; AL+hErGjmgkNgpUsHOVb+H2+QkmGAH4sQn05i77/A1GhOKOBLithKDS5jnwyRA62plUjQ2uP1TSUo+Hsy2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ss84BLY4hQoaOywKSMTnBuy5H/fiJ3BQFADMkCKo0YoasP45E
	V1maVQNim2flEplyfBtTkaDhn5QeR5vdelIfeO4KDx+KluFzzxmOgbCmzFzBQQF3iVq9Ip9AqsX
	SpmoAmY1+ricQ1AYODLHCamkEf5Z0z+6zJdMeijqAig==
X-Gm-Gg: AYBFou2R0ylJ9qrnc0eCvfDwVb9fWTNlckDtjLlfNcFjaw/iZV7WLatv2Q88XMVsm9I
	GumXKwp02WYfgDO6aijgMs1xXiCILcTk503r8WmWUkSFCApRLM/7+amEipkCBYH5Wumt3XB+LCP
	3XfFEqGXespfL190na/w3joJUKQalLWKFR5khnkvsoYfs3ddMGvkg7M1wzGVF4EwPbxCL40UTM9
	RbuN9QS61DaWcXGFUnKeVc17pboNSiNAYU39Qu7R1uj1LgbzN5igPXlwEhvsupmNXuTvFnXaWDc
	35I5d8bd5Iyzfcow6dhI/8v0ghTDLO+hwP0nhbDs5ua1baolgiU8FFzbhbR1XSP3HKAvVifMtOx
	Lav/cxXNw9rNlzUq1a4OnrBg+OBsUKbJNPq7j+8Aa5nQtEuPxKHmK+IeahSVxqMCI5r2Qj3YfTd
	7CZxmhcN/BmA==
X-Received: by 2002:a05:6820:c2c9:10b0:716:ddaa:40eb with SMTP id
 006d021491bc7-718a4f92ba9mr1015097eaf.28.1794325554928; Tue, 10 Nov 2026
 07:45:54 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794020868.git.tianyi@cloudflare.com> <73b9d23a4190cdd02e89d3a2ce8a1a21ad5feadb.1794020868.git.tianyi@cloudflare.com>
 <20261110073807.2fa62e6c@kernel.org>
In-Reply-To: <20261110073807.2fa62e6c@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Tue, 10 Nov 2026 15:45:44 +0000
X-Gm-Features: AclHuK9D14tZ4FX3CoGnuGmDbJMM4Y36vINL_kHffGczXiZfZcX98tAF2DEPmTU
Message-ID: <CAG4wq-fJfKAiCY2Z0Hv_nCBM+8gKSBq-N2Xc2KfKREkRL-VDvg@mail.gmail.com>
Subject: Re: [PATCH net-next 8/8] selftests: net: tx_extra_headroom: test veth
 peer at creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Simon Horman <horms@kernel.org>, David Keogh <dkeogh@amazon.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Woodhouse <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam <alasdair@mcwilliam.dev>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Alexei Starovoitov <ast@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Breno Leitao <leitao@debian.org>, 
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
	Danielle Ratson <danieller@nvidia.com>, Kuniyuki Iwashima <kuniyu@google.com>, bpf@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@cloudflare.com, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Tue, 10 Nov 2026 07:38:07 -0800, Jakub Kicinski wrote:
> Please use Python YNL directly, we don't want the dependency on iproute2

Thank you for the comment. I will use Python YNL for v2, with no
dependency on iproute2.

Cheers,
Tianyi
