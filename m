Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01082866
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749318687; cv=none; b=AM3XwhsfSrYY0U6ixwjh7cjTwdV+bCIRvttDVRINbowkfgzr8fbAyoXP54orFqE3T0LyhMnMxroU5xD28wkGF+bwYlS3bDLOAfOtDijOdJP70jksMHlBEZ91W7q12Boia/W4I5F422+K/QEJvC/fOS040zBnxCsA7csDeLFV3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749318687; c=relaxed/simple;
	bh=raNXHsePfyHpIXPLiU9dmg5kvTx8ukod16UtTmcMCYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOItMLDPRSjnL0RC4L7uOrtREohY2Yl+z3eXehf2gU4BLHoNHjXTl2mSXsbsL8A7jQ+Yg6+sUgT51tveNa+77hLl2sH+oCbhgs1XNRjxQS/LNrFkSSZ1ZPQLJ3jds7lpzCAJ8XThP5d7ZsLVL+e0Gxkkt+BUyin+tEqKxisPdKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=tSgRdf79; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="tSgRdf79"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a5903bceffso38063431cf.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749318684; x=1749923484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5x7tqpY7FFQTqwJyBba7fEUnGOPyC2xMtgUC5Nr2hd8=;
        b=tSgRdf79hMFqkZvfjRJKW21el8YKnVD/QCdzm++TpLxuStOuD2kJCL4X6ADCoghxVL
         p6kztvCO40j/35WpXOvKlliYgEFhWAF2YKwTXNQkgyGHzjZiqTag4BkZVTKwoDItcLZV
         cdG6rJRPaqYJhLoFOoR/ah6+OLE9V+aqOyy78zB3W+EnJU7sCqc5QTB2tr6knSsjsLz/
         9ZiuNPtxO0eTLg987S8TJwhgPgIdUExWM1itSPXACgxjATiNHuy6jMric8xZQa4trFDx
         X2lneAAxjInGIKcJYAww6YZglOid+u/nG4OWy2JIAvkuEmyFOq96gkAlZ0go9CuP+ai9
         S+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749318684; x=1749923484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5x7tqpY7FFQTqwJyBba7fEUnGOPyC2xMtgUC5Nr2hd8=;
        b=KGeOVlrTmxiBufrOt3d1nCsaHT2rxhgfpCkim/cuD9Obh09jEaLI19NWZaJV+/hoEj
         KSxnb2d7I+vGj4MvjXbp6rocwwV2ubXvN2Vn75+j/EJ0P23vEHPlhImvZL67aCDPIxuu
         CJ34Tk/c8ueHfqlxabQnDkZBNV9eSL3yGU/R6cptkWk99/vA9eTCPGHJ8Dn8PEuyRsjr
         7pbUmLIHBZXDFsW2++OBC9iZaTyUTKd+Xl0dPherqKhhkeMfWyd+vjoP7FwgURVcIFkB
         IuO4QIdSS2x8+t0hnRSiRsYeVtmUTCGGSkLTemzvEUOql6hILmpjY2WoziL44YSodv2+
         Yc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6dTH5uo5vjxt0HKWiTUoUt+E3/J7UuwU3LMyJfg0muGL/r1Kf+MmUzRJW4lE//UgBvoh/Mpdv7/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEziaP+fDHjMmMGYVRIM41COEd5o6J3wkjmpIlIFm+CM3vehYw
	tiJhImin4An+P1nr/BhdQHKAaTqULqnWoc6v3DRf0YRzkNs15+TnaZenxXBgqe1GLPQsOzOe5eQ
	rbyKLgRE2Xu8O7lOmogAUyh1AqIs1XIx7fkfiThti4g==
X-Gm-Gg: ASbGncvgTze7cJz2tYp4G4KWlc06sTukyD5ZrURLNmMFUiHFJtQ0/Bne8FTJoaXEAg5
	boYDC0aJAiCcLX8qMt76QGn3kPgBmjA50PoRbH7/EQCGD9tAmIrYKYsK3mVR7Nf5xrIAdZFqzVL
	myXfuYGsuD7UjgTePqReDPb4npAFVyNw==
X-Google-Smtp-Source: AGHT+IEFn03IT5C9pJFdS9tKXW+5B//fadk0OraiYcKgA8zAKYeMYRVrgrdQO/iYtEedwVrjla+0YNmycwBcp+tbU+w=
X-Received: by 2002:a05:622a:59c6:b0:494:aa40:b0c3 with SMTP id
 d75a77b69052e-4a5b9a0546bmr105143941cf.10.1749318684345; Sat, 07 Jun 2025
 10:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com> <aDQV1bAt0i8d95MQ@kernel.org>
In-Reply-To: <aDQV1bAt0i8d95MQ@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 13:50:47 -0400
X-Gm-Features: AX0GCFucvwsWUVtQaH9FvUCH6_T_TwPU1EcsbQ3OjZROJgpiTAuxkweKotJ6ncQ
Message-ID: <CA+CK2bAn5Y71FgZvfY0oJ+-65TT19O4=h5DXguRbEQdRvhurFg@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 3:19=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 06:23:09PM +0000, Pasha Tatashin wrote:
> > Integrate the LUO with the KHO framework to enable passing LUO state
> > across a kexec reboot.
> >
> > This patch introduces the following changes:
> > - During the KHO finalization phase allocate FDT blob.
> > - Populate this FDT with a LUO compatibility string ("luo-v1") and the
> >   current LUO state (`luo_state`).
> > - Implement a KHO notifier
>
> Would be nice to have more details about how LUO interacts with KHO, like
> how LUO states correspond to the state of KHO, what may trigger
> corresponding state transitions etc.

Updated.

>
> > LUO now depends on `CONFIG_KEXEC_HANDOVER`. The core state transition
> > logic (`luo_do_*_calls`) remains unimplemented in this patch.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  drivers/misc/liveupdate/luo_core.c | 222 ++++++++++++++++++++++++++++-
> >  1 file changed, 219 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupda=
te/luo_core.c
> > index 919c37b0b4d1..a76e886bc3b1 100644
> > --- a/drivers/misc/liveupdate/luo_core.c
> > +++ b/drivers/misc/liveupdate/luo_core.c
> > @@ -36,9 +36,12 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> >  #include <linux/err.h>
> > +#include <linux/kexec_handover.h>
> >  #include <linux/kobject.h>
> > +#include <linux/libfdt.h>
> >  #include <linux/liveupdate.h>
> >  #include <linux/rwsem.h>
> > +#include <linux/sizes.h>
> >  #include <linux/string.h>
> >  #include "luo_internal.h"
> >
> > @@ -55,6 +58,12 @@ const char *const luo_state_str[] =3D {
> >
> >  bool luo_enabled;
> >
> > +static void *luo_fdt_out;
> > +static void *luo_fdt_in;
> > +#define LUO_FDT_SIZE         SZ_1M
>
> Does LUO really need that much?

Not, really, but I am keeping it simple in this patch. I added the
following comment:

/*
 * The LUO FDT size depends on the number of participating subsystems,
 * preserved file descriptors, and devices. While the total size could be
 * calculated precisely during the "prepare" phase, it would require
 * iterating through all participants twice: once to calculate the required
 * size, and a second time to actually preserve the data and populate the F=
DT.
 *
 * Given that each participant stores only a small amount of metadata
 * (e.g., an 8-byte payload or pointer) directly in the LUO FDT, and that
 * this FDT is used only during the relatively short kexec transition
 * period (including the blackout window and early boot of the next kernel)=
,
 * a fixed size is used for simplicity.
 *
 * The current fixed size (1M) is large enough to handle reasonable number =
of
 * preserved entities. If this size ever becomes insufficient, it can eithe=
r be
 * increased, or a dynamic size calculation mechanism could be implemented =
in
 * the future.
 */

Pasha
