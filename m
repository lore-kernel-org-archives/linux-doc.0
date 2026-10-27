Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793137573;
	b=ArO42rJwMmoZEeVBUEmMfQ11WmSWlGTkDwek5WGwKEgh3kUzM5BLdTsJEPk/73r7v0d6
	 sZnqY1n8ZVJvuOJ+zac/5AiuT1x24jcO1RQQomdWMb2kfHr9eUc6G++4Ah1wuvl6nw14B
	 WxV96T/ML1xkKoEXaRpbtjS4oFwhbriBhbZ/qS2hpM2bBjCxAR+3sXaA+4EVlITI1bxxk
	 WGgNGGUOTfeLF08PIbUpdwGIVLq6+d9HS0sCOF23ihu80bIrBtAzSkjnywB8pQ1/inPYE
	 F8T+23mx+0fYijdrL2KK65Eqn4uoE1b4qmGm1vHWFOCLySEDebECtGvqNXdGKchetFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
	b=DFIxicFgS2ZTLpYDvSb4XpgYtWwAhdq2t4Vk9FfpPnHnfcsdki7JkIy/rxGSdBcV5SQi
	 2wMCK2ez2MwPe9qgXghZHHzKop1FuyGSP42ri4nC/dm5yoW7P5wfShgTHV61kODQwEY4G
	 33dQKsSuGSQHs2OopD4+FCVLWBpXlycyesbZplz4W8DNNGNfK/QrZVJy5gW6MPEkhNmob
	 LEuOVzqC/XKf6hTjPD6zdHYLmRoaU27Xrdzzz4vJTIsg5u23Yw+BNrMOFMstlkX+yhCTL
	 QsuDl3FL3M0Vxb25kdZx70LtCBwZ125rkCD3RI5F5MtpScDMX9DVa+Ujd5R8EKfGYxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wbne8OHp;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAAE606A31F
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 21:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAAE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wbne8OHp
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso470472a12.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 14:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793137571; cv=none;
        d=google.com; s=arc-20260327;
        b=p5k9Wo1LiVWNEZT772fSGI2GIM9vQUOu2TGD5deizqXPJNaOEuU6p7cE/u/vW/LLz0
         /gFNTq0rQBATBBc8fIuPKWxP8XPnsxjZ6o7AF3/RSI7bQoeMsLE3ATxzLTp77ceGcnFU
         wRcnNmzwiVdeM0nl+bzBf0En2ozQAIwb5RzOsfAqby/8h62YlNZkgMphbNauGAYUOHfH
         pb6irJwSrXT74jAffLzIVuBuc5r8y0twoSXML38oJkloXfzzZzp5Ltkd7uT2jdifvFUR
         E2RcaieXqB0r/o2vPRbOP8RMvWDL9lOzke/RtA/CSou8+CYSZYY1VXa/OVwLvczP2ZoS
         cG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        fh=uGCiZXisuNesC5XlcjAuMDXvRKz1TTy64jR9AKqjD9o=;
        b=AX1hTy2rOD266Krc/BvWdY+QhZ57zVH8fkqOqvjPSlE9TyQcfIbu+0sswtfLoEJtfj
         Lf+AdZ4/ncPT5iOd51F3eeSlBvD/7P8FOA5D2GPtIxGZEWsKzOKeiqfSfKjaorFXctPu
         yN1cceotOqeXS5XBehYmqmW0lu4//1bBCTLznOxri1P/JohzmES1/rCZYW0oUBq8TuDs
         iFfzoF3nkHwhv0AYkNnQjUxUCgMsBu4ounBVyFQunhGtkt0wCcqoIkgH/djkWdinrn3z
         aRZNmcBdrnfcnnyPa8VmiAzPn5ZL2xr1HXY4kQixzp/yoDorIpmWsMb5BA+N7A3+kuoC
         4jxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793137571; x=1793742371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=Wbne8OHp5wFBPP5dxuR8+Kp5ZHrm8v80mBFme9V3XRymOzyPXT+ANjuS8mZtAutbOt
         ODy1sui91Ycwohd+oEsUjL53uPSBpLjWgEgWbT0Ma2aK7Hvfe3g01z4xkvRH6s2A/fGZ
         +Zbv9XzVpEdyJwXjAhRmHLJ3XY730+XSfkzgh8qi4omMFnsRCwCi2Puq9v4j/9LjCquY
         7A7TovQ1C2rR2zd4geupuZI+05Cnugg1XhJ4MHSma5JAUcS+LWaaA2qCMueEuNn/BKvO
         xSW9c+bot29ZINzBkQ0CD12vMG5F6NsY2dux4jMT3EVU1twWW7mORuqkOTF0o5JB3euK
         EGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137571; x=1793742371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=u1unJSeCRgbyALc/Gi64yidvWgTnxbbAn4yIWRzVmdw7asODK/l9qDy5Eu7HsYkfv6
         LAxLmBNpdBwN6o+u0yTqCT1X+Sk6fRJ6gmpXoBLoTomsnCOKu3zpJhvZhbhwZsFkSCvq
         NsGYUxkvuXx1wpv39jffQ/23wdBKGpEunQM3Vfmjq0kGZJ6kjzZ+rNRsDBOdJzjiJUQj
         ICT0fEB//5xKos+euO7Y7ed9qegSyYHBic/jEhpxZ2l42StCjLj36W3xZUXbKy3eTWbc
         0zeV0Xb9kyQSbtw0122uMLQys62TJgT4Kk54SNGcc65Aihsz7tSURTKzh2nUlLr4yu13
         jFpw==
X-Forwarded-Encrypted: i=1; AKwUvBy4Z4spFSgnuEw/LVshpRRfeFtS48MhPoPDzv4qB3D8usBIMEPlG9Sg46vctRfee4K7PXHghUkLncw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0JkHaMr3JtLPFmjmrfVyBqvzLlDMxrqCFTFs6apnTftBh1wPo
	g5Ejx/gw4d0OQXkyqY0n9XaZ69qHwgRDtSX0bWa7u6mE0Ht4oCod1s5A7JqVNw2cLJmturS5BJA
	jHN3m1CeLeSFuFlPCztGacgNpvlVOOOQ5FWXLesBb
X-Gm-Gg: AYBFou0Q8BONMXWVQbCb0pDolk18k6/Xkaby7/gTfbK0Cm1a4lq8v/ovsxtOLnbtaeT
	o5M4Hz5hd5MkbC/ISxXneLmMXiBmdVHzzg+LBxrg9A4L5ekt75MWKT1BOFXVoSzk+USpCcQpO2c
	jw6Eaq6BAa6UifofZ/1/g1jU/XBjHRrqEDh58HR7VpBJ/g+EbNwNqGcg/7/5d2k1Qtdq5Y9l31+
	cT6r12Bz0BuoTib7jtZ0g/2IPnLubi6pHpMG+01xViLETCdd7LrLWXUTAVJWNwRzqkclBRQuMIk
	VITSgGWl5b1KpwIbPSWoYF4488Ow3r+v4HWVPEKggMvp8yX6o3N5ryUHCMPwHg+Ne0zUBtGJ/ne
	BJJ3r9j163SkvrUdlhEwT+wQEoYDZZZD8NUQ1LFRK0E5qdnk0Ipi6bXMUZPlFyY0el3Y=
X-Received: by 2002:a17:906:794a:b0:c36:7579:fe6d with SMTP id
 a640c23a62f3a-c49bdf3769bmr41163366b.11.1793137570881; Tue, 27 Oct 2026
 14:46:10 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-12-wusamuel@google.com> <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
In-Reply-To: <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:45:59 -0700
X-Gm-Features: AclHuK8QaCDsAbnjPaGufNN4kMFz5cqAaOc_WFmJQjgBqVdaEIaSp_a56eCEZoc
Message-ID: <CAG2KctpuWLxdxB+LzrBO8eGsL2E0m_DphcG4cauB0cHuEDEoRw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:

[...]

> Would it work to fall back to libbpf_kallsyms_parse() for typeless extern=
s
> that are still unresolved after the ioctl pass?  That only costs extra ti=
me
> when a symbol is actually missing.  Alternatively, the kernel query could
> match the .llvm. suffix for data symbols.  I did not find a fix for this =
in
> the rest of the series.

Yes, for strong externs. In v3, if a strong extern returns -ENOENT,
I'll fallback to /proc/kallsyms to scanning .llvm.<hash> suffix,
keeping the same semantics as before.

Weak misses must default to zero without falling back to a scan.
Otherwise, all objects marked __weak would pay the full /proc/kallsyms
scanning cost. This is a slight semantic change, as a weak symbol with
a ThinLTO-renamed static now resolves to zero. However, this is the
behavior of the light skeleton (gen_loader.c), so perhaps it's
acceptable. I'll note this in the v3 commit message.

[...]

> Should the fallback cover any error other than -EADDRNOTAVAIL (and other
> real lookup errors), or at least -EACCES as well, with a pr_warn() for th=
e
> errors that are not handled?

I'll update v3 to log pr_warn() and return on open() failure or lookup
errors. And then I think I should reset partial state and fall back to
/proc/kallsyms on ENOTTY, EPERM, EACCES, and EOPNOTSUPP.
