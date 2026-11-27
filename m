Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793204;
	b=a2kwYLTjDx99jtXkpXs2kRZZ8xni7amUC6shVUsPtNJN+Q3lj+x1dqhZJsWMqEVJp+JS
	 xJPGy3T1OF4q1iXxgEyfU5Oz6sePu9bRzKZ9nyagn19yRjm6tdVYVAhXoAlMPk2k3GB5X
	 lf1inxDLV4vrDKFheS0FuWadh9w3CpynPj9cTZXwIZ8F3WEG6c3yWbt19yRUjsfaHOwhW
	 KpTti0sMPhLaelIpc/deF5AjPLK3wlgDlhF54tam8FvhIeA/FFQCQyw+tObLJErykJfL1
	 mvdBzSsWZF9E2AnOklt88wG1Lz0CO61waqJhjMDHvzX5mqyAOMsNQvXZeCletgB9jvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
	b=blm9dvRVVLV5y5xBukIlV9zW/PzqoE//6izC5MjNYXU+CHm97L0hRc1GjbJxBB6iPrtO
	 8/m3HghpfHS8dZg81RLWZpcEd9cuQEW7qpOy05wPeL4PIYEtE/yl20Ojja4YI5F1mZzra
	 219N5/EvU79l7ZgCxQ+bkuUPIjU4EggqLBfpXn+h3sNoQ1lkZihRC1faA+1SQwFYmscsE
	 rDH0oqyFDN9ZbRXOPFMxHoGbyeRUfcyMPNi1wKoqrew/8O+12sxZZmNCrrWM9tgbD3cIW
	 Jy77kgL2AeTbEDYvS69RCSIW4CqBUOG56OOFABIE2eKE74PQTIurqY9gTnnWuSNPFjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E176606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E176606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b3402105b9so58064437b3.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 07:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795793203; cv=none;
        d=google.com; s=arc-20260327;
        b=foboZYSHy8ZsUASiO/1H423faeQz7UJrmLevDpJAZlqXRWR/mhRHsyM7XVmEi+5Wu5
         Rk3rozlGr7Fm0As0CO6oRpa42yoO0DmImPqimKFh9ZIfYGjLCAwvTFj8uFholpSKwlEa
         RtY/ftu70ktxaslB+aA5qw6FCmh6Bi3uaaMgpGXZST2KCvvvdOQ2dceLCz2UTI3stHlc
         qNRyhas8hSHS4jLGu4aEqkb3WdENVSATDqSsL4R1cuyeay8elwgsKeCmKIKoy49yMReD
         7cq4RpJx8qo5jjb37W63BdkD9Rxh9vLcO9x6UxpZIioAmfAZDNZ11ZIQ4caIb/dxTseF
         0RjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        fh=P77JaKheQgGO9GNxRPTwSGEfMxd0Tve4lMVF9j6oSAw=;
        b=q9tKKLlkj3PHZ35r660rco2Wf0yf2lvJevRJ6EfdwEgG/soSENP0QJXCamymWyQjUy
         w2wSYaGuRGZ4YkgT777cqZODdbKZJEq88Ci+KQLmENlPHOcAXbvhraPp/n9xkONI2Z5u
         sVThM8irlVLpXvKJvqrl/zwEZ1AqojnyWS6y1WulGQOW8wCzNdzJiQEZdFPBat+8Y+An
         mM/rVHgFCbwiQwYUAIVaJWeBsPqWmNR4EqBKYrfOo/Dymu2CzI6eKKIEbVJFKGkV4NKe
         edpmchx9LKWCLnB5R5QEC4rgXXt83hg8PLQ04fvc9y1cuE6l/9oyP7BXfSsizafIfXiw
         p7ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795793203; x=1796398003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=n94mAkyJOfvvvFdqyDtEpzjXrweT8JaZWeLZ+JYOiBFDDuYaMPknPGxHUMwIf2p4QI
         XbOKYuOKTdVMFxaHokKbNXTGDBUktL/B8JSyE7b6YdHb/W74KbvW6rbiCZmnIQlF/i8I
         ALou6ktP1I5Zbs41mBTFycRR8rPWR02G+g/k6UH6l6DD/aedUb053tQ5jkZ91GKvmJIw
         67G0iRK3SJp9Ne0ESx6cqkBNNWwucbSzu7o0e1KmDO5YpJZRB7LNyeyOHGcjxEYRPjwa
         qp45YwL1Q5w8yIJrLzHHQk7QAC0knp49PvcDTYRwISeZGMmOYrkYRgoOL+1gkc/Fe8L+
         ufMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793203; x=1796398003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=OY9oEqXv3ZQYvaJkvP1TjZgpuIZIvJeDduZb9a79P6W87o4wXFdnen6lHP+UzidXII
         fXGpsctesJqmzV+qvunwJq4UxfX0m0GYptvbF8Ij/PBveHb3hfbbydPQskdesa4RzY0V
         SswiW4lbJSHoqeNz7yfB+0aAxDxgah0/ktzAMQz/HXbt5y7+ZZl2Vgya706bOZLv6NRR
         7LCigsbYpWee+/3hUB6Ptj45xkvcaqMcMMuSu64tcfhaGG+OXUZ58xKrexOWC1uUOJwM
         +9IWsJt/QgovNGjSh/Ku8Z0QR/ZhyufcM+exAJJAPtWcghk1dMwxvqUvEWqzRJmgRIwZ
         qPMQ==
X-Forwarded-Encrypted: i=1; AL+hErEfVOI1+z5mAT26Gw7U5jEpllLHgZ+WXG/y9lAJbceKnESlFDy7Pne4WZ2TN1x6B+rnc0NOxDUjMCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RvOu6dlQ+sYTyZ6azX/hwy6elvCbjZifDjvsAHrO5J4Dr4sFO
	8AFXe8ink+UV+W8VTW6Ym8CkQuAVT9HvVePf/MlCUDF6dv1Vy7GMFtKM3PMyIKgSQNfvA7hxQwN
	doITAsMnVDmk9fZfWXgyvoYWyqFaR1NbATSzK1aSG
X-Gm-Gg: AZFdTZcK56cAghDceNbK7vsOEf33tAYlBF95E/pCKg9BVbp7OanV79una/kSHHJ26QH
	JiShGOvU3tKX1XAgtLoftFE2576igbxSUgflDEO0D0RED238+StZNUK1yg2dtizZt4KQDkY+SXx
	Mx6QGVk3MBWNUFB1FH6CwweB47mXyyDePjOcT5/ONOJFFSeL9mDW8PiPMf0geg9UWFKbk3Lhr03
	p0AqpwkZa7tDDc6zXOzG52qZ+Fr01cNq+bay7bmAba5Nj3YdQE4uEGOADWm+WpB5vH01DRoCySF
	BPvDbD2BGebCxdKVVQf+8bePc3tzupMQAIyvjxoyx2n/LComs482yzjlNrTFloiQj+MP07JnC18
	Ti5OTMj9I5K51MrXJSQPttzsKud3/ZAfGo60t5oPZfBCbN7hVczUwmVZ8lYuO2MLowm/gxtYZcD
	7XgIGt9+UwEyheD3Y6cg25Ij3c0GicJeg4SgQ4jl1nVygLVjIPuOBTTr478mdjIsg1YDZjQFNoN
	AtrBmO4WhzROxLWJKpRNR+l10rs3XhFYBgR15x48uv4CCEoWchDLd/4zmnX4xW/BWX+Ll1BECvU
	5M4/CUKaGe8SMZSW9HYY7td+DsPU+opycpN+XSv56NijknTI9bK314qwzkj6hmBFaZ68k6/dAD0
	lBIZBw9Nr55W121oAB59SzXmruiILse/k
X-Received: by 2002:a05:690c:698e:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b5204ed736mr106681927b3.83.1795793203488; Fri, 27 Nov 2026
 07:26:43 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795284858.git.julius@bairaktaris.de> <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
 <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
In-Reply-To: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Fri, 27 Nov 2026 15:26:08 +0000
X-Gm-Features: Aa3M54pxMqgZ_s-9JbfNek_3dyGz87LXsEraMMuneoiDkKTrHn3sKg0m5hARvDM
Message-ID: <CAC1t37L_+P72w+gNcrdphB7xkBmCQp5PQRFpcu1zqM1m-2Am+A@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com, 
	kuniyu@google.com, steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, andy.moreton@amd.com, 
	alex.austin@amd.com, linux-net-drivers@amd.com, saeedm@nvidia.com, 
	tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, 
	linux-rdma@vger.kernel.org, alexei.starovoitov@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ack.

Thanks for looking into this!

Julius
