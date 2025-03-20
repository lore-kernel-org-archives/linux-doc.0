Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124279C4
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742495465; cv=none; b=W7yrKjU37L3wFdnXJ1hckqRjMkzfWxBe5SFE7zScC7kALg/OKHUTjNwmVUgFp5QXKO/0NSa3a6RkrOZ4EgrCTm30QExKmltFjJTK7J7x0EdyZ2ACGzHbFldsWL3c/PWvMYSmsGdPZYl4QvSmahLxKjsfQpxRP4EFWFTayY61LaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742495465; c=relaxed/simple;
	bh=cV5oj4ZggNIAvzqVAAEfs+LkEsZa276a7RdC8bBZG4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UR9C4C69AbNCNs6iBv9gOvjgMeP5jE4Y5h1LwQ11Yc8lDCo4ECdfpTbhV0RulbKpxEd7Br9wUodlg3ASLs3TZLVAqF2uEMqi54PmXDLF6a4Y64m9665Eca453r8iFeRJ52OpaAtavHI1ORicIzBlq844h1CA+mk8ln09tFcPlew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=jEvKYDQd; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="jEvKYDQd"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476964b2c1dso20448281cf.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742495462; x=1743100262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtG9gf5FgKA6eY6YRT9BshPGwRpE+hENpTGe4jADqQw=;
        b=jEvKYDQdR9bnb3FvXo5Ps2OJJN1gnWr8Xh5dRth+0HUfljpWJ1wo6CU5Mvqp0Qjw9/
         pCOEMRcf4jOCnhZi5ec2pPg30VDkSc3Q4Dcjco9r0jGX9/kUBxvqZFb4Lif+cI3/4Aa4
         kxfLKD112Vh/AOTnsP89E+zmDDVvlXvliwWTEWa78f0INQtM6WHVGDBBearFkn44pJWl
         o11/nFbod/pnd3T8IxtK4CVYP7ovpcgyiFb6Q4reb1CN2cyuGYBITVobVqFnR3pkFj31
         RrXVbJem7ltZiJUKLeHxUCsIn7uLzyZYgU5Vwke8gu3bH4PlSV75Ql2+QvLgEh/xUHqX
         WouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742495462; x=1743100262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtG9gf5FgKA6eY6YRT9BshPGwRpE+hENpTGe4jADqQw=;
        b=bMpHnH2Uhz9Jtj8h4Z0bfO+iB7U8fRM8ehcYuecQ7/JFfUYs2MkikjxWcs3+kTwJM3
         0uw9NvSqvPpfZ6WZ0Nn/zE3vz5ufsX3A1QCNlz04nFamc6v94XdwKw4CCeA15SdrgMov
         baOEBvvw4I+KfGATsdZ0uajvpMBTBMuDK7ksZ90c13A7sZ9p+4BAnnQK37RM+J6EjlW9
         V46cyLnCdyIrfbOCZ3KeCrIe02iSdp0o5PGjRqJlR3unRRS9oW1PXTCIWkK+8kM/qGah
         q8qqt7tR1II+BDJihgC7I6Jkn2AnkcUXPiDRSy+sxBgqGvaBLrLS43BVhwg8SfdhQg/h
         l1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUxjMTupWm++amVTCDzXWLlYsa8NuPe9kKjpbtfGqYTCAJAheg5hEMb9xgc7d59q3MjkQNj2KOUbGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhgbYg4el7imQL4HMkpfIf+T4besq5VP6KmCcETdg3uusNCzJ
	3i3zLIe2UeI0tB5x6yfOz2E5+qcIOBh/wFP8zoujdADl5TA73xkjuFXZAwjd4OqRg+evjc7Muz/
	+wFUOd1ssZJPIGEZBdT/GB8vx/Obz9Fjxa9CfiA==
X-Gm-Gg: ASbGncsfXjK/20GZ/RIwfH0ql3tVU6qbDMAajFPiYqrWLgDUio5TISy/FUDR+PuFOSe
	IURtGz8DPsuKID8OBeEk4CFdaD3XruGoL7QAG9hXRJtAWeGOsEfJqaMgcd+DejY4UfFELvjSl0q
	YnfGnXnmTSS/gPzrgU5+ekKnStkdKIuxOHOg==
X-Google-Smtp-Source: AGHT+IFqX17oEVPuZbqf446QYtb2Di310WRkl/Dqk2wt6mMBXiCz6I8wulhvvrs+M761WPPyHRhMSYzgn47pKR6cr6k=
X-Received: by 2002:a05:622a:418b:b0:476:add4:d2c0 with SMTP id
 d75a77b69052e-4771de4792dmr4861841cf.35.1742495461873; Thu, 20 Mar 2025
 11:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
 <20250320024011.2995837-2-pasha.tatashin@soleen.com> <Z9wan08CpbvddHhc@smile.fi.intel.com>
 <CA+CK2bDWJcrWpkk0asKUb46GYT-r9JdBMU-OUx3E4qjr6rVpGA@mail.gmail.com> <Z9xVbqyomZunipQL@smile.fi.intel.com>
In-Reply-To: <Z9xVbqyomZunipQL@smile.fi.intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 20 Mar 2025 14:30:25 -0400
X-Gm-Features: AQ5f1JpHpjz1VH8ikB3opDcdZI4T-5QV1E_LN4WKtkhP3V0qop2kKh_p816Drds
Message-ID: <CA+CK2bBQwC16W2Qmw5vXdMi7EaadAGXfUs6ym1P1UZ90PzbZvQ@mail.gmail.com>
Subject: Re: [RFC v1 1/3] luo: Live Update Orchestrator
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: changyuanl@google.com, graf@amazon.com, rppt@kernel.org, 
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
	aleksander.lobakin@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	lukas@wunner.de, bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, jgowans@amazon.com, jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 1:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 20, 2025 at 12:35:20PM -0400, Pasha Tatashin wrote:
> > On Thu, Mar 20, 2025 at 9:40=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 20, 2025 at 02:40:09AM +0000, Pasha Tatashin wrote:
>
> ...
>
> > > > +#ifndef _LINUX_LIVEUPDATE_H
> > > > +#define _LINUX_LIVEUPDATE_H
> > >
> > > > +#include <linux/compiler.h>
> > > > +#include <linux/notifier.h>
> > >
> > > This is semi-random list of inclusions. Try to follow IWYU principle.
> > > See below.
> >
> > I will remove <linux/compiler.h>
>
> But you need to add something more...

...

>
> ...
>
> > > > +bool liveupdate_state_updated(void);
> > >
> > > Where bool is defined?
> >
> > in kernel/liveupdate.c
>
> Nope, I meant where the type is defined. It is IIRC in types.h which need=
s to
> be included.

Ah, I see what you mean, sure I will include types.h.

>
> ...
>
> > > > +     if (kstrtol(buf, 0, &val) < 0)
> > > > +             return -EINVAL;
> > >
> > > Shadower error code.
> >
> > In this case it is appropriate, we do not case why kstrtol() could not
> > be converted into an appropriate integer, all we care is that the
> > input was invalid, and that what we return back to user.
>
> The kstrtox() may give different error codes. User may want to know more =
about
> what's wrong with the input. Shadowed error codes are discouraged and sho=
uld be
> explained.
>

...

> > > > +     if (val !=3D 1 && val !=3D 0)
> > > > +             return -EINVAL;
> > >
> > > What's wrong with using kstrtobool() from the beginning?
> >
> > It makes the input less defined, here we only allow '1' or '0',
> > kstrtobool() allows almost anything.
>
> But kstrtobool() is the interface for boolean input. You may document onl=
y
> 0 and 1 and don't tell people to use anything else. ABI documentation sho=
uld
> be clear, that's it.

Sure, I will use kstrtobool().

>
> ...
>
> > > > +EXPORT_SYMBOL_GPL(liveupdate_state_normal);
> > >
> > > No namespace?
> >
> > Namespace is 'liveupdate_', all public interfaces have this prefix,
> > private functions are prefixed with luo_ where it makes sense.
>
> No, I'm talking about export namespace. Why does the entire kernel need t=
hese APIs?

These functions are intended for use by drivers and other subsystems
participating in the live update. They allow these components to
determine, during boot, whether to restore their state from the
serialized state, or, during runtime, whether a live update is in the
prepared state, causing different behavior compared to normal mode
(e.g., prohibiting DMA mappings modifications, binding/unbinding,
etc.).

Pasha

> --
> With Best Regards,
> Andy Shevchenko
