Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72901F192E
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 00:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362047; cv=pass; b=RQjtH/7zB0oFhCimGR3ZgtWUnbrbmSr3hNWeIEx6clxxdVfY9/k63gm6kKBjpSuDEB5CenDBBR1+YP68PuHmClLqL7WHuFQ3wCPO/pJMGg/iSSBEbKdrsXIu0I3vc1ecB9uiNccahRKA2szsJsf4w1xoOEC0ktIg6WavamkK01k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362047; c=relaxed/simple;
	bh=P9DYNvw0pXgKNQlqCuTgX5BsLWxpM/GHGwCmn4gqBFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTjqacm/ymuBgAO+BWQuszGLxjvTpW0IrzU2hpYLvzkFe0+oJfNdM48shnW64K4nhXWoEZDfRyLAxIm9SxE3xamfxwaMnx094c5WkoSps/hGtaQBNGsSLWw+RHkzU1sKXvo00SIs8L3UilKVRlF4uFGijWTP55ypxFzOrE6e/eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Vo4xbcbG; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Vo4xbcbG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6630858b4ceso2315830a12.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 17:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773362044; cv=none;
        d=google.com; s=arc-20240605;
        b=giqm/b+blN9mW8YLok7NoQ5KNmdZpxXq5W4kaxxjbq2H2kjDMnjOAnHVBcK6kBvDa8
         kdVIIHzoayOkk8iR2+eUdOKwXAcegvPfXQYMfI0/BPsfRBUGvcN566sdUEGF17O9PfaQ
         KWvvdiLKsJ2UUOKENhE5ZhNUmwKFZVJigdVIIpRYSnTOsf5geGjsJKvUjdvdURwZKsX9
         tGi+6Z5m+lLvfmX70vVha7QUdARzei65eV5UwbyclXpq7WClq3AXYN/QUq1I5Ot29Py7
         V+y4xt2vpKPUUxA1UwMt29XKUqrMfDLk/pzRsASufz3gMfGD3flEKCLthywKl5oBrtec
         6eaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pnJL3Iw0wwI9nfGsL4UNGadpWjx4M7Li4XWaHu9e8Ms=;
        fh=l0RWqmfN5pVRj2sCwL2icTcvoaV/qym6yxcsxew7ZQU=;
        b=jfyX2/t7DiCuR6TuzjYuxkUtpL4YP1478YbaCgdSYxYimVBx8YY0ubLE27MLSBdM/Z
         /+XCpUeahWb670kaVeG5LRKeNiwLpttDoMbwW6CTQjAXL/S88SkeKPTel7o3hwQ7bWbl
         deTySS3Ahnx9F4bhHfI3NF8b0WM7ZU+/BqIF78Dc1O3HD0qwZwKUs1FDaAFVvbN90uKE
         QxCayfJz5zQ6zSBL7uY1xrLk4vZb+J+hFHH2zOBUJskF8hpptxZ2pE7A6X+Bz/gyJS+C
         X4wvmk7M8JrogrNHCcFXPcTrf559xm6LswRaokZAhGMW8ptzIoAPwoZQNrspNKZ64zlZ
         3WcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1773362044; x=1773966844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnJL3Iw0wwI9nfGsL4UNGadpWjx4M7Li4XWaHu9e8Ms=;
        b=Vo4xbcbGVbDxB47s28JvwRyPuGtfhUdWydhmCZfZFIXwIoa4Nolcq1178Ix2aIR7FB
         r8v2I8q08uXsv6RRbkQyx/J8IkETMYbND4jJfuRMx+DOsB9K/PAnXSOpk/xGe4+FFVnY
         NPlR4d3w/YeSU9Y8BQRRUEGhqf6rDJX+b/7EAqF0bpeIputpz3HhnhP9env9yyvlcV8M
         6CF60BZb/c/ASGteI40pQ2Z/NPISEnB+B2jy+zyZAowFpJq3PvcpHATD/DnA6DihYKpc
         S1c3ryc+sbCygNaePFMbd3OB4TYVGxuhDi4cyqcpW1WLnQsu9ucW9sm5xTK7TLg7cS3e
         p8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773362044; x=1773966844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pnJL3Iw0wwI9nfGsL4UNGadpWjx4M7Li4XWaHu9e8Ms=;
        b=HbQS8Axv1bGLsdyTcUcUckbdRz4mAIeE7xQgjo5QACgin/ItH8ua4QwqZK4Mdyve1g
         oTHbB5BAz7MTwcyigD1ZxqdSL1zvGtyKhVxGoW+ibqHNzfbx9pNqOJDDEn9sYumOB/o2
         nwC4q8M448UmEx7BSV9fOGLkaZmRo8eAA4z9OROtRVA+IIGzwP2XOBync/A/KyJSRhsC
         i7v+uRLIqSjqNpvuHpqXbzSpUJEjqYCzEFOE8BSIgPis/MJkgTDd3ySNlU73CeeU3dmB
         TiHFqqWNMaytsPsiv/9vw6HKOsfD+upXzBdGzP5YRL6aM7mw5YZNfSwDkjJQt52FMV4F
         KXIg==
X-Forwarded-Encrypted: i=1; AJvYcCUNfdwNTHStGwq3b8y1nfCsgr3ATIas+6b7TVCLDX0VFOa0MMauJQkJAvlvzHuhiSYplK9irzM4wRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YymuI89ifft5JTH2cK6Fm+pONcduLHfRF+lVryG4vNZUttC4heJ
	GwPlGbArgbvwz4O85vzHD9UdT8U+NJOe+xNfTKB3+X1LBIqr6hf/Gp9uI10dcEyHhz1OO8dubmI
	1oXg0Rr1UlockrQu0rXuEPeTCpzdNIyvT5G2a4y549A==
X-Gm-Gg: ATEYQzy37ttI1Ewtfj5gleH0Fvo5O+ZwsFkX+2kcgfV8O3IZpHNsg4ZJaEoGGWkyN9E
	4wMW9RSyWfXlCB7Wfzh0mD6hEo1rdFdP2y6J8utZ54gF5ZMGKVydUI087fR+QcvptgjoEX9BaVi
	JJwR1QRZRW7Wt525yGvHvDJNiK9DmKu8/je+7KAHAI9I2ojaO4JBCtfSbBFKPxHHu1bmut+ahp8
	M3/QkN2Pmq4bPXIcS3BkpdglOE0rcCuLikW4v9Eyv19vxl7xudSWh//BmxoaPMGBqf2+pTh1F4o
	t8LW0YGMRcomBBqmy13zeZuAI+CUw2UYub1llw==
X-Received: by 2002:a05:6402:3486:b0:662:e094:8dcd with SMTP id
 4fb4d7f45d1cf-663bb3d3be3mr643429a12.27.1773362043907; Thu, 12 Mar 2026
 17:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-8-dmatlack@google.com>
 <20260226160353.6f3371bc@shazbot.org> <20260303210733.GG972761@nvidia.com>
In-Reply-To: <20260303210733.GG972761@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 12 Mar 2026 20:33:27 -0400
X-Gm-Features: AaiRm50W9P4A7h3ayFJS5r_ZVIe8OM2EYEDEiGqBav5AUONhmByKJOVge3skGH0
Message-ID: <CA+CK2bDADhFcMVGoJew9RoJ-DsVhYhiZJGJVwfzTBZdGX++8Ng@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:07=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Thu, Feb 26, 2026 at 04:03:53PM -0700, Alex Williamson wrote:
> > > @@ -203,5 +225,6 @@ void vfio_pci_liveupdate_cleanup(void)
> > >     if (!liveupdate_enabled())
> > >             return;
> > >
> > > +   WARN_ON_ONCE(pci_liveupdate_unregister_fh(&vfio_pci_liveupdate_fh=
));
> >
> > This is propagation of a poor API choice in liveupdate, the unregister
> > should return void, it shouldn't be allowed to fail, IMO.  Thanks,
>
> +1
>
> "destroy" functions that fail are evil. :)

Generally, I agree that unregister, free, or destroy functions
shouldn't return errors. However, this situation is tricky because the
state is controlled by user space. The only relavent scenario where
this function fails is:

"-EBUSY if the live update session is active and cannot be quiesced."

If there are active sessions (incoming or outgoing) with preserved
data, how can we safely unregister while they are in-flight? It is a
rare condition, but since the user can cause it, they need to be
notified that unloading the module right now is not a good idea.

Pasha

>
> Jason
