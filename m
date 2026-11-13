Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530523;
	b=woNUY7hItQjPVF89mue3Vuq5k8jlVv4V921ero+5SpAw0iay5rCnjKQ9M2zW4uRVefbj
	 tuJ2AECdwMNQIwdvVvqy72TToceyhNdW7zbzh4FnWtjQJv/sCXofEXKSmOAaVeM3ji1IE
	 DXYZAo13+X/B4mxSC90nV03H7lUw6U6MEhvbLKzolIXNExevWjjq3FnA8J3aU9C0m553+
	 aATTb07vZxG9mIlk5WW6u7d6p5BLcnyIOL+GjG4ZU3HOffQsgP2xuoy2Vo52Za/eLZaWj
	 wQMZmbZnyFr1DDPKqgea6ipR9R8ZJLvEeeMOd002NW+fpWJwlDDmPa/Ybt2d8e09jfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=rN0Ie5yME6hsx7pm+x3UNEKpXeb1k8nlYJCB408a9fM=;
	b=0bhPs1U4U3W5U8HwzRG+1u/DBhy02tmNPxGbFQbTl55sPMsmi6zfOPZHdDgSJoXV/Vcl
	 kWLaeovOFFdqkUlsImebI8it/v8H/8xuxnFCrRL+YwdKr0mmqojsseTaY71FDzUp7st3x
	 Che5M647/FJX3SS3OSa9eJ+5aEMxsmegJG1qUgYK8n3HiUEztufsNtXZjS2OuIcHX+L73
	 GayR9yvNXYhgQ2AoZgHRBOJumZWDTLSpdjhc9zUFZQ8cuea9yR53V6q1v3hHrJ3c7simR
	 5v05ljdL7kouZ4zPiPYfocHZF8xR6OgO7ULFeB3UcvKFJ72FwBlYq6uhVLpeh34lZow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wS4wsUX6;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1DA606A32E
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1DA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wS4wsUX6
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so137188eec.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530522; x=1795135322; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rN0Ie5yME6hsx7pm+x3UNEKpXeb1k8nlYJCB408a9fM=;
        b=wS4wsUX6ixKaKqiYjQsFCJYaIJKn2BaV3f3zkmlFUG5frnXleY4I+yDFt5BO59cWXS
         E5JETtLS9PRnKnT4J1LIE09WxVAAseI/wWSe9ZZeOV6x8kziPaEXsCY6VA4BF3ndFAYK
         RWSIBklti8rhZx7Uw73mxUbumVjoZyDIRHpcBnNQhm2oyRlOtVBUnzHH7YKMa/VKxtK6
         XRHkKorE0Qv/+WieykgVMwoTnmMHuUtoJt685pJPRiQLmu8VwLBvHw1reor7fxpobajo
         9lGqkOBDxWRjtpOvgGDO8xvWJO5ml5wtEjHhs/tWxIBi40DGSxddqrSQp+uaaq/lq/0t
         sryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530522; x=1795135322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rN0Ie5yME6hsx7pm+x3UNEKpXeb1k8nlYJCB408a9fM=;
        b=vFP0hBc4dN7Hp+QPvTXXsZILgkfK0Gvnk9hdYv8/bxB3bvZ5VDONh61HrU0Kbfz22f
         FUCytdze9DMuDzRqPaW1t7d5Dv83GMkP4aIbEDo0WUlD2t8yksLYx1Tqjr7Jqbdvi9+V
         /oUlUGbHQoWYHNzAKK/q6FXac9LlBa0m44w9G1/orl9BcGqcmobAs9cjTF2YNguPwaAr
         qh4j8kzCx/woIpN7fFZbFvQsubMd2Vpr5Tk6zunkceW6CLMEMxyLuEp8VeORuIOd1t61
         uepU71fJBGv0i+2Owegae7LLyPtZaYGuwTe8h5IbBMV9ORgw7PvX3YyPVMa9sgWU96E6
         TFxA==
X-Forwarded-Encrypted: i=1; AL+hErGXl9pENoZgUY4UAx8+LgWy0rykd9Obpu282B+2CSgq/ZkzG/RXpw5/WwfuEli0FgUb0Ei+TYmKdq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s1E5NKUIseExUbmfAFlYO8LPUUyZoRrYRRd4j2CG+8oZG7P3I
	9zpDlQCj1pY1G3YOYLj9vE5V1Bvw4w6vrDpszcmuqv1sFxPgzP30Mhr7
X-Gm-Gg: AYBFou1WlU/CVPycPflqGUyEZ7XaTAFaJuicOspNKU3Njuwo+Dryk749p2AIWYK5nxp
	Bgwx5Eb7dDQ+HBh9LKU/9Ei7av7msX3CYcAdl+3V8eK8N5xkgUN2sKCN6XWwTHhmyfrwHJT60pb
	FDLrj47ocVI9IVwVqliCasZMOsKmhGOlmbqxIDdi8vi90J9xqqbqCPGyqJLIrd413tTvCvGx7Du
	rTIcsYQ8LGsSx7das8NirIyAS1L7GM3hk6GQ1pa5aIeKIRj5TVLTcfAZi+EKfXP89fjSMxopvfM
	KEqtS7F7+ZIcwwDfV1YM1ySLq7COfkWMuztxtoilZUYaKRr8dHRyWfN8BDUI9PZt+3lDeJoAJ9r
	BRK590mHmnwE58741vj8KB0R/pu37jON9l3WgCykHY6BRLPUcldQbzJTBI8vAAfHaeHv3KUF0Pk
	f2cXHhjb9UiIdP+P8FpSf+vc772uzHW5OexlHJA+C5aj/ZQPusY+r9lKeZ6BdWzcVhqpyvibvUw
	y5e5sWenJNM0rn9MKmjdtTvzWVYYG+zXXZZVqd90hk2Po/qk94z0xrtPPiohfyMfgqzyB4BD2xr
	IKqXOpm9mR5ksNil8FE5pZPa
X-Received: by 2002:a05:693c:8852:b0:36a:1452:8dad with SMTP id 5a478bee46e88-37966f32039mr734196eec.20.1794530522135;
        Thu, 12 Nov 2026 16:42:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm1934134eec.9.2026.11.12.16.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:42:01 -0800 (PST)
Date: Thu, 12 Nov 2026 16:21:27 -0800
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
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
Message-ID: <avZXuHWBUTJvJnEu@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-3-bjorn@kernel.org>
 <avOYe27x-AlxmyK9@devvm16445.scu0.facebook.com>
 <87mrrfa6c4.fsf@all.your.base.are.belong.to.us>
 <avTy21_cSnyMdbb5@devvm16445.scu0.facebook.com>
 <87cxsarvwd.fsf@all.your.base.are.belong.to.us>
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
In-Reply-To: <87cxsarvwd.fsf@all.your.base.are.belong.to.us>

On 11/12, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/11, Björn Töpel wrote:
> >> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> >> > On 11/10, Björn Töpel wrote:
> 
> >> >> +	if (static_branch_unlikely(&page_pool_mem_providers) &&
> >> >> +	    WARN_ON_ONCE(!page_pool_supports_frag(pool)))
> >> >> +		return 0;
> >> >>  	if (WARN_ON(size > max_size))
> >> >>  		return 0;
> >> >>  
> >> >
> >> > What's the deal with that? How do we get here?
> >> 
> >> Hey! Thanks for taking a look at the series!
> >> 
> >> An explicit frag call on a whole-buffer provider is a driver bug: UMEM
> >> chunks can be smaller than a page, and RX gives the whole chunk to
> >> userspace.
> >> 
> >> But page_pool_alloc_netmem() also picks frags for small requests, so a
> >> valid call can warn.
> >> 
> >> I think it would be better to make it return a whole buffer and its
> >> actual size. The WARN stays in the frag API, before taking a new buffer?
> >> Wdyt?
> >
> > I see.. Idk, I'd still return 0 here, but without a warn. Not sure
> > we want a warn for any api misuse? Returning no netmem is gonna be enough
> > to debug things? As for the calls from page_pool_alloc_netmem, I'd also
> > handle it explicitly? if (size > max_size || !page_pool_supports_frag) ?
> > But no strong preference, up to you, was mostly trying to understand
> > what we are warning against here :-)
> 
> Yes, page_pool_alloc_netmem() gets the explicit check. Thanks!
> 
> For the frag API I'd keep a WARN_ON_ONCE, like the size check right
> below it. A silent 0 looks like an empty provider: the queue just
> stalls, and nothing points at the driver. With the helper fixed, only an
> explicit frag call on such a pool gets there... Wdyt? I'll probably take
> that route for v2.

I guess, yeah, makes sense, let's return full size and warn. Maybe also
a short comment will help to explain why?
