Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01CA256C66
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 18:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746211081; cv=none; b=juBFKZxhsjUIh6GN4ox4ioBr37GBVj3O6V+wHs+eXrVeXnmsByIEbcgWTavC4MVeSbt8rwr7EBnCZ9QZ442l44UA8MXz7Fjop7D+QMXjwFgBA0/AZtF7SKqEkLF+kvhaDN/A3osKuPE7+88ontTvsC+ikcBgbZ+O6Xa1zqJxft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746211081; c=relaxed/simple;
	bh=evz0UL5GViJbQYOeXoB2+mBdr/LLmySfQf4mosHPGw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BE7DEmHzQXJ4IBk+xWOsYqqM8t+GALm7SjPd13uf34epfWRRZ2edDuqVv55Kf1DsGDYCk5pCRfizQn6AkfGAyp3q1/jjdC1BX+bTQw9HV2RRdCJ5lZHGhWh9Ji3nlq64+lZzfG2xx7bk0NMMgFz+vrhfxLEFojeCUfWXr2T04hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRb2ybyM; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRb2ybyM"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so3596040a12.3
        for <linux-doc@vger.kernel.org>; Fri, 02 May 2025 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746211078; x=1746815878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szvh9FDiAeZV5KMXY9XpVOO+pU/TH0kKZBG6xbyHs1E=;
        b=dRb2ybyM9EToZlc9rRPDDaJFSph9bO2+zPF+OGTf3OTyX7p7aVGlPWIMJl9+OwrXnt
         Y6v3AC5oD5ubzWTPTDMssf15VOeCPSjZ+SPlFhsH286iYmHGp59r2SQfXCEI85/258a1
         /0V6NF7ef0FgPuZpYFfE/JbYCapbpTd+YBK+EGBP+j6M0eIpuH9C5K6ucBWY9uF0IOhH
         Ngk3Y9u8R+Sv56fVyoLjoBD9LauE6ur0SRb7nyx7SCXmTDM3Zhpd/DgdqZHq+RejkFdN
         +jphJy/dK5xLJYAwoWtp16fTelAuoHBFSqnr0r69M77QS+7mtzoU443KMrqi9p10Oxwr
         yJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746211078; x=1746815878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Szvh9FDiAeZV5KMXY9XpVOO+pU/TH0kKZBG6xbyHs1E=;
        b=N0H4IRFi7fopBa5LQBbsazrIttwPi2jC3qomgWMOztQLLWbvMxO25jMh9uOAsV9w6A
         4S3lvBhi3e1sryh1fSWxSumlQUfeDwUxhkR7OgV9DNy5K84h/4m1tH//wgQ/5nc5SkCx
         iw6A/Dawh7ZKIbxHpRMrtahpKgivB9rtpGxRLen7VSJ4UscpRJZBj8n78tSkf3Hsy+kQ
         1kdB9z8rd1Nup/7XUrgGIn4ruuEkCiXhJzwgRqPr1oJ1RokmUTXhqW0tX8CVqf4Cequd
         pUkpuVf32hA4iCvEUv3xDmVEvvhogDpwX/ucnJPfgKQ7PbWwz5m3xGio7jg4lueAVUjG
         lMPw==
X-Forwarded-Encrypted: i=1; AJvYcCWVi6GIhAIUM82gSHKY6lf8jwbWJhlJ9Kp029t+v9X76vrN1diseRYIYHjruqRN9/ySe4Msx6VksSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3kdzm7f8cuQBnRWJqo2pYkGGdPyZsWFwo3TLDKiNRsi37pKU
	GlwzIWGilcozCiH0idmeKtvQJaHQ7T4kddgF8Qn/cmrJhOLKLiNJkPHAjJWI0Iyx17dz1fVHEnU
	OvvhIbvWoEXk0WSin+TPS4v/5jmU7arpAf1yQ
X-Gm-Gg: ASbGnctAL8Z2RJdlDo8RdYjLGreUgpsFGnqfICh8T0ysBugvPS1Z6QWvSaNXWDzuKgz
	yEg4IaKZJzYUlc8DUEu5X7SMJkXh9ygsU3YrtaVS9DkKMjW1JuzrJ023NuCO9w12uvAgMvX8mDR
	lN2K/RvevF70nIwt9kUWHKtJcRb9cXzibB+ZFbidbvvbiGt7OBOg==
X-Google-Smtp-Source: AGHT+IGwGEcGt7qt4y6UtHsVIeUZAmZUDbWtJ+Ey7gGLeSPt9gI0iA5XJZYC4rzHLcT2CmY4/egmqxuj7aqEk5l5ENE=
X-Received: by 2002:a17:907:9812:b0:acb:94d6:a841 with SMTP id
 a640c23a62f3a-ad17ad8096cmr430432366b.16.1746211077663; Fri, 02 May 2025
 11:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-7-changyuanl@google.com> <20250501173557.1880f3aa8694352e0eb153b4@linux-foundation.org>
In-Reply-To: <20250501173557.1880f3aa8694352e0eb153b4@linux-foundation.org>
From: Changyuan Lyu <changyuanl@google.com>
Date: Fri, 2 May 2025 11:37:20 -0700
X-Gm-Features: ATxdqUHZQf1uwj7X5bskxFA1vT8WH6Uhw3YyifuFYUsYAjHkndnVOqhZb4vCKaQ
Message-ID: <CAGzOjspvbMkr8b4-xy3EfGLE4nmLC8B9EPx0QYCdpoFQD-FESA@mail.gmail.com>
Subject: Re: [PATCH v7 06/18] kexec: include asm/early_ioremap.h
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 5:36=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  1 May 2025 15:54:13 -0700 Changyuan Lyu <changyuanl@google.com> =
wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The early_memremap() function is decleared in a header that is only ind=
irectly
> > included here:
> >
> > kernel/kexec_handover.c:1116:8: error: call to undeclared function 'ear=
ly_memremap'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]
> >  1116 |         fdt =3D early_memremap(fdt_phys, fdt_len);
> >       |               ^
> >
> > ...
> >
> > --- a/kernel/kexec_handover.c
> > +++ b/kernel/kexec_handover.c
> > @@ -17,6 +17,9 @@
> >  #include <linux/memblock.h>
> >  #include <linux/notifier.h>
> >  #include <linux/page-isolation.h>
> > +
> > +#include <asm/early_ioremap.h>
> > +
> >  /*
> >   * KHO is tightly coupled with mm init and needs access to some of mm
> >   * internal APIs.
>
> When resending, it's best to fold little fixes like this into the base
> patch, along with a little note and the author's signed-off-by.

Thanks for the suggestion Andrew! I will follow it next time.

> I shall queue this as a fix to be folded into "kexec: add KHO parsing
> support", thanks.


Best,
Changyuan
