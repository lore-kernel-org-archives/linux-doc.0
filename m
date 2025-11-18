Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD768284898
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492201; cv=none; b=EfyBV2Dm7exNxnJU7Vbc8UqCMeCSSS5HRIo8/1f6w2dhuJH+nelff86kpzotnfpLhADRD/ITxd5g78TXYiXXtCsc9LrcOMVDUVvWS9p57jPoRE1F48gdX1bPmH9ghzZs5NC1LahOxMYgm3NEAlI1va8qdOXS1Q8PT4kw6L/PKsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492201; c=relaxed/simple;
	bh=/6mugj1ODPkBaYn733+xAcFs0BvD1UbpGR3NFy/rsFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEyJsc0IKa1gYUgi9hSb7h3pco6fjZziXARQ7c3MYdO37djRPEbq+LLExd3JipX7L/BTwosrSNhJ78VNFUySomRmZHJd3hWEWnKOy8XGXrDAuwexCGHWZGXkWGPs8ZHuCbfvvOS5V9aOkE1J7+7U5YBxiqu0RuqHEUAInu3qyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=CrVn3Dt9; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CrVn3Dt9"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso10273346a12.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 10:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763492197; x=1764096997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWpkfHNeylofE0Z6h0WbHIO4zlaztsQ0FoG6F0S+GrU=;
        b=CrVn3Dt9FrLGgyXT66OGLjBSSCiXvZgEGByE7VEQHcXPCTxnCpa6y2/ZyUAmWCBwLu
         fj/Ov0PIgxDRJdN1ITHc6cnyVpk4GtLX3aQozo045IuFeH+VMcBPLOTEz3o2alTEc9u4
         VD9vyfxZYZgcVQnd4AdaZge6iPvCsvINgxW3CiW42jnhFeHgAsLyFiaxgOWLFLfBmW/t
         2QfrH/ea8DABTKDByzngKcHZZZ/65Nw3vAnsrOEE4IPm32uaKclXpg3nHYaibk1TQoLd
         u/67k/TDvxGibDzfRN6wFOUCf44ZXBx5LxCtH0Cm+SlMfg5+6L7Zj7Qz386u3FDRpQ9j
         6RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763492197; x=1764096997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWpkfHNeylofE0Z6h0WbHIO4zlaztsQ0FoG6F0S+GrU=;
        b=bZVOQjW36fTUsoX9MBksoaCWY3PNHB23k1X8F+rds1+eyL2ZQlVScyd8DIZfm92qP5
         xLM5UgGpf0tiBDvdpN0ylguIqGGR5+SnSOi7eUgu4+ZYSpwU0O7LCZjW0JsnZ3aHdMPf
         3En0yTcNtpTfc9stw5HCke4YqJqav+H9dIPElSbyXuFucTP25wB4KiXsP09UkHV3mhTD
         1O+vTusJnOor44VYYp7bUkIH7IuPfrfkwW3PuzyX+q9LmoG9byOTNll+PKb8P5Scp8f6
         MJ4My4mrFEN82OhzcB50upSiv30FWFMq6qjc3xITG8SFQmJyQUHFLwG4OhQJOmtKNZVx
         PnAg==
X-Forwarded-Encrypted: i=1; AJvYcCVCWCrYF9a/SsHcsFal5/NQiLxEyKgS4nK1r0fMEs+ki5zXCqZ+MaoAaummxIrJc2x9tLjtqaXI6zM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSrXIukDgLMY+zUvUayqyjj9gkSverjofo2xUfHjqK2WRZvXio
	VtsSukCdpUW1d2F6UQwcto5/IcVAewnWsOkZasVJMSt4MZQYCNLK54ayp0PmFKUz2WLPukduVuR
	8AkRtZn7Z3fCyj3keyMCYgmcc8ZijlhvNOxNdDDH6FA==
X-Gm-Gg: ASbGncsttOaXfCdC3ODDSwLrCL/vxw9Oj74o5sbPEE2HNn2IOJjrCTRm+wIpZSkteMQ
	7QQnDmyoLpik0JDschyTgpKBd7EJogHEYUi6harsBTEEuR1fbEyS2SbcNaXSMIx77ZeGk8bvX0K
	d5Gjoj6dr/sQBtUJoWz1m4jbZ4Pt+vcp5GClVc7b2FXkv/3o0o54Dd5CDhu9ctEGEf6r0pG83Z1
	oMY+o0kHkcgjMQ41ewl13CwEChAs7VoZOUo/+VSTh1JfjoCI7rgmGSO84I+HkXIIlEn
X-Google-Smtp-Source: AGHT+IGgDybvpAfSTAM0QVtXWFCd8Zz0wmhZ1cAG/e31tljPdau5VCVWsoT0ybcXYQwiPkOov7XlapMJ2f8EsH3dOmU=
X-Received: by 2002:a05:6402:26c2:b0:643:e03:daed with SMTP id
 4fb4d7f45d1cf-64350e047b2mr14705623a12.1.1763492196993; Tue, 18 Nov 2025
 10:56:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-21-pasha.tatashin@soleen.com> <aRsDb-4bXFQ9Zmtu@kernel.org>
 <CA+CK2bCfPeY558f499JHKN7aekDzsxQkZJ9Uz4e+saR0qtXyfg@mail.gmail.com> <aRxY53gBbeH-6L0Y@kernel.org>
In-Reply-To: <aRxY53gBbeH-6L0Y@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 18 Nov 2025 13:56:00 -0500
X-Gm-Features: AWmQ_bmbYhd-e9mYzXSDDQXbPDAXR6c91g_2UNYAnLwXIGaKe1n58qU41N1HZlE
Message-ID: <CA+CK2bAc2p=_BJ=P-GJ5tNcxSHLckZP5iv+4bV0zrS-RVLH3Fg@mail.gmail.com>
Subject: Re: [PATCH v6 20/20] tests/liveupdate: Add in-kernel liveupdate test
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 6:31=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, Nov 17, 2025 at 02:00:15PM -0500, Pasha Tatashin wrote:
> > > >  #endif /* _LINUX_LIVEUPDATE_ABI_LUO_H */
> > > > diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_f=
ile.c
> > > > index df337c9c4f21..9a531096bdb5 100644
> > > > --- a/kernel/liveupdate/luo_file.c
> > > > +++ b/kernel/liveupdate/luo_file.c
> > > > @@ -834,6 +834,8 @@ int liveupdate_register_file_handler(struct liv=
eupdate_file_handler *fh)
> > > >       INIT_LIST_HEAD(&fh->flb_list);
> > > >       list_add_tail(&fh->list, &luo_file_handler_list);
> > > >
> > > > +     liveupdate_test_register(fh);
> > > > +
> > >
> > > Why this cannot be called from the test?
> >
> > Because test does not have access to all file_handlers that are being
> > registered with LUO.
>
> Unless I'm missing something, an FLB users registers a file handlers and
> let's LUO know that it will need FLB. Why the test can't do the same?

The test needs to attach to every registered file handler because we
want to ensure that FLB scales and works correctly with any file
handler. For this in-kernel test, there is no need to create our own
file type or to drive it from userspace (where a user would create a
file of that type, preserve it with LUO, so FLB can be allocated and
checked. This in-kernel test is self-sufficient.

> > Pasha
>
> --
> Sincerely yours,
> Mike.
