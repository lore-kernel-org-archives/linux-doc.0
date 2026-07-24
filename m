Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E639337F30E
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877653; cv=none; b=IM44eg2uDrOum3BXXWMfXho0SNsszoUxjndyG7KnPhmd3tkPfB93zDaXLQZ1WwZPqO0ci9oAlN5P2vP1byNjCfzis0sPltaRdW9Rd6FFA3MGq79a9VbRoigJvt4tsjgR+a8NKPloXMj7BMQQNLqIARS3lGx6P3RqotLoZ90T5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877653; c=relaxed/simple;
	bh=aOiahXnkJLxeXT2PiJPVq12iZVqQpAlIz++UX1OKaMU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UPKIV6b4oqbp2is6r6exp2cldjlaTodQrVHCjDfCFLM4aOhAWbT1h9iuoR0WykxJWsxGv7QsmP2D5UvB28rF1Mt506wFlhqsa7buiEDl21uPoRUPYOT2aFId2POCmd6XCWMauQ782uyBll759CQm7U4pIDIscupE9WfFMDUk8Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZQQFJN5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eaFQO6U7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZQQFJN5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eaFQO6U7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784877649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aOiahXnkJLxeXT2PiJPVq12iZVqQpAlIz++UX1OKaMU=;
	b=JZQQFJN5OWbBf1nhDJdhEku78CGW16JwCsvDzj6XV1H3bLT3xD4T4D8HVK5TPp+BQTxGvB
	ct0azTgQT2cV9pD3MKIK7f6C75uaKuZ7wvzHJdVVElReKlpK9MQ+J2e3g74x6Y1zFxW5GV
	mjC0UUgt+h0ukbITzi6pCkOfn78Ww+s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-XWMDDAsZPUmVNzj9Mzz77Q-1; Fri, 24 Jul 2026 03:20:48 -0400
X-MC-Unique: XWMDDAsZPUmVNzj9Mzz77Q-1
X-Mimecast-MFC-AGG-ID: XWMDDAsZPUmVNzj9Mzz77Q_1784877647
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c15f0aea084so12856366b.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784877647; x=1785482447; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOiahXnkJLxeXT2PiJPVq12iZVqQpAlIz++UX1OKaMU=;
        b=eaFQO6U7ZsKmw2d+Bq7odBELtaT24wfKNKtoesL6Brs/tPwTMJRyrAwR7KIGKR5hmB
         JE29HCMdzFPc7KLkyVHqnR7Fqj4TslzPkpRPB82rtVfRCBkFBDRwalIEXwmP72LWv8wC
         WIdm9N64/+eaOD3xLzV/tXodisXL6MX8xN/LUc2qwjIvdROjddW3NfyyKzkXp2QpMQTu
         gRz9tysBee4iY7AcBEsBbjTIP/3p1lxt/mtQlwE/oDGc0qIv7Dx+WZnXCNlLuJbyJh0Q
         adnm3spPMCkKeTtjvo3ji+VXUf7sleoiXBy3bKcShCpbNAegCwtApmVDGC9gjFKyzLwa
         oDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877647; x=1785482447;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aOiahXnkJLxeXT2PiJPVq12iZVqQpAlIz++UX1OKaMU=;
        b=A6L16f9zLW9fkQkAfNMFA1+jKjTXir16tqI4oGp4uRYJMwkN1DVMXEYYyINLiTVYbo
         aYFIGYlPG6vGTJiMf/3EHXQQ2HrhMMPbX3z0iyvsFN1c9jMMTcklENFRb7vQYXrtIuLK
         CfvvaHlbjbF7yTAI37XRoNBfoAWZCnvLYaOWLOJwwIEjglBZHYaQ76Rs4j/d3bH+FH4m
         bL3EsdYsfxRhySziqey92O4PtCHH2R9BMNAvXMGMJFm/SAu6XV7TGBUMIcLsID536Elm
         ijIP5RRMFI6O9MYmLTUimQ3w5VtbenJffLZAYKp+ws/iJizK99rqY9tafup9xYVhVqSZ
         873A==
X-Forwarded-Encrypted: i=1; AHgh+RqxfTw9CgaFnriVGJCfEiDjGIN3cBlHlyd75Kz0K5Xi77P4ofG1dgoqDUmmzYW3BJoTr89RjXiBl1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pRfvFFK7ktnIcsl3evMH1ddCe84kS0iyPX2SqYK1i1A6T7R0
	JRgAC8pvF0Zys1wWPupoXWk0sIJfa93oXdIHEADwbOlnBwaLkeNmh9e2gdYjLDP00SATU/kxPyf
	mH4W0PJYc9evMS8wk62sLvy2y0gWa4rcSf3Ch/B+dH3gWtAWpOCmmraDODct2FA==
X-Gm-Gg: AR+sD12O8zYSF1ecGTktWFlCIzWqKYILpfDa/tI55GHMiergIiaVLBWryW1N4hEpbGz
	QPC5ohI7J6bvm7xN02GwRQcShvcvO2mzGaG+fJtfux3RFK7KKzM6uW10K5X3PwokJQ8vSpGtTqA
	C/IF8wxnFFTqubVRSXFLIVWeL4WoFggXUl4HKr3wY4iU3qNtslVyXWrBxyVdT067TlzN1f+KNCg
	gA8sEMfkCnbun6YpxrEcSWt3U3ukzyl4i7CsLM06GBat79aoNEEhYaKiLTyzUuELd32XJvQW5P1
	HP91hin1VLhpgIXPB/cyfRWBVtrgsvaVnNU4U5SGSsCEgpWQgLn9m7DYbL6JXATJIxn+PFqjomK
	DKYvqpTRZAIAzAA30Zeklc2PX8y3vCTl4Z8v1a8OoJot6W9vEmcddtNwLWnGpFlRJDHdE2A==
X-Received: by 2002:a17:907:3ea0:b0:c1c:4858:c1a5 with SMTP id a640c23a62f3a-c1c50904a51mr330800966b.14.1784877647172;
        Fri, 24 Jul 2026 00:20:47 -0700 (PDT)
X-Received: by 2002:a17:907:3ea0:b0:c1c:4858:c1a5 with SMTP id a640c23a62f3a-c1c50904a51mr330799466b.14.1784877646796;
        Fri, 24 Jul 2026 00:20:46 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a7986bsm315726666b.7.2026.07.24.00.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:20:46 -0700 (PDT)
Message-ID: <f2679e058fa3904db3534a5f75d1339a4065018f.camel@redhat.com>
Subject: Re: [RFC PATCH] Documentation/rv: Explain epoll and aborted sleeps
From: Gabriele Monaco <gmonaco@redhat.com>
To: Chao Liu <chao.liu@processmission.com>, Nam Cao <namcao@linutronix.de>, 
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>
Cc: lianux.mm@gmail.com, lianux.wang@processmission.com, Shuah Khan
	 <skhan@linuxfoundation.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 24 Jul 2026 09:20:44 +0200
In-Reply-To: <20260722045706.85633-1-chao.liu@processmission.com>
References: <20260722045706.85633-1-chao.liu@processmission.com>
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

On Wed, 2026-07-22 at 12:57 +0800, Chao Liu wrote:
> The rtapp sleep monitor accepts epoll_wait() as a valid sleeping
> reason, but the prose only discusses clock_nanosleep and futexes. Add
> epoll_wait to the list of valid sleeping reasons.
>=20
> ABORT_SLEEP represents a task restoring TASK_RUNNING before entering
> the scheduler, but its meaning is not described. Explain why the
> aborted sleep attempt is valid.
>=20
> This RFC is based on Nam Cao's pending "rv: rtapp monitor update" v2
> series:
>=20
> https://lore.kernel.org/r/cover.1781852967.git.namcao@linutronix.de
>=20
> Signed-off-by: Chao Liu <chao.liu@processmission.com>
> ---

Thanks for the contribution! I have a couple of comments, we want to be
assertive in this docs: in general, let's not say something like "this is v=
alid
because the monitor thinks it's valid" but "this is valid because it is rt-=
safe
for reason X".

> =C2=A0Documentation/trace/rv/monitor_rtapp.rst | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/trace/rv/monitor_rtapp.rst
> b/Documentation/trace/rv/monitor_rtapp.rst
> index 238b59395ff5..234ed4d581ac 100644
> --- a/Documentation/trace/rv/monitor_rtapp.rst
> +++ b/Documentation/trace/rv/monitor_rtapp.rst
> @@ -67,6 +67,8 @@ thread to sleep for one of the following reasons:
> =C2=A0=C2=A0=C2=A0=C2=A0 variables as safe for real-time. As an alternati=
ve, the librtpi library
> =C2=A0=C2=A0=C2=A0=C2=A0 exists to provide a conditional variable impleme=
ntation that is correct
> for
> =C2=A0=C2=A0=C2=A0=C2=A0 real-time applications in Linux.
> +=C2=A0 - Real-time thread waiting for events using `epoll_wait`,

> + which the monitor accepts as a valid sleeping reason for real-time task=
s.

Not adding much value, try:

 which is a real-time-safe syscall for sleeping as it uses PI-aware locking=
.

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
> +entering the scheduler. In this case, the task does not actually block,


> + so the monitor treats the aborted sleep attempt as valid.

This sentence is a bit vague. Indeed an /aborted/ sleep is a valid wakeup, =
as if
the task woke up itself without even sleeping, saying "the monitor treats t=
he
attempt as valid" adds no value.

You could rephrase it to (full paragraph for clarity):

`ABORT_SLEEP` represents a task restoring its state to `TASK_RUNNING` befor=
e
entering the scheduler. In this case, the task does not actually block, so =
it is
back to runnable without any wakeup sequence unsafe for real-time.

What do you think?

Thanks,
Gabriele

