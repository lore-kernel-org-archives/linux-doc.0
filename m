Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208312F7442
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108320; cv=none; b=EC3cpWQqdFcdravBeu2lU/X0vQjlPJd/SdOmB5VWSlgXu+p3KRjxvGHpj9R6zjMRUU8VfPBSJUFlXn1r09Ke3HLsSkeftgH/TyCAs2Y2o2Phdf3cBQsUpRiy9SeTrlTJ2JxqpqjHBS7TUvMQVz8FPkNJ5FfGpdluK9UZDXnkesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108320; c=relaxed/simple;
	bh=O/f5MiBij3IECEF2d6NbqhVZBoXbyknaX3YNy+v2jBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BElVDR8dtjr09qulPrkfPm8ZymlGDZhEZIVdG/3qoE8eawh79b9NlBREUEx0q43T4440DD6AeEZLLf4I8VqlIKsa2KRxRdVndEsueCLsUsltMVLS2l504kroqo79shnHtFybLFXeupi41NCpbhWO+CR4PAGbkdnLufDpBRozMo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bFoqyy02; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bFoqyy02"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4da3019b6b6so19869631cf.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1760108318; x=1760713118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/f5MiBij3IECEF2d6NbqhVZBoXbyknaX3YNy+v2jBg=;
        b=bFoqyy02oYGr/LuWsFyi0W5Ej8pKXhjqyohD00Z5dbmSNvYpgSVewN3J+q15yRc6ii
         69LaSyM2tnR+luiCcl5eZPTkuEaxMlBkiqscmQBocaCErkJ/8uoJ8JQzcs/JRWsBs492
         ZgPrk5u9q1Nk7hg3EotW9qKnKWO2J2gL22sOWZM97MJcIR6WyTyUXzhBNsJN5wICsyuR
         jr0+y7OHElysr7a1Coplm6vDUbPt5vsBjlh30Ozonuo3yKa9UDglFAxvSAn3SFNb9k0+
         iE+F9gR9VJLEooADnWPNwfzCIFrP6cM7wD85seJ/G3+4aKMou9VK6t3t4TxBQuuxR0l7
         xq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108318; x=1760713118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/f5MiBij3IECEF2d6NbqhVZBoXbyknaX3YNy+v2jBg=;
        b=LHPfyZQL0R4g2giOWQwgNCF/+n0pAiz4MxFZ/hexxhyMpnY+bAW/nJBB0j8fGiw0cj
         BzdwKqcJlBIlxJY1Q6Zaj6YhZd1V/tVs0dplLik6xebFWbqzR6yfaacQCQEQKMbjHBQO
         3Z0G1/EYyMVWFM6I+zRt+T8BMTvv6+4DFgQx+4HMf1w/s7xu4lGrUNV50+mz3nmXa0oJ
         8eKlTxdYXp7uqOOE7DgTKHTOyYPrwzMs6xewc4mFE4SItRsCGMkPcdBXBf20pdiIUolN
         sFf8j0uqvFFevOjsmodTOECFB2vBBqLL2x2FVaMjGzzLeUJ139kaJhHI2xuVw/lap1Wp
         gnMA==
X-Forwarded-Encrypted: i=1; AJvYcCWfon+5dxuRhQO3InudNi9uUV9kVfox/EWlSe33tnntLoz9j0Du3Bvjn00l96wBUWKxEr2z9TT2Ej4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCN7Tfen7V3CvMrO1XiS0JCGP/3yZFjoW3n3K9bZiG28eZZyN4
	YdP5PNTeTEUK9Gfocp2BzzlqNLd1vxzvuaGJf7bsu3pOske6Ovy4Hr99WZKqGdIQ7DSAJSgrQ/H
	HhQQtnJ8VY+PRbd0MA7auFKgukNwbU8tec+CqovLPdQ==
X-Gm-Gg: ASbGnctFDKDpVn4+9ybJ7DxIyi4jqT+DKPaKd4h7HG3PbTUB3NzYCUuqyPeDpWYeIR7
	JdNtIJE7S3HFJjGZXg4lV9ZwR7eUs3ZLnDfDe2HKXt2Fs4DfMEWshO+hHa44z7HdMnRHBtrS9D7
	Xnsi8e8Bso3sxZ8VD/SX38erA+I6bTlo+JRcb/oL4G3M7x3Q0l74X14NjdEDmeMbBr3o/ISLzfa
	xqpMZRBg+ALUZq56ZeVvtE=
X-Google-Smtp-Source: AGHT+IE0WXDhjauHLcC2POBv0t7LgQCplfzbTEHy7h2aL8mobxzYVpt1EHLlI6ZDdZuKo41ZojriIaW0+E5fBHESUrw=
X-Received: by 2002:a05:622a:90f:b0:4b9:b915:a26f with SMTP id
 d75a77b69052e-4e6ead514a2mr181154551cf.52.1760108317513; Fri, 10 Oct 2025
 07:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <CA+CK2bB+RdapsozPHe84MP4NVSPLo6vje5hji5MKSg8L6ViAbw@mail.gmail.com>
 <CAAywjhT_9vV-V+BBs1_=QqhCGQqHo89qWy7r5zW1ej51yHPGJA@mail.gmail.com>
 <CA+CK2bAe3yk4NocURmihcuTNPUcb2-K0JCaQQ5GJ4B58YLEwEw@mail.gmail.com> <20251010144248.GB3901471@nvidia.com>
In-Reply-To: <20251010144248.GB3901471@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 10 Oct 2025 10:58:00 -0400
X-Gm-Features: AS18NWBORXQFPGvPP__b4olxbKs0hTzftz4XLJRMqdjSudzyOrwIdA4I2ICtXVo
Message-ID: <CA+CK2bBxMpb=jXy3-i19PdBHqxLoLrMMg1sOnditOYwNe1Fr+w@mail.gmail.com>
Subject: Re: [PATCH v4 00/30] Live Update Orchestrator
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, pratyush@kernel.org, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
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
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 10:42=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> On Thu, Oct 09, 2025 at 06:42:09PM -0400, Pasha Tatashin wrote:
> >
> > It looks like the combination of an enforced ordering:
> > Preservation: A->B->C->D
> > Un-preservation: D->C->B->A
> > Retrieval: A->B->C->D
> >
> > and the FLB Global State (where data is automatically created and
> > destroyed when a particular file type participates in a live update)
> > solves the need for this query mechanism. For example, the IOMMU
> > driver/core can add its data only when an iommufd is preserved and add
> > more data as more iommufds are added. The preserved data is also
> > automatically removed once the live update is finished or canceled.
>
> IDK I think we should try to be flexible on the restoration order.

It is easier to be inflexible at first and then relax the requirement
than the other way around. I think it is alright to enforce the order
for now, as it is driven only by userspace.

> Eg, if we project ahead to when we might need to preserve kvm and
> iommufd FDs as well, the order would likely be:
>
> Preservation: memfd -> kvm -> iommufd -> vfio
> Retrieval: iommud_domain (early boot) kvm -> iommufd -> vfio -> memfd

At some point, we will implement orphaned VMs, where a VM can run
without a VMM during the live-update period. This would allow us to
reduce the blackout time and later enable vCPUs to keep running even
during kexec.

With that, I would assume KVM itself would drive the live update and
would make LUO calls to preserve the resources in an orderly fashion
and then restore them in the same order during boot.

Pasha
