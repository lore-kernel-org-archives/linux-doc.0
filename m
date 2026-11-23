Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425045;
	b=rfgGKLdbYilLW+WsBPuhjACNlCDoor8jP7KltORPzZLYLm8Ik+MfF2XjjSbTC/c0wzDb
	 8etD8RK3g+zV7jG3NWIaGF0B7ZECBcKtyrkhsBRqTov3HwwL0Kx/akGCylP6JLKu2F1gZ
	 dJX7AHHcu8tSn7NaiAdr4gDvcTMNxSoLpXObEB6jCc6HY9ycg2aXhsvvrFfaurEDyqmLN
	 u8371XLbkRm9wQ3yX8b6MjZbm5s+jc4ubdlzdQ1NzGXccV3w2ogpK+Wowz9VJbvGvV60l
	 fYaMZp80blE25w38r7jSOO4mP2HwSMnVC6xtyJL7ClMVcoLTQa4YIj2xoDK4QzjSVuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425045;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=ecm2PV2gI1P0bnbXEOX8qjFIo1KpUBcbqXWnncfBn1c=;
	b=xEVJxVLliliLFolENxVJnBpuNelJdTeShEk9gCXpd7zuRJfJvp7WOV4bVWMrBDfdeRQS
	 LQeGHkqQkqMGBJruqzlLW8CnAp5TfdccbVhWeX4oKlIRltQLMjnwBlZlDrrBpL2j61bZu
	 dYysT0u3FpQ+lqueLZCK14hmFykOSNJ88TBbai1Em5NI6AhFy0l8NF/qLYl54j7GxbwP7
	 nYydK+VvXsbektFf8Z6MGvpe7Xffj/DP45tCecJnoTacKSzyXzvAHKPuS/rwLCh17SA5O
	 t1hzeA5XJ/FX12nHH4mhYVCF77PvHH0Hjb/OLkYPv+dI3q1iFU5RON8fCdY1mXM3A9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZq1TMse;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aVdvSkFO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC32606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZq1TMse;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aVdvSkFO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795425043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ecm2PV2gI1P0bnbXEOX8qjFIo1KpUBcbqXWnncfBn1c=;
	b=PZq1TMse/ERr17WHnFn6Fwa6tzq1FOrQ1gOmwo4GD1YHbn8sHV+8R5nM0jmfBwH7PWzosv
	hXupiLkut1Du425A4UAmqV7eTWQefct0xhb8e428fxkMu46WX0u2lWA6gSBS4GeFT4qQxI
	VlpfHMB1xEm+Pur9rJ27tNbjLdkbquU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-hM_nzQ0dPXqb1g7FhPkzIw-1; Mon, 23 Nov 2026 09:10:41 +0000
X-MC-Unique: hM_nzQ0dPXqb1g7FhPkzIw-1
X-Mimecast-MFC-AGG-ID: hM_nzQ0dPXqb1g7FhPkzIw_1795425040
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so18589355e9.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795425040; x=1796029840; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ecm2PV2gI1P0bnbXEOX8qjFIo1KpUBcbqXWnncfBn1c=;
        b=aVdvSkFOdghrvKCDXIQaSLPS34J6lztjph0LSP1aY4sa3PvJpC925MFnIUefQQjw8p
         6rzfTfm0f2Dwtrlh/CTupOGBTRJaCOr27ucukbX1uWfQ3ptpLa5mQX4ekegNiYwuWdBC
         BVrVjsH/tba4CAZBzlI1f3VYR/5poPETgi1+/0SQS3+9JRVx+dnHlo2Th0r5dQ1pAj9f
         9OruF5LzpIrr6PZMCo57gSHeHEQTxHz+JtYNbGSqMUuD9HTq7pwyNRs/TvufLc7tpzqK
         owhUukCJE3w0ZgtBTlBJ61sRM65VBsDvRB9kL2nFZKMtcRw2GGrScQk+zusCUHezu7O5
         fiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425040; x=1796029840;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ecm2PV2gI1P0bnbXEOX8qjFIo1KpUBcbqXWnncfBn1c=;
        b=fnyveJcLM4DcMUgU6x10zUAklppHj84glzAAfUpfshefQYnvEIPDnebuqBzb+0XZz6
         KY3ZAOSKFaJCPYHOQ2tJ6StpJ6fdrjRO8xUxmwWnT508zrxJRqtxRWlJdI5pLfZAY5qS
         ZupyKCk4120v7B2EHG8SplYAzC8t6/VJc3PEBC6sQpQ1Al9u/Z9Q4yFRJyA3oeyuIcot
         QnvYsaFrwZnR91EX4Gn7t/n1s8/bdkUt1/+UO6fL937+6akzCgZ5L0enSAdPBiGr4FX0
         pBO27es+jQ9fgP1ascqmj0o0EySIK1b73gTGwZv61S0IaP9M27JLqpHFYnEpTxTZVGkS
         KRHw==
X-Forwarded-Encrypted: i=1; AL+hErHeeqGKJMDc2nVHz7wFAu8RQDZFhY4CgFxZW6VcRrFw/hhvktapvi5CtpsDKecFNdu0p6gd0TXUbU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lyZI8wHNDySZC4inzXtV1Nv7T97EMGh9cNO6lDA8Nrqy7mH5F
	LejDqgy9iqm2HVaTsn9ynlNXoCFSmL0sEv8uWU87qVjiT87Fhq1kGTi7YPhnlUXTrMkupcsb3kH
	Eakhh2aLrrw/YY2EUHsVxOL0Wp/ogilRaQZ5e7Zn7ZqKdJ/CTHAFe6RX5NgfVcg==
X-Gm-Gg: AZFdTZd/Kxgv/AmbzYFzWDVKlxbQUKaZfQYuzfakLmKlXlPN6pnRaIYNBuNcJDEzOqM
	6wyMhL9DkNzt9iZLuFcBPdzcaiKNWVlFD2nnClyAVfhcL4BCxRuomuDD9EWWPHhnQdK3o6Xw32/
	fFTowrdlDQSIeX0h8kH6Y0qhXY/E998fokWd7bGqNDTFRLyDA/NaMaQKeIcqKiJBV7hmWZ4MT5p
	IoS38OD2pxCgzrUbwXZsgrnKNATB89ScjYkKZPL3kYYnK71dz68sVHpbwXjq4nCXwQrVhickdUS
	NR7bceHBQSQdOU8l5TmF9uHxC9NiVsamJoXb//gAvHqUkieAGJ7rypeVe15sGjZFwpmkoshJJAP
	aHJP6T29SSgNEv4ZrqA5fFAeeuA00KrwQXDvX0Hch0Av10RWils3N50El39EtB6PJJPWw8gDpwY
	fo
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr236628785e9.26.1795425040195;
        Mon, 23 Nov 2026 01:10:40 -0800 (PST)
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr236628515e9.26.1795425039893;
        Mon, 23 Nov 2026 01:10:39 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm317775305e9.10.2026.11.23.01.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:39 -0800 (PST)
Message-ID: <96080be96fbb96ec77e3e015779da807fa4ce64e.camel@redhat.com>
Subject: Re: [PATCH 6/6] rv: Do not send the trailing NUL to userspace
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wei Li <liwei1412@hotmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Nam Cao <namcao@linutronix.de>
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	liwei391@huawei.com
Date: Mon, 23 Nov 2026 10:10:36 +0100
In-Reply-To: <CY8PR19MB7009D39FB627A9576A9868AFB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
References: 
	<CY8PR19MB70098BF493A3B67418C7B9ABB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
	 <CY8PR19MB7009D39FB627A9576A9868AFB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
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

On Wed, 2026-11-04 at 17:21 +0800, Wei Li wrote:
> From: Wei Li <liwei391@huawei.com>
>=20
> In the rv module, there are three read handlers that pass
> 'strlen(buff) + 1' to simple_read_from_buffer(). The terminator byte is
> not data, so the read returns one extra byte. Pass strlen(buff)
> instead.
>=20
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---

Good catch, thanks!

Acked-by: Gabriele Monaco <gmonaco@redhat.com>

> =C2=A0kernel/trace/rv/rv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++--
> =C2=A0kernel/trace/rv/rv_reactors.c | 2 +-
> =C2=A02 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
> index 7846e4092b9c..835d53978961 100644
> --- a/kernel/trace/rv/rv.c
> +++ b/kernel/trace/rv/rv.c
> @@ -483,7 +483,7 @@ static ssize_t monitor_desc_read_data(struct file *fi=
lp,
> char __user *user_buf,
> =C2=A0
> =C2=A0=09snprintf(buff, sizeof(buff), "%s\n", mon->description);
> =C2=A0
> -=09return simple_read_from_buffer(user_buf, count, ppos, buff,
> strlen(buff) + 1);
> +=09return simple_read_from_buffer(user_buf, count, ppos, buff,
> strlen(buff));
> =C2=A0}
> =C2=A0
> =C2=A0static const struct file_operations interface_desc_fops =3D {
> @@ -752,7 +752,7 @@ static ssize_t monitoring_on_read_data(struct file *f=
ilp,
> char __user *user_buf,
> =C2=A0
> =C2=A0=09buff =3D rv_monitoring_on() ? "1\n" : "0\n";
> =C2=A0
> -=09return simple_read_from_buffer(user_buf, count, ppos, buff,
> strlen(buff) + 1);
> +=09return simple_read_from_buffer(user_buf, count, ppos, buff,
> strlen(buff));
> =C2=A0}
> =C2=A0
> =C2=A0static void turn_monitoring_off(void)
> diff --git a/kernel/trace/rv/rv_reactors.c b/kernel/trace/rv/rv_reactors.=
c
> index 06f21bcdd6cf..8a4f0740e3ab 100644
> --- a/kernel/trace/rv/rv_reactors.c
> +++ b/kernel/trace/rv/rv_reactors.c
> @@ -353,7 +353,7 @@ static ssize_t reacting_on_read_data(struct file *fil=
p,
> =C2=A0
> =C2=A0=09buff =3D rv_reacting_on() ? "1\n" : "0\n";
> =C2=A0
> -=09return simple_read_from_buffer(user_buf, count, ppos, buff,
> strlen(buff)+1);
> +=09return simple_read_from_buffer(user_buf, count, ppos, buff,
> strlen(buff));
> =C2=A0}
> =C2=A0
> =C2=A0static void turn_reacting_off(void)

