Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508234D91C
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714603; cv=pass; b=C54KLD3nztSizUzqGWLXFB3O0+oay4eigL4In3LVz0DagoCRvR/447vyd+dlpaqlBB0vyAgyPimytx36QSXEdmGdcCmlcY/wYTyZHSYsR1kiGPaWFZeqm4oX6aILaH6W4WD/gCieKfHZvGywcd0K6hE6palmS6EaBCD2U0JEdZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714603; c=relaxed/simple;
	bh=48fVzOvLrZOQEbkvM5UMLnlpv+imRIa8TVsOVuFn/vE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jy/tv5+m+To8n9p1IW5QJ89fsaDYtDjz8vZtdN7lj/lwdTWka7Nv1ARrplSGD4inyXrtuq0WaKKaUTpcCgJYtaiDeU2Y+JKX+7gczcExC6j9Zgn9NQavQyID8+OrJ4Nz+t5p+Yo5wJfZBXhs8LugN3Dgvp8+NkLk7f3HulNCOwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=makCLwID; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="makCLwID"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee243b98caso433631cf.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 07:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767714600; cv=none;
        d=google.com; s=arc-20240605;
        b=XU81FuX5AynvWHA3lXkZZbRG19wqoR40R9Tk2nJvxvOvvSxCHBEfx+6SYn5pI2+e0P
         DjmfsQUIL8JApPphe9Ha+s++TsTCEnoRUS3iJn0VORPf1RW/shGXGft1Ls1L1Oi8typG
         KbPNts7SKAOZEkVnRqzPbILsE/sbu7FFFqhc+/Ia2ON+2dnyk4iuoDIoBKlqixWaabAx
         jP6+HWfxYLEpHiH8EvEdKXVeyJf1x4xjJvrlGW0XUNd8e9XTYa63R4h/fxqdASea/JnZ
         ozg3sjQpXbSA836Yw0OSu1dZ3QlT+9pmEOCbDFDsuc9u10wb+TvYbbB89jrkGf8l1XXE
         HT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u/XP2Qb+qQvDlOXEIcff9WsDxL9SWsqniXEl78vuPY=;
        fh=ingXBZcS2VYR6aCM0J3PgykK3VpS0PZZcbqFNgeS2rI=;
        b=Cx535xJZh4ihli1wz9bqIPc7E+kmz5kjkNvi6woBwLmwVBTY7PpJhvkriL7fr5drLE
         UsmFMqVSJcrA4doZ4bfOLK8uhQUp4bnajfeB6LEC1AgIUqsr75Jw4sxUmn/vAMBGCe/H
         Fukd5bPMdN5Lkx7K4p518tydIYl22/uNmLCmsmZBIGBLwo/Sd7Y7RG9yIkDNKYP0Xcp5
         ZoXRmwuzJLrW9BGGfrBzStIGtzJ66emsXUjFNDnDP6KtqO33X66KFBWhkwui1OBjxBFp
         Xeqw4zZodDtQhn9MqY1ip527F44okk87giMrYuhnUdgUCYcua6yxS6l+P0gOL0BAVC7b
         jUCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767714600; x=1768319400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4u/XP2Qb+qQvDlOXEIcff9WsDxL9SWsqniXEl78vuPY=;
        b=makCLwID0tBZD6xYrDBLqXApkldcDR5ysHDPk0E4GDCATsYZ4KIFTe+s2jo5jHFmpf
         bkWpPdFOrq568zhBTVAIpRsrKPUxseinQfRh4rHqZ2n035gIsIssFfy1z2590sVEPp4Q
         3GfSv0rbSRB3fhip4lnAuSkX7EaPB45HDZfXDeKzWw3tCrmYPsN0MmAouXM0wkG6yPJw
         WmiJDwu78T3MxMhdN/hGfmtvNNHMAGX2bh9JOD2PhL3JtO9OlY2fdPwXjUrOn4vEX/KD
         JRkiE3w/2boeq+PnuMvFJ98WRPPIywbxBxeVJ6EqT/m3OgXhT6afUnSAhFOZG5h0WVbc
         PhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714600; x=1768319400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4u/XP2Qb+qQvDlOXEIcff9WsDxL9SWsqniXEl78vuPY=;
        b=ByHFqm+I+DAbmh8IE0uCaLeoZbh1zZkWn+a7dtYgl6XdmOURdG0elr+lVgQZ3P+X0U
         FoduQNjuYRGhrxPwvXzyVPgYfgVAdXjUoG5Ukbo4uQTTaGgOicVJo0keXozCxPC36cJx
         Gb6XtwB4zFhZ11Dkk7X24O8kn9n/WSuM/BxWpS+gr8CPE4uRo8faMdepa9gwW9KI9uLr
         LM1lCCCuzd6MsZ5MdaOKb5mqWixHINrbs0g2MEaRdeSHlTBPoGKMhDw7+m6+Y0KLvtKu
         gFe2eck/e3JHhEV0xual8461Wrw34VKkxT/uu6xJ8Ej7hmkKY3kTsvTgUChHf3/tOoe8
         AQaw==
X-Forwarded-Encrypted: i=1; AJvYcCUDZaF5eWDMfjwI9AS3ig8SPfepwm8JS8UVQtBf1zwMc6wx2aArhwvLNJxx+2Hpqjx62KVLt8fHWz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhHSm1H1ZEX4YS6kW3FGq1TRTAneQ77y/8yVkBMViBLcWPk6M5
	1vZyRZRCHiMDi7r7kmD34SOFWlwX9IVUhL+q5zvrfX89lHVqKa3iSpvv8mGd1cTQeN702ijTbNp
	YspXmK/D72k7mK76PmiGuoWs4MXArVxoED5DCpjed
X-Gm-Gg: AY/fxX7Uprwm8reZ0Lv3h68BYfhkK/q4I0t7mwAo7vlDeIytuTfhTCZ0iKBdE8S+/uC
	5fdk/ea24d+WNq/SEir8D1nw2sK62Q6Fbm+YMtcbIZ32zwlGx7l3RAuh7uDYgJ97SReVcWqqhaK
	2mbbQhHe83IcPN73fZF5MKQaSiBizdwMldp+EdkMYV5HG4Tso5pnGTq6FFWebTPesK9yD740gHW
	5FtFVyerBjmcJ3tdR5Ni1o8sJkWA9kt/8w5TPKXybp//AZS5g/ZBGCKKS4YCRUEIquBPjztt31d
	oBjNUJqJqTnx8ilcuFauS5bYiA==
X-Google-Smtp-Source: AGHT+IHbCEXPRNDYInsMRbyk944URhHinQrSqdn9SMJ0HiaUkC2VNjD/GTcHUOOXarpMrOxvUsEyl1eweg53sx9OpUM=
X-Received: by 2002:a05:622a:90:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-4ffa961f4cdmr5690451cf.7.1767714600009; Tue, 06 Jan 2026
 07:50:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211125928.3258905-1-smostafa@google.com> <20251211125928.3258905-2-smostafa@google.com>
 <341bbfd9-e6bb-4d1e-b9c0-9077dc3eaba3@linux.intel.com>
In-Reply-To: <341bbfd9-e6bb-4d1e-b9c0-9077dc3eaba3@linux.intel.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 6 Jan 2026 15:49:48 +0000
X-Gm-Features: AQt7F2oA1CBb4GrIbCitr-B-G-VTljeq1aZHCjWlK0-2EsS6hRvCfN68ucTwj3A
Message-ID: <CAFgf54r76=RF0TAkJ42VDnRkwYf0=bjRk-pO1dq3zzvxGBThww@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 2:22=E2=80=AFAM Baolu Lu <baolu.lu@linux.intel.com>=
 wrote:
>
> On 12/11/25 20:59, Mostafa Saleh wrote:
> > Add a new config IOMMU_DEBUG_PAGEALLOC, which registers new data to
> > page_ext.
> >
> > This config will be used by the IOMMU API to track pages mapped in
> > the IOMMU to catch drivers trying to free kernel memory that they
> > still map in their domains, causing all types of memory corruption.
> >
> > This behaviour is disabled by default and can be enabled using
> > kernel cmdline iommu.debug_pagealloc.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   .../admin-guide/kernel-parameters.txt         |  9 ++++++
> >   drivers/iommu/Kconfig                         | 19 +++++++++++
> >   drivers/iommu/Makefile                        |  1 +
> >   drivers/iommu/iommu-debug-pagealloc.c         | 32 ++++++++++++++++++=
+
> >   include/linux/iommu-debug-pagealloc.h         | 17 ++++++++++
> >   mm/page_ext.c                                 |  4 +++
> >   6 files changed, 82 insertions(+)
> >   create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
> >   create mode 100644 include/linux/iommu-debug-pagealloc.h
>
> Do you need to update the MAINTAINERS file, since a new file (iommu-
> debug-pagealloc.h) is being added?
>

Sorry I missed this last time, that should be under the path of "IOMMU
SUBSYSTEM",
I am happy to maintain it, but it's up to Joerg and Will.

Thanks,
Mostafa

> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
> > index a8d0afde7f85..d484d9d8d0a4 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2675,6 +2675,15 @@ Kernel parameters
> >                       1 - Bypass the IOMMU for DMA.
> >                       unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHR=
OUGH.
> >
> > +     iommu.debug_pagealloc=3D
> > +                     [KNL,EARLY] When CONFIG_IOMMU_DEBUG_PAGEALLOC is =
set, this
> > +                     parameter enables the feature at boot time. By de=
fault, it
> > +                     is disabled and the system behaves the same way a=
s a kernel
> > +                     built without CONFIG_IOMMU_DEBUG_PAGEALLOC.
> > +                     Format: { "0" | "1" }
> > +                     0 - Sanitizer disabled.
> > +                     1 - Sanitizer enabled, expect runtime overhead.
>
> "iommu.debug_pagealloc=3D0" has the same meaning as "unset". Would
> "iommu=3Ddebug_pagealloc" look more appropriate?
>
> > +
> >       io7=3D            [HW] IO7 for Marvel-based Alpha systems
> >                       See comment before marvel_specify_io7 in
> >                       arch/alpha/kernel/core_marvel.c.
>
> [ ... ]
>
> Other changes look good to me.
>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
