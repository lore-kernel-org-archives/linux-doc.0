Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E7280024
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403946; cv=none; b=OoFB/UBNw3B4Ar/OhTPM+6fUQIhCw9z5qqw03fMzBi2qCD0iu97v0KYCxljfFlHxGEFaoNnobHybVfmzSpuqCLdnT5en4MITNNZsxsBEl14UOgxfGfoSRV2jdmS3BzCf/LmfJB4EW8MwcV8CgaaYClXAlAxE4HMULE9jYfwk/oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403946; c=relaxed/simple;
	bh=dMycsWk6alcimZ9cye+sIiGHVio6V3dIKHH3BxJbFzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7+nFxKo1jpDKig/fig8JPITXYDILQVauhuaAMGLXho9meB4VGXTXvb8BmXHPUlFR3XzleVwJKs7CWwg9O8qoFvgIsJ1BOsR+jsBp0PpMS414k+WiNSlunaXfg3EKNFD3AgP/Fjtuu4xJCQFnas3ecEOIRrESTZW+HwVVqsywNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=JeQjlk53; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="JeQjlk53"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so8009005a12.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 10:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763403943; x=1764008743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMycsWk6alcimZ9cye+sIiGHVio6V3dIKHH3BxJbFzo=;
        b=JeQjlk53pq2zJjWMlm1xSgj7kGKmc5aUKot2CX4cKkELU/EEVPJhKR2EBqlXCae62H
         Q5OQMucd7llOJItyTh7wjKn0xn8Tv2/pdb29l8JqeniatA7lqmQnlsy+9Lz9fJefWIZj
         ohRtOO6qC3C4yDxmZhxEe08vq72Nn6/XiuXWrA0kn4yLxeDr3n9rTyJIk1cA/293oWSR
         rHO/wdIcRZmkbETgJN9MFNeqyPNL1R14An0FPBEMK+Y9mltcU+XiExEGWiYZ+SoWYSE8
         cNWVCvJ+3bZmtZe8hl+3lvFp1IdqEBr2BY2Jbg4K5jwzT+ESwa1Luzu0v4eyPLDOvHZi
         v4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403943; x=1764008743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dMycsWk6alcimZ9cye+sIiGHVio6V3dIKHH3BxJbFzo=;
        b=WLmaRrhJ/TYBlfjlmpBE5d0IcBzizDXKNZc5T6I8IyFZi08Dl4/z3FIYKhYt9tG8Ab
         Sg0GgJFKTcAQTXHjJ8JejiaymYJyWzjDPVUDXDZv4DSwf/U7tftWTwoQzLrdAiY44uUD
         f3X0B7qHhGx7Wpe3PwWoIyCOXsbwtHcz1hsd9v/rmc6ElUH43EJ9rFvTjZEa4uKbTrlc
         FAxOiKaI8X+w0wp8OieHO6u6vNESOkqA6jr9fjI87iR0O/g5W7hOhV5lxQvlSgQT1rz2
         +Dibezee/pohHXM/9vqq/aA9QIiGo4YyqykZSPnYGl0Up913GmvZXysbQmiN4SpyPVPh
         YN3A==
X-Forwarded-Encrypted: i=1; AJvYcCXWZb9s7cXPItwxFwMdAysgH7Usw8H4EofK3emPEks2Qtia1SDKAQ6Y5fnxYwEgCzKkoFIwyx1nR3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KbJHgPTfTf6zx4HphRGhNI2ffRjmTFJvneGO7/6Xo410FS6o
	nBGPoE6Phfg7/pU1qTySq/bKWycCse90oj4Tiw7bd2/09QU3Lsm7iFGd3qOl8cqE3DrRi9EBF6P
	g5YkbbOKsfYjDQUoo+yE06gBYqBxdtZH8m8Fi6+PzXQ==
X-Gm-Gg: ASbGncs1frGajEHvJiLhtiviXNEcW3W2CNhJ6bRa9vgSS4ZlMtDPm/PwLjAt2QpMB1u
	GO12mlcd3Sf8IxnJsYgtr4HwrdYiriSVNKUhuBGfZRTxS8LAwkClhJ1SNo9kETbDBzI5z9KVbl5
	7/1ncltZa6YSF+UUZxApmiGOroyvkmUDw5jCa82WN6hPoR6yuQIhUPwIau3MAhS7gqpNm4dh9bM
	VzL/McLkcwOugcrnKvUcS3CbyRUGt0mM+I3tASaS0LvtyZV6ZghkLvOlQJqXJ+ix/5CVi1Luq3Q
	xRg=
X-Google-Smtp-Source: AGHT+IFhDEducLN7T5Jy1DwFvPprFdHcnJ42WfejgEYNti2gLXiHYmpyBjQ/4t56trSFuAgRCxac7v4hY1mMU4Ka3uY=
X-Received: by 2002:a05:6402:23cc:b0:640:b497:bf77 with SMTP id
 4fb4d7f45d1cf-64350e9eb61mr11509176a12.35.1763403943114; Mon, 17 Nov 2025
 10:25:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-12-pasha.tatashin@soleen.com> <aRrvaHh-cP8jygAF@kernel.org>
In-Reply-To: <aRrvaHh-cP8jygAF@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 13:25:05 -0500
X-Gm-Features: AWmQ_blTQifSbVFjHBESf3b3IYzXXqzrvc6uwjRPXvt2KinsJtxmdBdOtqW5SFc
Message-ID: <CA+CK2bD_a=C0h-y4HDWPYV1VOWjM7V4gcocwekA6M9h5WbiqSg@mail.gmail.com>
Subject: Re: [PATCH v6 11/20] mm: shmem: use SHMEM_F_* flags instead of VM_* flags
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
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
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 4:48=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sat, Nov 15, 2025 at 06:33:57PM -0500, Pasha Tatashin wrote:
> > From: Pratyush Yadav <ptyadav@amazon.de>
> >
> > shmem_inode_info::flags can have the VM flags VM_NORESERVE and
> > VM_LOCKED. These are used to suppress pre-accounting or to lock the
> > pages in the inode respectively. Using the VM flags directly makes it
> > difficult to add shmem-specific flags that are unrelated to VM behavior
> > since one would need to find a VM flag not used by shmem and re-purpose
> > it.
> >
> > Introduce SHMEM_F_NORESERVE and SHMEM_F_LOCKED which represent the same
> > information, but their bits are independent of the VM flags. Callers ca=
n
> > still pass VM_NORESERVE to shmem_get_inode(), but it gets transformed t=
o
> > the shmem-specific flag internally.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thank you.

Pasha
