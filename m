Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421008;
	b=5ZJkiKhDyuzTOqmTcle528okiLo74r+8Sl1dDnk9vJNmfg3CkYeqYxkYVn0hdKBnDdGI
	 nOp1t1mhLuWoa49Lt3GAziACwzY9IFfyNrTJ//tG2Bunf5rskmdzv0OZ40/x10Azo6rCS
	 UhEaTWZ1dyGRQpqyenCvLQwAblDOseYJ2Nc3vHBQekj134HhUc6XNpe/p+pXgPuXvYKuH
	 auBupMq6PtYpX07du/uvQyX2JOhtXyRFBdPSxYcnN9OLX59Rz6moKnuVheOqLQICK+iJP
	 ou77JlihH2uyCiwh6OOtZjlSNygQU5Xisq6a+qLYX/c1BnintfAMXg5n5iXehygRU2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421008;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=689khxEoDyV88ktk93RsgzcvIyrFI7xnc9/WPz+bKEM=;
	b=x3HYV0upy10ebD0T2xtC7qBfKvQ5Io2ny5pMv+u8gR5TNbquZRNzhRTQxoZHiwxDyDJm
	 wFBWXYLq6aJ8OwskCqywSzOcnKDWTfCQ1wjKgx10k6oTdli5slnal9U/fzbTYwv4KjyPP
	 W9zPpR4mAx/DufORqyOZlIk70mE11FzbtaThP29UN/sC1ig6fVEyAbU2G4qJz0ay5u8QE
	 oRaHeESRPGT38LgE8VNF53b3RmZIW+E7Z3c0D9NybbAJlRiIRK+VjEdASGLs3GlfX2Ljb
	 KAxk00IWnn4LlM7kA8ySM+/74IEv0gLSAisNmtTGhjm9nKiHGAMn7RTjTFicv7yGUbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EiVDozJf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d2bVSJgX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59A606A6BE
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D59A606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EiVDozJf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d2bVSJgX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795421006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=689khxEoDyV88ktk93RsgzcvIyrFI7xnc9/WPz+bKEM=;
	b=EiVDozJfA45xXPBBTIOaQvYYxdfovVm7mwhKFWdjqcd+nXRGcXjRFYZfJ3PmaWMbJpyJAB
	lLAJvznmawBprTAXEBf+vXRRNmLV2YFTbG4qoeb2wN9pHllQi6qt1EO/JZphuSzbnpl2sD
	Wlt6/1cKA1SftBeyuvu1f/23l/pxU70=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-7XMVugPTMDq1lbJy_9lTVw-1; Mon, 23 Nov 2026 08:03:24 +0000
X-MC-Unique: 7XMVugPTMDq1lbJy_9lTVw-1
X-Mimecast-MFC-AGG-ID: 7XMVugPTMDq1lbJy_9lTVw_1795421003
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df02b91f9so2113219f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 00:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795421003; x=1796025803; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=689khxEoDyV88ktk93RsgzcvIyrFI7xnc9/WPz+bKEM=;
        b=d2bVSJgX5McdQIggJIfTHtG8EeOX6KxjLbRMPQgy7G6stNmmCeAKMbrwVUVVIIyuu6
         jAp4dS9HFzqDChfJhQceWm5ZIWsXxpCSmf0kXlWnF1re1Rj5zycCyT1/d+umWWMyCwpb
         xUq6IbsB/SvBtqgz7TK3/QMX8REkoyaLkgfgaRO/cIYaBoApJOv/tfU3lW/smUqJ7OYR
         0NmIWJMtgC3IlXOZEuKL+8RMq0uKBarjpzmpyzqeDOCdQ/kwprMnZPi1jyZq5Kzi07PG
         iCa15awGfmJPeU/kVt9m5UbLcA0adhXS2WTnKknVY4JyeV0QG+Lf+RaNUiXI3m79Enmu
         965A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421003; x=1796025803;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=689khxEoDyV88ktk93RsgzcvIyrFI7xnc9/WPz+bKEM=;
        b=GM/qP8z5F5DQ3OHTZASgK4beQeiFnvCV3O/bFlLaIS7eW7PwNKKrwOPV0CHtqhntE8
         rJTLp82Tt1OCvUF4pw7GAZD+f4L7BSP1vqnVaaJ2X5HuFS9ZD0vDM+Zi+aa+nLVlBdOk
         QnEv3n9Dx+HubxQtchKN7yX+qnZ209wZFL0Ael6gYljZlkJcf4kr4h/K2q85qPXyWfBN
         2agEnCJYnSVXyuwljHqKeaEn83lQTaQTa4rSparc76xqHXyjdp7570BlOpBss9Gk93Kf
         bnUDHWi1rsV8Rx0NyvPfgsSpktXP5KxuiKDgaXY4XEmJes7NvBv9nM/Gp5Ugeb+sEj1s
         LVvQ==
X-Forwarded-Encrypted: i=1; AL+hErHpz2t1B11arcoeG2VSBsk3nPy13MRCz9+rUAVWW8xIlxV8WPtWBfR8wD8QVlJNUkMl5NNraRbzyfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zB2Y6Kg26d3jiNFQqtYFHxvlZtYmf0xMgTZxyGgdQhs0hCTBn
	haZNVxP/FJp0qjHcjOZXew1a+PLpUcJGeeUEpvYrgyB5CyYTyfjQQLuYBOWq1MXELhEwFvLV+B/
	ll0QhCGZGjmT1MSlbpFhGEP8DZ/nKzRgGb0LlZpFh6nmROY4Ebblpk2ENbQWTIMXIcSppUG21
X-Gm-Gg: AZFdTZeaoNGtlsauBy8W4BJJnpMK0WcMtNGTluh928EkXBPipM07+qDMlun9BUbI/TL
	8vCyTijQFSN+wzaUFFa3W3Sk+ouEJkJmGctCkKxAh6R5NrQmqb4eWb2UozEVRFeH1LToWbMkVS+
	cJMCwVCsSUFSaUt6qpj9bPyvFCHZrv1CvSFgcfBhIyoQ4rwcUUVjAolfkULU1SRnD1jDNXTUVXH
	p677gKUnuhps0HzEucg5iBlthm3UOi64qhQVa0ylCIhKcAS/5n8HEB8zA3BzwUHyV2Rrho0Yrp1
	aL9Id/V812sowSkpGhslZdfyelWCocDDhLPAWeLC/7AYx535IcYv1zWsn111xtx1aokUgVM1cM/
	+EsxOZI2Veo/+VVNtuyBXciBPknOSFoPIRcvUbmVVr/MGy1Tq6LTBAshWdBrBjA==
X-Received: by 2002:a05:6000:1e50:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-4abb2ecf9afmr16124927f8f.17.1795421003188;
        Mon, 23 Nov 2026 00:03:23 -0800 (PST)
X-Received: by 2002:a05:6000:1e50:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-4abb2ecf9afmr16124900f8f.17.1795421002821;
        Mon, 23 Nov 2026 00:03:22 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm21061138f8f.3.2026.11.23.00.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:03:22 -0800 (PST)
Message-ID: <7715326a01e3cd906829bde394663d449241f17e.camel@redhat.com>
Subject: Re: [PATCH 1/6] rv: Mark diverged child reactors with a star
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wei Li <liwei1412@hotmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Nam Cao <namcao@linutronix.de>
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	liwei391@huawei.com
Date: Mon, 23 Nov 2026 09:03:20 +0100
In-Reply-To: <CY8PR19MB700998CE5DB06F45985926E8B7682@CY8PR19MB7009.namprd19.prod.outlook.com>
References: 
	<CY8PR19MB70098BF493A3B67418C7B9ABB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
	 <CY8PR19MB700998CE5DB06F45985926E8B7682@CY8PR19MB7009.namprd19.prod.outlook.com>
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
> Each nested monitor carries its own reactor pointer. Writing a reactor
> to a single nested monitor leaves the container view unchanged. The user
> cannot see the divergence.
>=20
> Print a "*" after the selected reactor of a container when a nested
> monitor uses a different one.
>=20
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---

This type of notation is new right?
It's a fine addition, but I wonder if the reactor in a container monitor wh=
en
"dirty" means anything: for all we know, all nested monitors could have a
different reactor.

Wouldn't it be clearer to use something like a new line with [mixed] (or an=
y
other notation already used elsewhere)?

Thanks,
Gabriele

> =C2=A0kernel/trace/rv/rv_reactors.c | 20 +++++++++++++++++++-
> =C2=A01 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/kernel/trace/rv/rv_reactors.c b/kernel/trace/rv/rv_reactors.=
c
> index 8e57a95d446b..ea52f50e6453 100644
> --- a/kernel/trace/rv/rv_reactors.c
> +++ b/kernel/trace/rv/rv_reactors.c
> @@ -134,6 +134,21 @@ static const struct file_operations
> available_reactors_ops =3D {
> =C2=A0=09.release =3D seq_release
> =C2=A0};
> =C2=A0
> +static bool monitor_reactor_is_dirty(struct rv_monitor *mon)
> +{
> +=09struct rv_monitor *p =3D mon;
> +
> +=09if (rv_is_container_monitor(mon))
> +=09=09list_for_each_entry_continue(p, &rv_monitors_list, list) {
> +=09=09=09if (p->parent !=3D mon)
> +=09=09=09=09break;
> +=09=09=09if (p->reactor !=3D mon->reactor)
> +=09=09=09=09return true;
> +=09=09}
> +
> +=09return false;
> +}
> +
> =C2=A0/*
> =C2=A0 * Monitor's reactor file.
> =C2=A0 */
> @@ -143,7 +158,10 @@ static int monitor_reactor_show(struct seq_file *m, =
void
> *p)
> =C2=A0=09struct rv_reactor *reactor =3D container_of(p, struct rv_reactor=
,
> list);
> =C2=A0
> =C2=A0=09if (mon->reactor =3D=3D reactor)
> -=09=09seq_printf(m, "[%s]\n", reactor->name);
> +=09=09if (monitor_reactor_is_dirty(mon))
> +=09=09=09seq_printf(m, "[%s]*\n", reactor->name);
> +=09=09else
> +=09=09=09seq_printf(m, "[%s]\n", reactor->name);
> =C2=A0=09else
> =C2=A0=09=09seq_printf(m, "%s\n", reactor->name);
> =C2=A0=09return 0;

