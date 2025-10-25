Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E82F302CD6
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761406844; cv=none; b=VBgumKeulBMBpaQoBV+aqsRuKYm7q6uD8jhZGhDZm8RPBxh1ThlXTSo8Df3saYPIpv7r5pWLEnxmvnIsYlLhSuD6v7q7oHFwmL1/sH4buZ2jMftrCDZh3RJ7Xr00r/aFe63QBDdmMPn6KIdz6+17eiRxSopsZCb1WtDvMSyO8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761406844; c=relaxed/simple;
	bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2S/LYoP+ZA8Pvk8JiOLn8QbDYL23UTIU6kQpbySaqpcqRu2rphQRbMsiuCMSx4JLcRAuzkYb9iexKtYcwiMF9t3kxQR5XbMPiaYcZZPCVFwzDxeDezNXoO35X8cKCtMVIIBa+zCwhyTvAAE849SJrms8pvG5HRnXlHQ4BQGPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=CF9FcJJ2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CF9FcJJ2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso5056487a12.3
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761406841; x=1762011641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
        b=CF9FcJJ2OewgeQP7WyxBZYYfnEwmZ+nkpezxtdSQEItAnoc7TKycpodGV1UvYWdpcN
         PKJj665ea+ijpXk88pukZgu4d/Jpwpl4sYbT3rSGMwtGCDYsDqObUVWucps/NcWzlpvu
         m+K3gCpXJGJwtUJGTQNnywQ1TYEkfS+syDeS6wuJ7px282/ZNy/n6tSz49rYZH2bj+49
         XKsqsLeDKpYV/OmH9Hj/V/6skast6sLChGgxnO0IGr2Z/JHMF73kB63WD4zr2OpF6KJF
         LPnicjcWcsXh98d5ZNSiz459c/RzSqZauQJuSTivaBn3D1S5RFPqlPhuhHtkur1kXa7u
         C3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761406841; x=1762011641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
        b=SvcLAAu87yeuT6R8sUXYNOgyhHvQ9mLiBRDNOhUMJv7MLOj48CAvGV1FD6Gp+s0OpC
         D35hgG2oAGtBJIk02hz0xK2dbT0889rlU7Eir9z5YmlKCebCyAO2m0dlvFxaaWQhTBmI
         ANH7lWZruG0kohk9OhfrrOzF/coXR5TZvD3IXyIvfZjJg0Qv9bwqGt0dSoYJdAT39Jdt
         RJ8QUbO9Sc3HyTN3GqY9LYPdo2XxqV4vWn+aq+sCAgkC61ohTVI8Ke8MINDlpJJK7CPC
         yn5/LM0Rk17EQli7oG6qKNLxNWu5zlcMuV6egtbM2PpahZnqOd3x3WcOzIf76Mwz2SGA
         1+/A==
X-Forwarded-Encrypted: i=1; AJvYcCW0+00kuLlcLDYrwmAI4+O8JnQTWngs+HymR9VBY19f93dRq6RCFRYBzAYjGESxM7eZcN+r14Aw44g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yMFKyJ8TMFdSdeoZF2xHjkC+W3ZYdkmMovzmVc65Zz+F/OTL
	cq2B/wuDJCxuJq24aGWoiucsSUPeFBNG+DF5intUZL8yleBVTrXKI+VHGdpEU2YB7aZPfe/voKw
	+YcqWJ0VVo0holRemDbDavSRER3nbwQcWVajGod2J6g==
X-Gm-Gg: ASbGncvcTX8dYGo3NVwS91WECPu0H7PnsbAw51Lmy/OY+c+cH0OW8A9CgaO+uRSpxMX
	TSiBWXR/Jc69BOZO4njY5ChhzJ2Bld5fs7p9Qeq2iHK2tTSjSl3wKcvLv/lmIM078ziZydyQdT7
	1Hu92zFsl0Qi6lZpCzrmy50Ye8XhfO4V17QldrOv/vdWYkklZUVbFRraghoGXSdJvT0A5dvjd6K
	RmYqhCPzHQhBVCS0VmfWsyP6QdaZmuPcoru/ilpjNTij1PqprngA0o8/DFKFntkGtEvZmNIdmyV
	EY6meHj8bK/nJmwfiQ==
X-Google-Smtp-Source: AGHT+IHusR3pR0UReEeTXHeTWS5omMas6c+gaYiIEsLmjRg06Miw4AMQcuQX3fi9PVgOyyAmpc1NpRtLuc0jLuFpHKE=
X-Received: by 2002:a05:6402:4504:b0:63c:103b:e1cf with SMTP id
 4fb4d7f45d1cf-63c1f584283mr30192670a12.0.1761406840700; Sat, 25 Oct 2025
 08:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <6-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <6-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:40:04 -0400
X-Gm-Features: AWmQ_bmCjfexrZLPPfdt56XAonJ2DbSa1CpJkmBpIfIxbAsyN_ouXa6sCMuBecc
Message-ID: <CA+CK2bDZ1RX9o80x2+HTshix0zxLcruzDfW--NMS8CjWo1PfUg@mail.gmail.com>
Subject: Re: [PATCH v7 06/15] iommupt: Add unmap_pages op
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

On Thu, Oct 23, 2025 at 2:20=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> unmap_pages removes mappings and any fully contained interior tables from
> the given range. This follows the now-standard iommu_domain API definitio=
n
> where it does not split up larger page sizes into smaller. The caller mus=
t
> perform unmap only on ranges created by map or it must have somehow
> otherwise determined safe cut points (eg iommufd/vfio use iova_to_phys to
> scan for them)
>
> A future work will provide 'cut' which explicitly does the page size spli=
t
> if the HW can support it.

Are there plans to add "free" when a table becomes empty on an unmap?
Not sure what would be an efficient implementation for that, maybe a
refcnt for # entries in table?

> unmap is implemented with a recursive descent of the tree. If the caller
> provides a VA range that spans an entire table item then the table memory
> can be freed as well.
>
> If an entire table item can be freed then this version will also check th=
e
> leaf-only level of the tree to ensure that all entries are present to
> generate -EINVAL. Many of the existing drivers don't do this extra check.
>
> This version sits under the iommu_domain_ops as unmap_pages() but does no=
t
> require the external page size calculation. The implementation is actuall=
y
> unmap_range() and can do arbitrary ranges, internally handling all the
> validation and supporting any arrangment of page sizes. A future series
> can optimize __iommu_unmap() to take advantage of this.
>
> Freed page table memory is batched up in the gather and will be freed in
> the driver's iotlb_sync() callback after the IOTLB flush completes.
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
