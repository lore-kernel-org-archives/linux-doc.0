Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B04838C2B0
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991836; cv=pass; b=eEm6yV1jpIscm+/xlm/TbzURPj046uo5YF4wb3B6GftETP8+JaN/yEERL+70U1Mh5WcRKteSgJakFa34wOO8Rx2UxrLazOM+UtixyNiZPsYg9fap9hNyv9NB9Fe943Fw4LCZ8O/NUxG22IfSXL4yluWIEzJVhOQj35l3B5yo6eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991836; c=relaxed/simple;
	bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ5u+2NxCgZGrMbL2E/Uny8NpLSlpAezE8AjCmDvnEGMNV7zoVBA6ziwfTzW23sQ5NKkgiaE2zsLRCgaIREKqIwq1pqieFKWtU1ASYmgiiImrnVByurYjx5LBpwkxivLYt/YixBOWyom5E8yENgON6GswWv50XMkXbKVwRmJAIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6ZAo7wI; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6ZAo7wI"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c750eaf4cso401036c88.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 07:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777991834; cv=none;
        d=google.com; s=arc-20240605;
        b=CkjtdadJ6xTFDiUp+75KsxxiCNEfyKgvaPYN6t0Uu8yusJGIGn8N+rP7vsJEKw8MQ9
         w2tTwPDgBVUQZO23+O4c60uhEblhwdOOxTDkB7opHBnvJYvAMToT5O/OK5++8vjZZVwy
         6eYlYqHAFsUTUmG1lq/5GaZXBqY6N9csz+nGzTjtGsND4MtoK7XdK3SYIliwHq2VaCAe
         yFwKlTe5KqBZn9j9gvzZfsr0TT8CxJJhcj56+kdK1Pt/yMTM2o8dD5XxM/jrC7toQbuf
         Bbm3TpXK2pLM7yW8VWO7z1Nm21xC5a/bEuP9sw2tQoLHUjtGWrHNi20RnYYzW/E7YGDX
         7ziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
        fh=vfmgKWhMs8CLRqoiAJyACb4UIa5ClXBHfoxGO54X5aw=;
        b=LJyrgR0PbTelByyG7IwahPAO9ohu0+kp971RlBTVMjrXb8tVgRFGF3tqFbVDPA5MBl
         bV5GWU6cfFKTI3PrAuF7QNiMukMn6kppcMHQxrdBh2f1cGPFw2r81NyWsZ7czjYiilvp
         h/PpEELhNwV+hQXQoME8lHOUTntKoVlAk/7wVh23dsV+AuqDCEmNwQCg32xHVRlKcb8t
         MW6iVbyisVUqSzeUHkWzHP1Ihnhcm38bmkXIFUzHHzr4i2QTcq7UlxBzjw40leEKxa5C
         s1MyfBGozBHdE+DxJkR3pK7yxFZdLOrrF7XTcgTaYMXOrDHcgO+z9E0BdcHkfUYyvneI
         Qddg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777991834; x=1778596634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
        b=b6ZAo7wI+YWlFSfmV94de0j+syISdOgZa2mm2ZuDQZvS72skP0z9+CqIeauoD4LvWb
         jWcwUngEaDNUgSjpfxpKkI717k2wfz9YgapahmADHqMm0yAMI9I3qMOj84KCioKorid4
         o4/FQb2l7aJjrsV6FDiEzj6BfztHgg6SK8GbtdOGDhl9BsGIW5UtSmhdBV6yYFvX5+6v
         d2P3LuDd+qsMp0ZUKgPNrNe5wS1eppoxhh6k5qdZLmwAoRfC21++LDQctxyq00wTqyI9
         EClq4OLHQ+Vv7BwbN8oYhmxqqkfyur+GZOMLl28hg6Z9cPk640zlBBgzsGrvy5oTxNsq
         Q0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991834; x=1778596634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
        b=J0dEo68Jp4cJxNRH7Hy3q25IbG0CtrHkD+6F+nmAhxDf0hC/iRWIxBRxnlay+bA006
         krp++9Na3JloqcOJJnFIZm9NeLwPVbPP6nBr4va3CMqHDRRDPEUGcbQNnKAXPAlmD2Gm
         O2sgGuMirGynq91tzkjOwymvJXTOUvjZ6ztyhAUjgcFIEGfJQ5ulOYrsTcPRzBikdhYw
         szgXgivrSmQljjB81LiJtSUwfAJZWV5j8NIRBuSL9ZipAgM7jSObx442kqmfciElTFZ6
         LgZd34cZHVBbs4xMCwVY6RRQftx6ySrCb8g+CechttsPuNZUIpNXln8Y/ONkfN3tkagv
         sdSg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZzkBVsm6oaaQjVLH5MrlDXMazzCvrP6HYZDFP4S7AFY8DEiNOg5ILbx8rC345BTj6dQG64T9r2fM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DHV1djLqe1j98a+BfNzRU7DLW4zXsne6DRxwV6tV2YQ+dx9c
	TkRnK+DnkJmwBGKZTjCmSdMlUNCs3far8o5TNuJQDb3+RFiIRzYoEGR0OSE+SPo4kCtARRhX9c9
	Ev1fL/GAqYNwnpSyH19ws5QiK8X6phTo=
X-Gm-Gg: AeBDieufCAeEPMZYFjVzpjCE8VzyYFCTFg8JWspjb+ulUzaADfv1L2KsoK7XlDP4Cm9
	LRSVikMom69Y8Vx999q3xYpOl0yejAw1ycuTXPUtA7DIeIYZMT5d///1mhDiJc9Sx79DFRnR2Xf
	Gmh/e85LcqbcIhkh7D4Q1fJ+z6RC+l8U0UgnBQSzjsbyorREwHutAU5dwbLX/SYdpxYQckqzjcp
	8yrO6ZSb2AEAs8DsseyZv7p8/FeCCxGSbAtJEVfygFoah8J8IFa8vtdaup7lgTuQZRkTbVCoH3z
	lQJAbtlkXtr9+6eloD/DDaQ6GzHuNX7f+WwLgZp356py85Q2h1j9wwbwz6Tz05KmX/3MkYaCoUn
	8Nx0jQ3gRo7vhVpCPFVjd3rjGt4QcJkTSuQ==
X-Received: by 2002:a05:7301:e25:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2efba5b4911mr3081382eec.8.1777991834024; Tue, 05 May 2026
 07:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
 <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
 <20260504222637.176edc7c@foz.lan> <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
 <20260505020831.698650ec@foz.lan> <CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com>
 <20260505074534.5fefbed0@foz.lan>
In-Reply-To: <20260505074534.5fefbed0@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 16:37:00 +0200
X-Gm-Features: AVHnY4KFg-nA5FI-3PEmoPQaEhP2bML65wk5bkvVgUZ5mMQRL_JGieGpQ42SIY4
Message-ID: <CANiq72n3CJXK3wcze0Ee71knG5U9RGruwO59Z_vS=tpW6=+XyA@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 7:45=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> No, this won't work. See sphinx-build help:

That doesn't sound like a fundamental issue, i.e. we could work around
it. Anyway, it is not something we desperately need :)

Thanks!

Cheers,
Miguel
