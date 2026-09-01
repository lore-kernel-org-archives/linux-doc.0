Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000DE46C820
	for <linux-doc@vger.kernel.org>; Tue,  1 Sep 2026 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248256; cv=none; b=RHcWRonQuQPzudmlCZveQURs9fTrkUtU1eMOGaQE4VEhvExmulBX+q0A396FCtomy9SmsWteV8uOSKSeerTXgaCI7LhT/EbOu2rkpGTLMid0Xp8foQqysSuhhLkVi4zORceomW6No+XWl9KXwL5yXrlMlH76iCHv+tOapd2ZIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248256; c=relaxed/simple;
	bh=CqfhTtR97gXh7eQqL6sBYYIKsG+QkBmqY1sau7tvQm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hb/xbvLcYuLoN8L/tQn77VmKI2/YKRA+GiRzMDbHFP7BPrpPNRnvQEOEUTMeXNICAGFsSuPc+PSmv3uLzEaJsEvkdehta8ngcSW/uhRPzhGG3Pp3174uIRxWmnaS53Be+zs/wdBe46zCdBEFUxkR9hCkTwVDQ/1CakT+xfkLGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAgxpPSX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SgTt7RnQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAgxpPSX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SgTt7RnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788248254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
	b=HAgxpPSXqH34QMw3OoIQWtsBfhOs2S1NddDazbnQLuEKvhucxOdpU59z4gAtcrx+radTc2
	1DOFzI/MppuqCTaZ8NJhjJVOZlYQXUW9n4zcDdv+y4Exqv/5mJztp6BxlOBj09L+5MlR1Q
	YpPaBMfYihkhuSDW9Hp5eZVT9XnhAyA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-mDIP4YJvOoKGzcDjEsB5ow-1; Tue, 01 Sept 2026 03:37:32 -0400
X-MC-Unique: mDIP4YJvOoKGzcDjEsB5ow-1
X-Mimecast-MFC-AGG-ID: mDIP4YJvOoKGzcDjEsB5ow_1788248251
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994aebe932so43223635e9.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Sep 2026 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788248251; x=1788853051; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
        b=SgTt7RnQwRo2OsKCCnMBJMz8jstWQ9goIO2NFvwi5Lz4ZC3JYMIX8Is2Z4tMBNWMpd
         EjeaWy3CEq0QEL+9l9QUEHwTDjjPSvDq/iXsaGbQVVvNajeflLc4q99EL9+nltIXNsmm
         06XmZmcU75qmFRXs0l4Xpk0gwZPNLp3dYsAR2GEWXLHiXSIlPrT7n8GpERkyWwfvMkkO
         uPw/PX/S5wUpCMSP9fdWsgQIhjHKNTg5/75JE8VnCqEDbu6i7/dIyw6v7pP21NjKtxaP
         0It4dl++Fvp0LVoJX6sqdexnr0Xjn4WNGI2hcNQB/zzDElHzR35Eixv+bdjHsPE7UpL3
         Vp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248251; x=1788853051;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
        b=Ws/Wx7BkW47hWBwqm+h/a0XxQZr+xvmU90/f/tDM2QuhlULCPZx6jw70teO88I99SZ
         ejk21jaFUHw8zJ2yzhT/JzUrDU9YdJSgejh7WZ1BpgxdMcZ1yEjtBu0KEhs/90E3q3Fw
         UGJzohHqPMgsa0mWifkjdf6PsQzU2AmKV2CT+qXVI8Z+gfcd9sw677lMxOoJ2Az/IQv1
         sfY25ma+kEei1E+6CBgj7paR31foK9X19yoTA1mgEfyQ4WrC0/sEFUdCl52wBGHPYTrT
         7v+Vj11bJqimfvUzscr8fvRvbLeyxdtor5bF8zFkGOtcxQVtzBfTiitagoHu40e0XnMx
         mBiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1qnOiQSgdtdSCoUhYsnuTZPTQ5HtGLkiV8LF1sQnhP8MAMbN3jVrAt5TyHe6ek0ss5TrVt5XOVbs=@vger.kernel.org
X-Gm-Message-State: AFuF++ndyYGSjbuhR/4TVqJT/QVrxmv4RbscbqZz6xE6NqGXL/zlc299
	s3H1h0iKPDR4+6kAfP6UAFNRxHtMaeUR8Cf3rvn2E6ngb+vNcgtWxpEFJgB9EE+q+VtQcpklO7c
	Qz+Xs7wlmpVtht+DNJE/o4GAe8S2Bqmf4mEEaPenPFNqdj+EbCb2TTHsYOgkPSg==
X-Gm-Gg: AR+sD101k4GFsGxVsSd9SMNNX7NNXIMR3ZBaR7oVFNr0skHxhaWaNuHg2uge88cVjPw
	sAPHWIvsSaOErJRIhKpsTfRjdk3KlArnMJ9na4EUq1Hf6oFF0zJaBrLpqPzoAh912t7ZxHFVHSS
	ob3lCA1LDaTGocq7zMm+ZMDtZ8oqWGfqIKQTGv8HWsoivORvC18jd94Y9WlvUg+p4YFWp9X2xxg
	jf3x6UtWHVh/4RYxPEQ7tDX+Ivcc18HczcIhgdT9ccu4ifS+w65vlI/qt4bYJzG8n3SRrFwSlOS
	voeH3VPPhVDeqDc6uEkAA0gvX79CGM4ykpAYqHY1B6n80jLq0ElF0jgrPYRHR4NQJETJ1T4uRUb
	KyIx3ldsQpYN42BcbstQKezmkqBA2KQ==
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr101959665e9.10.1788248251552;
        Tue, 01 Sep 2026 00:37:31 -0700 (PDT)
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr101958885e9.10.1788248251168;
        Tue, 01 Sep 2026 00:37:31 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm286144315e9.0.2026.09.01.00.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:37:30 -0700 (PDT)
Message-ID: <0b0b115713a6d5a10d719085284dc7cef21ed892.camel@redhat.com>
Subject: Re: [RFC 1/3] rv: add per-edge dwell-time statistics primitive
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jan Kiszka	
 <jan.kiszka@siemens.com>, Philippe Gerum <rpm@xenomai.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Sep 2026 09:37:28 +0200
In-Reply-To: <20260827072400.45734-2-tobias.schaffner@siemens.com>
References: <20260827072400.45734-1-tobias.schaffner@siemens.com>
	 <20260827072400.45734-2-tobias.schaffner@siemens.com>
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

On Thu, 2026-08-27 at 09:23 +0200, Tobias Schaffner wrote:
> +	while (dwell_ns > (u64)max) {
> +		s64 prev =3D local64_cmpxchg(&s->max_ns, max, dwell_ns);
> +
> +		if (prev =3D=3D max)
> +			break;
> +		max =3D prev;
> +	}

try_cmpxchg() functions produce arguably cleaner code, would you mind doing=
:

  while (dwell_ns > (u64)max) {
      if (local64_try_cmpxchg(&s->max_ns, &max, dwell_ns))
          break;
  }

Also, although issues are practically impossible, I'd avoid an unbound loop=
 in
hot paths, you could go up to MAX_DA_RETRY_RACING_EVENTS (already existing =
in
da_monitor) and put some warning in case you reach the maximum amount of
retries.

Thanks,
Gabriele

