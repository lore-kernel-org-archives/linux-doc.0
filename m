Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEAE2989B5
	for <linux-doc@vger.kernel.org>; Tue,  5 Aug 2025 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754418288; cv=none; b=k9WiGIWXcaPpqqv2LsmfYyL7Ht5GRhIqTc9ioTHdZxyi7wGYC/yuqthYBJolTFIE/QWnHw96aYOcq8GVNrltfZrNJrcyeN1e3TUMVW0n66nHw/FuyEoCaMK8Ks/J97qitAHDF6PtVLeA3/GpI6zWDpbOhbMor2g/7V27Fe+920c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754418288; c=relaxed/simple;
	bh=OKVLqHIWmibana5VQZUJL0qfjT6gFJPBTJLNVk0SJRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2X+cYMJh71Z524ueOtABpvY0+uxSAz5qsZOPBvRMzewpssKYnuoYumIfkGL7Qr0pEBwdXeJtDYf9tw1C3Tj9wGvSAIZ921wo2ExHlNxsK8Pn73kflNswgwJ1xFsif0+ppPEYEm8+cpqbMYtUEpR1SNz5Wt4s/8aFbZw8K6AUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=cxi2QUyk; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cxi2QUyk"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b06d162789so25664361cf.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Aug 2025 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754418284; x=1755023084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OKVLqHIWmibana5VQZUJL0qfjT6gFJPBTJLNVk0SJRY=;
        b=cxi2QUyki+j6r+AUnCw3RvWjcY8wIMjzkQZNYirvohpuOLbHcTqWGlWYsBGih7XRuF
         tFCgDzdFxy6+hDAK9GBcr0CwCPPSTwy13E2CkyC8rdhql8M8FQqKY38sbvSRrIlWDFTs
         B5P1qDdfnbnVgRUf1c0JV/ymlLzeeThbf8FhGhHQKpXUFUnDRTn1dRmQr1/397jWil1z
         MBOQ/FPyok5CCskwl9J7N9Lpeze7tBJCuK6DhWIjjRE0adMBmv58evpAHzHNds/ZuAbg
         BBlCMsogK6zHRFvWBP6ULOgAGU1WCvIVdFaB0EUTN0AA4I7Hq8BBai8Umt/V/3EVI60R
         GAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754418284; x=1755023084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKVLqHIWmibana5VQZUJL0qfjT6gFJPBTJLNVk0SJRY=;
        b=qaZtOjXfEMuK3DpZCF2x/kXfDnqmkPGVjjGRt7wav9k89khuM1UKCAk5EmgkUjIUqq
         dP3Lu4ZAUJWZVkmDWyMGDs6IQLNDZHWvj9Dj5Jk9rq3KxLL3OI608GIXUkV2kw59hPhZ
         7CFGxL6re7thkumhoRQFZjuZvGvFxOEK3ID/f/fetStjW2wHMUEo0d00jbV1PgXIcmFe
         zfTzGujIn7Qu9gtk/7y3wn1YezDuTuaITzCyRVawIgAhUs3FZnAXVwQ42U2mZ9SZqabA
         Jpq2UWXD5nuI5njjHOQ8Ak+Fb1iT+pEWzEQOmSnSiBePx0J5kw9zpUbyN9FvuCEtN9Vh
         MFWA==
X-Forwarded-Encrypted: i=1; AJvYcCXbXOpBl520tj7+YQ+gVc/W3GmOctNqmhBa3z8r0VcKTtKi88DfN44lyLnIuEq2VVUcpzJcBrhKN3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8EnD4Lx6njRrtM02OMSFZ/XNf1mNcrgMnQBNeumvqB7JWR7o
	r/5rPAQpuXMVjgLRAihnSwDWiRFvUayxkG5MJkcoyQBIRDTMt5L643Kwa8mfh984ihvhHB75CDI
	gpvdpjoyvFXpYnMbl+9AOeRC0EUAGI2NMI2F8dEx+Ug==
X-Gm-Gg: ASbGncssBIReT/osOm96Ay0EgClMd/2M7D8f6A53FLCLfzEwHjLVpEc4ExWU6LMRtii
	cEIm0sA7XI0ZY9208wq14doikONEuFLn5PqR4JdFTM6ZDiGxuf7+yhrawvy+InvKijqk09y+H6s
	bxPo3zV2Yos7ZWZGPwYuRWhLwi5qohAdSI7YS3zD7/QaGt7gJwWRQp+ovWSol4dMR69AFGrcKhN
	7Ak
X-Google-Smtp-Source: AGHT+IECP/Qxkxwml/cf3BCEf7Q2B4NHOjK/2NaPxdggrpfuJmAft+1jLFMG+N7JFiUAXv2wscgyaif0s26EEgdezVo=
X-Received: by 2002:a05:622a:191a:b0:4b0:86b4:251a with SMTP id
 d75a77b69052e-4b086b42b17mr42712121cf.25.1754418283817; Tue, 05 Aug 2025
 11:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
 <20250723144649.1696299-32-pasha.tatashin@soleen.com> <20250729161450.GM36037@nvidia.com>
 <877bzqkc38.ffs@tglx> <20250729222157.GT36037@nvidia.com> <20250729183548.49d6c2dc@gandalf.local.home>
 <mafs07bzqeg3x.fsf@kernel.org>
In-Reply-To: <mafs07bzqeg3x.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 5 Aug 2025 18:24:05 +0000
X-Gm-Features: Ac12FXzHvHvpYHaqyT4n7r9UBwaTJ5dSsQkeIlx-mzYjpvX_Sd5MnNPi6FTtCG4
Message-ID: <CA+CK2bA=pmEtNWc5nN2hWcepq_+8HtbH2mTP2UUgabZ8ERaROw@mail.gmail.com>
Subject: Re: [PATCH v2 31/32] libluo: introduce luoctl
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Thomas Gleixner <tglx@linutronix.de>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, parav@nvidia.com, leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> To add some context: one of the reasons to include it in the series as
> an RFC at the end was to showcase the userspace side of the API and have
> a way for people to see how it can be used. Seeing an API in action
> provides useful context for reviewing patches.
>
> I think Pasha forgot to add the RFC tags when he created v2, since it is
> only meant to be RFC right now and not proper patches.

Correct, I accidently removed RFC from memfd patches in the version. I
will include memfd preservation as RFCv1 in v3 submission.

>
> The point of moving out of tree was also brought up in the live update
> call and I agree with Jason's feedback on it. The plan is to drop it
> from the series in the next revision, and just leave a reference to it
> in the cover letter instead.

 I will drop libluo/luoctl and will add a pointer to an external repo
where they can be accessed from.

Pasha
