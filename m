Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596063B47CB
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909290; cv=none; b=OOIqoIRT0g4tNI9A7RyrmVFJfa7COKm12O0zSvz5U977HMzpNrbCRyKUWyI3bzowi/KfZUSTMbf89ZY9HO28cFvby5to2Hbk6glxwihrKk6svo2guEsU6lGij15wgbDQSJVR+KFDRqGQ+pP5oIg7oHI77SVA0xE51NZw5v9cMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909290; c=relaxed/simple;
	bh=WBSQH5doQ0XyZPnhEPmZ+vvlhRHyRdY4NTxRVrsDXZQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oPE0NJk6edFaw5TIc3jB4EfokeHH0WkfGSKbfZPH8aNesv0P5g4Lj+rF2GZH4HIC6zk0SPSeO/iVMTrpK6doK7fQiLWtdV7yh0xMd/l3ZPehGUOtFvlctsdSIbbnSoBPU/QyYyKwe6D+A5YVeZDDAl5BgTzjMIYjjpIykfeBsdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dBYOpptC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhx/G5H8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dBYOpptC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhx/G5H8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782909287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6SImA3bc67S49Aleri4ZSDqcnWVDlr+FWuRlVb8TQRg=;
	b=dBYOpptCDbM06q4RmuScC1uO/LUxuuOnxt/LyHhuMM/xyZE15sea+7YAd4hDDa1myLAAZb
	vLuo6hLVIvDMIX98wCvfoE4wSCeyckoYJA+iN8uLlusi4GC4tKwVKuYOjlqaLOHs2LzlCd
	eS7wwpLz3hMeSpqU/H4bYiG94mXLiPM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-qBTOl1IINq-_qrAR_97omg-1; Wed, 01 Jul 2026 08:34:44 -0400
X-MC-Unique: qBTOl1IINq-_qrAR_97omg-1
X-Mimecast-MFC-AGG-ID: qBTOl1IINq-_qrAR_97omg_1782909283
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-493bd52dae6so4673725e9.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782909283; x=1783514083; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6SImA3bc67S49Aleri4ZSDqcnWVDlr+FWuRlVb8TQRg=;
        b=bhx/G5H8q65VxTs2nFGWH9gsr4OveWDjo2XvSQEsCmBEImzMkaFPmuqpxqzZSberMC
         OLC4hWKIGXj1JjBJF6EzDZsWspKbbM45KAQ/jtdMbjLYutSnYbXjtvKi43Fr8I3yIxGj
         jHLYlHwRNZfxFqK+WFFqnI3TEgqcNpEI0mOCDqjuZ7DM1nN7X0ivSze8u5UlS30IEhEn
         9dKJRETypQbxM64DERQ47TVVicSmaRFqUCjIBHCdwGAtyg3UcKMkUTAwH2kwVU6lrrwn
         0bz6HwTonLLMtNbTD++2s0Jpq8d2Fhw8WVSyaa8kEJBW+41gOwhnF5k9+py5l2Vtl4Cn
         m7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909283; x=1783514083;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SImA3bc67S49Aleri4ZSDqcnWVDlr+FWuRlVb8TQRg=;
        b=CH8ubzXgPPGXX6NfMgqiL//zr+z+8Aw7aTLQQQ6oQkugj2fzP+5iAsSF1DmwBbjTbp
         NwDBJZ5Sg0XOrwvqrjhdaAHxdQ4rj+vFsqcznbKgJPQcHgUAdF0BMwPeY5MBiStjVrrr
         s3/k/S1zlGwX12oKIhGlKW6Oajhumy24f1OPdmmnFkGF4DvbXpvCnpN0QN/taOvG3Km1
         uOhs50QPH98YkUynsRzENFwL6T6JCwMAtqe5Ll5lxUwyTsGjsWeeiGlak1HFPmQFDLXQ
         wE+EN8T80SJAVrvYQGjVfHfLkbTxZmS9ZuFfikB0Yex69J6/11QtjQHGuw0m1DsPI01R
         bDyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LH7uB0UIdXtaAaSWxzBCk/IwuVZkMHrkicoXYAYbO9F6P7KbC7EvlYdNM436vEDfqar4rTMKyCEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97DHHO/KgH9z7+HChmpAhQuAREa+tpS1jyvKMjxE3mjaKPZU9
	bgDB0LsKMFg4s5UAEBzVqKABO4/n+CI+AdnybKlIN9pfok+03EG0D101Z4XnV+hFj6KnzVcFxXL
	ibFDjtQXMNwbhELT8QscnUeCvW7j+9F785AFVr7YaAU7ErObWcH0lPxExyGABEg==
X-Gm-Gg: AfdE7cksmNZWs7Vjdt6crPGk2v5Ial7ARELAI0NRB/Gy9wJMSFDLAOrQ6XlftY4R3Ls
	QWaNYgrzYjau3KfnJFVc2KHfZvxfBckxVg6gEursQ8NjSf5ceJV66rU/ynE2DPtwXu8bZ1W6+vh
	1Hr6YAtGHe/E5TdXuasFSqsunhZ1gaCkrTgLYvOuLO3+Qxo2PkwGI33eTuivXax/rVNKXoF7Xjs
	i9Hd9bXr6ZK5x5Cv/DcIkvw7X9IkhJm4CEZ2bq6VVQBWn5FIIOg2gEIidt9YdxJEjB/6gH93rGp
	BnDzqo1Oh4hrAwyp1z7aV3zAy5Fa/DVd1oke8x+HIIm4qvrAh7oxK6C9noyzz3iV6RZ4iqz/CYU
	QaXPiY1O9Xq/S3xzPaC+MDcgPlZXBUjElyyEuq2aOFZNZea5YvevBAN+E/GaV4I/9fw==
X-Received: by 2002:a05:600c:68d0:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-493c2b4d01dmr14992045e9.13.1782909282921;
        Wed, 01 Jul 2026 05:34:42 -0700 (PDT)
X-Received: by 2002:a05:600c:68d0:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-493c2b4d01dmr14991685e9.13.1782909282587;
        Wed, 01 Jul 2026 05:34:42 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d19573sm15953957f8f.4.2026.07.01.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:34:42 -0700 (PDT)
Message-ID: <84105e8f975673f9c49ed4a5c47f0437fa4f7dc4.camel@redhat.com>
Subject: Re: [PATCH v2 1/4] rv/rtapp/sleep: Make the error more informative
 for user
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 01 Jul 2026 14:34:40 +0200
In-Reply-To: <9bc739eec41b6616e9f81cbe50759cefb1c3ad9c.camel@redhat.com>
References: <cover.1781852967.git.namcao@linutronix.de>
		 <d97b4b5c476e5792b6875ec9bbf8dc214f999516.1781852967.git.namcao@linutronix.de>
	 <9bc739eec41b6616e9f81cbe50759cefb1c3ad9c.camel@redhat.com>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-01 at 14:26 +0200, Gabriele Monaco wrote:
> On Fri, 2026-06-19 at 09:21 +0200, Nam Cao wrote:
> > -static void handle_sched_wakeup(void *data, struct task_struct *task)
> > +static void handle_sched_exit(void *data, bool is_switch)
> > =C2=A0{
> > -	ltl_atom_pulse(task, LTL_WAKE, true);
> > +	ltl_atom_pulse(current, LTL_SCHEDULE_IN, true);
> > =C2=A0}
>=20
> Well, this triggers also in a spurious schedule: current -> current, can
> that be a problem? Otherwise you may either use sched_switch over next

sched_switch would obviously be in the wrong context.. Ignore that.

> or pulse only if is_switch.
>=20
> It probably isn't a big deal though, since there's no SLEEP prior.. But
> we may want to avoid the noise.
>=20
> Looks good overall.
>=20
> Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
>=20
> Thanks,
> Gabriele

