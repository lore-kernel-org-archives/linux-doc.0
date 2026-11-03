Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793748915;
	b=wENI2DJl93aMcV93byOF/JJOtAKC4AlwY5BLdMR4bjHr5gqvxG1nSu09RbgPo8alN+mA
	 prpOdJYxRNqpMdi/8YjonNVpU7z9Bh+gwunnCG2BAn/XtFxmOUPtDv4TGrbrrKgmroePu
	 Jnz2kTPW/TgJBtVRbeOqlO7ZWFibu7H88jju3H2Z3M9qT+nZ8x1F92JfPlgJuW1+VBOOS
	 7DN7DscEZaVX68Fqi9llEHcsCJtAMyTtSpkg2Rp0kLZAWY5umw06A2zyedZcuLUqk1d38
	 0RGtSqec7WdY7esgr0kxAsgrlT5sWKZZo9m/96KwlxzQyurn0V2gAv0nS80Y4+2QaBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
	b=qfbTsa3Da3m3bodQIIz5LD6COWA8576Ckfyh0LzFZECFoi8rlgu2W/LXZNB5IMskk1P3
	 tspaTfrVPtM4gsuPGx9Jcr66Lf0vAkQYGrM/IUbd0sHsGEBLI/Bg+4IjouIL+9wKx2jPu
	 plWngim+ZHIZVQjKXX25yXbZiH5O9RB00v+bxRA162h58dXw8nBCqaYW7iB87bAxqewVj
	 VPzzVo4tJiEJZP+nLieVGo2sntpD84VF63YIL5ceTKV/5WQFd+9rM/MW+Wt+iae3xgXwV
	 nPnQq957RdSy99Dkeb/i1j+9r7KAIDP9GP3JteslCK7ZtfX5ig4nq7ZCkjeVYL9tjrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxTJ+4aJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE7606A326
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 23:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxTJ+4aJ
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91befe703c4so1716266d6.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 15:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793748914; cv=none;
        d=google.com; s=arc-20260327;
        b=o/d10rkYloo0rmYPhXVeA4GxBqGCu0astzhW+6WcIEPI6M5ho/dPRkIEDIf0e5mqRm
         Xc1oUCerUTDN9BiYPeENE0Kp6+WEbG6q/riJdI3BehAdOOlzRKB6AP00Y84sNSiUimIf
         TfvExxi2/oEzPuiiiKwEA5YofOihUc4FC+3Aztnpzsax3IZ1j4a6Wc2wnEPplvdxQ/44
         Smt/MEfriifPNmHUy0wKW8QhRP4pkAj7YaL+0EqLDLF7ScOprPcLsTLIwNgPCdaHV7Ja
         fkjgeiQH6suyKjYkafUurISN+eJKAyH7c8fUE2zTBsJpltVkhZ1d/1R1IVJHrylSI3bk
         TX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        fh=Z9MBQDSM4mhcKBlOpFIH1cM0rZou+E86YRZhvxEXFjU=;
        b=Ue+9h9y9XBbOtKBaa6Lb3u0/d4FIMvauOu2D3aaEv8nQZtrNEB93twGrCS9Hz5QUP3
         ilGHNH1YbcVmgP/iWkIHpNJc5PKk1LF1NA2ZTw9pHGfYXDmnZxsXoHH/7mCyEhmP28pE
         lWHmzPZopwv9JwUKRpAp1QbDe6xJNtv6wjHq8KJgibPW6hgyYLlU/45KGtP2LyUk6YuU
         B33bGmxMmkZB3+wL1F9vqrQmtP1WsVt7sD+kE0O1vWj5HYbxvV9Q1gixOslOY+8zeBxL
         vMpnwIWYcm14OdEuHCujzLXzyyV0TOmHqVUgEW6IGFwfhRNcBe0ehtFuuW7cyJgr+Jwz
         x2ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793748914; x=1794353714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        b=VxTJ+4aJ4hoGXlN0OEblscqsEQ8ZIHoVlcPvCs4QWOtOxiB6KfhsX9LnWXJ1+88jC5
         0JTCj2E5N2/3fs3r1e+RvaE9uLU+ENzivEnj2ssqal8mv3UOGemtl16V1KRc5jm/UX3C
         RxanjYA2i4+D/A+cmNKKG0E8C4enpHVo0ZPMBVFtUDmR5OiNohPGtyk0ZJGJRTkv93uX
         v7hCXNF/t2IwvnBd8lnfDtMCDVh7ykrqTzVw9MjHzF74JPrJRs78yx3S2MLuciYisYU+
         qAU9pf9YwEGQt2oG/HcPePOzm8xYVcD/4WEYZIKmHy4+NwBYlOcYGNmtY8HhfcBa5r8h
         1msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748914; x=1794353714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        b=zM9vvvICnOxgfse/eu/nYqaPpp3nnttLeKdx/0540UtTEynejwn9JAzba7fH9j9Tp7
         cn1cjIsBYd5t0pfyMWlCuxDfLbp1vC/dmMo7V71Ja7v4Q7tHNzZzjcnU6BPHSjBB8SvO
         dKhG2fwCy6CoTGxu0tUYk/6XKurZyDuH6tzzx9k7sFwTYC3d2Ka1ueBj39O5A0vAk6yF
         JiygLxtYUFEP3l9QzuK5whpwIEYybJXNPUT1fiHosLY6Q3MWmD3VNbHl9J26ea/G68t5
         mAjk1ggaB5RIizmUAFwSUUSImc9WsxnqAWHXDwLmQCk9pE1dv/a2N6ZkwfYB3zClifPa
         5wVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYbUQW0rRcUHyAwuQoBo0/5099ThE31Wl4X+vh1AbS4wpVSI2ZnbPUOBkNh/AOXbm1vQBNVohZDzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ip2qDo8dBheC9HExCaFf4x1heInmjHuts/z7rhHB5ACG2/+xZ
	AwcsANEcucZwGegTC8TdMjVwk9MvKLSqF30XN0Ljpm11mI9ULZAa3ewN1yIbxgHTZlxBteMnbAj
	4BezNi2R8v+HtZHk3v6TTi0LcJjjkntw=
X-Gm-Gg: AYBFou1bAqYKKsKgX2XJs//zCFOyAO4/7kGsiO7HAJQzlDUdHopwU/AEKgjVOUnz+fY
	+GPjya/qFgqsoHW8bwKyjgQT43kdnkXX28uRAjQ1ShXIElJpk7X8cIRxtrWSV/qlfzr4T/iuAxR
	rshoGTNXgPii/vy9LWcVwa8iahaHHYRlzNTLUw6JYKPI4Mior4FUSPlI5hxBAxTdSlw1V3Zj137
	7LdRQKnvu4XqBZT3+HkUlDeqH7z13cuguU0BoDVyRovB2eARYIUcr/mo8D/ECbpnKZlvXIM1tMZ
	/QjJtNFU+XLMbRTL2AN+j/Haw5zampsUEHTgPkybZTvSaTsMuLAtkiGrNyA31SESutFxjK6bBQK
	jwu35uAdzQ9HR0i2z0jt7gorfvXpWjHF5l62RJP9GWMSD7I1BzaMC3vJZQYWnAEpw67HCXVuuAr
	znh5Kmm2i3esKvoTX6O0wyl9T8cR8EBv+T6BQ9Wyw+9pCSh7kSnsuEdrqFyRFIg6o4iL/anC7SP
	/Ddl/O2nU7Tko/rzvJYWSpXLQ==
X-Received: by 2002:a05:6214:300b:b0:91c:7f1f:2c9e with SMTP id
 6a1803df08f44-91ca4c1bea5mr239516046d6.55.1793748913967; Tue, 03 Nov 2026
 15:35:13 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com> <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
In-Reply-To: <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 20:35:03 -0300
X-Gm-Features: AclHuK9j19hhkEsExp91lQWmWztn20ZPkjs1fSHVQiEkHUWk4-OotQ7EK4u8uqk
Message-ID: <CAMAsx6d0kMWT+QLBVGnGjfbEUDuOfrBaoCaizMNKZKn+NmkG=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: martin.belanger@dell.com
Cc: martin.nvme.dev@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kuba@kernel.org, sd@queasysnail.net, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	john.fastabend@gmail.com, hare@kernel.org, cel@kernel.org, 
	alistair.francis@wdc.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"

<devnull+martin.nvme.dev.gmail.com@kernel.org> wrote:
On Tue, Nov 03, 2026 06:57 PM, Martin Belanger via B4 Relay
>
> From: Martin Belanger <martin.belanger@dell.com>
>
> When a KeyUpdate arrives, kTLS blocks reads with -EKEYEXPIRED until
> the user installs the next key. A kernel user such as nvme-tcp or
> sunrpc never does, so the connection stalls.
>
Hi Martin,

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
