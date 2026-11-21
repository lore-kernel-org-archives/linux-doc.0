Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272204;
	b=NH2AtqPmZjqK/5R/EPUIhYzqfAlf8nXtvSG5NlgtgSwOb8VlhGd6lmvdhUb6LVKxZRm8
	 FOm8mGEi0sHQjlxg1kjFz7mTS3AEvN/WMeOPCdHZsKQjqn3+d0VqySC1tneIty7dY/IO6
	 IxHDps5HB1U8POvmT/gKvzRTMjIK+55cNqWG9NYjmaWkNHYdk6UckazqxUYS4Dn6yDurL
	 /EEF/HTKy3LYA3z1nA+CJt0G4alGJ+DhS9UovmPlKt3aM3DX/Em1BqSi00hlnifxMtazK
	 ZuxIlUCKvgX2P016/0i78X+tRQ1N28OD2s9W9+DSIublHuy44YxhXSwC7Tfy2oeaPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272204;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=cCJcXQgk/Si4catT5eOwtfh+QW2z1vm+mPPFnEPeMZ4=;
	b=KIUuPcqLstBEeTAnkqhfPGbO6b5pF/EiwaNmpAmdMoD0TWGZErni3LQpHdvQvgss+N1c
	 lLV+IydXG9u/6ERc8degxo7bbBJAN6xLGPJMKFwkG+BOazfN9SZVq8etFOUv5Da2uTuNP
	 uvXWbufRXzUQf0Wod22GgglULHEV/A4UhCcTK6iD1TNnW3yKjskM8LDeY1wqE4I7qwN9S
	 knUU65mItckLoaBfQLyBvG4XNbxiRfaVxc6Zn6V/Ko19NZdu+GJtk7tCjqDm9F9BEessn
	 2JPa+hkRmDpf51PKSFWSwbNGtHWPpUs/A8kRykaInMwWouPhlYJGGm7EKmojMvGwRdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNpSypgf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jNaJmDiS;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E2B606A32A
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 14:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E2B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNpSypgf;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jNaJmDiS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795272202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cCJcXQgk/Si4catT5eOwtfh+QW2z1vm+mPPFnEPeMZ4=;
	b=GNpSypgfGPVGCuri//eCXZYtp5nxBq11XUwZEKhtWYUPD3pj7bdm3xtKym/CsVYklNsgrx
	GjrVLhPXfcoZveO9OSbIhJpHRy0BskN/V5ljPzUhQughMKlM85Zonp+qjBZ9y1vn3z/T8N
	tQin5OsfQuijmw22Vo5N8ihL+ERotbU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-G52gCgMoO8CR-HGTE4oCcw-1; Sat, 21 Nov 2026 14:43:20 +0000
X-MC-Unique: G52gCgMoO8CR-HGTE4oCcw-1
X-Mimecast-MFC-AGG-ID: G52gCgMoO8CR-HGTE4oCcw_1795272199
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso8796545e9.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 06:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795272199; x=1795876999; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCJcXQgk/Si4catT5eOwtfh+QW2z1vm+mPPFnEPeMZ4=;
        b=jNaJmDiSPYucTcK2ql2FUYqtNaqtEcwlcLgBLqTgua8QfR8VNXgw4VXM63Si1DKXew
         NLxGVjIN+btZHWBcwKFDg50VVz8lMjq0Cy2uAV7SClfKv6rdTf5R7v2F5Vs2f6ZvwhlU
         iYls4p28h8WUqw36B7ynUqTQaKDB/fFLNZm+jtU6krCJZJ+6QJkrzzaK0/2zRa89pbFm
         gvLqh3V6y9X3kaM8UAEtqTls7p8futyagqv7WFECDMTvrr92KhooRCA/BzQGuMMQcfpR
         xE4qlAOHGCTNRUCRsJElGHtKHBVadQKPT3v3VdUVwVbem9E6RbZC62IZwm5mH4Ecvz1i
         0mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272199; x=1795876999;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cCJcXQgk/Si4catT5eOwtfh+QW2z1vm+mPPFnEPeMZ4=;
        b=Cho+hkwLz9n7y+FgVTS33aYZvk4KJa4XTsQFskQNdBC7bVhQP2sEwdL+kHC8V7jYD7
         vuudxXlfvIiZ/dbfqpqlbanSH3GVJOEF3YCwC/PPPWINAxLDCTaLZDU0NP0Kxso2EBGn
         n1uT36d/ZnQAlyELKdGGce2Mtp9rhQIwbmVz1IrjgJCM6KTh4ANMaPDQk32HI51a2vWl
         1a0djCxEunCV/XiE3CeF9PHzhFhfn/ikT+gco9qKfHGDayHwztNON83cjawuZtvpQGOh
         IZhb/1m+FsIpFbJjiDvjvDVRaD8Z1Q+DTAYuUS/7CLOhat7a9/WRPRAQGgdmGfUF1WaE
         c3qA==
X-Forwarded-Encrypted: i=1; AL+hErF4JYelfdvsAJtmom/Q/PzaCPNSJttTX4tu/B37GMv8j23wXLXRCaIPQ5kExBWghUDe5+m4xJfcwT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lUdF15I+VgNueAi42+gT4AsDCBOTqUbzYk41V0iXQzGUEgeDi
	GR5LM5ioRMKUxcq0FxiUxi1gs+uTWpZuuvUOd66ocpp/sULtY7xaG6KE+bw2kB1Qn88PQ4gtu4R
	q+T8AEy/Yr/D+sBebZjrgV4yod5WcbEYW83OelSLhm8N1JEgJVOs5XeBLngOPMQ==
X-Gm-Gg: AZFdTZc7a049a0nQ3iGs/glipEdGowzlUt9PjU46DMkrHTMy2uBnNCs/B34r+39pTLo
	gE2+92z7/211aMTaRsW+KlcWyMcrubOffQOY2SfVWPu+x2bBV1P9tl5qPHf4e3jD3fyYVJEy5pP
	E5e+uGcexSvpQtuZrsqldkmpSDdCe/ZN6+Gj3cD8kvX62L6QVNcfkku9y+cb1S1qA15KGHO8w0Y
	qr9lXiCemYOEQSzA5skUfDozlx04VCHc/RghVD2g3sKS+niXmaD6v1DodvS4gEydEDogSS8v9fF
	LHf8rWQi88rEuOwWls0AFNeA+KnD5cPakXm48NhBJMrHh5d0o6sC6fPxLtcKo2M1JEIIYvzD4BB
	TAemLg/nkCtO/wvTuRh/gLvDrHjl5kfIitlH1Hwrx1z3cWHRVl+ewP5o4C11vsN6NOoxoqtFOpE
	Be
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr150766665e9.34.1795272199361;
        Sat, 21 Nov 2026 06:43:19 -0800 (PST)
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr150766295e9.34.1795272199011;
        Sat, 21 Nov 2026 06:43:19 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm13970576f8f.55.2026.11.21.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:43:18 -0800 (PST)
Message-ID: <9d23c0a68ae574f0c124da238d8ebf676d152039.camel@redhat.com>
Subject: Re: [PATCH 3/6] rv: Show the mixed enable state of containers
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wei Li <liwei1412@hotmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Nam Cao <namcao@linutronix.de>
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	liwei391@huawei.com
Date: Sat, 21 Nov 2026 15:43:17 +0100
In-Reply-To: <CY8PR19MB70099F2263C408361053B295B7682@CY8PR19MB7009.namprd19.prod.outlook.com>
References:
	 	<CY8PR19MB70098BF493A3B67418C7B9ABB7682@CY8PR19MB7009.namprd19.prod.outlook.com>
		 <CY8PR19MB70099F2263C408361053B295B7682@CY8PR19MB7009.namprd19.prod.outlook.com>
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
...
> +enum rv_monitor_state {
> + RV_MON_DISABLED =3D 0,
> + RV_MON_ENABLED =3D 1,
> + RV_MON_MIXED =3D 2,
> +};
> +
> =C2=A0struct rv_monitor {
> =C2=A0 const char *name;
> =C2=A0 const char *description;
> - bool enabled;
> + enum rv_monitor_state enabled;
> =C2=A0 int (*enable)(void);
> =C2=A0 void (*disable)(void);
> =C2=A0 void (*reset)(void);
> diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
> index 4e689d4590ae..7846e4092b9c 100644
> --- a/kernel/trace/rv/rv.c
> +++ b/kernel/trace/rv/rv.c
> @@ -235,12 +235,15 @@ bool rv_is_container_monitor(struct rv_monitor *mon=
)
> =C2=A0static ssize_t monitor_enable_read_data(struct file *filp, char __u=
ser
> *user_buf, size_t count,
> =C2=A0 loff_t *ppos)
> =C2=A0{
> + const char set_to_char[3] =3D { '0', '1', 'X' };

Real nit, but nothing ensures these match the enum fields although they sho=
uld,
you could use a designated initializer:

  { [RV_MON_DISABLED] =3D '0', .. [RV_MON_MIXED] =3D 'X' }

> =C2=A0 struct rv_monitor *mon =3D filp->private_data;
> - const char *buff;
> + char buff[2];
> =C2=A0
> - buff =3D mon->enabled ? "1\n" : "0\n";
> + guard(mutex)(&rv_interface_lock);
> + buff[0] =3D set_to_char[mon->enabled];
> + buff[1] =3D '\n';
> =C2=A0
> - return simple_read_from_buffer(user_buf, count, ppos, buff, strlen(buff=
)+1);
> + return simple_read_from_buffer(user_buf, count, ppos, buff, 2);

Why don't you use sizeof(buf) here?

> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -269,10 +272,22 @@ static int __rv_disable_monitor(struct rv_monitor *=
mon,
> bool sync)
> =C2=A0
> =C2=A0static void rv_disable_single(struct rv_monitor *mon)
> =C2=A0{
> + struct rv_monitor *cntr =3D mon->parent;
> + struct rv_monitor *p =3D cntr;
> +
> =C2=A0 __rv_disable_monitor(mon, true);
> + if (!cntr)
> + return;
> + cntr->enabled =3D 0;

Do you mean RV_MON_DISABLED?
You added the enum which is nice, don't rely on magic numbers.

> + list_for_each_entry_continue(p, &rv_monitors_list, list) {
> + if (p->parent !=3D cntr)
> + break;
> + if (p->enabled)
> + cntr->enabled =3D 2;

Do you mean RV_MON_MIXED?

> + }
> =C2=A0}
> =C2=A0
> -static int rv_enable_single(struct rv_monitor *mon)
> +static int __rv_enable_monitor(struct rv_monitor *mon)
> =C2=A0{
> =C2=A0 int retval;
> =C2=A0
> @@ -289,6 +304,27 @@ static int rv_enable_single(struct rv_monitor *mon)
> =C2=A0 return retval;
> =C2=A0}
> =C2=A0
> +static int rv_enable_single(struct rv_monitor *mon)
> +{
> + struct rv_monitor *cntr =3D mon->parent;
> + struct rv_monitor *p =3D cntr;
> + int retval;
> +
> + retval =3D __rv_enable_monitor(mon);
> +
> + if (!retval && cntr) {
> + cntr->enabled =3D 1;

Do you mean RV_MON_ENABLED?

> + list_for_each_entry_continue(p, &rv_monitors_list, list) {
> + if (p->parent !=3D cntr)
> + break;
> + if (!p->enabled)
> + cntr->enabled =3D 2;

Do you mean RV_MON_MIXED?

> + }
> + }
> +
> + return retval;
> +}

I need to test it, but at first it looks good and sounds like a nice additi=
on.

Thanks,
Gabriele
