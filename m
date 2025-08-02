Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048B38DF9
	for <linux-doc@vger.kernel.org>; Sat,  2 Aug 2025 23:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754178411; cv=none; b=mOwp+JjzNpix1qrQ/xpwt1HFR12cPlgpRC/wUocWIou1OMZrRgZ6SDLU7pdUwfMdiuzPNQ4DcWg5VL4Y+MLcAQvkERC9ZEDotnApbAEC4Y0GUFzKIQGsD3C2mHkBBnLfsHjcI9OeB6AQRZ9Rpp+YBVnhC7jWIcNv7a3IiNAWI1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754178411; c=relaxed/simple;
	bh=vAc/4KiHAcjlsBQPHI3wMhShkkf1hfeQY3lbP94F0mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnEMSSAr2EJWrQh0dHzBgYCd20rTwqzEVvy0QOWj8RMKZXvFez+DRbU7Sa4vNldBwPpcwswPYbJdIFnfQAM0H5aowZh0/6XbpKQnjCfpcgy/6esJchLIWPgRt0L8BA2Z1WamUK9j6TH/aEzX2o4ewSR6IPCPoaERsJdk9uaSQpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=cgPACfat; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cgPACfat"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4af156685e2so10320841cf.1
        for <linux-doc@vger.kernel.org>; Sat, 02 Aug 2025 16:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754178408; x=1754783208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omSxCOyrH+cAC0v6maS2PTOyG9YcJYfYvPlLW3DY1LU=;
        b=cgPACfat0WhI8UuC2n8WP0kbRDCjkhg0j6kz0R6iMWhaa83EHI+pZc8A9rse91mHpG
         URd5Pm5YArkSOGxuO9aq/aSLMYEqFjojqI/lfgVjkqc+djODqw0ow28sKDEkzjmwvvSM
         HeKUFh7gMBei1E4OxNZwqzql40QU7t/IJtPTvWjTdMdbAhlYoIqrGahPzOm4zRPD2gZF
         blFBD4UxSdcl8NhLw3ebkw4SfL8NACRQ6ZvntGH7p0RLidog89esDacio51ADmAHbVe8
         vvo8rFXGFojfzfswxTN+pfspK5Y2FDQh/2jktHBQbaf4vASEjmgG3KR40W1FSK3U4wni
         mIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754178408; x=1754783208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omSxCOyrH+cAC0v6maS2PTOyG9YcJYfYvPlLW3DY1LU=;
        b=GFULwcXHeoQ3wLU8UD6OU3JN0KU3aAuYD2aEBw2fKDqAPWsyz+oJ5ZYrPqIxaSxizl
         yv3prcLcKmwivPP3XtQavSpIbe6x5srBzpvJxEBs5Cm9eP5R6LTqOA2obGppuduFzQDk
         sSJr1PRaGonp8vFqFBpe1rPRGXqi69Li6FQ1LsoL4PD58hQQgaPGFyoxi/dBrMabDTC4
         HzkEBOawS1DBunlpQ1nT5ABO8tOyaN+R3rz3VPFgfNGsmOaD/tejgdyV39+gvQ4cds7o
         Sjj4Mb1Sl4qS6Uj1PpdEpsK42+0wXNhoADnZrDbKhEpCL7/BPIMqchv/0q5S/CrMFeS/
         zUDg==
X-Forwarded-Encrypted: i=1; AJvYcCUpMm9/ODQr0gO+teZyit0hQpa/v88CGbHngOVAalkIAEqXUu5L5Kuf7BvSVs99NR9a+FOVrJ5UIVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQEaHJU8mpsrUBun8Ya7apDHMI5RhWwX2T7lV6PoIcUTuO5Hru
	t6JH/Vi4sDsv0RRNsQXUUX9jhC3klNpX6/3i5w09HUgjbXILIJwd4cRirmOAher+siMCs3wjdgQ
	RAJB1+djy4352f7LlEz7aEuo7v8zPlCiFwQEgk5gzTg==
X-Gm-Gg: ASbGnctG0IBpxNN3Onm46v/JEEAZgGJBZArrjIeXsb2zMry/Iio4TS2smTNgVwTeuaG
	jLvdGXCccBY51va3t2yVHbCGmz85QbpZzSe5ExZ+vPAfP5GOX1jKnpad0p2pdUN05lV5zyDr9Ah
	y+WR46nY4C/Zlq6t+EeU761qukFTI+zJ+GEWKgA50STJZkWAJdgPLW7NftXmJgolL+4v/DMHUbU
	XXh
X-Google-Smtp-Source: AGHT+IHdEITyYGYGGvkUJ/FLXWfXeXO8iQNocqY+DuXZ+nO0UMVJgqKLU07m6mpEY1xZc8NU3/+RPBwpxH4hgExqjBU=
X-Received: by 2002:ac8:5e4e:0:b0:4ab:3963:c650 with SMTP id
 d75a77b69052e-4aef16dc96cmr147684491cf.10.1754178407719; Sat, 02 Aug 2025
 16:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
 <20250723144649.1696299-10-pasha.tatashin@soleen.com> <20250729171454.GO36037@nvidia.com>
In-Reply-To: <20250729171454.GO36037@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 2 Aug 2025 19:46:11 -0400
X-Gm-Features: Ac12FXzVHD70UwSnRqGNkZr2cSuqC2q4gMi23eZp3qK6a2xJfpUPm-pdMLJYecM
Message-ID: <CA+CK2bDz0t4+r9Yw+rpf_8K_GFDygXQ_b6wvPFtNYkssfX7wew@mail.gmail.com>
Subject: Re: [PATCH v2 09/32] liveupdate: kho: move to kernel/liveupdate
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

On Tue, Jul 29, 2025 at 1:14=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Wed, Jul 23, 2025 at 02:46:22PM +0000, Pasha Tatashin wrote:
> > Move KHO to kernel/liveupdate/ in preparation of placing all Live Updat=
e
> > core kernel related files to the same place.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  Documentation/core-api/kho/concepts.rst       |  2 +-
> >  MAINTAINERS                                   |  2 +-
> >  init/Kconfig                                  |  2 ++
> >  kernel/Kconfig.kexec                          | 25 ----------------
> >  kernel/Makefile                               |  3 +-
> >  kernel/liveupdate/Kconfig                     | 30 +++++++++++++++++++
> >  kernel/liveupdate/Makefile                    |  7 +++++
> >  kernel/{ =3D> liveupdate}/kexec_handover.c      |  6 ++--
> >  .../{ =3D> liveupdate}/kexec_handover_debug.c   |  0
> >  .../kexec_handover_internal.h                 |  0
> >  10 files changed, 45 insertions(+), 32 deletions(-)
> >  create mode 100644 kernel/liveupdate/Kconfig
> >  create mode 100644 kernel/liveupdate/Makefile
> >  rename kernel/{ =3D> liveupdate}/kexec_handover.c (99%)
> >  rename kernel/{ =3D> liveupdate}/kexec_handover_debug.c (100%)
> >  rename kernel/{ =3D> liveupdate}/kexec_handover_internal.h (100%)
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thank you,
Pasha
