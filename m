Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673DB44BCAF
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840323; cv=none; b=f6w/7RLWetZ9dLhCxeHjrJilO2ACkEeX2M1jRHMXrZRQAg7yRWbw71BaUdbDkvFWT+ChweAwVpET7IlEO2f+ip9honQrco7Okj18OgJtPtxHVcfr4gWReihDSHRaIyKWXd8PJU6+ZiJrApuJ/d1Z0OVwx+br2Z3/+5XmHej9QsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840323; c=relaxed/simple;
	bh=wLrvAGZ7jOnunflkcxAE6oQVsM5m+51uOLvAKd26H/0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dJGcnPNJkbAl4Y9Tq0AF1EKWomyhUPQeZe963lSUNG8y+RDtNHa8GjzimryK/kdLiTXrpgDrTKIQayNL+vg4HnJGvvzAvgfhdltB5w2wdRamcDDGXj4IOZYDnzD4eonPPzKTjdx0jHGh4ILalqf3SV1j5B3NPQq/gNPG/7zJJOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NU08A3+j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lm5/6Ctj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NU08A3+j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lm5/6Ctj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785840321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wLrvAGZ7jOnunflkcxAE6oQVsM5m+51uOLvAKd26H/0=;
	b=NU08A3+jOE2C385WGjmCO35IH3Cl5nv+RWpPyWx3yRxhGVCdc00IrBBikORf2fc9DuF48j
	pTf/RcG/BNJnX0L5XHCaJKwQdyDWmh2Q8ab8GKJmH/90JsYcu3LTWxqb8qv2uP+3VtTBlj
	DiE3g9Zm1FDuBdaDTP4ubDbtEBTb4Js=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-_VbsQ_VaNr2xvOy4yE99Gg-1; Tue, 04 Aug 2026 06:45:19 -0400
X-MC-Unique: _VbsQ_VaNr2xvOy4yE99Gg-1
X-Mimecast-MFC-AGG-ID: _VbsQ_VaNr2xvOy4yE99Gg_1785840318
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-496b6f97676so34255735e9.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785840318; x=1786445118; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLrvAGZ7jOnunflkcxAE6oQVsM5m+51uOLvAKd26H/0=;
        b=lm5/6CtjBCwZWJpZbOhC+UrSis1+yQ1q/kxQ6vl/O/auLifuUZCi5agWPwmtVKTW5x
         da0Gi7yuVWqwnMfnTg9tC6TRbYv4/l7fHEjNL+xzPE5Lz26Xd82W+BjU+3Spu2W3l35V
         ylOzJP6G7CCRoTA7RxXgs0lZd1aYWRm8rTi1AT6bSD0lsrExicmql23X26v7Gz7rsr55
         mZGorFjsIwhLB2tupspX3PzwdNJN4r+UuvpIQ63HEAXCzPady/Tgj+oPnqF8Ou0WhrfX
         RCuhR8TDRyChnfX9Qv2nJv9jNXyWmfEIm/7yZuy7fqSa9VT7VevL3kjNu9GgZ41/Hgvn
         Vhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785840318; x=1786445118;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wLrvAGZ7jOnunflkcxAE6oQVsM5m+51uOLvAKd26H/0=;
        b=eIeYjp94dXN7fGM9qmyD6BbyWgu0ijThmcL2tMdwjJoGC5Z6yJpwqDCG2su4fsR8/0
         SC4MVId00Nd80X+4Eom1QfdZ5SP/TK/kTxa4J9TV+d9jMwN7N+04XbNe5qMb21bj8D8p
         ZWXYTN5aKSDWJPBCrj2XskL8lNYUQ6lFPBCJcaeXwI6LVMkIEEz99iE4PGsZRP3rcBq/
         CWkln/NYFxj5e5bf5RXN4wU3CStgZakP735DPY/jVYFPNLM8f9daccq+ndQ3OGrzudQT
         66+RUelvIajDusYZRE0r1kJTC7cfw0r5WDBWJ1316onGjso0Mp9U6p88WjHPHvioRnvR
         uPdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/0dBMrw8f4do1RETRvgnDHTe/Jj0Z2HjSDtfLOQeH1r7/adzjRlOrVjh5fJfItEzaG5ABVUz7+7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTnvgHDGl4FqnbTIJjedR1ffFxh8cnnAyALmcF4slWI6aSfEk
	HzB86yxsUqUOeAh2KtOhecL+ZEJoSI7BZzqZzA3GRDwUJlzGhAuzFenHfxjqHziJvenL+8TSTtl
	noK0rC8b0BaoChskwh/D1dBfSx7eRmw9WM31dr1rahWBTzIzlgOlfvuLodozN88Z2wnlNJA==
X-Gm-Gg: AR+sD13FW9H3CNzvLw0ELEFPIGy8slxO8agCQlwUgKv3pZMS7QV3+InFqAXY8tTTIi/
	XimVe+Bh1ioo8KcTFWSD7+mOe7msVAn+6NV9LJGPAWUCUB8Od9qBMfrHoXSi3cnGa2CnKRO0HzA
	QyYbtTcmzM65UC0+13YrupvLpR24DkqGew3XTw1J9GiVBfz7Pj+FGdoF4UdHwgl+4XHgxTa/N28
	SCAYDtTG6h+bUT6WEzgz61qA30lvz+xwwxwJdRAqijW/uYUuF/Y/tUgCTy4YrCr4qinnok3nCZO
	3jxraACl3fa8TuSdt1ZujLcpyqBjSvBsGvv/hHG2lX/nxBLoLpn12pJjWxGHaWLOusWTwqx/4dg
	vtahnz3AbS/JiOt4uvnFQDnqUWFzi
X-Received: by 2002:a05:600c:3b01:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-4980c66c90fmr254159955e9.7.1785840318394;
        Tue, 04 Aug 2026 03:45:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3b01:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-4980c66c90fmr254159185e9.7.1785840317938;
        Tue, 04 Aug 2026 03:45:17 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6cbsm38107677f8f.23.2026.08.04.03.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:45:17 -0700 (PDT)
Message-ID: <c9fbfea2eeb6603f275365e61bef0bbfb355d963.camel@redhat.com>
Subject: Re: [RFC PATCH v2] Documentation/rv: Explain epoll and aborted
 sleeps
From: Gabriele Monaco <gmonaco@redhat.com>
To: Chao Liu <chao.liu@processmission.com>, Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	zhouzhouyi@gmail.com, lianux.mm@gmail.com, lianux.wang@processmission.com, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2026 12:45:16 +0200
In-Reply-To: <20260729081102.73138-1-chao.liu@processmission.com>
References: <20260729081102.73138-1-chao.liu@processmission.com>
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

On Wed, 2026-07-29 at 16:11 +0800, Chao Liu wrote:
> epoll_wait() is a valid sleeping reason for real-time tasks because it
> uses PI-aware locking, but the rtapp sleep monitor documentation only
> discusses clock_nanosleep() and futexes. Document it.
>=20
> ABORT_SLEEP represents a task restoring TASK_RUNNING before entering
> the scheduler. Since the task does not actually block, it becomes
> runnable again without a wakeup sequence unsafe for real-time. Document
> this behavior.
>=20

Looks good, thanks! Please next time you send a patch, even if it's an RFC,=
 put
the extra comments after the --- . This way I can pull it directly without
changing the commit message because git am ignores everything after the ---=
 .
Also, no big deal, but for simple patches like this one, and even after get=
ting
comments, there's no need to mark as RFC.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

I'd appreciate an ack from Nam, then I might be able to squeeze this before=
 the
merge window together with the last fixes.

Thanks,
Gabriele

> This RFC is based on Nam Cao's pending "rv: rtapp monitor update" v2
> series:
>=20
> https://lore.kernel.org/r/cover.1781852967.git.namcao@linutronix.de
>=20
> Signed-off-by: Chao Liu <chao.liu@processmission.com>
> ---
> Changes in v2:
> - Explain why epoll_wait() is RT-safe in terms of PI-aware locking.
> - Explain that ABORT_SLEEP does not require an RT-unsafe wakeup sequence.
> - Update the commit message accordingly.
>=20
> Link to v1:
> https://lore.kernel.org/linux-trace-kernel/20260722045706.85633-1-chao.li=
u@processmission.com/
>=20
> =C2=A0Documentation/trace/rv/monitor_rtapp.rst | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/trace/rv/monitor_rtapp.rst
> b/Documentation/trace/rv/monitor_rtapp.rst
> index 238b59395ff5..b95994ade14a 100644
> --- a/Documentation/trace/rv/monitor_rtapp.rst
> +++ b/Documentation/trace/rv/monitor_rtapp.rst
> @@ -67,6 +67,8 @@ thread to sleep for one of the following reasons:
> =C2=A0=C2=A0=C2=A0=C2=A0 variables as safe for real-time. As an alternati=
ve, the librtpi library
> =C2=A0=C2=A0=C2=A0=C2=A0 exists to provide a conditional variable impleme=
ntation that is correct
> for
> =C2=A0=C2=A0=C2=A0=C2=A0 real-time applications in Linux.
> +=C2=A0 - Real-time thread waiting for events using `epoll_wait`, which i=
s a
> +=C2=A0=C2=A0=C2=A0 real-time-safe syscall for sleeping as it uses PI-awa=
re locking.
> =C2=A0
> =C2=A0Beside the reason for sleeping, the eventual waker should also be
> =C2=A0real-time-safe. Namely, one of:
> @@ -114,6 +116,10 @@ The monitor's specification is::
> =C2=A0=C2=A0 ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or FUT=
EX_LOCK_PI
> =C2=A0
> +`ABORT_SLEEP` represents a task restoring its state to `TASK_RUNNING` be=
fore
> +entering the scheduler. In this case, the task does not actually block, =
so
> the
> +task is back to runnable without any wakeup sequence unsafe for real-tim=
e.
> +
> =C2=A0Beside the scenarios described above, this specification also defin=
es an
> allow list
> =C2=A0to handle some special cases:
> =C2=A0
>=20
> base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
> prerequisite-patch-id: d8b6c952a954662852e6b0684e0a3386eaab7f41
> prerequisite-patch-id: 940f7637aeabe4ba15a09c048c6f48138406f332
> prerequisite-patch-id: b99812692691f76d825778e01a2e771e058febd6
> prerequisite-patch-id: 512c300dce2cb74ac9cc007f9234aa507ef5c008

