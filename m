Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437216;
	b=J9v7IhOCAfXgAjekdpK1EUFpR1U6TZD0EFf0BW7LPjMl0sMaHj1SKtrmWTYD/HEOD/eq
	 oBTsuZ5M8cQl0KKNN/4+xzJ/3WURQLYz3uqgMMsgzboBgmfta2V2ZAfgoItim/oT7vrWD
	 XnhzUQ6lDjh/TZD8I56ASS1o6KVL+HUXgNyGvNwj7Ds1a6yjB3JF4mN4jF4E3adBsZqUU
	 gyZjRA01Rr60xVvT91Vful0EbmcPnpOBEKvQMtQmFOjHH1id7TbctrDUx2Rj98X488AE2
	 cja81jcHWRFjcR9fK+RLD9yc5sURDhhYzcv/KghXKCAT9oOAEaRnCoCqm4fNS6Sa5ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
	b=5t7W6kwRredMDDVgTQC7eYD8dNSB2xOe82dfwF60r5mt4aQJX4fOnshzzMyUmG2wZO1z
	 CqHzpBNCq9rlUeU8ahgrxzZy6cDWt5v1FQX3m0u0mGav3AS7+2dM0vPTPrm+ULeHPDFNo
	 ah3Mf9VtbhZfZ3xMHmMsc+XQsF/j4YOKMdVni3ab6n3vkwv2iuwLpq8fR05JsT+xUtHyj
	 D37R1dtOy91LSoOk6Zz83ru+eVy5dgYjPdMxASZID6lRUKoTEZkPPUzSEW1QgjKTX+cyZ
	 IFbHgTNpa/00fg6pyXXcqmuDEdiUsS3ipkV8iT2ZbMDZqagkdVNplKYekci9M1MNOjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7usWCHz;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A27606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A27606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7usWCHz
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4d6981c67so18610207b3.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 04:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437215; x=1796042015; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
        b=b7usWCHzIxH06fYfGotrQgPVLAmQ3sWKSBQiYFomKOR1WG9RrYxCgghN5xryJd8aa6
         I7QJq55FrNH2VuK5wByTae3ZvEPs8yxhLG5gaiAM+xYeoGoJNVqDsFy32aUK0AJtpTdq
         D78ot97LeUzcEUkhfyorOUMIj/esXbrJ/wjakWlzrJo0XjhHt4WkexbHjpNCTPX67slJ
         36CKmmhtVcOSioQ6cdNsixq8eqPWaI7iyBZsQOgqX+p4gsgXdWGgbWM/eQNhxwlEWeqn
         V1l6m/NP8B2sMsm759gCJ5b5kr5ikU8Zo0KzFfRJh2dp2rTjXrvw2lUmrdawOpHzwQ/F
         9XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437215; x=1796042015;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
        b=lo2TOFOpY+MWnNuOmObnUVtIxiBvo8d4JWyf77p328vYKs/M86lKSCf6kmco+nFMZq
         EFY1CJAy2ee7TBQ7RLUfPA97H1qIvwJL9S/Zh60e++cztxxQMif7Ij6rfzkAC4x0kgy4
         es8bgeXyflJHECppywBxtiva407rRlIm61k5eLpQrOYO1rxFcpbxgO8ZcbSsN+vQkXQr
         PS/upznDcsanSN7wRwPwSI/HRRkr77bXaPtMqD15B0NAnOF4+5oddvoQFYZ2vazgyQIc
         FmkMruL6zkjedqDk+jSmd4Qc+DAt9TEATeVm7ZwdXLgv+bALu3aiv+03f3neLmSk7c3s
         0F7A==
X-Forwarded-Encrypted: i=1; AL+hErGp+LPxH4Rvt1XrgZxrUR2YRWf4cTWfuFsNza37ra4EiH4r4CvXjDr8yNt3voDn0ytrdD6vJhDdtno=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YyQaAmfX192Oua6viwlusi1eTAlHSUvL3TnysLOzZkIPKiejh
	VobxF77FIUcJiaoCOQPRzJWKSJVbfC8/PQivNTNruDLpklQmUklyTOPu
X-Gm-Gg: AZFdTZfMjD3J7OsfeNLVAhkulgtP4pu+UfG4c1F9FTvHVZSG1f4ciC+c3g36Ae2bPxS
	HVxZYPafPxrFwQkyD1Cj7MAIKnaKlULbX9gohNTekpiKoqAXgVK/r/BaRxLoa3irRe204NR07Xg
	n1K7TiQ1AqR8rJzFcRCiqounyXCU3bPpuRRCySlm8OxfEqm6qcykSuD6PsrwElfbn/775Jry2xt
	wORmUEM5Y+I46afjvsbv7QLBYC+KDOly2TFGsVULVSYSq4EWwFFUqWTDU/cEa9+awjw/uJy6jSi
	R0/n68nHH7bdGrb8LtlDxD/wAHC7VBCroX6eAMyokmi+JPHTt5fxBd6llBQmF11YMdoMQu9wUEK
	ZOyByts90g6zxmBvilIe+aSwkUhH5wdo2aXx0QNoMhKNNOOsrj2Z8VEItxBROXWAyjoUhBMj3yY
	b2QKEzA/CVym4V+Uw2RdJOX2Yn8fFlEiG7SdAviFd3z91O9XethrmXQY/oos7UvbhWolyuOlrOM
	zTGnaUID6pxpOMQh5McGmol15dzq+aCr3tKs0zMduiDx2rEpCi0viVpAE+mQoe72N1F86/XbYuO
	ZDxziFNZo6GlVKN3gVbZNRYPh0f3eLTrfso=
X-Received: by 2002:a05:690c:610d:b0:8b4:deb1:4b18 with SMTP id 00721157ae682-8b520442309mr48137067b3.18.1795437215079;
        Mon, 23 Nov 2026 04:33:35 -0800 (PST)
Received: from localhost ([2600:1700:4a51:2210::11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520ca0cf8sm41807657b3.29.2026.11.23.04.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:33:34 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 07:33:33 -0500
Message-Id: <DN2LDH2V24NL.13URJFKPGO0N@gmail.com>
Subject: Re: [PATCH net-next v5 6/6] selftests: drv-net: psp: add rekey
 tests
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261118-psp-v5-6-b9ec840e0296@gmail.com>
 <179530218434.3135.4343666486290603431@kernel.org>
In-Reply-To: <179530218434.3135.4343666486290603431@kernel.org>

On Sat Nov 21, 2026 at 6:03 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] selftests: drv-net: psp: stale length n in run_session() after
>   tx assoc
>
> --
>
>> diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools=
/testing/selftests/drivers/net/psp_responder.c
>> --- a/tools/testing/selftests/drivers/net/psp_responder.c
>> +++ b/tools/testing/selftests/drivers/net/psp_responder.c
>> @@ -247,6 +354,16 @@ run_session(struct ynl_sock *ys, struct opts *opts,
>>  						fprintf(stderr, "WARN: echo but no data sock\n");
>>  					send_ack(comm_sock);
>>  				}
>> +				if (cmd("rx assoc"))
>> +					handle_rx_assoc(ys, data_sock,
>> +							comm_sock);
>> +				if (cmd_w_msg("tx assoc", struct assoc_msg)) {
>> +					handle_tx_assoc(ys, buf, data_sock,
>> +							comm_sock);
>> +					__consume(sizeof(struct assoc_msg));
>> +				}
>> +				if (cmd("key rotate"))
>> +					handle_key_rotate(ys, opts, comm_sock);
>>  				if (cmd("data close")) {
>>  					if (data_sock >=3D 0) {
>>  						close(data_sock);
>
> [Severity: Medium]
> In run_session(), n is set from off once, before the do/while loop,
> and is never updated. cmd() still tests n >=3D sz and __consume() tests
> n =3D=3D sz. For a single tx assoc message n is 49.
>
> cmd("tx assoc") consumes the 9 byte string and moves the struct
> assoc_msg to buf[0]. __consume(sizeof(struct assoc_msg)) then takes
> the else branch. That leaves off =3D=3D 0, but the 40 byte assoc_msg is
> still in buf[0..39].
>
> The checks that follow in the same iteration (key rotate, data close,
> conn psp, conn clr, exit) still see n =3D=3D 49. They memcmp() buf agains=
t
> the SPI, version and key bytes of a message that was already handled.
> Suppose those bytes match a command string. For example, an SPI of
> 0x65786974 with version 0 reads as "exit\0". The matching __consume()
> then does off -=3D sz starting from zero, and memmove() gets a negative
> length converted to a huge size_t, which crashes the responder.
>
> The conn psp handler already has the same stale-n pattern, but it
> only leaves the two version bytes behind. tx assoc is the first
> command that leaves an arbitrary binary payload at the front of buf.
>
> Would it make sense to have cmd() and __consume() check off rather
> than n, perhaps as a small fix ahead of this patch? Then a command
> could only match bytes that have not been consumed yet.

that probably would make sense, but this is mostly a preexisting
hazard with the demux loop, so it would cost another setup patch, and
the issue is still not actually reachable during test execution. The 4B
SPI would need to alias the string "exit". That won't ever happen.

This would be the only reason to go to a v6 for the series here, so let
me know if you think this is worth it.
