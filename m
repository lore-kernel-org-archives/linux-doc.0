Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C961A9F9B
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760340633; cv=none; b=MSbO3xX37u8e8N3/rHGPnCGPbiX9JYBfIRDkmjByyqfHLf3tAxb16HQsnG08MX4kGXwPo+HZR/9v1zG5IxwxhMCblavsj3DY0yjFzAimibOJXs51zD04338t4mv+/a6o+7YiSc5AZhJP+WrhHNYJM+XQncF99s4u/QAfl6MWm+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760340633; c=relaxed/simple;
	bh=7hKulDyCiG2MZUrEpJuX55XdK4d3NXy+qGwlTfVda+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I3aQyftPPzT7UNZvnhiphM3O5jj/mCtxDxkoXuxkQ+5YGPcC8vaqUMyqbDqo13+2yQFyE4ttqwIm1DTl0Ji08Q+AdEutS2puDdyoUeKcA4hLncg8uiVU5Ojc+7n/87NEAXZNMXGWwp2wv0V3WdZAanXtFVaTNth5kSBk8Ondd6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8UnPVfQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8UnPVfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760340630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jvcrm6KIUPUNpc7xmiZElApRSjY4cVtEn4dAkTy/70Q=;
	b=B8UnPVfQ9+61fnzki8AGahmrz3uL7Itgl/vUl01KV1td38bFseJds3Cj93BPlCA71/xTNP
	OHBCai8loIfrVpchdihMMt8DK4bKoBk/xyV8KITgRifY7FHbwarXBfJw5/DbOC2qQWhSUw
	pMzS49IcogthepLBzu496Ewi4KR4V3Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-ahSSCgCoOTCPHMDyd-AbhQ-1; Mon, 13 Oct 2025 03:30:29 -0400
X-MC-Unique: ahSSCgCoOTCPHMDyd-AbhQ-1
X-Mimecast-MFC-AGG-ID: ahSSCgCoOTCPHMDyd-AbhQ_1760340628
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e7a2c3773so20218185e9.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 00:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760340628; x=1760945428;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvcrm6KIUPUNpc7xmiZElApRSjY4cVtEn4dAkTy/70Q=;
        b=h6CkLIReuevLRCdIg+rAXg+z714UfYBHDjGJFWr5AWRDUk2iC5Nwo6QlN7MsHGsyfQ
         j6aTDoh76Egs1t7IWSXZtKu5l3mLrSyjFhBpwAG166tBmE1zyVv4OBlEHSTrmk61LewJ
         960/fjBRQYq/W8o/bDSZ3aqyeFpMcMpc+O9+UetJ904H0FD1N37m8Ie2XRSWXFbfLqx8
         mLw5yraJBMs5MLbnDB9gwk2gdLZj0TpYZ/7VNwjNT7oT+V7K+xUqpS4jMVtWvjhyKY4a
         v6HKHlbXC3oiMb9RfmsF9qlgpzVt2Hu+n7/to+egUmPU5DkzOZUYp4TmnVsuFGRsayOX
         kpUA==
X-Forwarded-Encrypted: i=1; AJvYcCWYhZNqu9AGnSZnV4HbHRYRRFI+Ur0IWO+2uks4VuGrqPJ8ib0waMOhHQBAxmt6SBuwa94WUjlGOaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsd9HGxEgIoCDFHBQuhefSyT3CkQg6sd16x0nIgRN8cCO2LEr
	/VNPs4OG32HDZLoYs8nXeabB59gWVN653PBbiW+tYTWgRFo8Vh6+rMZz+sP00uOVtJY+xM4AAvE
	cPI58pcrXv0xXxYJYuCRZpt9XAG1NwORgwe4jYC0huImuXj7IMlsnv4c64UEjCg==
X-Gm-Gg: ASbGncuVhWo+qLyk4N69cWX4v/hTfaAYOTHHvP01C/Xq8P8qPjfy9sN+hwUIIZYug3c
	zrzJxvql72CUqP2bOSJeNx4sCRGeL1nDVLxqa86lSzlRAf72m6jbnafMtJFy85kFDJhtInzclTU
	6TDgNN0DsTkSt+Xfx178Z1s/83rZilbJegnJL//phHjqB04VCS4iXCZNHybtiJl0fWq7A7mmlXf
	QOCcRxX3SBchBhzzOl/I9nYwOYOdbB9TymuzkDlc4hvYe99BPzxelt+ftmjI+r8X8iR+0WrK4G6
	gm7DmP1EoYqYbW3ly+cDGO0+yHZPuCQQCorT9EO6YfWZ4WwffN8vbhRfi1TjUVoKlQ==
X-Received: by 2002:a05:600d:824b:b0:46f:c55e:a687 with SMTP id 5b1f17b1804b1-46fc55ea6f7mr15279235e9.7.1760340627726;
        Mon, 13 Oct 2025 00:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC/F6R+8hlK3CtQbemkFUUvDibbdW2qqB3BO9HixY7B8LvjUh+PY8O3sgUpuovPDwK9I3d/A==
X-Received: by 2002:a05:600d:824b:b0:46f:c55e:a687 with SMTP id 5b1f17b1804b1-46fc55ea6f7mr15279035e9.7.1760340627301;
        Mon, 13 Oct 2025 00:30:27 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3d2c1asm121363435e9.1.2025.10.13.00.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 00:30:26 -0700 (PDT)
Message-ID: <646db9e9d956f009d53bfabf8b8287c034279066.camel@redhat.com>
Subject: Re: [PATCH v2 20/20] rv: Add deadline monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, Steven
 Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Masami
 Hiramatsu	 <mhiramat@kernel.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: Tomas Glozar <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>, Clark
 Williams <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Mon, 13 Oct 2025 09:30:24 +0200
In-Reply-To: <87a51yyf0o.fsf@yellow.woof>
References: <20250919140954.104920-1-gmonaco@redhat.com>
	 <20250919140954.104920-21-gmonaco@redhat.com> <87a51yyf0o.fsf@yellow.woof>
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
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-10 at 17:04 +0200, Nam Cao wrote:
> Gabriele Monaco <gmonaco@redhat.com> writes:
> > +/*
> > + * Dummy values if not available
> > + */
> > +#ifndef __NR_sched_setscheduler
> > +#define __NR_sched_setscheduler -1
> > +#endif
> > +#ifndef __NR_sched_setattr
> > +#define __NR_sched_setattr -2
> > +#endif
>=20
> You can use __COUNTER__ intead, would make it easier to add to or remove
> from this list later on.

Right, good point.

> > +static void handle_syscall(void *data, struct pt_regs *regs, long id)
> > +{
> > +	struct task_struct *p;
> > +	int new_policy =3D -1;
> > +
> > +	new_policy =3D extract_params(regs, id, &p);
> > +	if (new_policy < 0 || new_policy =3D=3D p->policy)
> > +		return;
> > +	if (p->policy =3D=3D SCHED_DEADLINE)
> > +		da_reset(EXPAND_ID(&p->dl, DL_TASK));
> > +	else if (new_policy =3D=3D SCHED_DEADLINE)
> > +		da_create_conditional(EXPAND_ID(&p->dl, DL_TASK),
> > GFP_NOWAIT);
> > +}
>=20
> What if the syscall fails for any reason? Wouldn't the monitor stores
> incorrect information?

Yes, that could happen, this seems an issue only in the throttle monitor wh=
en
failing a DEADLINE->NORMAL, other cases are at most resetting the monitor.

In this case, the monitor is really saying: a deadline task is no longer
deadline, so its runtime should be counted as fair server. If the syscall d=
oes
fail, we are assuming the fair server as armed (not running) for a bit more=
.

Here I couldn't find a nice way to handle this: if I attach only to the sys=
call
return, I see if it succeeded but I lost the previous policy, attaching to =
both
(and keep a per-cpu storage just for this process) seems a bit overcomplica=
ted.
I see this can potentially lead to errors in the monitor, but I'm not sure =
the
extra complexity is worth it here, considering this failure might only happ=
en if
a user really makes wrong calls.
I tried to avoid creating a new tracepoint on a successful policy change.

What do you think?

Thanks,
Gabriele

