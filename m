Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858F434E4E
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712981; cv=none; b=aM1VJ0jFMgZQhzzMf7Rqx27wctJX3oe3pku0QAgZK/VJc2eaLCQcTZvZoiFS8n4zgabEbqyJDU5Af+vCsoSq7yv0g2yAi+IIaeQ7mon0WItaxIn3Mj/k8y8YGijsaFuIAf5zAuzfWxpn73MTJYWMCWpRsl18qYIvuYTFQJmlpTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712981; c=relaxed/simple;
	bh=D8rbVhsJJF5navg4jZBF6ln1D7fQH99MXTmXV+mWAbA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DEle7maI8djIxNLbUJoGfKfjoF0tHhFMuOMnaZ0f1Py7gnbB0sPu+QyKRr00yBlV3gS/BYVcl5XR622inV9N2nToydhDHOJqbLoFt5hBbQTgOyUVjxI4zmU4JMGKupFQlyiaFMApY93VQRoxfh7gfkUaQAlA8s14z+dd0BF3KMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ISPzdZUt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8v7kCRf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ISPzdZUt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8v7kCRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784712976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=887G4FpM8v6xJwAY2TuX6vrvJZdHf0fmrax/gsZiZnE=;
	b=ISPzdZUtHesiwhQwyBfvuVegpmU9yNJK8as4mSlYNRDOyzKDYp/XJwYgFVMeUnlUWJfsv7
	X+6EAoXY2fQjg1Lwngybu16EGjXYN1TE+EmBqMgZ4ooDDFNhzjFvh7mhvcYSDiZcbgipY6
	wwcHZZd0PN025CVzp1JyXwlSIv1sHPs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-MYT4ixQNPP2TbWlqwT6pIQ-1; Wed, 22 Jul 2026 05:36:14 -0400
X-MC-Unique: MYT4ixQNPP2TbWlqwT6pIQ-1
X-Mimecast-MFC-AGG-ID: MYT4ixQNPP2TbWlqwT6pIQ_1784712973
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-476608a9fefso5580427f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784712973; x=1785317773; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=887G4FpM8v6xJwAY2TuX6vrvJZdHf0fmrax/gsZiZnE=;
        b=D8v7kCRfRxQUgqk9bUyFWBfpTTZPzVfufcH7MLZtYFvd0hgpGpxYkNet6NFqhrrMOh
         eBGz+TCyd8YLJehNO6xpJB5ieOW5bD9sPK5Fq+SsVNj6Rdzw+8Pr2+sEBBhFzzC3bpi4
         Y3DpjJOElT+xNsnFqyN4eTpy5hT4rExvoBKCgQCZXESQLRhaA9S8s0B7/sUzVUtYqrm7
         vSBOr6aSIpR4bRtsedJGYl40DRYD6qC/d2bN5wEqw2R64j4/uBpYxoJzGxCYbvR9moyn
         xf+cF1ZHIQl/heDfZSq+6qJWdVY/YaSfTp/SG+J1Mo3SoMTVym9hDaQbSBiL/k94VcoQ
         mZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712973; x=1785317773;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=887G4FpM8v6xJwAY2TuX6vrvJZdHf0fmrax/gsZiZnE=;
        b=F3GzaamyVSqtVIu8334T3cbHtuTwzkftx+iPwYbJUHhFF3gHsW5Rxj7Mhbjh/rvZvR
         4M0qDAVg0zUf3sM4vN9zbS3ezr74s6VGrV/fMWcfq7FXAZ8LQZnjQtDV61giYNxfg+xI
         VsQaznudTnJRNMaWVER1wAwOfW+mw36MnYc3xhVTaLbsfxw32vv4SQjyyk+57I/eOoQD
         wqA/9/gzBHj305Puz99ZiRcjHNb9+dHNRtkdtiu8N/qh6JfyNOd5i4f1q08GAsPqXSBA
         bqCNhUJ0Buld0xF7wee3CsFgthe6deqf9R3G3/kmppWq35kIR+iDKXWZEr6gAaMYUJrY
         qvmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4XWgSe8dM5wx1JO/xY7qUbtJohQJmkOfa8ittKbZRtkmovH9+k8Yi4StqDcsN0rQ9LjNloIL0o64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtX4ndYmRNSFGgqIsTho7VIf81GAXoHx8OIABvem0R/mrL3UM
	mT4ohRdiqqiPGLk+lSxN13LE4PURVVDnSgepvy/mKTnYRKLxEY99g2LUpRROcvGj0c0w9rKIuzN
	wRNXRZs4WwBGJcvXvCtJs+gv5v3qpK+nhETtQtKxwJ+MFvh8ztqWuCytTN2x4AnpPbxZgof2m
X-Gm-Gg: AR+sD13KFGkDyPKzcAdr86yVIyZmNIqQEX0aY9CG2b7xNQXCLI6vZTHd3wls4Xoq5OX
	G41grNNEpEVlgtfYhsWXOS6JGlgPyXsYYCC5fbrPJXX+aXw+LOFZX9yfzWDIIaqu0MkuboBbpV+
	PIyHQpvo+tdBCoJfqHI+ovz+6Vyqh2QPEPxCJVrT++OPY8805JU4IotU/eKoFp9g+uYfdsgpZT+
	hBwZMeG+xVjSCEqSjERj9hBM5/cP2vlwVxALrtrLFGtHMXPOS4kkcxDLPob9h4cI3JUOy/EEzbu
	ew8tCRPuNhiID4mABLb6tZICW17nlGq+Zi4uSpRagAsFmvef1kTjWdIKG0EQZP1QfSrfQ9/4DUB
	a2tDPg7kS/XnnqQN0Z3hJzy/4Yxqe
X-Received: by 2002:a05:6000:26c6:b0:47a:b6a0:b024 with SMTP id ffacd0b85a97d-47f840a020dmr4085314f8f.4.1784712973080;
        Wed, 22 Jul 2026 02:36:13 -0700 (PDT)
X-Received: by 2002:a05:6000:26c6:b0:47a:b6a0:b024 with SMTP id ffacd0b85a97d-47f840a020dmr4085256f8f.4.1784712972611;
        Wed, 22 Jul 2026 02:36:12 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.132.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm4537989f8f.31.2026.07.22.02.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:36:12 -0700 (PDT)
Message-ID: <1fe191ba66ae668b4635e2dd18b3e6c3b3c0090d.camel@redhat.com>
Subject: Re: [PATCH v2 4/4] rv/rtapp: Add wakeup monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Chao Liu <chao.liu@processmission.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 22 Jul 2026 11:36:10 +0200
In-Reply-To: <87y0f3wjuk.fsf@yellow.woof>
References: <cover.1781852967.git.namcao@linutronix.de>
	 <ba5658fa13e49ada466b84a2c211f233037180b5.1781852967.git.namcao@linutronix.de>
	 <amBHR4JTr2InJDk8@ChaodeMacBook-Pro.local> <87y0f3wjuk.fsf@yellow.woof>
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

On Wed, 2026-07-22 at 09:42 +0200, Nam Cao wrote:
> Chao Liu <chao.liu@processmission.com> writes:
> > > +static void handle_sched_waking(void *data, struct task_struct *task=
)
> > > +{
> > > +	if (in_task()) {
> > > +		if (current->prio > task->prio)
> > > +			ltl_atom_pulse(task, LTL_WOKEN_BY_LOWER_PRIO,
> > > true);
> >=20
> > The implementation also reports wakeups from softirq context through
> > WOKEN_BY_SOFTIRQ:
> >=20
> > > +	} else if (in_serving_softirq()) {
> > > +		ltl_atom_pulse(task, LTL_WOKEN_BY_SOFTIRQ, true);
> > > +	}
> >=20
> > Should this description mention softirq wakeups as well?
>=20
> Technically, on RT kernel, softirq is a SCHED_OTHER task. On !RT kernel,
> softirq can also be executed as a SCHED_OTHER task, which is the cause
> for concern.
>=20
> But explicitly mentioning softirq does not hurt, I wouldn't oppose that.

Sounds good to me. So as far as I understand, this change is going to go th=
rough
a separate patch right?
I'm considering this series final.

Thanks,
Gabriele

