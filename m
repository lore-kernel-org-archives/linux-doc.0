Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6F82857CD
	for <linux-doc@vger.kernel.org>; Tue, 29 Jul 2025 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778824; cv=none; b=BcyH/7vpFS+BsaqRd+oY77YGiYBvogERSbI/8c5DvkiLubnnJezMkzX2uQCZ+6+C6n1Gw0EY4uIufW/2dVg4f6E6lAVMZ5d5NWVaZB1sHJLGicYaZrvYiawY/mgjNwog0TsRHrnigvDdo0mqr2cpQ/hQWwfW/54XfieGVmGiXSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778824; c=relaxed/simple;
	bh=IeklVPatKGQJK226Ipf8izovC/a1rB5bC+YlMlow3Zk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWymYJyQcSiChB7sBjUafTnpktxbPCREyULp4V+bgY46k2NMEXifxzSsTD9Z6/idYXEzGI4b5QVbmr46UiJRrCt3MeLbn+LW3+WpSvkESVoJVGt1BaU/GoMOJKlDrDICnfEiIdy8hYRcw1KPTGs3rgQOGcJ/hSC7b9HQdu8oD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LBoKLKtg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LBoKLKtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753778821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IeklVPatKGQJK226Ipf8izovC/a1rB5bC+YlMlow3Zk=;
	b=LBoKLKtgnYcnYbhERWzyxlmnz0BpeI2divnf95zdmkFN0eO6CyZJfq6Yr6UENwdYcGowXp
	bMSkH152bR+vysjEr2sPGQ/QfwyyS9jdKoc0y7IzqDlDLYB3bAF6rmmej8Q7EvpRbw6JS4
	Mvj+uVZ++g76oBNSGVeDnYi+FGVkCSA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-ZeL1A5vBOuiUT_yBdEwP9A-1; Tue, 29 Jul 2025 04:46:56 -0400
X-MC-Unique: ZeL1A5vBOuiUT_yBdEwP9A-1
X-Mimecast-MFC-AGG-ID: ZeL1A5vBOuiUT_yBdEwP9A_1753778815
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so26673545e9.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Jul 2025 01:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753778815; x=1754383615;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeklVPatKGQJK226Ipf8izovC/a1rB5bC+YlMlow3Zk=;
        b=TrEgiOjrMIkb7zvcgcgxxUf9dAjvKMGZFKS/2QNzhDzjWMn63lLgoL0z6txBik72UK
         a0oAwzKzD84ei5Kh7UiHxeQ3r7Zim20XVIGJVAL0EeTTCfiRswxUvH6pXrlB6kxqVF1f
         WxeQTJVoUmq+7GHekq+ecZhMhDllCP6c69NbA885W/pkUPkSM4H6ChIgDGY6YARxp9vp
         oKshVFU4l3cAkxYuCU1y+SspR9iIrMjnmxOFcHBtwxwrNC25otGd+wgTupGIjaDI7VjY
         clb3a6kl5Q54Onl15bpaWxyp6jYY/g+vLIecfVBVRU1QVgiykRhE2jCTXFdeaxNEdaNi
         vl+A==
X-Forwarded-Encrypted: i=1; AJvYcCWjrPFMFmLjiA95NfHRFiZLe6FeISYS6giGISB0QO23vDjdTx0GlzADGJB4uPLGMAXGPNZaW1y4Vqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHv7mxOW7pQZPhHFI+MdIYzQNH1XV5ElBP/ByigUeSctMcKGbw
	E3qAyFaY5Yf03KrPftOVFnOnJ2LgDU2k+ordeWnZnaRs/JzeO1sfA0Piw50P+UE46unymrAkuQz
	ko7vXrdUDq0hzXmF2ftwfChthZIG8ZXO9WDga8fycSEzA6UmSr7+w/MpgIYL0LQ==
X-Gm-Gg: ASbGncv/bFLesezm7p25WJ4Fn2BITTaLeCIQHKlP9xoKn4bqznsYQFk+3SC/xra4IWN
	SEA7yZ7LGA6flA319lIlMwGEDoLbTmhsvE2ikKJVl6n+YztsNuGngheUrHY+QAzSkb/GSMjDMmU
	vk3Ce1xrLzuiGNQUxvDluBhU1SysbYA4GGb/tVldEUuKdV7hM7VJxGllOg0FZcCITiP8+YnptMd
	u91Ay4s0ZHYrQYIuWSF2Hd6WcjRP+6+nqK1NmCW8QJQg1ae5dNyvp6KkDJ6NfmpFO7euaPzLdIO
	55scdPSy1kWy1FbwaXhpgtJyh91qrvEdUPg+rHHI8cp1uJeDRIaMXOUfvLoAjgzBqw==
X-Received: by 2002:a05:600c:a088:b0:456:1608:c807 with SMTP id 5b1f17b1804b1-4588adc3677mr39809945e9.26.1753778814861;
        Tue, 29 Jul 2025 01:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENm4rGB9QH5ZR2b+CQxX8IopxI/UqZi4w2Zrp9xW5q/tHuwjGtN0qFNHlnuI29FnnDzuK6cw==
X-Received: by 2002:a05:600c:a088:b0:456:1608:c807 with SMTP id 5b1f17b1804b1-4588adc3677mr39809655e9.26.1753778814422;
        Tue, 29 Jul 2025 01:46:54 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78dd6cb0fsm2299807f8f.29.2025.07.29.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 01:46:53 -0700 (PDT)
Message-ID: <76d7e572aae2ccd1699a461aded7a6146f6d8215.camel@redhat.com>
Subject: Re: [PATCH v5 7/9] rv: Replace tss and sncid monitors with more
 complete sts
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Ingo Molnar
	 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Tomas Glozar
	 <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>, Clark Williams
	 <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Tue, 29 Jul 2025 10:46:51 +0200
In-Reply-To: <20250728155332.sbkepHj7@linutronix.de>
References: <20250728135022.255578-1-gmonaco@redhat.com>
	 <20250728135022.255578-8-gmonaco@redhat.com>
	 <20250728155332.sbkepHj7@linutronix.de>
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

On Mon, 2025-07-28 at 17:53 +0200, Nam Cao wrote:
> I gave this a try on riscv64 and observed some errors:
>=20
> [=C2=A0 620.696055] rv: monitor sts does not allow event sched_switch on
> state enable_to_exit
> [=C2=A0 621.047705] rv: monitor sts does not allow event sched_switch on
> state enable_to_exit
> [=C2=A0 642.440209] rv: monitor sts does not allow event sched_switch on
> state enable_to_exit
>=20
> I tested with two user programs:
>=20
> =C2=A0=C2=A0=C2=A0 int main() { asm ("unimp"); }
> =C2=A0=C2=A0=C2=A0 int main() { asm ("ebreak"); }
>=20
> The two programs are repeatedly executed:
>=20
> =C2=A0=C2=A0=C2=A0 #!/bin/bash
> =C2=A0=C2=A0=C2=A0 ./test1 &
> =C2=A0=C2=A0=C2=A0 ./test2 &
> =C2=A0=C2=A0=C2=A0 # ... repeat lots of time
>=20
> Any idea?

Mmh I see what you're doing here..
Those instructions are supposed to raise some sort of exception in the
CPU which apparently disables and enables interrupts without raising an
interrupt handler tracepoint (the discriminator for this monitor).
This lets the monitor believe we passed the time a switch is possible
and complain when it actually sees one.

I still couldn't reproduce it on my VM, yet I find the timing a bit
strange: it's alright we handle the illegal instruction like this, but
do we really end up doing that while scheduling although it doesn't
look like an interrupt?!

Could you share a bit more about your riscv setup? It might some
configuration/hardware specific thing.

Thanks for finding this,
Gabriele

