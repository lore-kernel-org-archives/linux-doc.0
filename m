Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134721;
	b=m5TkA6/CFkVLtlh/YW1I0WEpPNm+NTOak+H2dY3IjFUZxgSZ0hvwZ1z6E8HqW4W64uQn
	 RQdhdDF7J3A+QmW0NwzXesTfhtZYOaBGnZNnvQXZt2Wbi+UhnNkuXVyM7SfoiLr7FZ2G/
	 9G+da4v98sR6l8Qnd2JYJZT3dZwXWJXWck43zSN9PILPbK+xsFZdgtsKpAXlmLUG5O1Za
	 /XvhVTEyX2FlkkcNRNyzvFOv4TPWy/EgclAWmy99uZJpTr/pAmmPSlHTzi2tmKfYcSkjv
	 gNH1XNNjLxWWcgmTH5lRPEgzP9WNiPFWkcZy/TXqaD/lhaED08kyQrSspIb+wyK4OoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
	b=AegjhTcRiA7n53ruQNFOyBTImhwAd4bkkM6+fJVmQs6tXtAJIqOFZPqEhVegzJT9qQeG
	 xPurHwWlj2LBn1y2KvJAfj+8wZFeLObB7YAp4gprAJFHd49TNutazIZZl7GdwE7ltPBLz
	 NJqyeDWXf5t8TndDkq/qGT/K1vSm4FLWBC7OsuE8WVBCAiMQmDZr3sMqgQVyfmdisUy36
	 PXB+HSmidj1X4kHV9O43KKdLGwHzR9bp3XDcmrNZUNi8nkNbPxYqdxpkXDL1hWkzWny17
	 11uKCZ6WJnhWqDT7+BbFPvwcmhpMslUpoEXl7j1nuBAEHNrcxfIS3VOZffeimLljMoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI;
	arc=none smtp.remote-ip=74.125.82.65
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AE606A330
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079AE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1aefd1bf74aso213745c88.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 16:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134720; x=1795739520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=glVrkyNIyYlm8wVTiuLIn+1R/pE2V9VJN825nkjbnVE7DzI/tklr0XR6PDNFu1OUjc
         A6P3ZfTwHJQxiHAjmoK4SpQIdS8Ir/katd03VOBvE+4swUu2oA+8IkTyyok1Pjj9/pPY
         jRHRWeNYDZ3yM5EUWHx+RVw95l+YNdToEWVWMBlDmJCQ5nDUi+lZAkU6M+KCBd+2W1HW
         fToXfkJkp8+luUW1MITx+x0oH3VnjO0S4X/xzsL89lshkI/VzuYPu9YudzfVuvXLiO7a
         PI2e6DkQIuvL5sJxpbyOQ9dBGmqKQnp3LSWMA4iJOQsw2EYyE1DA6dSJBL+RP9i6HuS0
         6Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134720; x=1795739520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=zuIghfv43hUSALKTSGmo9DYtHDo5HrxrxMprSo2Q6ISkUN/dM8r/81cWV14G697JtY
         EuLlgBDHDNmScc1Q64bpOzJZ6djUekjG7l0FMBcFe0GNJoh4KB5Y4+AE9ZTQCxxgLG6J
         +JpYZ59h53RU0DcROFQzfc9Vr4Uu6OgK4YqJtre0H2C2wAG1jw5GFYz5xIuCLk8IgktQ
         OKnQ3Hwhlrx/hLAsrJ6htBQuoB/72DBQ8cnV1IFanBlZr8+wqwipwKOHQ59VAXWOVT2f
         z3LENaJoIh90HgV9uF217ijI1uDvRqWSAjOGezvNPZ8vywy9YHYmJVLJbY7NAmcc2WKA
         FSew==
X-Forwarded-Encrypted: i=1; AL+hErEBYsgNpls2r7gC18Y5EkbYwisfqDTQWMaxUMucHVmn7obVH1T2Vz3nousy3zwF6yp8FQ3EZ0oAXQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v6DRQJYaWFLZdgwunj36pS2Of70AOBOulcvqomalkb7EPz2W5
	NNProvboat5FYMAVa5R7HqMojpZCdqbTkA5Bc3An7Xw/vb1cgacOmeEe
X-Gm-Gg: AYBFou0Yj+3rXQ70XqPTDgYcy44AriSv8lCSUyjxiEmkvmxgXFUWpb9XLOTlan4vCxL
	S8h0WvRHTGOjE/2B1XV9uL6X6z2Ad4wfuBByJxh6pkrEU/U0Ed2769XGg/1tr1zQn5XrgCXapES
	DNBva2Q7zGQf31ia8VIGa28zs8ayy08cdtPEwCJ5AOamHdz1FHJZV25nv90gq95/Dbo+Pj9y+aX
	JyBfEgz3Cn/7wSurOE97xh6XGEpll0bwFeR6bkx9pPmrkrp4O8R+1cPTqTT9/9QPQNkvWibHYhX
	pgF0s+QSiPMz06sRGnj3mdNp6FfLSdGmXljFv3ADAMh78pU16VLCkj3Ly0gRTgCvvy6e+/SD6J7
	FeAsABk/E05vbWogBnIDw56tNbtXNhQhGv9MzByR2hX/4c4DIcPRbVAB8KLxSK7wfriNeyDNvQz
	inwUvjTuBwjYBjEGrTvFjN1tXvn7oHV39RJF4u6l0UT3URsoDZ3ttbsd2V0EBStw3uuepZq+WE5
	h3ROrRJK+6VmXensznJmQGVRsOzBOHOWa8eVPyO4VdVHa6SVBIVFOV5pMUL0u0ppZVuU9Lprkeg
	fCqm4r2oHUMYT7z4R5vUiRU=
X-Received: by 2002:a05:7022:7f19:b0:19f:cc98:f603 with SMTP id a92af1059eb24-1b5520d7d86mr2448430c88.1.1795134719982;
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm2242124c88.8.2026.11.19.16.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Date: Thu, 19 Nov 2026 16:22:53 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 1/7] bpf: Keep XDP helpers within readable data
Message-ID: <av-SmgwQhAKI5u5P@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-2-bjorn@kernel.org>
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
In-Reply-To: <20261117164700.2157816-2-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> Devmem and io_uring zero-copy RX put payload in fragments that the
> kernel cannot read. XDP helpers must not treat these fragments as
> normal pages.
> 
> Reject operations that read or write these fragments. Access to the

[..]

> linear part still works. Tail trimming does not read the payload;
> clear the unreadable flag after it removes every fragment.

I guess this is technically true, but why allow it at all? Easier/safer
to reject tail trimming as well?
