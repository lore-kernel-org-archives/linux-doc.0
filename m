Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA814FC8E9
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977350; cv=pass; b=e7CCBskZCFS2yiC31SQwaDslID5A6okC1h5txpCs9D2pgnOK42r+CrAPUPRqofsIB7plPYRvNyxM2BBWeK3uyNHcS7UPK83fyOeWOeVZ8NZ8QJGp45DGMdTvy20FCRexoQtusLFnlULJt0xSoPPtqrBnXTfPpl39IrE58eI5dA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977350; c=relaxed/simple;
	bh=Bm8IXeZCCjjHRHqufoiH0uSm7tIaA4fZ4x02DGLBDgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNLC6ReR1O5O4XtSoKpg0aKEKDX851ovlymhTDZqSBmijfZktP6EnG2PXR+rTrHKxFUv71BMl+iaeeGdzoo5T+WP0Y0s42TXJNMCeMngINkYd8ZtNV2uBEXP+hhjRHH9zqR78uZ64L92AjpRhmZQoQfGz3iPkPvumYTDAqKSILM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkAqllS7; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkAqllS7"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35159e0092aso446342eec.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 04:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977348; cv=none;
        d=google.com; s=arc-20260327;
        b=RceD4L7TGr13pAjb3iTexgulnXmpqiI4jO5F6IqAKOV5v2O366qebriJ5k2CWHaIHd
         v/xenJPwokXV7WkLhptfaWoUQPdjfEcC9C7fTJEWNPhe+cqHAs/VWJa5kYCuSNzseXIN
         ewwfM45HEz+yFpOWeooyDw65j+s8BtzI0qyneJraa1lAXRjAHBJ8PWksB/fqHJfiGqw8
         PDlX+fOdSjYKeEgDGZ5oXmEgv0FN9ksDI1CMBKr5sQKPNwXhEvoWXfNN1C3l/+xNEMhw
         hXBKXh6we+tqDyEXf25/HHzCVK0EwVfAhOXpH7ut3z7fI7Hp+n4CpmI6AP3QP96WWOsw
         ayEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        fh=l5tY+8q0l5Kdagtv/gIYOv84YJGodeOhNWT4VE++ud0=;
        b=aTshMMCco0z0n/6Ag590JjZI3PMEsdlR6IPYfZUoCUhoEUJk8C7tRgJhHnbvAn8BTm
         9+BJe/2600PBV3qcl0MpC6R8GSXpQmEYyCQUXcLDAQsQHZysGJN4+JLW7xsOk6lml1Ef
         Vo+bPXD6BnwjJ6wsGFiHYYvism8BIv7zfFBUG7v37lxC+m1w7XMSU9WF3El1uANvKQp9
         5mqrVKErGu1J1dFqu6g+3+ctTM6e0IDMOzmKWDP+KCL38nHD9Ix6LXDqKiKLqOd5Ox/d
         dWnd/vU78bUKwx+CTFCaFhQLrl8ybzEbyrgBwirBEkrc+nheUt6/F0RVvTrDA15gZp73
         0mBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977348; x=1792582148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=EkAqllS7uOOZxDGJ4I1yKdIi3WQSBbyUhPsWLoVzgJERDBlfP0X9cEpWzjyHAR90JC
         Z1zW2YqVc7X46XPiuAerNf9mNnAJ0uUF6PLz0rzePzi7U1lf5J9vz/gZr1IuRwk27MI/
         4/D886vhZESIUjDPJZRvHbQYWiiMvCS3NjhX5siJV1JzVFlBVMBE4d5Q1ZOlRDw5uGo0
         qEQHzjWEYvo+agj8c1xw4Nkq2SVQg9Ys3jvU8s3NkIQ4fYLQcX3kMyght8wz2N51o7tV
         AXXBZTinlSID6wvgzNqIrr0dJv5ZGB14N23uEZXq5jf7doeVho73k08XFK/CJX/hTW5i
         pPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977348; x=1792582148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=aIm2Tfdvvcdf1iO7lE+VdHMUgOgXNPxjUrPXHuWhV8J92wIHu5neVBTknqUId93Y/b
         3pFv6UeTjtJoYvwtl/CB3sOiZW+VKI7m0yyyguM3Q2xno/uZ+B1t3FcX66WPBgy4Hcu5
         fz0UqFKYSOib9CFU/+Uf4eBuhTqhzN59Q2ZjC1p59QUe9h96hJGBxzADxNG/ZX4SuK6D
         UhYpMjkFOl7WjjdS8DVtrA9vCMawFSTPWw3mm/dbX30HR50jNy7aZepk57wWjmos8JvE
         mqhoJ+KOuMoEQiuV1ok9meWqKMYrmqw8/YbLJdZOFFGh7aizvf0tzywCYJYAg9I1EpgU
         DteA==
X-Forwarded-Encrypted: i=1; AKwUvBwdXazq4TLilST84W4ikEb4r1vkGc9CSVs1WsH4joMTVHKrFFtZp0cWHb+F/fz24+uWO6/f1ENQAgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmFt7MgPF92L/oZLKd6lSajEStWWlp/Q8gOt2JhGUjDKCGdk4n
	2/UxLus5tx3ZXoyW6kDpIKL8TgTtrW/LZOzdxacm55l0aG5DMpgC2g+PWm4Ju38V6FiL5lR02aP
	kMjS3v+6o88x7P4ILkUuaT3Iqfzjbciw=
X-Gm-Gg: AYBFou0o071sMLdwHK4O1g0ZjS0HHwt3ziKAbBBhqUIzTak7MtFXjbXp7YlO96G02Nt
	u5v2qeo6TYMUBPmln9wqxvoFEFAKWZSWSTL2Z6U7fyZmamlF/I5tU8UpXH73/s9bempYjlVEVZD
	wBUQaxe3jK5y0eI/RrXC+U4jBKXttELfk+FSwvkgtb4QTGGYvqhHIHa4ZXoCPpRLSyVFG9nu6cX
	VFOTJ/n7STCHlFqhijlj8zXFvcyom1xUtUoExFNETvhRp1wWLZ4uQfbvcA2hcUAEWLBtq0FUGjC
	Wcwz4mwRfjPkkD3FOoTi24VvBMK7cIRtwssQfE2VqmvfTQR/8UD7QHN+O0r5UwU+uVNKqtDLr4E
	zbAuILymk4lR1sFl7ieoBKgsm9W0Vj2igdMZpy8YxvI16pK99a/kWXPidk/CWUe06ljvPdpH5un
	pKtSFEbDg0nSICq+qoFNStP+zrHuLEdYokqJV8mCUObCcGSL9YVbI=
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr14326600eec.1.1791977347656; Wed, 14 Oct 2026
 04:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
In-Reply-To: <20261013223946.1836757-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:28:55 +0200
X-Gm-Features: AclHuK8qVHO7HVQy6LgzcUgjYcQf3EimC6SJcN58PVqcWVdOf6T45eXZNeTLsEY
Message-ID: <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> +/*
> + * Optional: not supported by gcc
> + *
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#require-ex=
plicit-initialization
> + */
> +#if __has_attribute(__require_explicit_initialization__)
> +# define __require_explicit_initialization __attribute__((__require_expl=
icit_initialization__))
> +#else
> +# define __require_explicit_initialization
> +#endif

The LPC slides mention Clang 14+, but from a quick test in Compiler
Explorer and a `git log --grep` on the LLVM repository to confirm, it
seems the attribute was introduced in Clang 20+, no?

If that is correct, then it is not available in all LLVM versions we
support (LLVM 17+), so we should add:

     * Optional: only supported since clang >=3D 20.0

With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
