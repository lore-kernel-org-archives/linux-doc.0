Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EB1E5B97
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747350975; cv=none; b=kzAhdr2wnnnfMjyT9YRAVQzAJSv93LEaD7lQqPF6Shb5t0ghh1+fCECZpjkHcFRnuG3hGw/+kG07PPoCDlvRyic9NzUnbcnSol5MmSrAR7Hqh1/QNZGbE01+euPea8CaBkAhZq5a7ruHqeAyIRR1pWpO+e97u1R+aNYfLPDHJFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747350975; c=relaxed/simple;
	bh=5PFE6PBDej7JAYJBtqMW55W8SV4SYUKu1kOFhZZm1Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzDDreJNcQ/g3hOrErWlqE6hrLG+oe22aM4ICDWF1TdZo5UQmG611JX4mJXEloPQYZLvlmTBiWwNgxwVSu9OEQv78xOptMfw1iHL/c2WTsLga1g7RrAoIrv0MhOJPBHbXGZB/TusFox6qBVMl7YGgqSFz0JJ9pUlLDeOQ7GlnKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mrzA7Uu9; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mrzA7Uu9"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70ca2888e99so6805537b3.0
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 16:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747350972; x=1747955772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5mmOI/4OR6UtWDoONoFMIJO2T0/hKQ0wXwTW+1Gf8g=;
        b=mrzA7Uu9uhun9n6z9ivisGksvdBQrhFphoKwT97qJN8NToFU9agT/bmtitqYDLSdGE
         0rB3lOl5P3RvbWZNyIbIt+e4C34LvGqylhiY5kCVj+0g0Vf2WRQazn3oUbcL+w3kO4l9
         q1wHHmTg13ZNPPYzYsLEWMHA3EpwbY3bIHFLLY6wfxnav844w2pR8WKEEkp3wxrTmkw6
         GNgQ0Xh/fx5jOzvgFv3/XF7OBYTSUhl1gm3DAYpGnXDUHrWrGF6GJzMrzfx4vazkqAS2
         TPARsLjCRsle8nAZgi4cuY2Jy5UgNPqjGjnNMf6shprJqnTYyzeH60fc3ukJHfCzMr8R
         RMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747350972; x=1747955772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5mmOI/4OR6UtWDoONoFMIJO2T0/hKQ0wXwTW+1Gf8g=;
        b=DeJNhe7ndiQkmGmaGa6vzeAlLDMZzna+GM29sLOnsp/iilAaRPooohWEUAUnEBew1j
         w7ss0h0EI+d8vup/hZDtFQ2ayZA5FkO6ir381kxqTKjCBKD9E0NCrdLHQdtIsW7udF4d
         pL40U8WTuturle5t7F0Bbnk3i/PgjLhDu/g8g8ayOrm55dQjpc5uQNkP5dD+ZW8cpXpo
         oteCkIuViVnSc/f1ILM/n3oNLz27DTOqbPUo64I+qqyevyn6xYiHyPTnsbZu+uxFQBhY
         mRO3gBP/6VAy+JTcevr4YOtXTueFD8WF8UsWBZ718+73W6V24Q/1mcTXDVsFZt2Vkfbg
         4inQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2e+nXyZmFLzOVWjmvwFMK+yF+c/afvD8JFDzsDo1seafDQnbk24/ZnmseNQLFm8IDzUvYQ4jc5a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXxdNo33WoVOUvGCQP/udh35w/UFDaUY+Ddp0tQGttet24Ft8
	g+pUl6rUbVyzMfoYLOUK+R8+Q9cvSAOyt3XNArDCXb25FNEm7UrUGIt6q/cOa4E5SvN7VRguZg6
	wHZpvEAZYkSFWrBtHOottAXAKnIsS6gwGaieP3/fj
X-Gm-Gg: ASbGncs7tzSM4zhOl3C8NqrkiySq4owxxwwoRl6mudvUv90Ti+phN9OwzZ77mDIIpYe
	5WYoCURhkE5mjRtE/+z55g5MTXeXmOsmsNcdQ6Jk7BLV/zLw2dP0y/x+m7PF29E/eCyz8Ut55SQ
	BkVJt5VYjzQbNXA1TvpMkD4Yy8TU+nQOp6NqgSdHaAJLXTA9fY/bsA6epyFAEJctgPeZOGHYinu
	w==
X-Google-Smtp-Source: AGHT+IFFHBYRwvCtfapZS/yu0YBHtTfKBBrDprV/SIxy8r7ithlDy7wnX4wo9osw8Ua2f4JgbG2SQ+W5qDC1/NhHDR0=
X-Received: by 2002:a05:690c:6c0c:b0:708:3532:ec94 with SMTP id
 00721157ae682-70ca75dd471mr27677277b3.0.1747350971992; Thu, 15 May 2025
 16:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com> <20250515182322.117840-9-pasha.tatashin@soleen.com>
In-Reply-To: <20250515182322.117840-9-pasha.tatashin@soleen.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 15 May 2025 16:15:36 -0700
X-Gm-Features: AX0GCFvcRAz1A96zfk5fwiW5s1ruo_5m1cnWp4ykamlEP9S3Jtz2iPKdg4_M8Ho
Message-ID: <CADrL8HWdAzQRVhLh2Pq1GV2fy6tus66Eo37PvG9A98kUJTihsg@mail.gmail.com>
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:23=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
> +/**
> + * luo_retrieve_file - Find a registered file instance by its token.
> + * @token: The unique token of the file instance to retrieve.
> + * @file: Output parameter. On success (return value 0), this will point
> + * to the retrieved "struct file".
> + *
> + * Searches the global list for a &struct luo_file matching the @token. =
Uses a
> + * read lock, allowing concurrent retrievals.
> + *
> + * Return: 0 on success. Negative errno on failure.
> + */
> +int luo_retrieve_file(u64 token, struct file **file)
> +{
> +       struct luo_file *luo_file;
> +       int ret =3D 0;
> +
> +       luo_files_recreate_luo_files_xa_in();
> +       luo_state_read_enter();
> +       if (!liveupdate_state_updated()) {
> +               pr_warn("File can be retrieved only in updated state\n");
> +               luo_state_read_exit();
> +               return -EBUSY;
> +       }
> +
> +       luo_file =3D xa_load(&luo_files_xa_in, token);
> +       if (luo_file && !luo_file->reclaimed) {
> +               luo_file->reclaimed =3D true;

I haven't been able to pay too much attention to the series yet, and I
know this was posted as an RFC, so pardon my nit-picking.

I think you need to have xchg here for this not to be racy, so something li=
ke:

`if (luo_file && !xchg(&luo_file->reclaimed, true))`

Or maybe you meant to avoid this race some other way; IIUC,
luo_state_read_enter() is not sufficient.

Thanks!

> +               ret =3D luo_file->fs->retrieve(luo_file->fs->arg,
> +                                            luo_file->private_data,
> +                                            file);
> +               if (!ret)
> +                       luo_file->file =3D *file;
> +       } else if (luo_file && luo_file->reclaimed) {
> +               pr_err("The file descriptor for token %lld has already be=
en retrieved\n",
> +                      token);
> +               ret =3D -EINVAL;
> +       } else {
> +               ret =3D -ENOENT;
> +       }
> +
> +       luo_state_read_exit();
> +
> +       return ret;
> +}
