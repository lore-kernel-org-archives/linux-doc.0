Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E02472BD
	for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749846411; cv=none; b=dkEOlId2kq6sSF+Jk+L/lXlUAz5iHQresiJ0jieglfpfJnXf9ka30rpW88VghVGNYDA7DVWk9wSscgeM2Xh5EpX565NRy6eLOOnvgKCIcgdJgjYQ+VmqtGFhoht3wRgnMUsAE3EG5CZCsK7370EGEb79B9iStL9Hx7HfwWmc1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749846411; c=relaxed/simple;
	bh=DFyKp/yhJZEzV1BA2ndAeoIkyIKISY9X93mahyLohhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhOXnfPMPEh6Bx8qEUIiwtzT+ihHY9F4ZPCXWwtXtpc1WPJuO9GBb9YZZnJaHH8cGQWlTGaNbJ6S7bs98VWIo0VLQLhGID+XMGkM/N7IKnypipBohTK9HpeMRix7HtG+nrNbiZvY+nh4SdrP6F95k4o2JVD6Gb5kZlwBKIR+OCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=LMLi0Gy3; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="LMLi0Gy3"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fafdd322d3so28293486d6.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749846408; x=1750451208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1F7eBu2yh4yyIng6GZ4YIrhraTRHuVfaAEr8sxIw/I=;
        b=LMLi0Gy3QwXNVMEYLsGW3kGCoteuVpcrg7t8kLBdMd9aj7M9aF0CyoYSta1I7orYnR
         GEASRi5TX9Dj05ClxZ2bIAAxzNe+PJNr7wZFLNLm/SE9IOAMN+vIXc+Q5pCFNfOiWrlM
         015f9l8tmbPsN2syU95pIsoKt0nD7bklIA9WV2nB794zNKy6tuUbg2Ye026Ikt+B6SMC
         LxO2xtKZwj/fIw7i3cJqs1yGmpLZvbsPjxrREjXVQk6UinfWH1+ssbI2rI4q2w/Cwcaj
         7abRMiJpRAIw76WS/Pdo4VU6nWN0O0+3t174YyQiHtdjLH3UKTnSjQnfs0RqsEufuSqa
         Ji5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846408; x=1750451208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1F7eBu2yh4yyIng6GZ4YIrhraTRHuVfaAEr8sxIw/I=;
        b=YL+mGOueiNUZ7BleNmftD29lWLxQ6TZdPi3+EgiFAnYl6O+yUyp8Nljxdc9bx5af4d
         CsFFS8eKCkReISlGV44LNQ8YujfZaRI5MCJngRKXTsWPao90MtQFHCR64wPyhZxiU6kR
         OijyGYOAWPKn6qF8JCvCVQHOf7XuyinQ+uP+6mqDi1KA/HQlsFH7jdecVelo/9ZQS37/
         RFKSPSOmj4YEINeGgEiFEcY/ZHBAu/7n+wcltyhlRF+vs/aJYdg7wLs+i8nVq+EgY+LU
         nA09n65ojQg6uu9N0noxsX5226jWngB3XCgmrh6I9zGghJLwNr0Y9rFzNeCqmW+u+D1j
         LRuA==
X-Forwarded-Encrypted: i=1; AJvYcCXEGomsGi5OJG4MbbfwH8Mutv7L8Y4h8oCW1bv1AHUFMsRL19Vj6cmJjB9V+oAvtRN6uSvxvbmbQEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdR7A20nT7tlx+CoSTrhJewWIcyouDSJZTsslI5QV4z9PMdyr
	tsV9sH1EUdEs5F0+cgxpIAf9GgiOqaWllJLStiFw14spHOomN8ySUeYgR9ATPyw7XRBG9wtl3Yd
	LafbXF0V40Q5BG2cjwVazXlrm2vxhzttefn7u6wsxCg==
X-Gm-Gg: ASbGnctZLxTgd2knsAE0BoWYfpAVf5Pguri1TFsVVsZIfpafAEx1cQ7fYn+BQc/t04F
	p2hijIA2TwVb1N9UGuPKb5vTHz0TeXkbghh19fJEc8MC6qPRi4zwdxyDj0Z+EvSqAkPjLqHI+ZB
	mVTLlaYnCYNHIzv5pIM7uYc/gc2H85o761WkYrvGKV
X-Google-Smtp-Source: AGHT+IF3nwss38w+6sPte2LyqGqKz6Z8Ac5rw75TrU6T2qKoe2RWjWXsO/0k7+DIxBlrqkXH+4SsDrUNg7bBmP0KMdo=
X-Received: by 2002:a05:6214:2022:b0:6e8:fbb7:675b with SMTP id
 6a1803df08f44-6fb477a609cmr14338616d6.32.1749846407982; Fri, 13 Jun 2025
 13:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-10-pasha.tatashin@soleen.com> <mafs0y0u6rx8y.fsf@kernel.org>
 <CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com> <mafs0h60jmzzc.fsf@kernel.org>
In-Reply-To: <mafs0h60jmzzc.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 13 Jun 2025 16:26:10 -0400
X-Gm-Features: AX0GCFuCENC8DGDNRlKtZr6QEPTNog2Lyu6MfBppirHIT_JNXbHcfvU0_kVcGIQ
Message-ID: <CA+CK2bA6zsdARkRMQwadD__qXOzjABcRnwdZjfdnvLf26hsz9w@mail.gmail.com>
Subject: Re: [RFC v2 09/16] luo: luo_files: implement file systems callbacks
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 11:18=E2=80=AFAM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>
> On Sun, Jun 08 2025, Pasha Tatashin wrote:
>
> > On Thu, Jun 5, 2025 at 12:04=E2=80=AFPM Pratyush Yadav <pratyush@kernel=
.org> wrote:
> >>
> >> On Thu, May 15 2025, Pasha Tatashin wrote:
> >>
> >> > Implements the core logic within luo_files.c to invoke the prepare,
> >> > reboot, finish, and cancel callbacks for preserved file instances,
> >> > replacing the previous stub implementations. It also handles
> >> > the persistence and retrieval of the u64 data payload associated wit=
h
> >> > each file via the LUO FDT.
> >> >
> >> > This completes the core mechanism enabling registered filesystem
> >> > handlers to actively manage file state across the live update
> >> > transition using the LUO framework.
> >> >
> >> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> >> > ---
> >> >  drivers/misc/liveupdate/luo_files.c | 105 +++++++++++++++++++++++++=
++-
> >> >  1 file changed, 103 insertions(+), 2 deletions(-)
> >> >
> >> [...]
> >> > @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
> >> >   */
> >> >  int luo_do_files_freeze_calls(void)
> >> >  {
> >> > -     return 0;
> >> > +     unsigned long token;
> >> > +     struct luo_file *h;
> >> > +     int ret;
> >> > +
> >> > +     xa_for_each(&luo_files_xa_out, token, h) {
> >>
> >> Should we also ensure at this point that there are no open handles to
> >> this file? How else would a file system ensure the file is in quiescen=
t
> >> state to do its final serialization?
> >
> > Do you mean check refcnt here? If so, this is a good idea, but first
> > we need to implement the lifecycle of liveupdate agent correctectly,
> > where owner of FD must survive through entering into reboot() with
> > /dev/liveupdate still open.
>
> Yes, by this point we should ensure refcnt =3D=3D 1. IIUC you plan to
> implement the lifecycle change in the next revision, so this can be
> added there as well I suppose.

Yes, I am working on that. Current, WIP patch looks like this:
https://github.com/soleen/linux/commit/fecf912d8b70acd23d24185a8c0504764e43=
a279

However, I am not sure about refcnt =3D=3D 1 at freeze() time. We can have
programs, that never terminated while we were still in userspace (i.e.
kexec -e -> reboot() -> freeze()), in that case refcnt can be anything
at the time of freeze, no?

Pasha

>
> [...]
>
> --
> Regards,
> Pratyush Yadav
