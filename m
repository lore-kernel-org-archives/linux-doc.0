Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63870223710
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661712; cv=none; b=RHnRimoU2YxXLIajAiU7XsNVNlrKo3HHRUoLUGC6D+YghqkssBgyHSDu1Nx99HYB7OXZt8LrizOYxDnOvzukljki+FFqfishzgySKuLXLsJ87g/jThfxIopUW433ZToAOZoKbQGOsrF1J/IwruR34RlyuTvvax9ojnlMAnOfqOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661712; c=relaxed/simple;
	bh=XudJJd4XOmhk26ypsQpMMb/lzwssZiORriOrX5Ocrbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSiaoAEDmB70BPvxW8++RGziYUILRzPDEy5i4s0FIi/PGWUEyHQp/ve3SH3ua6emuSKbUyZnbbiGvLDiywAIyip8aDlfKr5UYac6dTZba+B63zMcpFZAt8tcQBPyMFPyDaBLWLffEcCelvdGGaJD528T4ymwaAp3lDVdTDi7rkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YSHo12rd; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YSHo12rd"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b0848b5191so21422251cf.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 07:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754661710; x=1755266510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cgf3Gf6pf2QyMmdIpvCgXWMeWxUvQmvcME2UoQnjQWw=;
        b=YSHo12rd43CZjqW43H4h42hhoZE0Xud+09tw6SvsSBoRb7hB8kynw5XuZmZEujxnso
         4dp4ibV/DHw38LS1oiLTtZR1H1mXcFQeUXB3STrQ9ls6TgB2p1kUPDsp2gVAjBcVo6MC
         ZY87Of0lUkgGaPCrGJRGNoDYDOvI8HJFkxolFIFdLpa0xqRXE31w2Rmmhj4heEjKwW24
         HGqi4f5bZXfFRGI/zJDr9kfPj86cZjfwHeXIEGou1GlTH15pBV/gMKkkAeeW2c11Sd8t
         Mck0ThFgWNTGZARQ3hlnbclT4AWvBW4nOJmnj5U+BAJEqOU9BRQ6pG4xnbHmdpHfTTpi
         mXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661710; x=1755266510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgf3Gf6pf2QyMmdIpvCgXWMeWxUvQmvcME2UoQnjQWw=;
        b=NKZULptlWQGeknSrEDGyiaMa6BS5tjHMm0fzt/XrnPeFIWMMyiNiKEiVoyzgo8LnUa
         8FTW507xsi+Q/jhy3iSAtq5oTGPHp4XTY46/IDNcXX1EEX8kAiNuRbtMrmztl8y/v1zV
         eCEnVx178Z3wkZ76f7foIgKha56y34dotuLtx+1mGKufeYEGT+bv3qS60TO3HI8g9N5g
         UxGFdNB9Y35ZEJRTr1q68oh5+mKmjWlliAZwfsIhrCZ1MCnV/c4WX5ChWxnn+LTFIp/Z
         k9J302ARs04T7GVunCtLMFtfa7TcVsdgYsl2phnT8S48UUwj1IDQx2iM2uzVJtHGgXZV
         isKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2N2CMk2MaKeK4soB00DQalYjMOiz5WVD5ydn7uNDsYMuZYwtUeO7OAzMv1+HheGI+1x4M5WwvdnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLgWwjKyW4pCgwKKpve2+2zYVCJw/ZKoHyRTNS9E47R1wCWGT
	JstTG/G/Gqp1pJ02fGhmDPE7dR9BYhU1TmHi7WAnJ4YtjI0HsNRx289JfuQ1mTEuDAYktDRI53a
	bSbEIvtiD7S/58Pt5ogu23iMzv3mYgEN8NrLS43EzaQ==
X-Gm-Gg: ASbGncsNJgYOKuwo2Yp4B4GYD7N+LNoZYx1pBqKu2zCAJfIgaSumB0NYGbcxP0S1sWE
	o5WrOuox7d9P2+JnCS2iuOAbNwSWVNXtykqdpA6vRQKCZs0nK2eWlE1P8gaC5nbDkReRAAqhoJ5
	DxziaIw0uqqY4fi3fZFFmzkySHky9zUGuWENIDWg9LHhq6dzXhffsddLklOLir+lSTrWOl0XWUZ
	tMQ
X-Google-Smtp-Source: AGHT+IEH1BqMSX1yIRX4eK9XjBPS6pkTO1kxH3JapIOH8TKb2ESrqoA/iZRqQ2exr79E4dgeMXF8CiLL82TWwqJhOYQ=
X-Received: by 2002:a05:622a:258e:b0:4ae:cc75:4703 with SMTP id
 d75a77b69052e-4b0aee5afb9mr42782921cf.58.1754661709835; Fri, 08 Aug 2025
 07:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-3-pasha.tatashin@soleen.com> <mafs0jz3eavci.fsf@kernel.org>
In-Reply-To: <mafs0jz3eavci.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 8 Aug 2025 14:01:13 +0000
X-Gm-Features: Ac12FXzfZzUeYL8qqgO-oYE8dxdNMTs6gp9itdpmGem1pHDL8sFl_NAXG2JwrAk
Message-ID: <CA+CK2bCqos=z0q+YsmFK_kFQ8PLyLQw32TkJB5SK2y4Y1kVErg@mail.gmail.com>
Subject: Re: [PATCH v3 02/30] kho: mm: Don't allow deferred struct page with KHO
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 11:47=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, Aug 07 2025, Pasha Tatashin wrote:
>
> > KHO uses struct pages for the preserved memory early in boot, however,
> > with deferred struct page initialization, only a small portion of
> > memory has properly initialized struct pages.
> >
> > This problem was detected where vmemmap is poisoned, and illegal flag
> > combinations are detected.
> >
> > Don't allow them to be enabled together, and later we will have to
> > teach KHO to work properly with deferred struct page init kernel
> > feature.
> >
> > Fixes: 990a950fe8fd ("kexec: add config option for KHO")
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Nit: Drop the blank line before fixes. git interpret-trailers doesn't

Makes sense.

> seem to recognize the fixes otherwise, so this may break some tooling.
> Try it yourself:
>
>     $ git interpret-trailers --parse commit_message.txt
>
> Other than this,
>
> Acked-by: Pratyush Yadav <pratyush@kernel.org>

Thank you for the review.

Pasha

>
> > Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  kernel/Kconfig.kexec | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > index 2ee603a98813..1224dd937df0 100644
> > --- a/kernel/Kconfig.kexec
> > +++ b/kernel/Kconfig.kexec
> > @@ -97,6 +97,7 @@ config KEXEC_JUMP
> >  config KEXEC_HANDOVER
> >       bool "kexec handover"
> >       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FI=
LE
> > +     depends on !DEFERRED_STRUCT_PAGE_INIT
> >       select MEMBLOCK_KHO_SCRATCH
> >       select KEXEC_FILE
> >       select DEBUG_FS
>
> --
> Regards,
> Pratyush Yadav
