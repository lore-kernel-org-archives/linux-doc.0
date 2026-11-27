Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790192;
	b=hKd0qxHW34uEg7hmZEt1V6uQQ42Yh1R94kqHWmQI2AAZKAExL7ALI3mYr267WdAOVkaW
	 47/Tdxgzvv9JsdNArXlZuuqQ357yS2ZaEl7Bt4f2iEMK3J8PcObYXgaxRmH3UtIno53Kt
	 F29dQ99nLT5uosLxF2KHp0rfUH0qRO582Nledu5Yd+NOq9C5yThe8UkPoFTbqYVMpmguU
	 wzDZIXJXZsBchZqwlJgQ613de9CwARrRPR2KGMY6eAIdpAiuiNFN5AgksllK2OdSJbg1I
	 CiLcvvGomRxl4DuKo64PPgPvXQRuMRUvRvJc/5z844s7oH9jwrFOb1SxnGA/erIwsrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790192;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
	b=prHYuk/miEZ05wmWUCwhkqSR1tTQxb9yVJ2UAg9qvvV5/e01VNkN9hHdPKSTjc04creA
	 /9wq5Jq98Gt3SpzKjhwwAov8jKqfDGvuh2K4jS83CJHN6CQYdPU50s3nsN6/gRO1dFJYX
	 rpKZ5f1Vq+uPV+GZmB2MazF/tdNOS8rhBXm/O2qLNNVt/Zz4G47CavrW0/9qc6oLirCkL
	 /sWcDPkqwQLYCNLUwrgKBL2HC1KiSVvF/xAxRa28Qmjw8S5INYMeKxyXnxONmj9+0xElR
	 AsUPWicIAuMJ5X/SBN/Cagc/yD0/ruxotNs+d56VHBlcRDjIeugSlbdAv89bLSJzpng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="f+lGq/KT";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i64iKlwG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DF76075FCE
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 14:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56DF76075FCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f+lGq/KT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i64iKlwG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795790191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
	b=f+lGq/KTgJFHp/ihjEJBuiMr9Cuxmph03oK4KYDYY0Gm3lacRjqUOssKqA37dqBtihmzU0
	x5t+3o7ivF0wohoGa0IaeBpvAJlZLuDsphKvbNNmx+xus++eL5hjWOTCJ1m4xwcZCCt+Sa
	N2XBT1eVMAa/I6pqe6K846hyZFMdiV8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-X8EIwbidMC2uNiQWhDTCAg-1; Fri, 27 Nov 2026 14:36:28 +0000
X-MC-Unique: X8EIwbidMC2uNiQWhDTCAg-1
X-Mimecast-MFC-AGG-ID: X8EIwbidMC2uNiQWhDTCAg_1795790187
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so6732881f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795790187; x=1796394987; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
        b=i64iKlwGKrIvI054OWHT2Y9Y1gv1AmT0UOp4ovkEMwuzDimg4spZDCi+95cELWfrLn
         C5mkKs6VSvkXU9B0Ipzwo2lqFFKSWwSKAboKhuVXzChz9uJ+/1fm6RjlIJuXCwt4994E
         UDfTbwwm57RcIHcGqav6oM2fJtuMlKe9uwEf955l+cmPEUgdSnZv9MVY8Y0ZDiXCaJVA
         VKbQc6sKToY9A7Q0NolpvbpagC6SEmHD1Uxf+8Z1Pgx06sOxcgQQ/Z6VNN+u3yCVZ9po
         0d4jVyj94OOBVb6envEO/GC+90MnxDSO+bxg/Qn4xiSH0EXAglob2Opb+Ot5FMESI5ks
         NtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790187; x=1796394987;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
        b=ArEGPy17ItA2J9x3EZuzTfVNAERD1hs7/5SyZgdEa7ypPpqjMmsAITFwBxC+8cB4w9
         /YvpmSgNlBXLzPDrr6fhsw7zZoBzp1qv04GeAELEZJGZpSvd8IM3b4FRC2A+ZOBZhdBi
         AHm+hH8Jo8FRdEM3776P1xyIOd7e2PxlTGuGeZ8jFjAk0KM9KHUflQFMBpD8+myj0g6t
         5jk9WUyavkOKfvONT5y44jfSS/Tig66YlFNpuS7vCwceBvT2KT2iPZdnFkaVQv7II3Ux
         QBtWP2iniBAz9iOegs/uoSsi9UUuBXiJIaPWuKUNyNqf+Pn46MphryXr1ksnMIGlxM8M
         0dpQ==
X-Forwarded-Encrypted: i=1; AL+hErF6EKuQc/VdYX7zbZNrXZszVCkPGrug5JcmDSUwFLv6++3l5jodva71GAxTyNN1Ga0IPsutyC3H0co=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YBSsxvrGwbSeMcnR9TxK1YHUO2tWXxiW725rsZoWCipRCClot
	N6mhmtrEBGy+jky/zXtorFeGwRiCL4Tu72YNxs9+PdBi7ijDHlxOKE0X8cLQcsxjVsI9Iv4t1xZ
	T9ofsxHBaHFMJGgLvaLOSoDewizwVE4nmdqojaDrYKTREFAVePUrLLhtYrifQEo/A5CHLKXTt
X-Gm-Gg: AZFdTZfSJ27gFEN+TdYvUyudkN8NgTFJOiQj3wfoqB2v8WrVEoxLO7Q6B+dSFjAqiwK
	AvIhazTPtcZEK4Ns9Sl5Lp7ZFECeMhz91ruHA/a2q/9BOUEKe+xFaiaduZtaBWn6CleVi4v8c9i
	SxZmB56dySeb+MxmToENJRaD8w6+Q4w02EquY0MEKqLEIVbKTBqGnpV+iBHqjcNQVx/So4uBqcC
	TBFRADZcLjMaYes60jOat8vZlX9ujvOOSSKHfLoFk2f70xLM5c7zcRdpazQuTh1VDvc/VmXdk+v
	FPUdgfukW1lR6CARbwsFH0zrd74i+4VqZzQffvt6RXcy7WHUWMOZ/OmsP+C8SkbN4zZ3B66c5u4
	U8ZDBKVVyT19GHJgdEsiOZdrnHJD4+adIDGWvDxlT+P+CFAjnYnnxkO0UkELiBNVGt7SD2x5qHT
	Vr
X-Received: by 2002:a5d:64c9:0:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4abb1baaaa5mr50096504f8f.15.1795790187563;
        Fri, 27 Nov 2026 06:36:27 -0800 (PST)
X-Received: by 2002:a5d:64c9:0:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4abb1baaaa5mr50096474f8f.15.1795790187167;
        Fri, 27 Nov 2026 06:36:27 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm48633531f8f.3.2026.11.27.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:36:26 -0800 (PST)
Message-ID: <b3aab99c30da8fbfe8d2a7b1bac7795d2e1d04e2.camel@redhat.com>
Subject: Re: [PATCH v5 3/4] rv: collect per-edge dwell time for per-cpu
 DA/HA monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 rpm@xenomai.org, jan.kiszka@siemens.com, Shuah Khan	
 <skhan@linuxfoundation.org>
Date: Fri, 27 Nov 2026 15:36:25 +0100
In-Reply-To: <adebe91c-09cf-40b3-9780-998cea432226@siemens.com>
References: <20261127113609.650286-1-tobias.schaffner@siemens.com>
	 <20261127113609.650286-4-tobias.schaffner@siemens.com>
	 <edac7605937c5fd1a02458e171ddfa4d5e6c1a36.camel@redhat.com>
	 <adebe91c-09cf-40b3-9780-998cea432226@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-27 at 15:13 +0100, Tobias Schaffner wrote:
> On 11/27/26 14:57, Gabriele Monaco wrote:
> > On Fri, 2026-11-27 at 12:36 +0100, Tobias Schaffner wrote:
> > > Hook the edge-stat facility into the DA/HA layer, so that any per-cpu
> > > automaton monitor also reports how long it lingers in each state.
> > >=20
> > > Account a transition as soon as its state change is committed. An HA
> > > constraint that rejects the transition can therefore reset the monito=
r
> > > without leaving an accounting window for nested events.
> > >=20
> > > Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> > > ---
> >=20
> > Looks good to me, thanks!
> > I'm taking the series.
>=20
> Thanks for all the support! I will continue with the missing bits for
> per_task and maybe also per-object and global monitors soon.

Great, thank you for the nice addition.
On the long run we may also want to have this integrated in the rv tool, pe=
rhaps
to do some filtering, aggregation, or pretty-printing.

One thing at a time though ;)

Cheers,
Gabriele

