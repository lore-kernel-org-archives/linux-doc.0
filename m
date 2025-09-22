Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627A281370
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758553257; cv=none; b=ZwANObMEZHjsQqIfjRlAvBE3stSt/XzZWUKwDmVXMIIJBabd2Rv9Ofl48uHDoYFBPmHIKA5vCA2zzau6VP2zbe0ohDRBBWvTEwbjIwKCEqm74ozCRV5D2za8N/bERk/JaFV4s4yqhVbhVOqsLv56oqby0cCLXwzYZFWa6yA61xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758553257; c=relaxed/simple;
	bh=kh9XvYd3EybefvfxgcE5HYVIHxtLjRtv+CBZJd9A8sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVM1Hmit82T/8hm15JkhM4GVe8HOKzIlwn8lYJIVB5g48lkpOxYgHQuFYbdYin7tKAdqYg9pdelaXqOkrsbE0CcDGyviDP7l42BgRiEfFoGDC7/7I2NONozcC02IR5AidQSUB6q7GEhp2gACP0EkbJVOuEnAIoKq2hdgzfHFKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=BN15DxHz; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="BN15DxHz"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b5f7fe502dso24250691cf.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1758553255; x=1759158055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f6Q5jc1vTYxMw5O1/g4HFLF7Ms2PoeIAA4LcbVkCRg=;
        b=BN15DxHzbcgH3jO2lx3ZL1eCb8snynPgNtQx8dzHAO+PLekKUG+Q9KEOCCMnFiDQYh
         N5mwqMCoE62l0XZqEqyjVLe3ngKNivgB84tVGyp4fxKVCEiTww47ujjzS2q6VxJWbVZJ
         YrC0HYW87Gc+GIuUIh7xPkARpETh08/IWzeEse4gI+r+x4561Q8TcRsF4srRMnZz6F4F
         PsBvAJCv1mhNof7LM0wRErHT10VivDHJRtkdioWQGQenI0/dZnuUqBU9G+6AQveQhhvN
         7sM0g4g+36M2useltsF9iAE8CD5yA/1jojShv84pTeMnD6qW1cjt5pG1a2fzFUNnoePT
         +b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758553255; x=1759158055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7f6Q5jc1vTYxMw5O1/g4HFLF7Ms2PoeIAA4LcbVkCRg=;
        b=LozI80K3eRAku4ZmudUmAqHyfVCU/OILKJqFo5kUQptWIiyzE9Oz2/vEbOsfAuaSP6
         c+3zyQwvDpIo3s8j2/CYlY/Ojpt3ZNCOx4GcD+pwzg/ncYFjEGjf+AxJEsGDuzyi8Xaf
         9jv5KLpn/dnaRZqcZOQkoetF8IrAKn9zhnHJvheqnGmRW5e9vkjvs2nLT7oM7qu8LUoQ
         iQzYOzhMOKLlHs4dRKAEPfP+GdtE4vUeXU/Hpg3rA/pBcYdiiTQNFKW/r4LgNoTRuJvm
         KrVQ//P5KWoq299a0PbhqnT5GQvqDUR334RXNU0lwEipL4xg/z99pRo/Gc2pZdI8U5Hx
         6CnA==
X-Forwarded-Encrypted: i=1; AJvYcCUF4UnFd7YPn2SOwSyUVIy31bvqk65uATNrQcBMuZYEn4bGUcx2XRWvtAs9M6PoDkY/UAKoqJAi1mM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX9sHyRRVvNs9fXAIWD2WXnyzroq+cxPodAspyNP1Hfh3xj74x
	80yPGrT1uwntVvCPtAhltTTDoAObJahQM5+xsLjmb3fXVTQKDOn/frGgqKuu8Zj5uDyagWJNZxJ
	x/3U8+EHdTg0KWhaPs0GrwGJvEyFgdTXQajvcA1IslQ==
X-Gm-Gg: ASbGncvfMJhEY9w8F0ZnpkGy3umBh/oRXgF0uAAXTkGb9zFJ2ypuHd8kjqUXuz9gyCs
	JPaAKO+Q7ZBLo0pA9SG//JNqxsOIFWIQwh0Pl1/lZzixe5CRMa+kbYXpkP4nMmsaVZJDECoJloR
	5viSC1njZPtobJGT9hobG0KyJ9sj8hMMsh4W1gHdeh3bqT6UYTLubKOKMInbqjphCrKgKjvVOah
	1zhQJmxPpBUpX8=
X-Google-Smtp-Source: AGHT+IFODvetLMEI4TglsorFs5/g17pXRnsZ1YySfP9UyB8TJrkLIBj/0y5AS2xiVpb0YAgRS6Chp+Ecl7/RH4sOKKQ=
X-Received: by 2002:a05:622a:19a7:b0:4b5:781c:8831 with SMTP id
 d75a77b69052e-4c07482541fmr145941741cf.71.1758553254248; Mon, 22 Sep 2025
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-11-pasha.tatashin@soleen.com> <20250814133151.GD802098@nvidia.com>
In-Reply-To: <20250814133151.GD802098@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 22 Sep 2025 11:00:17 -0400
X-Gm-Features: AS18NWDWvCmwoZ0UUnsayOxFgu1ddJVOr-n1U4qHAgmRCSllAUpUXvWhJbPgaAE
Message-ID: <CA+CK2bALMGy8eYpYdsQSJXsCWrusKA0UJfBfv1fbfW-=tYds7g@mail.gmail.com>
Subject: Re: [PATCH v3 10/30] liveupdate: luo_core: luo_ioctl: Live Update Orchestrator
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
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
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 9:32=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Aug 07, 2025 at 01:44:16AM +0000, Pasha Tatashin wrote:
> > --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> > +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> > @@ -383,6 +383,8 @@ Code  Seq#    Include File                         =
                    Comments
> >  0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                               =
 Marvell CN10K DPI driver
> >  0xB8  all    uapi/linux/mshv.h                                        =
 Microsoft Hyper-V /dev/mshv driver
> >                                                                        =
 <mailto:linux-hyperv@vger.kernel.org>
> > +0xBA  all    uapi/linux/liveupdate.h                                  =
 Pasha Tatashin
> > +                                                                      =
 <mailto:pasha.tatashin@soleen.com>
>
> Let's not be greedy ;) Just take 00-0F for the moment

Done.

Pasha

>
> Jason
