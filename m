Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66FE40B6DD
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464306; cv=none; b=aMApfSpKKq6LAZs764xieWX/64KX76FwZU8SDh6ux8ya+Ins3Yc7+hKR8sdMAP6vqsUivQb7tZdN4Z2EKrONe4x8CQRGXpFaLs4iGbiheb9LztjMIGHmjeeN004KJUnafInAQ4TwogRwwflsX8pQsrgvmBNolArM9uKqsPDrvK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464306; c=relaxed/simple;
	bh=pqQAGan4yvTVrFiL32CHCgoQyF1G89388WDkZh9066g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ejkW6z8glj19DZCQ6oNpxDV0G2QWJVP3H+FpVa05fXEXeG/vqGkCrV8FoRM47oh3eR1GSeU4XgjB/t02nzXuBIK0vqAT3kDsl4nUzZnPe2vEFYlF5BPEUZ7kQvcPXMmlSFrQx+G8bi4EjFnquyYJiKvb0hLtrmV9HCjUjttbRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=csHMLUkm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T4EVGc1S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csHMLUkm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T4EVGc1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772464304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fR0fvLxS9OT19o4gHC8nFDyqzxeV7tuHCO9Mj5KxIFo=;
	b=csHMLUkmRuxYrt1N67t2HTOEeRy9sOpHh/7cn5m9wiqn4gr7V1Lg0jPu8566LYJ0jmjU9s
	HjWiSEMXxGJH2C7Feckra40zFWwfkp50cAJx9AvpVAgSb3SgeYtZv4cVeU1LSIgBPkzmz+
	4S3uspfGB4oUAh2c60Rwyf4LoLyK9nc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-IvSeBZjtPVetezJ6h3xekg-1; Mon, 02 Mar 2026 10:11:41 -0500
X-MC-Unique: IvSeBZjtPVetezJ6h3xekg-1
X-Mimecast-MFC-AGG-ID: IvSeBZjtPVetezJ6h3xekg_1772464300
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-483a2db68caso38000525e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 07:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772464300; x=1773069100; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fR0fvLxS9OT19o4gHC8nFDyqzxeV7tuHCO9Mj5KxIFo=;
        b=T4EVGc1S3KDxLR9wb870gWHgh7Ib8ee7cdBmFLELZXC0mqEd66GAkEMD/1vYSzgppE
         zwNnis61nntKhzs/3qhE3U15fQ3iAGkG4N74yKaIjznBI1MitsTNKBklCIJ8KpiITu9Y
         6YKkRiOJuSiC+7ona9hnRWacuHf0SrdaDi8adN4tmKA+2qdL9SkY+fpiWnpuENLrgj43
         heDrX54xhP3p7UFQ2E7RzPiIVea02PCMKAgk+45xpajpbFj7d/p6OvgYoXXZAQuEL4be
         WuidYCwC7ev+lNF5tA76OA2AhmuIvP9hi5m6F5DPekBj48LBocziPz3maSafq5FDXqIp
         RgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464300; x=1773069100;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fR0fvLxS9OT19o4gHC8nFDyqzxeV7tuHCO9Mj5KxIFo=;
        b=CTezfxsZWsRP2HG9c1BuAxuKXHfFnhBmtaoQbmYpwFIULfdSj+DLJRe0pmW1TeuQ9Z
         m1jMXKjfs8y3PF4mAYYjSPmstWkX2uabPUDqBaK/JvrI4vznLnvl30kTr3mQG4pN6G6R
         Jcc2EOJT3XX0S8jTS/JUZs84uXUhDVzin/c61AlFg9n/0m27bMT+GGoThjH7gTdDKCd4
         LvhyrgUYMmp005mRw510vqHJ4inhbshzYDzIghRhEIWkASpmd8tDROwX0sBYxN3B3HbV
         sokYy3uIFS5vIGQbgV0UUbT76It5M3qpr2jAQroK+iJLVK4B3zGjXLpSi4Q+XDqbu6Pi
         dXpA==
X-Forwarded-Encrypted: i=1; AJvYcCX60u3UJHtub3bkMZG3j23MYkU9/kzFgZEFtusP4TzwaPV2GBr4sf/bEm3SlMkCB2m42f/RFWaZt5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0L17yacAwlMRlsvIL0Hh9CKbh2h3NdHIswFgdiXqC9EA59Zv8
	LAEJ50fwWMPOcxZ3ldMXvsjV6Twkex9v924Ol+vo/p1VkyJyp55me2HoSvbkLTiUM72AbN/xl1k
	+g36f+9JS2pCcdd/9q44yaXdB9wyERyv+df3PJkRkVlJ26koBl78qROfmWmDEIw==
X-Gm-Gg: ATEYQzxdQPgMqsM1TOvnuD0rc9szrKRJq5LTHfDTVYtg6tD2jdMrr9wy9HNKrEGen7Y
	lkaPb5rrkEKw7ZNp4Qysk/oInHGUle1D/hKeX9h5dltLeu1pCZeYdnKfFZNNYtYA58Eb1/sPzRD
	aaScL9u4Y8pSyc/07vXglXp9c8TB+NjfDoN+xvtbemQdA4YVVrh590/RE/20JNtUPmid2pEAggt
	rNx3QVndT0FGU9OcZdvhAujGTvLpBCGmm4RdeqlM1xywwkbPdFI10ulEnlI2RlWMTed+2lkviEb
	9iwtdFDXMD+rwguaivWkmX7oTNPIZJmfWKRA7EL5d6+lCOPxxQ231/4rn+utWOdYue1loV1UwXL
	CrI42a0iFBsp4OmLadqdfhjEK9s1lezGP/1D+M+sOqtvJ70t87cRGU0poJDAvi9ic760bsnTQSV
	yYvK2nd7ykIhmzrRA=
X-Received: by 2002:a05:600c:c059:20b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483c9beacf1mr153607085e9.22.1772464299858;
        Mon, 02 Mar 2026 07:11:39 -0800 (PST)
X-Received: by 2002:a05:600c:c059:20b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483c9beacf1mr153606585e9.22.1772464299371;
        Mon, 02 Mar 2026 07:11:39 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770c2sm281641905e9.10.2026.03.02.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:11:38 -0800 (PST)
Message-ID: <4369c322cd0626844ace0f42c55ec2cd9890cda0.camel@redhat.com>
Subject: Re: [PATCH v6 15/16] rv: Add deadline monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Nam
 Cao	 <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Peter
 Zijlstra	 <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Clark
 Williams	 <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Mon, 02 Mar 2026 16:11:36 +0100
In-Reply-To: <aaWgvBXaNg48qYRl@jlelli-thinkpadt14gen4.remote.csb>
References: <20260225095122.80683-1-gmonaco@redhat.com>
	 <20260225095122.80683-16-gmonaco@redhat.com>
	 <aaWgvBXaNg48qYRl@jlelli-thinkpadt14gen4.remote.csb>
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
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-03-02 at 15:37 +0100, Juri Lelli wrote:
> > +	if (!pid)
> > +		*p =3D current;
> > +	else {
> > +		/*
> > +		 * Required for find_task_by_vpid, make sure the caller
> > doesn't
> > +		 * need to get_task_struct().
> > +		 */
> > +		guard(rcu)();
> > +		*p =3D find_task_by_vpid(pid);
> > +		if (unlikely(!*p))
> > +			return -EINVAL;
> > +	}
>=20
> Not sure I get this comment. RCU is released when the function returns,
> but then the task pointer is dereferenced by callers?

The idea was that the caller should ensure there's no need to do
get_task_struct() (which is fine within the syscall, I'm assuming).

But looking at it again, that's not even necessary as long as the caller lo=
cked
RCU, which they should do instead of guarding here.

So yeah, the comment is misleading and I should just do:

  guard(rcu)();
  extract_params(...);

Thanks for the observation,
Gabriele

