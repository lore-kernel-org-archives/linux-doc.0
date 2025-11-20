Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B22D1925
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763663895; cv=none; b=dtoY6YlrE0LaY7O4eEXU7fQTxVk09JT59g88V+ONOzU2fm/5pN70EuypXhSCQu27iANxJijcRd3HnEd4k7JaldbeiRf2l8sLrPsiUBi7kwmt7ZTviknS5CUrwY3lP2iG3mC3PCBv06NJAYTJSmJ5zSrbNy/hFrVq9QYPtWGfMZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763663895; c=relaxed/simple;
	bh=pH4aoYl2QfUcnU259m/ftgZ7f8gdGn4cUZTF2MS+DF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0jImw0H9Isn04N7lzUbx6xkAKM3ISSdsAZJ4Gi4+XlcuANk4PaHW7jcEf/KxstTWYD1XbHBNnddtd4hdfPeNMddhq3MJdqLXCDRcn2yodvzFv+sop12DLKRkPg8Ba8Zf22+f5xrw6ymZAc/MGaGKG7CE2sYtxF1RD9sqw9IM8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjxvRnyP; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjxvRnyP"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5957c929a5eso1701098e87.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 10:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763663892; x=1764268692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEixO8O0Sgt+Lt6PLSkUIcXQwGzn13P0qmJRoyPv45k=;
        b=JjxvRnyPLzP9KKLdLgJMGGeSFqt1JD41b5tEWSrvRWkrGpiUvDpWOmPg6NuCGPlQb+
         CgzY5ZnACO7PfbmJdUgUy2YpYq2l3SJUB/6tiOzSQUgz7XMpJvX+zwv1EXQvNa/iet93
         Ys9aVeBUKEi0DvJznuvPa0gcKa9PLnbK3CpnXXy+Vc14r4Gr4Vw1jn2dApEpMYo1mWy8
         if42VZUsHww4QNk/Y5SSoZ9Opt8oHjeLzUwGA9SIxNnp1IwxgNibo7iQMNgCN0DzMEvW
         zuPELdHb3teKvQch7cUwT0t1ErRjd3dMz19YFnVNVtOc9INgAZs3sNYqCCc1BZaP0vdJ
         eAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763663892; x=1764268692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XEixO8O0Sgt+Lt6PLSkUIcXQwGzn13P0qmJRoyPv45k=;
        b=gjBihWUy6Fnyvp6nkp5UOUCP95uK+QekhcWXVT8nWmVyLxJX3QKxWErWa/KmPytEpt
         7aeAF2ImOOJ8+vDlTL2fX1CN2pBnPsiLLRbNUEp/MtmFqX7Z0lp4XSFjPlNHpGOgHe/A
         fgxYiCoycacK2Nc3v6iWMYxvER+Z1I1Dv6gd3yQ1alfOjgVU098XNGfBA+RYjHohct6l
         k6FkPGxx40S7eAvb5V42QeBbf80rzwufev+Qcv95PcCFsvxJ4kBTI2Rfw6E1co3FSdu4
         ynz55xaDwTpO1XN8O1RFDT2YZxQvtidkYliuZ9DtXI9Y3JY5U/y3gSF/KNcHn2tcPGCy
         Qvtw==
X-Forwarded-Encrypted: i=1; AJvYcCUDjcLAF39jAKl5nJ2M2jv9KaxbNliFDKSOkVM0bmmVOLsXAlgSz4yCeYnp1rZgMS7gu9y8LacQ590=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1GDrREv69regDFgcROFFnWa6KpOQYCpRnIqtT4a+Uxsw3aWN
	Di4y+fs4prlHgNc4pXJadtxLIalNy5DFJ9p6cNxWS1q4BJi6UW40eVgrrmNqc+635IHuaupT+rk
	rvKUZvUePlMpZBM4uOuOqxmDhHPzwsEoYK0BFTy2b
X-Gm-Gg: ASbGnctomsE0QtUeaj/cxRme8CxMqtf78R/udmZ6LCe/WOik2M/kK/lYNrLbIvEcrfp
	ODyOed5I9F/gAFmNyFJjC4H9G8MvJPsLjFG7QgFxEgayk+YT9KyYmGgEW0Vk7mRAm9uKZW9fcmr
	ddH7EcHxV1Xkzwb+u+F8Tl0m2peIcvtE3DGEIUXcObSVZsVZ4lZlwKkLcJfgFw70sxURUacXd2j
	1WVUoYjuCikds34IR7hjuEcrfBweBKLF4QZmMuN0N/Ep02ZCTwr6KbUo2k5hOzK6B78xtY=
X-Google-Smtp-Source: AGHT+IFxGlfrzESORJlhJ+sQ1ptMndyIY9+wnuGK/JMRNqNcwAbgDqN1vNXo1wzn0/v3S95tUN0EH3tcgci+Oz3slSE=
X-Received: by 2002:a05:6512:2215:b0:595:7a6c:7dd3 with SMTP id
 2adb3069b0e04-5969e2b50d0mr1513169e87.5.1763663891285; Thu, 20 Nov 2025
 10:38:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com> <20251115233409.768044-6-pasha.tatashin@soleen.com>
In-Reply-To: <20251115233409.768044-6-pasha.tatashin@soleen.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 20 Nov 2025 10:37:39 -0800
X-Gm-Features: AWmQ_bm8564IWabRa9o-QUB5L75hdON9Crp276hpUHsnCI8idLYa3aONINMtLrk
Message-ID: <CALzav=c-KJg8q8-4EaDC1M+GErTCiRKtn5qRbh1wa08zJ0N4ng@mail.gmail.com>
Subject: Re: [PATCH v6 05/20] liveupdate: luo_ioctl: add user interface
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 3:34=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
> The idea is that there is going to be a single userspace agent driving
> the live update, therefore, only a single process can ever hold this
> device opened at a time.
...
> +static int luo_open(struct inode *inodep, struct file *filep)
> +{
> +       struct luo_device_state *ldev =3D container_of(filep->private_dat=
a,
> +                                                    struct luo_device_st=
ate,
> +                                                    miscdev);
> +
> +       if (atomic_cmpxchg(&ldev->in_use, 0, 1))
> +               return -EBUSY;

Can you remind me why the kernel needs to enforce this? What would be
wrong or unsafe from the kernel perspective if there were multiple
userspace agents holding open files for /dev/liveupdate, each with
their own sessions?
