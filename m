Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01F72517AA
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761405904; cv=none; b=sMPbOvi5PcoSntoM07hzByWJKJ2TmTGkFSmAdXlqSnSXGaXy71KH9iJHxZEnaN6ntXaRAD7iVre4U57Sf2TuEgb06FMDeAoj0jpQ5jrDfVCxZby61ju3xUSDAUjrz5ZlIlaAkyyylWKDeOYiufS/7QeIlQl1/FzaKecxqpGlJmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761405904; c=relaxed/simple;
	bh=xDRkpAn0D2lhlrXt3t3UOPRfnSga85kN6uhnRJl1ndk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+wAyYey5tnWp4PNE5ZaCpCtYTvCxrdl3UPmsJN+L88rQKqHE9igPVsOu6jakvrRXzLnPzqZKjk7c70+z9yVhd+0DOZOGdhsdumWIXjFPg8gU0Y9kQIc+79Y6xke/G+Hl1ZFG1xAsxR8koVBPRXdFQG00SkUyXVqZerEkPY1AMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=INt4IXL2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="INt4IXL2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so596234066b.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761405901; x=1762010701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEsLv/ORWjWt4JjusiVyw1pkRSWkY2jVnldvJ/kYxAc=;
        b=INt4IXL21VYqDx7iKJKvvZKQiutlYwBCOhjkiXC9yDBFUqb62UGDfYUksjAXFv0mcY
         XfiaRG4ZeGqwvGYfi0Z7VA+1ayJbFAnxNu1s20L5Klcur1fe+pFNyicBbrK5cY/fbpWi
         mO4SXc8jGKTcAkNBwkWzXRrPVgIzy0PLubo3najaSeYOt1qhQ6sfZ8YTOUtUOaBs//Hq
         F4okar97RHI6BlBxjoMFuYrIVmZb7UANxDTdvbUK2V6c+vYaACXe5gtHDLyyU6vQ98MH
         omz2/I7YSnf0qTo4PgAN/O5LyTMSVUsrkxFwETt3Zs+mltCFms8gkrp8Zkn0Qt5J7phR
         kGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761405901; x=1762010701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEsLv/ORWjWt4JjusiVyw1pkRSWkY2jVnldvJ/kYxAc=;
        b=qa3FPW9JXeNCDLXnHn/uwzkWS/x/b0YHtJ9vf31O0XYz6lHjvulUaFBUBAXE0EvoPZ
         5A8Et+8/928euwWx6MZkRVbzWoYmeZpoM35t4oUvrFvTSRG8AltUWie6H5xlN3YfZ+Dk
         p7VgHxbJUerKO6u7+lNy06JtNcumc5ly2+1BpZzyU9JNd5KTdTVUoleDwavGmCdC+m7r
         Hxj1GYTmuyQ3gY0snRvo4vHuF4/GTFnn5Msy6znviCH4gaEHYJ8Py4u1BWIHox9fMhyg
         FmaG2SQeNqL757ziUJbDiL42hFgH+n0O/DF9dNzjYZMcBtwb7vnFs2Eo2/VaBaHlBVcd
         1r+A==
X-Forwarded-Encrypted: i=1; AJvYcCUJpizOmoU00qQlqMGc1bAlYKtVXoyBj4JRR+g1LEc1TfOPKSPA6WAbAmdl7LdykP6ZSZLEtaphqhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQ3RK/EYCX6pwRH8ncHzPHAOdEpStnz7Drc5YIXPvzW2rsMlq
	qcRroxuRylrj7KbVBq8hioyRa+hV+Wgs2MJeHmcnYRVc9FU26/QRRDoAhhdvTATOf+MFpbqbFZL
	/Tai8ub8KdZgbpPWnLx+Bo1dZiqNIaJPtFGaBrhPF2g==
X-Gm-Gg: ASbGncvKa+Djf/wRP/eFdd1TyMcWoHcWF5WVkwk5EhwaEHJ8DJrnxsdNxrmB1Gw3iPa
	lbfm9VQEylMP4oGdFc761xnlz13DxfXP4Qd54JCCI1V+c2wdi5U/4bUNllY3uDnkOmVGj8TpW0V
	kIN6ufh6IMa8ltF1ttyxusCyfVfTdPznjresVxzdcHV+trz8yOaQYsfpeUlye5CKQJbkg/rgdtK
	40qGA7kN5oWk6KNISKdnKcThQy7s2X9hPweYEmfFuKepCxotZ73SurJvmWS+dpENJUa1W9obekp
	NuEddHYn2YTsrJg7lZT/JCeQo4Kq
X-Google-Smtp-Source: AGHT+IEkKuyMVmFsWXRY0bxtHWTNzex75v+WBGMxRJwOZQScs1xFZAgq+kDpvorbdJ+d0KcQ27kL7+tqDAzCdvkawvY=
X-Received: by 2002:a17:907:da1:b0:b6d:5e64:c36b with SMTP id
 a640c23a62f3a-b6d6fe9fac7mr565664566b.29.1761405901273; Sat, 25 Oct 2025
 08:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <3-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <3-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:24:25 -0400
X-Gm-Features: AWmQ_bkMrpRaMfcHcpe107aX1k_bm11BfLXJjxsMDuts5-Fo-hDichMUKRxipls
Message-ID: <CA+CK2bC5=rb1C6i5yMad_tG9JpbYYgSRxAX-vhYctuoLvcQbWg@mail.gmail.com>
Subject: Re: [PATCH v7 03/15] iommupt: Add the basic structure of the iommu implementation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 2:21=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> The existing IOMMU page table implementations duplicate all of the workin=
g
> algorithms for each format. By using the generic page table API a single =
C
> version of the IOMMU algorithms can be created and re-used for all of the
> different formats used in the drivers. The implementation will provide a
> single C version of the iommu domain operations: iova_to_phys, map, unmap=
,
> and read_and_clear_dirty.
>
> Further, adding new algorithms and techniques becomes easy to do across
> the entire fleet of drivers and formats.

It is an enabler for cross-arch page_table_check for IOMMU. There is
also a long-standing issue where PT pages are not freed on unmap,
leading to substantial overhead on some configurations, especially
where IOVA is cycled through for security purposes (as it was done in
our environment). Having a single, solid fix for this issue that
affects all arches is very much desirable.

>
> The C functions are drop in compatible with the existing iommu_domain_ops
> using the IOMMU_PT_DOMAIN_OPS() macro. Each per-format implementation
> compilation unit will produce exported symbols following the pattern
> pt_iommu_FMT_map_pages() which the macro directly maps to the
> iommu_domain_ops members. This avoids the additional function pointer
> indirection like io-pgtable has.
>
> The top level struct used by the drivers is pt_iommu_table_FMT. It
> contains the other structs to allow container_of() to move between the
> driver, iommu page table, generic page table, and generic format layers.
>
>    struct pt_iommu_table_amdv1 {
>        struct pt_iommu {
>               struct iommu_domain domain;
>        } iommu;
>        struct pt_amdv1 {
>               struct pt_common common;
>        } amdpt;
>    };
>
> The driver is expected to union the pt_iommu_table_FMT with its own
> existing domain struct:
>
>    struct driver_domain {
>        union {
>                struct iommu_domain domain;
>                struct pt_iommu_table_amdv1 amdv1;
>        };
>    };
>    PT_IOMMU_CHECK_DOMAIN(struct driver_domain, amdv1, domain);
>
> To create an alias to avoid renaming 'domain' in a lot of driver code.
>
> This allows all the layers to access all the necessary functions to
> implement their different roles with no change to any of the existing
> iommu core code.
>
> Implement the basic starting point: pt_iommu_init(), get_info() and
> deinit().
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
