Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5213728A6
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756234726; cv=none; b=CTdETuarr9Q+a11aHJBKXN2rA9P8sBcQBfV2mT6dLYT8MIEGKjpbpiK4oB0F97w8uGVWVPG2bUDBz1Ex33Fdfu4hWgf325cg/GHNVsgnfksHvkmpM8zVbdJYr1Raj/JwdX4rYI6LslQ5v4FP2rUHlvXoOGMiM6gWhx69EZnZPmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756234726; c=relaxed/simple;
	bh=pJME+1KmU2SzOA/lb1+BnOW4h/J3iSbhKPhNpdWiID4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6eaoLW1a92Lom5rPT1E1tygxWTaZsBqi3wQWq/aHKtXkal+5DwzUY/TA2GSiNQRFJjUvb9lzi2f927H8tY7nEZR+aKqjnYnvpJOebgqIsnWoFE67Auj8Kfftleqs8+FmIKtKWVU3+bO9vIk+qRS6aYhWaHm7DCkCp+X8OBH5UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=KTzuNv4i; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="KTzuNv4i"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b133b24e69so25186651cf.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1756234724; x=1756839524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJME+1KmU2SzOA/lb1+BnOW4h/J3iSbhKPhNpdWiID4=;
        b=KTzuNv4iIOvR2/Okp9GCEoXbHGLVDtZof0ZdrJ/5BDGDLHFFf/wu3vhNswj272YLKo
         ZgDjFd9x77OjznESGRGkCaF1E5T0gbU7AYJDQts96nUx4EpEunvTfX4CTmqTwsZ5FG2R
         PAcVuVKYiC63dcYpgSHHCsk9xuP+tZLHYvjYzbdYSv3jSWBo3FFvJv3Fw+J884zm0kex
         dj9F6Rv2StZHhTxdjS44N4/vu5mfGHNCtrw8cwNLS0EP0EsgiQu12aFL61m3l3aVBf8T
         0yLnFV3TcO+5RqMsi+WyW/NWG34gq5nUZpjmeV1sp7uBdv0AoeQ7T4WAQz1GlFJZ+Hdx
         yzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234724; x=1756839524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJME+1KmU2SzOA/lb1+BnOW4h/J3iSbhKPhNpdWiID4=;
        b=E5EBI9sO3NTDbp7h/yqbeeFfuG7xjzFKj8/lmRIblXLAeZ+1RoRm5g+C9v+65Mm38S
         aIVPZiUVpV6XZAArls7jV9OtXVRJP0TkilLfc3mQ9saXQvLHgMDDwx4zX0GqqxvMU0ni
         JWgWGpDlDCnDtHwznrjRjgN0+GphhQNrDIXny1YdPRfCj4LPwRj4TyzycgWwqNEnvQKR
         ydIKSViE4F6Rq9frqr5PY0La9jceUIxYG9gMDQJfTtnDFNeWeHMVIeB96tW7OTEJwR90
         /b34umA2PjutX5mkZBICBW3s5l+nZu+bC3EnmNT4WsxsmFiC1+AeQSJo75LkN2tVZvYM
         64rg==
X-Forwarded-Encrypted: i=1; AJvYcCXLeZS3X1igP+V/WnWonsOT7merrQqinxBlgdFzzBAtn7fcogW6aVfSzhkPxrRVNyG95EwEYSGbCDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXi64kJE9MZkpwCpER2p7vMY5tdT5MyiewjZoUn4kGlKwunTS
	Nl5VuUK3POXjR8IaK4ZzdZd3sSHHvb/IwV/IB1X0jJ6208ajTAPa/RJYWVIyFvqhNHKnQRYHoT/
	uIQSsJmrwCdbootXuh7PW2zvKXvNUi4CdYKc+oFm6kg==
X-Gm-Gg: ASbGnctDhvOmCaEjd7/kTs45QdbLPIlqGS8pDjqMbjn+rTbKcEHGv/8iFwyyClWzSMb
	Gxr4vadtkDNoRQ/amumnWXEev05XSZi9TBA+NXV0Ut9C+zr6Qjk7gCpVb9dg0HbCDOpM5KZNt9j
	Op6j8ia/QsquStKMOApJAmvQ/HdJODc60EU8qiXI0JWMf9McyC0dBVuB4W2SIeyaTc+Zyk/MqGJ
	jUZ
X-Google-Smtp-Source: AGHT+IH7x6PzB/jpkOPVprK93HcHA2jlE9LSPDmfVuRTuFZ8graOQso5EGuliHqnNQqcqLY5o7Pky9G7peBJC7yYL1M=
X-Received: by 2002:a05:622a:286:b0:4b2:d5bf:20a1 with SMTP id
 d75a77b69052e-4b2d5bf2602mr93874511cf.23.1756234723572; Tue, 26 Aug 2025
 11:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-20-pasha.tatashin@soleen.com> <20250826160307.GC2130239@nvidia.com>
In-Reply-To: <20250826160307.GC2130239@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 26 Aug 2025 18:58:05 +0000
X-Gm-Features: Ac12FXzbC4_094zxu3z9fUDRO3yQVd4QdY6g8DyMrUl3RDt_kmv57pEA7HFGGV8
Message-ID: <CA+CK2bCR84H90dZP40yFw086JP+YwH4=V0ncFfNoR8Mo5+azkA@mail.gmail.com>
Subject: Re: [PATCH v3 19/30] liveupdate: luo_sysfs: add sysfs state monitoring
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

On Tue, Aug 26, 2025 at 4:03=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Aug 07, 2025 at 01:44:25AM +0000, Pasha Tatashin wrote:
> > Introduce a sysfs interface for the Live Update Orchestrator
> > under /sys/kernel/liveupdate/. This interface provides a way for
> > userspace tools and scripts to monitor the current state of the LUO
> > state machine.
>
> Now that you have a cdev these files may be more logically placed
> under the cdev's sysfs and not under kernel? This can be done easially
> using the attribute mechanisms in the struct device.
>
> Again sort of back to my earlier point that everything should be
> logically linked to the cdev as though there could be many cdevs, even
> though there are not. It just keeps the code design more properly
> layered and understanble rather than doing something unique..

I am going to drop this patch entirely, and only rely on "luoctl
state" (see https://tinyurl.com/luoddesign) to query the state from
"/dev/liveupdate"

Pasha
