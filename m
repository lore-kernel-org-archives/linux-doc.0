Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359B225397
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029538; cv=none; b=CYbq4xrjG+aV613U4uG2uIxZce8BGTR2Fi1ySioiu1Jf0XcuoWlvQc65EDpBkf5pacOwtV5TUGcQZoepnl2Yi2/lYt6VMuLqTGeANKy48uBMnPamQrPsFbgblfVzzAl29uvTvqJk3Z2hDagI0K6oBfaOXh74HjYSyQVTfNo4oYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029538; c=relaxed/simple;
	bh=ZEwvryL4F3rbj5qgEHR3Bc73043Xk7gnhFlf4AiO1uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpzm9r1toDURf6seehDFiXIySi9YxZmvZ//41VnsvTkpI7CsJcagHuiRsUAaD24s3hUw+RmR8SNt3I7zilKnJGv0xteU1ykz5V5/owW9IMtC/bV107W2s3TB5190IUohTt5HI6Nsj2+I/ONQvoBo+ZZNfu00b9Z4vXglMm32HS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bNg0lRi+; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bNg0lRi+"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-856222505eeso122342485a.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1760029536; x=1760634336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEwvryL4F3rbj5qgEHR3Bc73043Xk7gnhFlf4AiO1uc=;
        b=bNg0lRi++rFK10ae92hN4Q+tD9JKalVMgtXOuv5DxPVssEQDJepsowAy+hBIDI1Q3b
         d24YXKnoa9bgNi6emnzdPBZBOj1vfailzHg6agjIpzM3JJyndgZxPINWrJhnqbZ1vHoo
         gxyUdudesuVLETrCGKh8N7SQZnEDE9Fjqoqf5TwzYSV+jg5HRAv5OgbF1Vmfl2urNTiZ
         NAFBJeR7fREu/yildLKrb73j2o2cZA6vZamNc1MA1MdAC5A62yW3Ysh9wW1T9NzoUlK7
         S70a5Kwd5gImEZJvKQVKJgayqIJUTneVBJ9icQs2ulU1PZuMPH/eyMjPDjILTyKSI3TH
         spVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760029536; x=1760634336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEwvryL4F3rbj5qgEHR3Bc73043Xk7gnhFlf4AiO1uc=;
        b=mKRrfvbc9Rbc3PsENJ13Uc8S2N4kYM5J3O08zGepKp/RRZbJWTzi4sPigeEvaJw6dW
         jrHoZmlmNnRKCFOTYjgSM0vCjm5DbZ43D7Z0qhJOpEv9BubHviftcrCNRH4T1pQayndo
         esMb6mkaDS3YnUz27/al7aXnFTeJSiC7vVfjmdEevS1SlZ8pmDcVJr5T+huTWPHM8nVI
         1VAJ98lBel4baJw5uiIrqR93LJAhCGKQwGOxDGcOjwJnRrvffzdjioy4ZSDLwqaLGRI/
         w7iVgZxYyGlJt7zb61nLTZq01P1VL/eWoIhD+TFXgmmO8OWgHZLCSm+0MkJp48H18YxR
         rTmg==
X-Forwarded-Encrypted: i=1; AJvYcCX2AqQU97Kl5OLAsfEzs3Tkz/NyEnLXWRgoDwiM/eY9zcI6fWHBZGP8GjdLW0wMFdDaL+WOXa7wqKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZL436fR3d5mCBxtZOqdFDyPsxT8PNR9/SG6x6NhXImQuOD6vN
	EwdN+21TXgMx0zukXLlMezfJG+V2qFvbgXAZnX7CZAfpQQRDioOQPtmpV04rU+9XLMipRlKhnVS
	+5A4H04aJX9tv+bjberlxK5li+QyjZFiDlqy1u+a1rA==
X-Gm-Gg: ASbGncsenZ6naoAOGGEy/s6xjzLd1LYfehb6M51J4lpZOzOxAJDmSO6C5cWskbc34Nx
	o7TflatiQbAc+8GWkUNbG7ABI1miqP8/dnLRekfGpoZvV7aG3+bCcCtWKtVBz59bMAkMwllI+PV
	KSsidix/mP+o0oDqrkT1Up//B8WPTQE3gTIpthHLmlsrzDHr8Rb98xOUb6MyVPKguhNUAWbe1zg
	VWuIAEZ9sH/cKpk03ASrPeHuUYqQW57ZO1H2yc=
X-Google-Smtp-Source: AGHT+IFE2sAReF4JI9gkbOEBI0GExAG6O+9H49nxZIOW3wiMfCJHnma5AW+apR4GDzx7KvuzWvZY/WusdxfEgE8+CuY=
X-Received: by 2002:a05:620a:2952:b0:870:ab:42f2 with SMTP id
 af79cd13be357-8835384546cmr1185682885a.24.1760029535702; Thu, 09 Oct 2025
 10:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-20-pasha.tatashin@soleen.com> <a27f9f8f-dc03-441b-8aa7-7daeff6c82ae@linux.dev>
 <mafs0qzvcmje2.fsf@kernel.org> <CA+CK2bCx=kTVORq9dRE2h3Z4QQ-ggxanY2tDPRy13_ARhc+TqA@mail.gmail.com>
 <dc71808c-c6a4-434a-aee9-b97601814c92@linux.dev>
In-Reply-To: <dc71808c-c6a4-434a-aee9-b97601814c92@linux.dev>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 9 Oct 2025 13:04:57 -0400
X-Gm-Features: AS18NWB7Cr_VpUIKYZatXQYpiNUtQ7J6s9XvqZtMcyHaQrrY3c7p0E8zT1F9p7k
Message-ID: <CA+CK2bBz3NvDmwUjCPiyTPH9yL6YpZ+vX=o2TkC2C7aViXO-pQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/30] liveupdate: luo_sysfs: add sysfs state monitoring
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, graf@amazon.com, 
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 11:35=E2=80=AFAM Zhu Yanjun <yanjun.zhu@linux.dev> w=
rote:
>
>
> =E5=9C=A8 2025/10/9 5:01, Pasha Tatashin =E5=86=99=E9=81=93:
> >>> Because the window of kernel live update is short, it is difficult to=
 statistics
> >>> how many times the kernel is live updated.
> >>>
> >>> Is it possible to add a variable to statistics the times that the ker=
nel is live
> >>> updated?
> >> The kernel doesn't do the live update on its own. The process is drive=
n
> >> and sequenced by userspace. So if you want to keep statistics, you
> >> should do it from your userspace (luod maybe?). I don't see any need f=
or
> >> this in the kernel.
> >>
> > One use case I can think of is including information in kdump or the
> > backtrace warning/panic messages about how many times this machine has
> > been live-updated. In the past, I've seen bugs (related to memory
> > corruption) that occurred only after several kexecs, not on the first
> > one. With live updates, especially while the code is being stabilized,
> > I imagine we might have a similar situation. For that reason, it could
> > be useful to have a count in the dmesg logs showing how many times
> > this machine has been live-updated. While this information is also
> > available in userspace, it would be simpler for kernel developers
> > triaging these issues if everything were in one place.
> I=E2=80=99m considering this issue from a system security perspective. Af=
ter the
> kernel is automatically updated, user-space applications are usually
> unaware of the change. In one possible scenario, an attacker could
> replace the kernel with a compromised version, while user-space
> applications remain unaware of it =E2=80=94 which poses a potential secur=
ity risk.
>
> To mitigate this, it would be useful to expose the number of kernel
> updates through a sysfs interface, so that we can detect whether the
> kernel has been updated and then collect information about the new
> kernel to check for possible security issues.
>
> Of course, there are other ways to detect kernel updates =E2=80=94 for ex=
ample,
> by using ftrace to monitor functions involved in live kernel updates =E2=
=80=94
> but such approaches tend to have a higher performance overhead. In
> contrast, adding a simple update counter to track live kernel updates
> would provide similar monitoring capability with minimal overhead.

Would a print during boot, i.e. when we print that this kernel is live
updating, we could include the number, work for you? Otherwise, we
could export this number in a debugfs.

Pasha
