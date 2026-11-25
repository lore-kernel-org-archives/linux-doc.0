Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641432;
	b=1pBiWiRiOyNwulAJEn+TbWucA3bXvdVUvvpBkG/EryJk/gIZshP9Om2c/ulT8BF3m9pO
	 7TyifOYE9sxl/vxIxmYy8Jsep04VdkIyPWMdpYFN/qVyRSCOdcPNuQ6VzC0EmSrzpj82x
	 7pKpz2BT36AzEWFPeFdjxHH81yhbbOF455Pei+ZqsgjEcD2jl8/8jzTX/AuSqdAn2qtIu
	 vjLv9ypEcq3+fjusbcJWbNMevbPDR7sjRMAQcB44OA/RwUWSp2ccF/sBa3TI34ARtlHoU
	 HqEawiJhtTTUKXy4KDs4Ni+KKAKxbbInsrszFZ7QN9bpH6QKKu5kxj+LsRetCjQs+1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
	b=XqsR8PymCzFqxUk5p+5cfNMowCClepMIUXjFMbEF4vZv6dyXZkrfnplCJgINH4g17cmo
	 QBrdJTfJCti7w5RapFZYO8OZnmh9XGG82uC8zwlFVPKW7FNKeYu+Qz6P44roON60Vu7J1
	 oK0dPaI1tcoBPeDxAA9RxmgDdHzhElS7H/MtMFE6OtrnUMyUnIWIxqpNV004ycjC2plfJ
	 kYhDCmGQHVKsFXCMvjU8q+J9CyFu8LTMrQkCxz5esNF+OSLO3kujEU36cmlb4hqjV39x+
	 0BT3lxIpPcB+/tO51Ukzx/U+ggGdjXr+OrlJex203V8GJzNUjDrowAxDie7FMExhx3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="ikCqdo/J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC83606A323
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 21:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC83606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ikCqdo/J
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4fb5d96b3so97864447b3.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641430; cv=none;
        d=google.com; s=arc-20260327;
        b=ls1oPurdweaA9xQy20rQlA3Hxs2h71gUJ8YW8ycVG7Oa1y8zoov9sDGxLNKIzzU1Vi
         FqPFFzXNK4Y1R2sGPKMMwAE/fNIobWuoIcKJb2WswQK+C8474bW+b5nGERG18lT0JyWT
         1l8L+mZ7ewRzxXR7OFlEyq1z4qMyROFaN1t6R5tb+rp3ge9/l/8QGcUwtQDcd1FFyrca
         tSJdqZhD+eT8Sun7bZC0UiErbhQGVKR5gu2lds9Xk9yjv8v3Yj99N5AvqVlXeVtbfXNY
         CRgFjSkl8WgTvSWzr5yCI7RYqhE0MXJ77oKrmgoX/fp4CY3MSTLuG/ljuYJT8ABu9XN0
         DP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        fh=blMUA5uoZ4CvqQcGR1/Jx604ESzQyl524l6HIJzPdaU=;
        b=Us2McPfN468r7lYTb0Qsttugz2oUms2z/bkZRdy+Z1rz9YljspI8+4GF0cOELkzCr5
         OQXwB1FopQjiJzO3XDGHaxZTKLhzoLui0dPoPIeNQbDxWLtcWLoDTUuoJ+LX0WFdCaID
         cGgoN6mjO7giiviAwcnlBz3gs2ZhPsd4fDbzC7MBHrO9PHHiysBiWjYx2Y1mNZyxW587
         wCtvElzDFFZ/SjN0sanVFGUwCtqNGzKifpR3D2njoRPrFmt5ecschR7XH7rnsK0RzErX
         crVJPlc7JyB67Cmhfa+HFxPU/l45N73YEEKo6u32XxYjyi6q/dr7gr45U/UIu3becQVg
         3DMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641430; x=1796246230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=ikCqdo/Js06OZnjno0W+kIv1CiD0oR8ObGMHXOscIUzGqP28wgQViOHE7omuITw0BX
         0k6cs0KjS+RXzmw6xE3ijiInaPQr2YTNUkoruz+Xsr5SXXKxLYZsAHzv/bm/il9q5gD7
         hd+2fQw+XlkJZL1mT+6udr4PlowS0oxRoTFtBpOFHp5ZCTuFSxpI9tH1kYrhjWRUC+Op
         LsBmuYcllItowU4p2kLnw+34e7kDcgDwdlGhTL+r2AIPOoNm25DfC5QaHYR6/00Dke38
         oh3XTh0v2gEbor9gNFvPrq4rZGrpFqfZH+KDVveZM2Mj4dQB27ephNT789CrGGk0cooX
         LjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641430; x=1796246230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=bhhohZxMFV+GUqsUMRlP+kdc/BREG+D7W2uwAvEedZt7sPayJairB7I9/sQEnidy3h
         oI23YsJu2S+ZKG4HOe4TqZfl6dkztu3Rk26bUaW76xMBrQBRF6LzgmNBrPVMmp3xtfhd
         kHR6aF3W0yzFk/syPBZ1u360GFUxwfFZ7iSAJaJl6016pv8uOnbB4ZNH+pN/XhenRj4x
         utTkdhEzjqJ/p9qzE7qiSkx7CAPKz3MFMA5RQGkUNfwMVN4ClY/XmB94YkVK/+ZMWMDz
         WuALz3EJYCpkmuz6TankY3l9HIBSKvrO+ShtJSylNccLwZH7mi+BZ7M0nlWelh0knfzj
         VlfA==
X-Forwarded-Encrypted: i=1; AL+hErE1SHq4qHGqICHj8KgEAb1EAc+Toq7hXuqZQXv9J4M8zPMEYPD6hJctdK97SyitgouqbTl6qLU+H7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gZlZTjvkog7Y0Bpjhoj12uTNEorzMvHHjBI/fcQOJbNVgBLoI
	i4eGVMIfSVa0xJ/2vh/eqwhfSv/ItyyGsT9OzVJ88JxQZH/WyX4RNxS+bBhPoB1DayaIczScFgy
	0BNYLDW218yWGDzc2FK5/sz0dg1NqRUB//eF7QTngNA==
X-Gm-Gg: AZFdTZdGPK3Ln++3UtmKAhMTJm/3yt9nf84hHhXHhqgUgAmcgoJuz5f4PP29/id4cvc
	0mjLTqyoVohtqNYO4FGtROMLOvBaPBauuhcgCniFT8OzDrHNmSIpB/+RQzE1csyu8MMRtCs+TMZ
	N5rdQunQDrkTyJdE7Ariv7x83V1T5xj2fbWuba3zxuLFfOkkB0Of3S7h383Pj1+9jthn06ioNpY
	tSu5CUKXe+Dxwra5HNYQPe7HESUuVQDN/t/+QcseBmq5mjbWUAbNj0G41aVqGPvwZeCI8951Tst
	lRrlongPepF2pSxMzl/hGbQc+0yfak8ELMFuxttjPEYqrDAFi8CvbNcU6H3hD2kLZndsiy9ocoJ
	tq1vLGhHHmHXbWyzE0F4YDSSRiVOFlEYVDlCfxut2aCcSrO1SgqecVbivEJpMdYajbu+c
X-Received: by 2002:a05:690c:6e8b:b0:8b4:c69d:17e3 with SMTP id
 00721157ae682-8b520501322mr76798817b3.32.1795641430719; Wed, 25 Nov 2026
 13:17:10 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-2-ccc2a3a6cd09@nexthop.ai> <179556272812.3135.6671930746959900620@kernel.org>
In-Reply-To: <179556272812.3135.6671930746959900620@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:17:00 -0700
X-Gm-Features: Aa3M54qAjb6VOUA_FXJBwfwYAI4hdIT50Z_FnPsv-oL5ve_wAb0briVt4LVCUPY
Message-ID: <CAAv61uR_cfj-tcqjf2q1KYDVxENmwJmjfR0M08Jk65iiQaj2Mw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] selftests: net: add tcp_l3mdev_exempt_ports test
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:25=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] vrf_and_unbound_listeners() in
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh waits for the=E2=
=80=A6
> - [Medium] selftests: net: missing VRF and l3mdev prerequisite checks in
>   setup()
> - [Low] The negative checks treat any non-zero exit from nettest as the
>   expected 'did not get the connection' result.
> - [Low] In unbound_listener()'s 'exempt, VRF conn to unbound listener
>   rejected' subtest (lines 117-125), the server is started in the=E2=80=
=A6
> - [Low] selftests: net: tcp_l3mdev_exempt_ports.sh bypasses lib.sh
>   helpers
>

Thanks. All of these are fixed in v2: the test waits for the listeners
with ss, skips when VRF is not supported, fails if setup fails, requires
a timeout from the listener that must not get the connection, and uses
ALL_TESTS and check_gen_prog.
