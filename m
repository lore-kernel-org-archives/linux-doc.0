Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439268;
	b=qeEAKFWuFlU8bkZd4JegMDazKjKDVc+N9zoJZLvWMqcH4yGRruaX84IarAbe6C4AKjXn
	 p/xGrC+SLi6RgYzzNhiNv7NnZorPDUFZdETbOVHtfzPURDZgCeQiDJTInhYE1t69vjWhu
	 bbpvNXUKBuIjaHNgOYpFmmD+M1w2L2L6jq0QnMWGas9J9an2DkaD0ptCsAyfacFern00K
	 oMeJF0rWE1ffA3vxmuPUxf2neiXXKxpuj0raAvC180x5LCHtx/VFHNBG/dqEc1lXYSPBg
	 RhoJjk7XLPuCIXmDl8cJOQ+m8Kgr6RyYGOjnZmqATN9Ls8mYpJirqW0axsah8SBM7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
	b=i91Z/kOg1XOkpkaacMBm2mVa1h3GkJN85vScIigUKVk06tEZbct+EF+JQwFEQA8Pv/13
	 byhnqXblXbjwns5w85g0wEZLHYZjTf7Efy3gpjGoIa/oreLpElKceTEhAFBuVXy7jAFai
	 FSxBdNMNaifMc5dgdU6XY0bi8c8zWmKe4LS/IQwICFJde09R5TAtgmTRuEVD+ctqUHVtS
	 +08M45np4T6U2nu75CIuTiB0nKUQc8Zt6sCzOVwV0nL1a332Uy04TCGEvxZKJR0+wkXRt
	 K6fZULrRf/vwkhMH6mYIn0vfzcF36J+6aoJMD5SXirg0KvOrOD1mCQG2rPGzDE8vFKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ntajgG;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943DE60A3803
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 23:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943DE60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ntajgG
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so1644184eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439267; x=1795044067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
        b=O0ntajgGNrfKFATlaSWgSLejjNVQgDjxhVsVSDttqGtq5aviS683LBngKpx4uv3XAj
         dDXGAMnqhsJSWt+XdWei6LCeTtI0eQn5Nl+kVt5xLA7YMoToNjUv3RXoZQnXBzmCAAon
         58HWQLnHa7Grvb7KMRM3cEQbiFQWgxyWzConOroVYW5bzGieZJD/P3DhTxaoXAjODtdB
         g8pGGYhCkd+NRGJqXJU/6bLHnDl0nv1mZ9iVzHlkbKadEUNRBQGHmA6oJ1OCXi/IwLID
         e7Vg3qQ2RpyRtzo25N8hBpRXogew+6Y7BNCYMMxSdgjwXmY/3cPgCHBTPC3v80B5QRTi
         7uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439267; x=1795044067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
        b=krEcQHIMgWpg5SS6ICH0zcl9j7YjXVv41C+QqL2lCxZ+xhBmXaocniALV1RUispv/T
         NPtgFFVODoeW2rBRvGdxa9dNnNxrzXMkW6/tPNP+91MsGicYgqFyxSz+3en1EpOizqho
         dkzO6ILS3mHUdNsF6Y6Psnuk+bI3osoGYomObG6wxZWKyAlWH365dC1rPRCCmHcJANvi
         5NIF/yDdCG5cyKfPIugiezfpva4TBDyp0lfslBqdEGaYaRMTjgWHcEBeGfpkXtQf8zr+
         wyAM+7haQMoRtpUbEjsxhIN4/4iTScljDFz9eqrI/geD63/WBjkxDbaneEnYDLoQwdWI
         fjNw==
X-Forwarded-Encrypted: i=1; AL+hErFBLyIzCQXXANyoqO5R2arrGaTN9DNlzkPzorqqjC4VEU09uqMe8l8ihRz6IwMYqCVbDbB3hbIMl3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z80nRWaptDcLJtHp/invjHit9Xp9xUSp2l6cKX0BoQI7hGTgP2D
	fF1heWJ0gWoKcJ0xuZ+NVM/yYKmoUapHWQoef5NxIr7AWurapSjDmfWB
X-Gm-Gg: AYBFou3rrR5uy/R2o39uew+rXsbfkEHm0lkBnpndYHzgpvA40hZ8WD+FXsGvd1jPw+U
	UAa2wSpSAccqeE5EdVoOL1Nmag9Ysv/m0w2fKhAPACrQNlzd10co34PB1oAjZMvyEZAs+CAjZX3
	WyB9pq17DnZYC5WsyeO07qzY84OPWv1tkS0bs3fyoXJTheMwtMeGl7DrdEmbRuAyv+9g30M4tIq
	aHFDduKu/KO51wn3iYqAE3wjvR+uRYTswxPgrLrpl/1R6Ini2axzu3VGTjCwc9Ez5wT3QeOwEfm
	ARUu26jWw/WV2g29Iejm1i0u4ZpO7ItG48kFms7hlVPe/wmbfrOILiMuZwUYcwL8p9bbMHYaVNC
	2n19deVz24tCkmo7sV0eQX5lCodq8YQ0YuL0vknMA1F0vy0HYr2DobNyXbbUcEE063rfdQgFCDd
	zJKhTIf9OlSJ9JVj9yQ/WwI2Xzvp2hWrk4hYHVAoAbFa8mWNo0mtCwgTiGIqyThSbiYyBVERGpM
	KDzyoMWgqYF/JlLkUvG4GWCkmwHkx13bSDpbe9j1nO7wSGKmJ6RHvnpSI9Xowy7YqJ/IsxTAbrT
	G0jVupZiUBLi0l7WEjK7K18B0DTsQu3YLu8TWpcNgQYKdA==
X-Received: by 2002:a05:7300:6dac:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37686754f0cmr6158044eec.25.1794439265724;
        Wed, 11 Nov 2026 15:21:05 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm19142236eec.11.2026.11.11.15.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:05 -0800 (PST)
Date: Wed, 11 Nov 2026 15:13:02 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 06/11] page_pool: Coordinate refill with
 memory providers
Message-ID: <avT2Fj5qjbJkArpg@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-7-bjorn@kernel.org>
 <avOtxBw_grmuDJae@devvm16445.scu0.facebook.com>
 <87tslnrwgt.fsf@all.your.base.are.belong.to.us>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tslnrwgt.fsf@all.your.base.are.belong.to.us>

On 11/11, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/10, Björn Töpel wrote:
> 
> >> diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.h
> >> index 989120cbf452..ca12cbf7b825 100644
> >> --- a/include/net/netdev_rx_queue.h
> >> +++ b/include/net/netdev_rx_queue.h
> >> @@ -33,6 +33,12 @@ struct netdev_rx_queue {
> >>  	struct pp_memory_provider_params mp_params;
> >>  	/* stamps the page pools of each queue allocation */
> >>  	u32				mp_gen;
> >> +	/* NAPI of the running queue, for memory provider wakeups. Set while
> >> +	 * mp_armed, and if the provider has a refill_done op. Written under
> >> +	 * the ops lock, read under RCU, see netif_mp_wake().
> >> +	 */
> >> +	struct napi_struct __rcu	*mp_napi;
> >> +	bool				mp_armed;
> >
> > The comment should explain why mp_napi != napi? (I do not understand why)
> 
> Fair. It's the same NAPI, with other rules. napi is the driver's
> association: read under the ops lock, and not cleared when the NAPI is
> deleted. Provider wakeups run without that lock, from socket syscalls
> and ->release_netmem().
> 
> mp_napi is an RCU copy, set only while the device is up and the queue
> isn't restarting, for providers with ->refill_done(). netif_napi_del()
> clears it before its grace period. Setting it also schedules the NAPI
> once, which replays wakeups lost while the queue was stopped. I'll put
> that in the comment.

And all this only to make sure that we are not recycling something from
the old pp into the new one? And reworking existing pointer to change/update
its lifetime is not gonna do it?
