Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F4632ED58
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763389719; cv=none; b=nLCR5lDx2VxJF5blD9lq/clGmWwmGX/LqAXVcIlXiJ3MhV8BqVkBFoZITOzgZhNCS5Uf0P0u8IXxted4mTg4wtsLpEFlxM3ZMI8oC9Zm+U07L0zo3DPQfFfhf/1XhOjv3//FE1EV6al99hJM2sX4MZK1MnaNCOrdSLlkOQmDROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763389719; c=relaxed/simple;
	bh=AMc2ILHILGpbxf7Iwmbtxzu0IeHwgu3vwmxmrbvehR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+5U/D2i70/UTISiRt44k2596KfsFkiJ9uQ0pEc/EhZgxqtF5TLABWsN7fx+xuZYnDGHPV9iv9hKJpBCAUgZVgjpDmrSrz4ZllcGcAuWdPlCikts3gAn0xK82kJFtQB+dAhTWjZP6I0zPTXeYBbcmsJVuwekdulMANzcFkk7lIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gH3qohYX; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gH3qohYX"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b735b7326e5so607670766b.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763389715; x=1763994515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQVCE/CnnGowlKqCGL6JwWMjWGkEt4E9DF7myhq90M4=;
        b=gH3qohYXE4nIIduaKocyNkDSMBKDGdCkktTQvcw+xHdSUGksf9O7S6XGkyMEf//xAB
         LkPUhK/ky2QYWCafHzVuZLZYaon1B8+4IU1W9seqiT7X7R464Zi4DvgOPG3ecY32FOsi
         w3gRvFA/PckwXM9JpIcfbqczID4xkFKuqcof3B+AhvL+C26n3/7QoyAGES38XpC7v7Kv
         gbGll5xibpqLtE2Zl+AesQ5CvBkeV0O4QYLuopFE5ubp1eB4K4e4Lh6xs1b1v7w52nms
         4PJKoa64UiLvDSBLCYwqLMG6Z0uje3G/3gGLfJv7V4PaexZcTo5WxKmgVreCecrFc1EK
         /Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763389715; x=1763994515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WQVCE/CnnGowlKqCGL6JwWMjWGkEt4E9DF7myhq90M4=;
        b=KFX0tHAVr7j2Mdrv5W1FGNPM3Us2HKoueDux3gFALn9WW6HUjoB7tLGo2PCBnlfdTj
         yrba2YnORTkj0yRW+czr9Y4DZwXeMRJBi5yV8yqMeGYETMLE18WiTRLq8H0q/pgjvojx
         QMLTRTvj07vuxhRcXdE3mtW6fjecz6uN6NIPiAoah8bd05zkKWQ4q8j+TXLy2iFHX5ys
         NZNGOVYF9oP7Mq7RlVBq+2pIGwTIF06Xc78Kzhgxn/sn+YPaUpfamQUK48hK3eLyHEmD
         e5xKtCCUQAkurI6OoA7dudqmVaQ9vu4qq0tyX3rJIsE4wX80QMmtPGJwoPvlecJ6mUbB
         oGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWiAOZ0JeIhq8r6fjpo4wCbtP3nbo45tx+fVAIdq0r9t7L8LXefNshE+zB5W7JKzyXxpHgHqi47k0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnMUTtIKzNto7W0ZwpioEHXTlC2SGoEeurm3606H7ZiKFaftcq
	4t7jNmwAdTjhpKF56VaTjISgZ7x3x46Q59FCkDjUXkW3K3GiVGliiQCtwKVW+9TtmiUms7E4cQ/
	4s/JWLW53jtJHo97YDiRXeZ/k0bQKyZwLGi3C28YF3w==
X-Gm-Gg: ASbGncvDQGwIxqxip3aHXEOWO1wLzD1cCSLmyhAhIXGkvQQNf4Ygb/D9si0DpfY5gYC
	Fp21sR+WNRmzllcN/of8MH0fBFlnYI0hQJ7JqWcyXQshcI0Le8BGqkVc9yi7B/LNWRCDO1TaUii
	F2o92IC0cCKaEr/p2Wicmv4sEuPl0HOSlilVr37BVqNoE+RrDJVXBesRT+65YzViju5KgSIwZYI
	Xy15SRcXx1BsZaKWKNBBoUpxsqNK+tLA9Q+dcfUNZGyzk5UQrbEH0usYg==
X-Google-Smtp-Source: AGHT+IHFe/sTuuiJ+53/94QiMySpnxf4UN/E970XTSsHg+BmNQprmENpJq+u5KG4abgGaMQyqcrDGuE+yfqH+ShvDHg=
X-Received: by 2002:a17:906:fe4d:b0:b72:7e7c:e848 with SMTP id
 a640c23a62f3a-b7348570745mr849235566b.17.1763389715484; Mon, 17 Nov 2025
 06:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-2-pasha.tatashin@soleen.com> <20251116185406.0fb85a3c52c16c91af1a0c80@linux-foundation.org>
In-Reply-To: <20251116185406.0fb85a3c52c16c91af1a0c80@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 09:27:58 -0500
X-Gm-Features: AWmQ_blpOVxmRUODWBmJWtPPz2QzcGqIJZJTFHJU9AtpYTtzUk5ADMkO-uE2GJ4
Message-ID: <CA+CK2bAKm_Mb0Tp3Q5X=B0ngYrrfiT_pQ5P+c0=YVCXymxkqXw@mail.gmail.com>
Subject: Re: [PATCH v6 01/20] liveupdate: luo_core: luo_ioctl: Live Update Orchestrator
To: Andrew Morton <akpm@linux-foundation.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 9:54=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sat, 15 Nov 2025 18:33:47 -0500 Pasha Tatashin <pasha.tatashin@soleen.=
com> wrote:
>
> > Introduce LUO, a mechanism intended to facilitate kernel updates while
> > keeping designated devices operational across the transition (e.g., via
> > kexec).
>
> Thanks, I updated mm.git's mm-unstable branch to this version.  I
> expect at least one more version as a result of feedback for this v6.

Thank you Andrew! I plan to address all comments and send a v7 in
about a week. The comments/changes so far are minor, so I hope to land
this during the next merging window

>
> I wasn't able to reproduce Stephen's build error
> (https://lkml.kernel.org/r/20251117093614.1490d048@canb.auug.org.au)
> with this series.

That build error was fixed with the KHO fix-up patch back on Friday.

>
