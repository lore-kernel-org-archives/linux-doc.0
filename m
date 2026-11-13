Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598046;
	b=NppEEh9CyNQRkDcAAZLzbF6UbPJUtiM48rnRcv5jgjAAPP8EwIvtLmq4ZochbcNtz94y
	 GZtZc8sD3zxASxamKdXMUpJ80SumSFr9urfUEQOy8t7C76uj2wwF8UR7NHrp1G1CfLiso
	 qdnGSNniTT750UtKBnxiBLc0TC+DXJZf+aOwb5oerLUBf4JALBHvg4OBP6BPSbSrdnWYl
	 SPSmkxWbxhNElhlvYZM6oqGhqHxEo3dgIwhbNv6SgFn+sR6rOJqcKQFEfyJaEgCS1pSiG
	 BLqrXZvbjh8udENPI+XDeBEpLXVAqmjJoVLZjEmP+tu04Lnp4KxaOED7b42xXnVUpPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
	b=Ca5K6j9pjolfac56nkVqBYPJEzIi2w944bYerQR+KuQ7uJfTtETVV6QxmM/i6u1Xae2H
	 BkoXdfUx1mG0ZSOjaO1giDGkU4rNTGLIb+QUz51Anoc3jQb2eqCV52kR+JJxEO+Senhnw
	 m1a9APKqrtuwFNRaxmwJM59UhY5PAXFW6PsFKlyoFklaAu+odk6byFHvs+oXEjy1JvjqT
	 nHr3IJb+ezwMcsMkYy564Jln917RYRXjzIOE/It3TtjxQA9WssKSe2gJICxPjRTkL6FKs
	 BHmPgWZw/e2a6VnNlAwk9PXUkViqDiNXH8AcL7ehJ4s++K6S2ZzfzVjDU0U1cvhxTtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gL8jZDdW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E893606A334
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 19:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E893606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gL8jZDdW
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso2246a12.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 11:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794598044; cv=none;
        d=google.com; s=arc-20260327;
        b=eAGRJrAc5F0qZA/AAX++pN1QRtk8nAcHnv1IRODmDtgRMxI6YZRXqkEbQIfd3ow+Ri
         JkyYJ3XUX82MFAVFy12ueaO7LlGMA5rIqcseXz/NteQEaqBeMp4r/HrlTFWPTsibWsut
         t/klYNKHAf11PH8Mh07PjDbgKemR8yy0xQnseTK5WRdWgsQ2b3Sii6PoM92SFhGk10jX
         5hLapPdm8CMluMk55F5wuAuQ8/KTq1kThEsS8MOGkAgazEMz/HYaDzCelhjvDUuYWTQI
         +50RcETmJ2L9+WrbIv4XYBa0HFnUvsOxlmM4nZvBTtnLzGnIOyVNPiXGY+KQLEyBXGPI
         ytkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        fh=FhlBlysv1jGV9u+nCVIirS2LJAKMLkRNCQTh3yow85E=;
        b=rPkp7RrytHtiipaWkMc+dK9PQBpkHf42uoANKZmOJgxeTcHWfl0swFoHwDLvnz20Ed
         7lZUmFI9cVEhKazdqD2e2n129SoZ8dtPUb7/GCyXQGtg8NkwaAFBOQ8dfY2WjwZuhzYu
         PObh/8JpMRfIOlePGdGHRg/Apli59+0fNdwWW3+PaqjsMovkBTyNjGDC5tUYIGd/FUQa
         JjgKhkcdCH8R8hj7ZJEreBe53iXm25VyMKMuCqHRrqkQi0q13HqWgRiPvdQth8n/axUB
         +adXySQP7kpUFrKrkiPG6QLeKf4NKR777YCDk8aWUqXa+7nnaLiwWld8WKfLZ+h7nBAW
         CT9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794598044; x=1795202844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        b=gL8jZDdWoijYOUqqlj8DOAFvK6zCt6P1zN7hO5bgTFypZZ4sQKlyeApMVL5tn//P0M
         6kW3UYi9iCdBDhHfk6wKFTzI+2CfsAFBw7Rqv9Vk1nFOxXNXN/aD1X2E3ajfnJ6UGuBm
         glDsl536MTl2iP4zdDhrwJ/LeGsb/n7BT1C7dJ/ov1VxHcpDm2TAmCZoixEJlYoKVorI
         ShfqoCaCnn5MgtpAfxRcrwijJhRmF2tjMYr+EO4otzUnXlUcb3HThkZkliJTv9xT5miG
         cFjd4sB1mm4TKPqC2fzbcGlemMbI6HKTVpEDf72EISt32sXh2M3a08l80d0nxf1IFaH4
         Jg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598044; x=1795202844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        b=bxbvt4AzU2iWLA69mkpPFpNWHGmjoWDWaj3H8+aTF5MJK++npKxxbnAaccNuIoWQxl
         s5qp2CxW/nVamE/k+OQ0JhZTlgJxe5rvfcciXsyxFKJ5CjoHsnYWgY+D/A9NJpuZI6TC
         vXiFK+NBdDnjNwjz/ccq6wh5zj8RR/PKRS0KeSl1QCzCXvNQnfDjYK6oQgvDRrCZ+DLy
         3Wq3dyGhDgv66jf/NsO2A4yVdLsRibDtvY2GROa1UjyF1sgWoBzcenOJopv9s/zguYgl
         Gf0EXpFublTF7U0eXxzrIYI2+Ve4U4PF+6v6nzxI34WYVQEhwNR4rMMmi/EzOzLUpPxi
         Yuiw==
X-Forwarded-Encrypted: i=1; AL+hErHBb7r6c/wFeeQl+pZVrjUj0YUyBj+keesEu7Icwi4I4eNVoJ/sRC2AjG555GA1ktPa04qsxKj51VI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9azlTbbGRms9opekZgJIn48kKQhatRi0oynB1ioQXCAdv2BK5H
	mHbFzM3EF37M+8z3/OFY83c5OLOHZKQjERASCe3LUervrPahKDJ6dCk3XCnj922QyY8Xh3ccGd8
	zodCQIbNb8xkQzSZgFbu1oWmf2OvIvVAorjgYHXNl
X-Gm-Gg: AYBFou0ck6UZhGKqsnjdnu3xP7GPK6mkZs9x+UambXMos1eTlgdGB+y5KXgMkx/NJmx
	dm1r7T4xefWn0hJZ1a8gSS4Uje+giP/GfQgPQSzI9qFu7h903vPON2boa4e8i4sPhItljzOEwGT
	pHbwq1bzHqswyWQK+/yAqY/yRVfa+1lsINX/E3cjlOgWiXejkxvv3Qj4VwLxUXAWfcujgg/qKsG
	8TjRtsn37Vgbjx//Vvgub10pl8qV3yJWpQjS8JgJv4LI8AgRsIz++qtcmXJWctg1UMbEFYBY0BO
	JFXtLHRWL+mQPFwBiQbgveqKdMHmovhiLXUPAHjb/kwtU8nn+44MJuml90BOSuz5vmTpDEkL2dS
	8bkP+hnMX2D4rwEpR+Bhp9zASB81KFfDc1oU6ppyiBUhwIoxvAlidItPI8MylrEAClTA=
X-Received: by 2002:aa7:c60c:0:b0:6b5:5d24:5d90 with SMTP id
 4fb4d7f45d1cf-6b7e064b605mr11515a12.3.1794598043562; Fri, 13 Nov 2026
 11:27:23 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-10-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-10-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Nov 2026 11:27:11 -0800
X-Gm-Features: AclHuK8F8Y_DVnfmHCZelVEZmvLdtuJXie3zRJu-e7GqKDc7mN1PxeFQiqOooCY
Message-ID: <CAHS8izNyMM3pSJJXZga+OL6QMHFgnF-gu-+vzk6DO=EC4CLfuQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 09/11] eth: fbnic: Use netmem for RX headers
 and XDP_TX
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
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
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:22=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> fbnic reaches header and XDP_TX buffers through struct page, which a
> provider net_iov does not have. Use netmem for both, and set up the
> xdp_buff with xdp_init_buff_netmem(), so XDP_PASS copies heads that
> must not leave the RX poll.
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
