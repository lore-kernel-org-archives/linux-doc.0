Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51504346FB9
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052966; cv=none; b=tJ0U8AdIETOX/HjHiYOkSzgF7gjdij23kAid0BmvJ2+95OBEZLsFdpi+LsnJU2xZ1w3UGjH1bbdYpg5ZlpGUpC9INr8I60x8HLFduk14AoUCnzcAxwSW/1KEv9H5g9v7tf5O0jdnd1jiKZ4WfQgsPtW5VkApK/C9+fuu/s9B6rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052966; c=relaxed/simple;
	bh=uGvdD/ipW2kG9og5miefSvlr2P5i5Da/ls3E4y5uIkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZbnNMkKudAULSNspUjmUit9MvfxoknpGRcCDdEjDCvPUKK4w7WisKZob95PTB4f5ObCFni+shZxcW+eyPdmWNMWWhOwKlmQfty+SpIHASGURQ8BKBc4ZqYOh9M7NBpohae7yzZkCrxHJtlHz5GFTqHIWRpsxiqiPlWO/W9bWmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=X/PfIDSm; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="X/PfIDSm"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso1906590a12.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763052963; x=1763657763; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMCY5fmkZI76R3Lm7+dKka7numEpthvdX92HaVpx2Bo=;
        b=X/PfIDSmlOuIwMaKIQHVjSQJmPr5vBQyMIQCtP61fnu5WYT7WNBO+FJPzn6TNkn6uq
         Q9yuT/+NHua0KBDuwK1NBnMY00fqlSqm1thohn3JCm75hBpwylQrnO99vvH2i25W+hMS
         DuVxU37YhvLqGNsdbFQEwom8kkQnjZr0TecqNrdo28yMiPzX92JCMpXUG2hCzGpi4jBI
         V3WtpnmqYezqPxfDzSuLJMngcN55M1VT1Bq/qDqm4W3utBHY82/6CIPE+ASD/tEg6Ngu
         m/xeiJyw1kmhdnPP5KUALuPex+RTsLmYuJAmt1Fl6ZWh34yuoeryUvu54kGkTSQw1Sry
         GJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052963; x=1763657763;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMCY5fmkZI76R3Lm7+dKka7numEpthvdX92HaVpx2Bo=;
        b=Yt84deg3eZuvi9WiCYSjSnt61Kslzede6BdEPi9TUFJIsRGBe4moRMgNjqvnesixnz
         mnofjFjFJHn068lZBYLxG0Dvfl+/PHBgEVkooXGr/egc5sW7eNK6HyK0V3phxLQULTAx
         raT4C5Sawqn7RQ3I/QiqXjpz6jM7SK1FrRe6UU9sTCvlW2dLlin7ZpaFm6qJC7Y0reVG
         H6QRHDsa0/55pLmM11PGibcj1TdrSb0GkEMHirktWbDUOXOB6b4u4zwq9xafusolJIOz
         aS5KvtN7CEiI0MSzD4nkyEmrWAnqq46KqThaNu3ne6T5P7bep2FEvrq0Rq1QcxDF7tNC
         5Ezw==
X-Forwarded-Encrypted: i=1; AJvYcCVKKy/BXUeTxzD6bP34VwCSSmYXILLzCAjYdB7HLs5iSHx/F3lv7BAWkuVKJG+ljvW0RvwIdY+nCOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6hCL5xixOifWPq9jmUi6Pr18FkaBgl4nMawzAnKWVv8szeLL
	pv40qHeKrSmn6jjwMpTamfAe/1yEwRl74JIFk1uKJpxf7X4ukOJWg/qqK+Zxtu8ghjQuBGwhUuY
	wdmS9yxTuhOLgKNrLwIqhgy8LLva2wMWD+K+zC5kZCQ==
X-Gm-Gg: ASbGncte63zTLjEsKuTzqgb9urOWO17ofohSLXbw4/tUzqFk83qpRQJxlXQyyfrZght
	PTqrjHCkCWmxaL00uJV6Pr1yzX4TiAYhxfLCLsEZkTRet5jJ3mWwcMItCQQZ40IZfcE1IenVyb1
	EWokNOU9PtsQrrgQhadXhzqcPiLjEAe7ImLJTbCQzCZFu3VVGtEhw+OjHAydgLJIJXYND3maex1
	g99JKbLd7uwWkaCJ65Z4datpkZeYfAbw4Qf/NMXoYxWY1KfqOSnERcVJmVXdPQmQZ3X
X-Google-Smtp-Source: AGHT+IF7MT7H/N1FGVv2fGcWDDSq4G0lsAr/9izNZqOxycuQNiS8y26Pa9vU+efWnOrN6wB/Co4CNJQLTQPPNB+6gYM=
X-Received: by 2002:a05:6402:20d5:20b0:640:6650:9173 with SMTP id
 4fb4d7f45d1cf-6431a5906c4mr5014541a12.33.1763052961708; Thu, 13 Nov 2025
 08:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com> <20251107210526.257742-19-pasha.tatashin@soleen.com>
In-Reply-To: <20251107210526.257742-19-pasha.tatashin@soleen.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 13 Nov 2025 11:55:25 -0500
X-Gm-Features: AWmQ_bncXGN-eqIRVfciSwqz1sfkpOsYp0SxgOx72ZS1NRyOW1CKwiM1xe3CWB4
Message-ID: <CA+CK2bBmSD_YftJ-9w1zidLz2=a4NynnLz_gLPsScF145bu5dQ@mail.gmail.com>
Subject: Re: [PATCH v5 18/22] docs: add documentation for memfd preservation
 via LUO
To: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	pasha.tatashin@soleen.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
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

> +Limitations
> +===========
> +
> +The current implementation has the following limitations:
> +
> +Size
> +  Currently the size of the file is limited by the size of the FDT. The FDT can
> +  be at of most ``MAX_PAGE_ORDER`` order. By default this is 4 MiB with 4K
> +  pages. Each page in the file is tracked using 16 bytes. This limits the
> +  maximum size of the file to 1 GiB.

The above should be removed, as we are using KHO vmalloc that resolves
this limitation. Pratyush, I suggest for v6 let's move memfd
documnetation right into the code: memfd_luo.c and
liveupdate/abi/memfd.h, and source it from there.

Keeping documentation with the code helps reduce code/doc divergence.

Pasha
