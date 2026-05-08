Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30AA3C1996
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233564; cv=pass; b=CdPRygMd5qstqtLQmDS/DPkctLRbc3G/ShVcchsBrTe7jhINvx60rRgHGwXsaSQGDvuT1ML8MjhalsEfenmpYGWbiWO299tZ+JEBnqwxm0jJUeFZ9zS/V2hrg7F1HWahpVbpKs/yge0i4WhJN9rPpe8n6ZdQmnx3JPThO39mNs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233564; c=relaxed/simple;
	bh=Do+CokqU7oVirDwvR3ktQHdmO25HJGaXZRspoXy+32Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/8zAm9u+fHD6nRiFfh+kUb9uA/wbdSLuVJN/AJd324uy2QP80c/8qFIk6wMVJDOjqyZJ5RYLVWTH1dmBoBI8jywTZaMVdt9biflfdTbelCjzOUWK71N2i/oBTMwpFzIjZS2p574U/Nv2y9xB63EPqXi1QB32PmpHIo3Keo7PwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+eMUg4W; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+eMUg4W"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12dc1c0b724so172878c88.1
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 02:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778233562; cv=none;
        d=google.com; s=arc-20240605;
        b=dF+jbORaW9hzvUxmLlFmfoOdGUDYR1s85G1S3S6SHQHoaO4NDaN57iFZ7LAE2nQC00
         8POdoURklqulyKbrioUhihv/NLwkr2QYOsafuvxDthxHxPUiLpN/+9SI6GoFUn/+75E/
         0ff9jTMkSBdxiyAAn118GwUaIbHzVH2xvalETn94rfl1oyaa391PG04fizgDMdI0NnO/
         P6orOGMEaPHh/q7n5kYDXkD0K2vunQJQIooSbspA2yDEaIYaIS7PhuaTDz701GWLmcFy
         1KJ+hlbIvKTLHO/XgXu40+7BFmAhhm8k5CsWnN71IFgD5qErlU+FAwAicP5GMYXw7A2O
         ucEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iqeb3B6vsv0M4PL/Tp8/XaVQQLocfXwNH2ocP2BNO3M=;
        fh=PdjSQXO0621XWUVjpj87iCMlsG3R/fSeayi84rAYAa0=;
        b=j8UJi4KXI77QSdGFF3IdvOuOz6KxhG9qb6NolQrrpnCgw8mBu4EDpj7C6marFtUle0
         KtNdPPBqxbsvssek6FPQxKwelJ5cABi2m3GK34NhjBURzWZyxf9C8zRWykj9hrSo+l4q
         /btbzehnR/wwxHsuJLCVUtr5wtiHl0PKVih/oUGB3NbOulGv1QkMu4MXqZFtDE3Bcmv0
         TJ89XmcJKX3sr6kwxlxjcjuMWhNDZ9VfaHmm5gYOAIxmfo0uBSHX/IpkvN74QiY56hwy
         NslV7axsORebTcUeC8UuPlBQ1bqkJDDzs2/sDg6kcvjfBNbJW0LI06vt2FN0ypwC0stY
         BCCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778233562; x=1778838362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iqeb3B6vsv0M4PL/Tp8/XaVQQLocfXwNH2ocP2BNO3M=;
        b=Y+eMUg4WvFddo4yZ6B0C9bdD3GZe0l31BmMtYZTrwUT0U0ZwUZyDiajPcInDuk0r9D
         yV+owDx0qrp84WJpEteus/z0aTr2870Es3DYPR6OfXQCec3cU7e4uKr1Koaj93WX7D1D
         jOJPBsvkM5Z8zi6pXhFweFRb8/FOPX1OEdwRP4XSlwx1M9DLTh1+1ZvjAzRKsXKJ5oiR
         qt1hNLvUwFSAf4LZCSEtTclGqefX6iPiv4GIrT48zhhKGszvNHzd1tCod561w6khEbcr
         m3xZU83wf3xfhnjL3IsONBACBeIG3kRRmfxVZ5j7pIdVO2c8WmC6URfNz05gYkQRTQml
         ipEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233562; x=1778838362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iqeb3B6vsv0M4PL/Tp8/XaVQQLocfXwNH2ocP2BNO3M=;
        b=nvQNBeIBiysuCeKkoaI3UK2sWQMcgmUPd8RQEyMSrsa068NjXaeD1xq+owN3HDv6mo
         5jUvbhzVEHQlxb1t9/7jroD9OLaQcEbw+HcnLmnVtLirT8E5TGN4jGddSIu8nW1/U1Lk
         L9o/GpKeYh4SGuKYgMRW4SKXLhGGMNqLlmI2qe9tYEwv6wTP7bAqVx1YWnNMdjvriqKA
         E59ZefpFiKS2tbscQ9AoNhYGANgzqK1cG8BljKDT5JIOMpY6ZQC98DZ24zqol8J8JiTm
         ZlGQolUcCfWdKvHYeiLJ9kWoijP3UIZCyGkLOPYXvHl7PLFg3KXLqskxPYu7phnp9V3T
         h0sQ==
X-Forwarded-Encrypted: i=1; AFNElJ8j/AYbbCga8itmeA0vCkfy7/WWQZlQ2F7iwXj7VFYZvGx2yHydRATAYiwIpBwEDYbfRXvTvOjpsZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKjbHTx5PF5il0T2JBpDI/8dqrk72atMduFWaPqMV5dP/2D74N
	tJESS5cUf38B04R6SEHoVH2WDuZURDTAO1fyETWPw790O17ahG7gsGhvORCTHJAnwZobaPbMG6E
	+dgoHwoszkzFYsTFX+Ylo5zcGUqYmmlA=
X-Gm-Gg: Acq92OFBPQDkDD2QNGuOlBU8wB3atBRfV0GPDL06asF5YJ/49/HOf5bJDrtMzZVX2rk
	laC07rzMtSMYn8q44N3dVF1NJbtvsYEyH/4mi1NBfTZkoxQT8uhfSAxNLL+vT3TgGzVn9T3ZHI5
	9jbwpU1e9S64pGp6n+2aLmr5xaxbdNUGNVn7fkSjtMe0NC9s0jPKq0bAtNEGprF6C9rk2mqXT+4
	Ko8CtUwYBYV05LsfxpR/JLqRKP694z1O670ncC6h3WwkfpawL9LzppWYLUdLWdyrfvVewTnrAjy
	cDABgAcAWmDX9Vvug21di/3C0SGnYgBNJjDyvOiGZlKQsSbTQQj1oxHYMJu9ZtaC44/1fVy0t/p
	CHiYxFlq6v86EZLP5TmOBe+0=
X-Received: by 2002:a05:7300:3b08:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-2f54c37e2eamr2604840eec.6.1778233561754; Fri, 08 May 2026
 02:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
 <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net> <20260506084935.1cd4b794@foz.lan>
 <CANiq72kN=2RsE0Wm_489Sc-VKO40A0uYinCj1McT=YMu=cM4aQ@mail.gmail.com> <20260508091644.420bd440@foz.lan>
In-Reply-To: <20260508091644.420bd440@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 May 2026 11:45:48 +0200
X-Gm-Features: AVHnY4KKhh7Pt3-mdebtWjweKJ1bQNmrwJr8n8fkbKGyuacXpWR9XWERelNi_jc
Message-ID: <CANiq72=8nuD_OL5d8JF3zP-jRgnBORgHMNrGhQtxy6Jg8JVNRw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init maintainer's
 profile entry
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 9:16=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Just my two cents, but all license files that are applies to the Kernel
> are already under LICENSES/ directory, and there is a document defining
> how SPDX and LICENSES should be used:
>
>         Documentation/process/license-rules.rst.

Yeah, we are aware, thank you; the files were annotated back then with
SPDX identifiers for that reason, and the links were intended to point
to the original files to show that they were indeed licensed that way.

> With regards to patch 11/11, I'll send a new version just changing
> the "P" tag without dropping the .md file.

Thanks!

Cheers,
Miguel
