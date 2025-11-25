Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7002773F4
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097312; cv=none; b=AQXXkGxn544L3Kx2lAXupclaCrB+M2PkuNd3+GDnDTGEOeP4Drt49OZ0z+RnLjheWvB/zbvo0h5mie+d58lEW6R6DBJEjl+16Ej+fidvyfTsEW96aos4q8Ls1SmQoQZQOppvtwuWsv6tI8iQHSzlzz1rQYGxSxwG87OP2vyIizc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097312; c=relaxed/simple;
	bh=MOyjrq9o6VhvNdGxsukEhpqXDWstKGHoaaJHOE/8nqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IO2cAMA9c0E2Wm4YqXpTsxZfawT13+26ChBs0iwbPMrBisdYfrMKvlLA3+Dv4ansHbl/C8QE3xnFlIZ851TzS1E5eVjRFPluhjba087zJI22thZMO3X8veCt706NsN6r/EeWc4URNYujIjixpKDJQpvZ5VB3AYWguXZ0LA/SJb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gaz/sIUP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gaz/sIUP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so10077153a12.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 11:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764097309; x=1764702109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+cab5OoFiSAnh0Rr1KkIMrwuY0x0IPZJPyGZAN91W0=;
        b=gaz/sIUPnVyEAbMa4nHlq67irq9G8tHlouy1AmrGF3ax4IsbJHIwRGSpkPO2NOm5xc
         PaIQ6tRg6jdyKqWAVpdIEIAJPw3+zg9UedPjStCHsaRdpCFtp0QWKacaMO0aP4kYu7/X
         tyJ8PwlLH6lGzh+gUVrLUF+PjvaN/dAbxyKS3LXsAlYU7m4VBzctEH5lSVzuLh5DVAIp
         TmTvfnSGC+pufTBskrZNocvBbRnKsOq5TC2eTr+gMCaRYPE++dR+G3n4Syt0bPQsUtqK
         Havf51x/0gdPFrOa+AqrmtuDnUdy7EhvCSd2CMX5ZAVIE37MIJVFMiCobFtlLSnUWg/v
         gOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764097309; x=1764702109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+cab5OoFiSAnh0Rr1KkIMrwuY0x0IPZJPyGZAN91W0=;
        b=iCDJVyTVLJtGCPMr0FgSZOwn5N9U7awIgRolrFhG0NP+jrtuiLSrSEMIiCEib/tOVI
         I6rqpQ+rmgJzTfvCYXF6SOYzym52fsnO6mMTD/3nj4SioZx52idpJtmR9VSQ3MSabSeC
         mY+pX/ZJbdcsYn09hutrIiZ7ipKZ2xRNC/1AeB3HUHWWNcaSJRvW5DMu4kDZDRHauPM6
         VXLmKJTmn6Nwg5V5zB/5370KEIJFTpcJt2OmCRL0KCwWV7IIYRuprTqIYodOkwB5Z+gB
         GcsKbS3uayFiwjetWflrthd+Nw7+FZomu6S9TatXif2Z06YVDcijcxHEfesWFzF7mM4G
         z/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWLPd5MIY2osS3F6bHx6FQ0tw50KNQY2BLtMIonXJZY6tBiwSyI9UDtoud9ZKNj7gAda4oPHD3Pdl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YziFabCrsuSSPZ5FhBNRt4K/NWm7SzRhfo16lnZq0xEYYD+igKo
	JDp0iuj7BjhmeBa0tk5GV9WBCJB3mJpitrmh0cjbewsfTFKoCeLtTvHhSmTaVlnzD8NCBC34NaN
	xGONq4J3aOPVj3fPeWevnGduCY7PSSKNtBq4g+k0cqQ==
X-Gm-Gg: ASbGncsfqoCEU9hpLLv+y4lwUHE+rk0+H+9FyTeI5lBswrDl5CKGkHGll67Ey+TbZlu
	qQ33btZSS1LfF1fUSAfJuwiQQU9AgyVWnot7kDlcKlYP0nDASbvnae0cZ94WSREpoZ4dkL4YCq2
	mh7Flu7tymsW1ocMA9uLqf0JU7eIB0WYjbPocWsXIvHr8pFz6dDK9+WNDntIHQrcTgOwyvXPCNC
	MGE4o07I4w8VXtpDAd8tmPad+lHF9AjdMX6eYTc6IvJw+Eub8P0m4JWisVLlXLX7FiW
X-Google-Smtp-Source: AGHT+IE7rh2493kGukystiIbPKWb0LUwVClME9rpzIqFBySy1Ee89iOW2xWboR8KNUdfVwKxse2RLFaevMjMIITj+Qo=
X-Received: by 2002:a05:6402:5252:b0:643:4e9c:d166 with SMTP id
 4fb4d7f45d1cf-6455443ed4cmr14156611a12.8.1764097309246; Tue, 25 Nov 2025
 11:01:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
 <20251125165850.3389713-3-pasha.tatashin@soleen.com> <aSX7Nm_yrXHeejQU@kernel.org>
In-Reply-To: <aSX7Nm_yrXHeejQU@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 25 Nov 2025 14:01:12 -0500
X-Gm-Features: AWmQ_bn2a3c7qeqfEVEla4N9ePeEsUIzOpDhVQeyvGV93y9dTtTiY8YHmxuVAOw
Message-ID: <CA+CK2bDJ0QwbVi07A2tAohceuOur8JNp2Dut3DEZ5z4EFwXz5g@mail.gmail.com>
Subject: Re: [PATCH v8 02/18] liveupdate: luo_core: integrate with KHO
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

On Tue, Nov 25, 2025 at 1:54=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Nov 25, 2025 at 11:58:32AM -0500, Pasha Tatashin wrote:
> > Integrate the LUO with the KHO framework to enable passing LUO state
> > across a kexec reboot.
> >
> > This patch implements the lifecycle integration with KHO:
> >
> > 1. Incoming State: During early boot (`early_initcall`), LUO checks if
> >    KHO is active. If so, it retrieves the "LUO" subtree, verifies the
> >    "luo-v1" compatibility string, and reads the `liveupdate-number` to
> >    track the update count.
> >
> > 2. Outgoing State: During late initialization (`late_initcall`), LUO
> >    allocates a new FDT for the next kernel, populates it with the basic
> >    header (compatible string and incremented update number), and
> >    registers it with KHO (`kho_add_subtree`).
> >
> > 3. Finalization: The `liveupdate_reboot()` notifier is updated to invok=
e
> >    `kho_finalize()`. This ensures that all memory segments marked for
> >    preservation are properly serialized before the kexec jump.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thank you!

Pasha
