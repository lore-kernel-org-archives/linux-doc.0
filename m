Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D7283FC3
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753114404; cv=none; b=U41/YoWLWyx4xqlkk6L7scKuicIk4xhN//YaezizKGfQUCLd07Rl3KwvSjjiUPchqOhg1KusA0wXrTrMza4qbBoVcrJWnVHBcdBKu4qHRDv7IYAb9aVPxjQ5ThOkLDGhoXkl9lv81x6VF38w/trWlFDaqvPcR1kRxSjPjYM28S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753114404; c=relaxed/simple;
	bh=eP6HpFTt5M0VrV12uHRTWUJPZzddGV0wIeJ1SegML+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gr2mb6aBKWaa0EPyYfC3qgUMQH+buMjruLYBe2/fcBA8IFrmiHftd6aSPVmpdWEpuoZrtiSXJMTjSai50zvXhqvU/bci6zIH5v5WVZW37Qz3qMGrCItcwuYm5HWQjQb9vz4UE6JruPO6HRSPCEPXWPZNTJPNtc90/H5hDIGNQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DIFywGgx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DIFywGgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753114402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eP6HpFTt5M0VrV12uHRTWUJPZzddGV0wIeJ1SegML+E=;
	b=DIFywGgxzWWN39nHrpBHe/79PXsWOAHzrQQWwTTiTg+xtV6npojDR9Lj+ugs7Jhw2m9l+a
	KedUyVrbuqn1PUFysM2dLTMeyCcnn2ONhSGg8dNfiZQTG24/QW3lRj0by/2v2Of5ozyMO4
	qvsRq+JRJyJ88zTd0XTegwLWOTfrcPU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-Epge36mXNguu3HRH0vZTRw-1; Mon, 21 Jul 2025 12:13:20 -0400
X-MC-Unique: Epge36mXNguu3HRH0vZTRw-1
X-Mimecast-MFC-AGG-ID: Epge36mXNguu3HRH0vZTRw_1753114399
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso1851384f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 09:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114399; x=1753719199;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eP6HpFTt5M0VrV12uHRTWUJPZzddGV0wIeJ1SegML+E=;
        b=GWPOdthLHDs/8IgHhQh+/8ToH8DWLFg9sI/ls61f7eb5pVrjKNtTfF5CrUg9Q4CSZo
         SaC+KnVApysi7XdSqwra4qh2czpKI5SN9KrwSX1JvBGSeANgGVa6FOM5HRhYI8xgU11K
         +KrX1txVnfYwQuD0/yF3U/UzJFDjZJhrZHH1363mFjqAIZOw4E+RAtYZAwOuqHE/XNLd
         XvOhUYei3a0PqkX+YRqH+505LrFbof5DjGYJGTndn7MfeXNgtdABD3CB4oNFGtcR+YjG
         aTHmQUJYlY6DBN2Wkj/hrVcn8H9cG2BWkbhSIcMARjv+nr3Pu8PcKCiK0z0tJt4DQk90
         T8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVGDlNqFboMg12v34vfTYNx6FbVGs9Mj5AwOYrT0EwTByMb+VfiKKuti4EGL6lWBn7TbIlVyuZ1w38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07kYMaytvkYj7IUdjIAM1w+hJpIZwz6X8PvQaYOg5sT4/dcUB
	3wMkJh4i71aXbKlJCjnrysE44Gv6igQC/FENXbwvKcWwm8Hc0/mIHiiL+pnDi0iIkzaU4/k1Q8V
	UxdE8qwNNVCrPXrRfFdFWEi+7S223UylS2fziF/deG98Uiw4SuL7W5XFxoy3BCQ==
X-Gm-Gg: ASbGncvlxopujqvV7Wsod/C4BUhZOHXfw+y51Dl4Cm3nW8HnDADnVYvuv+jRKtgKwR6
	mXZ0rX4TfBcDUcf4B3D/+YydvlZaOwvZ9J9kQwbZxaqpGTpaly526NJNEHfsH9nTTJ3c+GSZvKG
	rOB+r2ONAinoD3Lq/zb0byCq4B0dB9mKSb6A/Y+9G9mhMmYm2NLjR/vkHaT+fHpk5uwMMLdM4Vt
	6hD2nr/clFOgad0LYzkaSmGK4Ud4T2ldHrjbR1rhHTMhnRecYkbpTIZ5O0CR1X189zOf2JZoFs8
	+5/s6Fv/JZljcIAg1WmuCdEC7Uh0JQEJnC12rdhfWMOHSxo5tWpSpbUbaOSCLPf/DA==
X-Received: by 2002:a05:6000:25c3:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3b60dd996d8mr17044497f8f.46.1753114399353;
        Mon, 21 Jul 2025 09:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgHb7IPoyQZVbYZX2Z6jGkPlm/aEeWZsfEVFg5fmU98gr7ENzxCxPQYa4SNPQs8aHL13kQpw==
X-Received: by 2002:a05:6000:25c3:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3b60dd996d8mr17044470f8f.46.1753114398783;
        Mon, 21 Jul 2025 09:13:18 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48986sm10853554f8f.46.2025.07.21.09.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:13:18 -0700 (PDT)
Message-ID: <2e362bb6b1eb1146aba3e88cfa9bba5927d5cc70.camel@redhat.com>
Subject: Re: [PATCH v4 12/14] rv: Replace tss and sncid monitors with more
 complete sts
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Ingo Molnar
	 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Tomas Glozar
	 <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>, Clark Williams
	 <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Mon, 21 Jul 2025 18:13:16 +0200
In-Reply-To: <20250721151539.EXglDXpl@linutronix.de>
References: <20250721082325.71554-1-gmonaco@redhat.com>
	 <20250721082325.71554-13-gmonaco@redhat.com>
	 <20250721151539.EXglDXpl@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-07-21 at 17:15 +0200, Nam Cao wrote:
> On Mon, Jul 21, 2025 at 10:23:22AM +0200, Gabriele Monaco wrote:
> > The tss monitor currently guarantees task switches can happen only
> > while
> > scheduling, whereas the sncid monitor enforces scheduling occurs
> > with
> > interrupt disabled.
> >=20
> > Replace the monitors with a more comprehensive specification which
> > implies both but also ensures that:
> > * each scheduler call disable interrupts to switch
> > * each task switch happens with interrupts disabled
> >=20
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> >=20
> > fixup sts remove sncid
>=20
> Is this here by accident?
>=20

Damn, again.. thanks for spotting.

> I cannot comment on the model. The CONFIG_X86_LOCAL_APIC case looks
> complex, but I cannot comment on that either.

Do you mean the amount of tracepoints or the state in the monitor?

As far as I'm aware some special IRQs on x86 use those tracepoints, and
I needed to use all of them not to miss real interrupts, which I need
to understand if interrupts where disabled programmatically or by a
hardware IRQ.

>=20
> But things look fine from RV perspective, so:
> Acked-by: Nam Cao <namcao@linutronix.de>

Thanks!
Gabriele

