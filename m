Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C1C313E0C
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822520; cv=none; b=AemaaR8s25fmh3t/lVmIzSj1n1o78lJ6guk0S76GRqjvYET8PB6i6yQcQkSl4WBGjBziyF/w5kBxAtjy3mXVpdtgdybwhjSKpl7Rj/uOsdmW+9y0tuBQ1e0a5C6nF2chxS0QZ0Ws8+DIWVnqmPb1h48nGkUqYnGBbhGWPEclTnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822520; c=relaxed/simple;
	bh=wcMNmsz8MIooQoKQs33DRCmEYgTeBEbRNqSTQQHd1c4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D9x4vC/7s58IzjZjjPnHEWd3brKA3xyVjet7S5aE80LgZ0i1fdEcwTs0olNThkmc8T2/a6yJ6TmY0s6/FyfdYSMfVWdkv0rxi4WLAKqDanWHPsYlyDhYwoVVAI0HtGnVjIRCCkEU9d7bwkTQAS9qRlpT8GV+biBRpsbQpGEOGZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LQaeYGBw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pjqVA5JI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LQaeYGBw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pjqVA5JI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768822515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wcMNmsz8MIooQoKQs33DRCmEYgTeBEbRNqSTQQHd1c4=;
	b=LQaeYGBwr0Qg1jg93Ur7MbwQz9+POgYfcFqpZLt+hCO1yyGyvqc9kDVJ7iRvorluIWEDfb
	S/k2i1bz4qOAB7wmRf7AO/diHTclJDGQwHyuC5k+j4Xia7sTxrmORGn+d8E/ltv/RX5diY
	4rwnOrDoN6Bf9o7azohFLj5ZlagV+KA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-CUhufE-NPQK2Amx5ZmzsYA-1; Mon, 19 Jan 2026 06:35:14 -0500
X-MC-Unique: CUhufE-NPQK2Amx5ZmzsYA-1
X-Mimecast-MFC-AGG-ID: CUhufE-NPQK2Amx5ZmzsYA_1768822513
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430fcfe4494so4383748f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 03:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768822513; x=1769427313; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wcMNmsz8MIooQoKQs33DRCmEYgTeBEbRNqSTQQHd1c4=;
        b=pjqVA5JI0N41e0TaGjasxwxOCds0litU3m3wWiMHjUlDA6suc9DZY+k2hKUeTzSeva
         Tla7hGvQ6ulPZn23idiDZrQSbH4gHuZf+dLbyXN6RNlMxWMga3Uyq/J2712LuiScjNkL
         h7Zdk56w117u3HloHVxeuOA4wwk1uD9dTNgEAlv3oZGJd8lN4Eh5/BkUsExXAfaVpx6b
         CWM2UCk4Vmyn9EIXrZztyPrVVtFFpPy6u4sMiDb3it046tPqkgipx8q3g38PBn3pyyJG
         Jm+IyTahVn1tlQ7aNPA3VhlQsyt3ikcX3ucQkOUVJWsVtGjjMsSuAac+hUNruxpb3tyX
         UkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822513; x=1769427313;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcMNmsz8MIooQoKQs33DRCmEYgTeBEbRNqSTQQHd1c4=;
        b=MvqNlSF/KQ7QtF6EnY/Q+kapFxYRu/TVUgcL4jILBZXscsDE1DQyCLl0UJfvCOSbmU
         UcSHeyhm+kU2V1ofT92lz7ktx1G4zem4n/JovOQddgaMgcXePr6m4F4jqyFy6NTjtpoJ
         ofe25xmoNeoeOPsLTw/qX5s+OC+dQqaL4ubVLDR+WWBko6YSqDSxHhVQ6/+5zNgW/5kW
         QMQd2HUWqX+3K8iYSMem5Gaqh891S/RiXqmarW9qcm358enjZFbTlPjoQ43Sfm0KtgSd
         2nGZSt5F5GE2061YrT2EvG1ApjLPPPNTXHwK0lWfaGDsk770dcyXDZnr3Ss7mPtbFnV0
         Q9VA==
X-Forwarded-Encrypted: i=1; AJvYcCW91SvhznjIOKTNLrAvm4tfKegw/SsD/aT2xzppAGdG6i/PPMa+13AL6YTnKRapQTaGnt/0vDrnybs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaztixWK39PuYf4qLIPtmfHLLPMIPEEXwdOqsthTqiErkCk9fh
	SttGH5j52fP4txOlcjFxKVWIVY7VjUQt1UTeN9EC8C4ZrBHsxrRt1j/nPl1ckzENSYDEg2xW/ji
	k/sX9RvjUiAO0edRb2+Nh1msZjofPkTJy3IdWBsiIdM+C20HSebF0V0Jc8jY3Cw==
X-Gm-Gg: AZuq6aLBOOpvO2M/eP1HSPd4Hl7aDkuO72m05iClIbxW24QetBlSRJpBnLXTlZpkC81
	vaxq57rGRWL/3l3HH49mP489dETEe9lA1qOPYK9+08ee/b3r3TNiMSreoRQmQIwYTzYr/S3vJn+
	mSN7dnteHcHntXRrJtKu0yAHXXD1VidgsPSTmg9FQc5G4TdKXsOZX3ypS4jQVxHbCwTbA9xxe1B
	2BDG0e/8NoXnzM6COTzcmB9AUTWoBBHaSBM+S00ewbios4rX+Y39xk05VP9/IDfdCBUB6u0JGCt
	4xc7MKr4kAJEeJnZF8dLc0kwMlgNFxUlGy/wa6cwL4ZAXcuqX9dZ/WjFhBXK4q0o1aP66aMlkgY
	djOniV36bgHqQXKYnPr8DNYicwYbvrYZZSOwl753vDzo3wQiJBjuYazK4yOspy23fglrhATm2H2
	8YjLzv+gae
X-Received: by 2002:a05:6000:2f8a:b0:431:701:4a2a with SMTP id ffacd0b85a97d-4356a089804mr11261072f8f.59.1768822513303;
        Mon, 19 Jan 2026 03:35:13 -0800 (PST)
X-Received: by 2002:a05:6000:2f8a:b0:431:701:4a2a with SMTP id ffacd0b85a97d-4356a089804mr11261032f8f.59.1768822512887;
        Mon, 19 Jan 2026 03:35:12 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (185-132-178-103.hosted-by-worldstream.net. [185.132.178.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb0bsm22352413f8f.34.2026.01.19.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:35:12 -0800 (PST)
Message-ID: <5df16facba05b84857ad09cee12df0c19a551285.camel@redhat.com>
Subject: Re: [PATCH v4 14/15] rv: Add deadline monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Nam
 Cao	 <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Peter
 Zijlstra	 <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Clark
 Williams	 <williams@redhat.com>, John Kacur <jkacur@redhat.com>
Date: Mon, 19 Jan 2026 12:35:10 +0100
In-Reply-To: <aW4PvcDxBJnDLJFq@jlelli-thinkpadt14gen4.remote.csb>
References: <20260116123911.130300-1-gmonaco@redhat.com>
	 <20260116123911.130300-15-gmonaco@redhat.com>
	 <aW4PvcDxBJnDLJFq@jlelli-thinkpadt14gen4.remote.csb>
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
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-19 at 12:04 +0100, Juri Lelli wrote:
> Why use pi_of() in above cases?
>=20
> For the first, in case the macro is called while the task is actually
> boosted, we then might continue to use that even after such task gets
> deboosted?

Mmh, yeah thinking about it again it doesn't make much sense considering we=
 are
not tracking when a task is deboosted, unless that always corresponds to a
replenish. Thought that doesn't seem the case..

> For the second, current PI implementation (even if admittedly not ideal)
> uses donor's static dl_runtime to replenish boosted task runtime, but
> then accounting is performed again the task dynamic runtime, not the
> donor's (this all will hopefully change soon with proxy exec..)?

At this point I should probably just ignore the pi_of() right?
I'm assuming the original (non-boosted) parameters are more conservative an=
yway
so it shouldn't be a problem for the model.

Thanks,
Gabriele

