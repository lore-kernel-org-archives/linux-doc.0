Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F0115B10A
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 17:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720720508; cv=none; b=px3VFQ5/9R0rg7u4zRfI0npBKCPZSV6Q4qVmfXnZb9TLCcjWmWNH+mfLtxn8wJL8tktx755aHNxJPoACq7spGElLnIWGo4Lh+kGAqbNBd0/datO7sVokPTxiUtPwRszumQ8hqE6UpT2vSx2iA2QKFDSPK1sPQWnfHBGCoKi/hAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720720508; c=relaxed/simple;
	bh=Q2jGwB5t17HqynNj9nfvA8d60yx74p0B3SdLkap6ocU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6Wvg51Ww4FjIsErbCD2QJeLgR6PM3cVgx4dh44IEWYfLrbztDRdS/n1PzzuOEnXhYlxW8cb75KsNHjznTKNwkgD7b51ykHE3KWCBveusdOiRMUKeIDX3FW5EJ4TK3knRx8O2xeR/K1F7X7qrpGO+T6BMyEcqI23N4K1iwMylJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ec78memJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ec78memJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb67f59805so10605ad.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 10:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720720506; x=1721325306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2jGwB5t17HqynNj9nfvA8d60yx74p0B3SdLkap6ocU=;
        b=Ec78memJ1/Eo5Ob2Ad/TE2bIkk5ya+uZzFIhtw/BJxVgCTJB7sW6DO9ci9xikD+PM9
         PibWhD8BCTtmiS4+QyiZkgaTorlcyGRwlgQxpo4Tlc4yvPgSrGGVaWo5Vl8cRnmgH3MV
         /Yl2JLzPMI4o+IzM63435sXjO7MVwWAWC+yg17l0R65YUu2MuKUkszlJJmeZZYwuaWu6
         a2TOvVc8PLjI5GGApRcfsKCMJfBKP+WIjlcoDjOyj8WqCMBidGg1x8p8E1VFqgjjg0tG
         GMDSOsXr428dBdEOzgAz0DYnNoiogBA50L8F5+IcR/jsfmDQF0wGCvbH5KT/DvAdCnun
         BsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720720506; x=1721325306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2jGwB5t17HqynNj9nfvA8d60yx74p0B3SdLkap6ocU=;
        b=ZLaxTE9CPRuMes/01LTyq73HiJ0cqf5Zd+N6Yr1HSfFmjBMMFqogokITsGTBf0epLj
         R6upuDKlmd1dWaL/mmMHRtzIVV9YOtfntV3FbSojdMXhmVquVxNK0AIdwQXSP7RlRWsY
         1AxJ2FmfR50Zn0UgTvewHeom/HxwrI007yk6DiLmfzgwVRl4M64g9KkY9UOc+HrxJDAt
         sgOOBMvXaJivbmVMo8jc3sY05EafK5W/E5NzSI/eEu95J/qKkCZPWZOfFccBXFcpVrtL
         rQrlCI1DH5x/bOKRL2xoD+XfbWtekniv9cPaOi4fLyB+3Ao8XV+YCVXq+iwoBqc1icgr
         FFtg==
X-Forwarded-Encrypted: i=1; AJvYcCX+wcJ+9lgXZfwoewCnHambai0Vk8HYusl6Mh/CDQytENZWUVwJaLCrtM+b14vlfGi6F0Jhc0OuYJN6yoHOX9i6zYgwPUO5NCsw
X-Gm-Message-State: AOJu0YwVCkBBaMNRMloNV9ar21gPLVcQ80OEKU9s/ONOVVuS9hLupR8W
	UuLOIjKAJ4goWOEExAzg7INWaNG7KYF930f98gRdZIUfQgGCMiW3E5QIW/+1ny9zavnOjb3Ns/M
	dbAr2wxDL8VQlcrnRiuGBkYlQnyJYoiZMC75R
X-Google-Smtp-Source: AGHT+IHPl0hMtGzIful8PbEv97szuh+yMniIwD4UrUN5WZPWkOFkV7tC3++A18niRRomq2oAuqh7wl6DUv9+EvJrdGI=
X-Received: by 2002:a17:903:32c4:b0:1f7:3764:1e19 with SMTP id
 d9443c01a7336-1fbf24ced64mr106635ad.20.1720720506068; Thu, 11 Jul 2024
 10:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 11 Jul 2024 10:54:29 -0700
Message-ID: <CADrL8HVFARsLq0Tyw8XF3PR02gELQhbYM8ZDdWNx0eD_jyDW8w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] KVM: Post-copy live migration for guest_memfd
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 4:42=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
> Solution: hook into the gfn -> pfn translation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The only way to implement post-copy with a non-KVM-specific
> userfaultfd-like system would be to introduce the concept of a
> file-userfault[2] to intercept faults on a guest_memfd.
>
> Instead, we take the simpler approach of adding a KVM-specific API, and
> we hook into the GFN -> HVA or GFN -> PFN translation steps (for
> traditional memslots and for guest_memfd respectively).
>
> I have intentionally added support for traditional memslots, as the
> complexity that it adds is minimal, and it is useful for some VMMs, as
> it can be used to fully implement post-copy live migration.

I want to clarify this sentence a little.

Today, because guest_memfd is only accessed by vCPUs (and is only ever
used for guest-private memory), the concept of "asynchronous
userfaults" isn't exactly necessary. However, when guest_memfd
supports shared memory and KVM is itself able to access it,
asynchronous userfaults become useful in the same way that they are
useful for the non-guest_memfd case.

In a world where guest_memfd requires asynchronous userfaults, adding
support for traditional memslots on top of that is quite simple, and
it somewhat simplies the UAPI.

And for why it is useful for userspace to be able to use KVM Userfault
to implement post-copy live migration, David mentioned this in his
initial RFC[1].

[1]: https://lore.kernel.org/kvm/CALzav=3Dd23P5uE=3DoYqMpjFohvn0CASMJxXB_XE=
OEi-jtqWcFTDA@mail.gmail.com/#t
