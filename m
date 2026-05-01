Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B04014B2
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777654677; cv=pass; b=XqWbCQb5+U1S/Q6XuUOBi6BO3drnRrLzocZn49tHovuVbBf0MSh/lLbMFQu9Z3XboSVYRVh8BHn2WlxUfmV1uCXPj/ANurG8AP3DPBBhmM2qZ+3fpH+CwOexBFfzKG5IRw17oc3vbBhBVm8VH5HVp+f10bVBje43Lqng0MuZbog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777654677; c=relaxed/simple;
	bh=bKdkMIOKWZNneVM2/reuENwleR9x2amx9Y684oqA2m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGBgK777YqPdyeVtRv29mkRePIrmS+/daGCXIoNYvsm0PyWxFmi3hRot0bGLy/+m3X2C1r2d5nRw+zfjraevweslv1HtJYUCxJAH7hZapQtwkldSyru3Q9BizKXwE3353S0b5VEO2gZFTYSxE6DPyIqmLoGphFCCwkFNaseuV8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rwsOvsa2; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rwsOvsa2"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c726f46baso3325584c88.1
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 09:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777654673; cv=none;
        d=google.com; s=arc-20240605;
        b=TAT1JrMF+56Qb6rIMZq5gnl+8cdbpLIj+zOFOCtsCOSBHfjGaG2qZ0AGNoh+5zIRrF
         E4L9QIP/X8y3UcgwOnHwTmWkQwf8c/AFTxc/5iutsah4Fy5OmLRR6TeM5hpUvgy76pL1
         gzG8b43YOtR9eUU4eVW6MfL/h90C23YiHmk72fGCfcPjDAcPUGzsJf8KJxDnaDonvd+H
         4s8SCXtRb7LKPYGqYn2mBSzT8StXx+LYuKzFxGWyWN8EE2D+BrfbP3seqwGxbaMuWqxY
         QcBR391iV8ztFB9iM74mMoQMKDj/fl2qdLF4p6xx+Dro2pfN+WAXM0VwaCIIZwixhH3m
         odog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G34ikY2DD+u+VVE3dDOd4ruOH6p/Jku1HJ+Euceqccc=;
        fh=mcs5gsV8HClEJK0CX34JAo2tS63owm0G/X2e3x9Hb6k=;
        b=LJVDCQv6sabCXWDpUO1hqj3KAe7jfsVeO6rfc8YUx4YSwCZWidBzCnj3x1mcNYEHWC
         0gvNV+ox95R6cS9yMsa8mfp8FeotJgPo3fcDJBFmG14YmW3RPn20nbgrYz/njyKlBGQq
         UxdcOTc6QdGh48tYmzsNY/bmUlEdutXNbw/h/vYa+egCpaAO2Np7UPUAczEswt5RhWRb
         dTLOIT3nN8vBXM2/RztYpEZlpksUnjGSSAu7YtBw7H+XGg7ZV9fVegCoeBYb79TMFViX
         cm4TuBs67KlDVfkQNtsnW6tJ45pu0UybjkboaaFQ576MMGJxRUtXhTjPkfGPH5LYnxyz
         eunQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777654673; x=1778259473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G34ikY2DD+u+VVE3dDOd4ruOH6p/Jku1HJ+Euceqccc=;
        b=rwsOvsa2I5764eUV9LIYhn+wKeG7zwNhGRcaNuJ1SNAL/bTp+ULAhaA7vcEzUCvmVG
         foDyFl+s0OFroOg9OfYwhGrm7wHYXILuRvj40xwJtqdaTVOD8HIeAucvHeP4FNPSCevW
         6rLIAaaUliyCA+5E3L7nhEpiBWZd0uR8o2SNp+tOC5dNq5xqWRWceVRyYgtyCLkjgDaO
         oNdvk/DF59Kgy2g18XdAOQz3eisALDvtvwE9rQtHqKpE5fkLyvYOAlSsD9uzI3wgMSkX
         c4yczDOG6Fb4fA72VhecPQ+79DyI8VJGe9zNJmPal45b0hvjlyd/EnzG6oHlt3mqds3I
         jjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777654673; x=1778259473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G34ikY2DD+u+VVE3dDOd4ruOH6p/Jku1HJ+Euceqccc=;
        b=Vsu05ORYWZHH5Nene8efLVxDGQxxO0yti1DJTPriJbaZQyB5sGpUcEL2hUXM6YVzMi
         u92XoNq8gwE0+gyv8capI6srn0tfRjemgz+s+Mb0JpLisZ2oCVztbWp+Pk0It9gT9PoZ
         b/88RHwpI8P9EmPjoIK6zyvIj/Jv0LooRidjEcHPrPkx5kogQodpdnh2Eg/fT+Vxf9U6
         b5vPgwJcvUJmV4CxcHmEr9i9xyzgM6QwzuNerxZUoRz+F1HivZ9X+CsW97it2QBJFg5a
         Q6WIhFm/6Ki0EizZDoE8vTctiTnnBbWVzf89y47j6vTeCkc3h5osX40P3XMS5CiH+0Tn
         67JA==
X-Forwarded-Encrypted: i=1; AFNElJ/NpkzzpPL/UMmgNXmP2EdOj1o+6bnUsKbKR0qDofUjoTOiw/yHuP3Q4P+KtuolioK8DC/+cjfWt2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEqLL9JR8qznOJU6tH9JQqk7hSJEnS+UXs1XZph8MRI5m2/vmT
	QWb9er4l7/X+c41lQLWsd0sxOW5UC2j4QL9sLOiU4Vc6CQ9qYjY7KWw++4htRGgfnuwgoZg9kpA
	1ss8lbeUWzPfDi5CYje5BdLjKirstxmc6waXKcW+R
X-Gm-Gg: AeBDieut1rXS8jVgaJ4dm9miaD7jIMRpi1XLKBlwxZalMQIXNyHS8O6i9E7f4yX6M6J
	tN30z8+Puh93T8YvBQ/d40Czt4E7n/Zl03JE5WnNG4cSrV0UlhsO61Iw6hSoCWPmAqiJuy5xPDX
	uKabBuhpPfsjF/YSLs9dqd6t9gE35wlRFQ9hHDIY1JB0rHnfQexsTBEL238urVSTv69lNhyKInw
	rcjXWNL4SwImVXDrSkfnibe5BfDiZ6yBh4AwtdAskC1F8YtinGF7wsSfOUFVc1E+JHSs60P7mDH
	2yyZtBwWAtHMhvvuHAOuMU2z0qWeVg==
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id
 a92af1059eb24-12dfd821474mr32517c88.21.1777654672480; Fri, 01 May 2026
 09:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <afFHC6C1Qbwio4pH@google.com> <20260430210642.GA439800@bhelgaas>
In-Reply-To: <20260430210642.GA439800@bhelgaas>
From: David Matlack <dmatlack@google.com>
Date: Fri, 1 May 2026 09:57:25 -0700
X-Gm-Features: AVHnY4KFLnH4p2pRBeiWD3uz1DZ5zLD14tslYZKT6G5Ma2DKmFI_8zfdZMWusuU
Message-ID: <CALzav=exRqf3XZWDwUx-OXp8TgzpmQ-iUTixpT4SVRk8nxctrQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] PCI: liveupdate: Set up FLB handler for the PCI core
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	iommu@lists.linux.dev, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 2:06=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
> On Tue, Apr 28, 2026 at 11:47:23PM +0000, David Matlack wrote:
> > On 2026-04-28 05:50 PM, Pasha Tatashin wrote:

> > > This is the way we agreed to handle kexec changes: Baoquan He is the
> > > maintainer, and without his Reviewed-by tag, we won't take changes to
> > > kexec. This is the approach we follow with MM for KHO changes to
> > > memblock and memfd preservation, as well as the upcoming
> > > hugetlb/guestmemfd preservation.
> > >
> > > This is also the approach we should continue using when adding LUO
> > > support to other components like PCI, VFIO, IOMMU, and KVM. It keeps
> > > life easier for the core component maintainers and ensures we do not
> > > regress LU by staging everything in the same tree and sending LU merg=
e
> > > requests from a single tree.
> >
> > Ok it sounds like we are aligned on keeping drivers/pci/liveupdate.c,
> > include/linux/kho/abi/pci.h, and Documentation/PCI/liveupdate.rst in th=
e
> > PCI LIVE UPDATE entry and not duplicating them in the LIVE UPDATE entry=
.
> >
> > I think the only open question is what tree to use for the PCI LIVE
> > UPDATE entry, PCI tree or Live Update tree. You are proposing the Live
> > Update tree.
> >
> > Bjorn are you ok with that approach?
>
> Yes, I think that makes sense, at least to start.  In early days, it
> would probably be a headache to coordinate LU things across multiple
> trees.

Sounds good. I will swap the trees in v5. Thanks all.
