Received: from mail-ed2-f26.google.com (mail-ed2-f26.google.com [74.125.228.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4EE48F031
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103238; cv=pass; b=ZW3seib03vtrb3arNfuBJvN8KLht6D+/m4aDoEHm3DI+X+jNfwIgDXLhGyd72jypaZRF9en/30NSZFkatHUpDNKGdqP5Bs5+cujTdrJOc+9dJPDB90itbS53DqWZIhwqj2Xrczrb/4vl6Wn1InpS8ir0vYL7ouHZs1qUojC20X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103238; c=relaxed/simple;
	bh=CxQ5R0YiXXR5pS5OlXpEM54373E5joJN4ppW4x5rEyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNTY+yb1hZlvrZCYhbBsIBsPcadRgPuyFxRfyp3V2FKqnD3bLrroe+YOIWfo4e9vcUuWbrZIij0hdG4AXxVE9Z2nVXPF+yo0kPmst/qoFVkQpFbSYwxL8sIP6eG5i6Q3PeRLZJsG7vgx4kEbSi4N/H+iYWT9uQQsS8goyf9NIwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RETCNeQu; arc=pass smtp.client-ip=74.125.228.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RETCNeQu"
Received: by mail-ed2-f26.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo272588a12.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 11:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790103235; cv=none;
        d=google.com; s=arc-20260327;
        b=eN91xBMdVfNA87sc7qq+sQBgRakN+/GzTcft4c/Rhs3K2DjSGV544QsU9ZDPg6Ok7b
         23RB1eGVUmDCmkFBNJFN4UNArAAyng2bD/7Y5xh8Dzoh3a1SGT9SrI6Kym633yiLrXu0
         pYoA5SxsKUU1ENpzB24tNW40n/pOeOB+H4vbedfJhWQLhWH0JYjPJw6FWh/fO4d9xOF+
         g/P4Fs9dHAoSfuUFqq+FNAVo+iGTH5X/hFwQ/KJ/VlaiX+R3D76PgHTvmh9a3RvCZOUG
         LXDUktqWPoUG1LHp62+OsLbZVNkDkw5W2d8PYrQu2T4wrgAztLJbN9p+ow8srohZZSGi
         +NjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mk9DB7qPIG0z2a0BppKMxU3ch/ZxTA+4gqsB2SAa/tM=;
        fh=mhzL69OJRXBvgeFqDRDTzksD/vTypGDTdHyT5ng56Lo=;
        b=pbcsjXHN45N4lKyTQbYq4Kqrve2iZf28XiJUZ+x+DbgDbLLDgwc5xHFehn7AMnK/OV
         xbHGZg/LFSRrgdycOzqJsNsCaYCrnxhkClw3W/Wu57ZGL+VPYjaS9q3/DnDqwRtlpmTv
         r722PIPKCaXqiHYcjmO7v1SbtSkr/q5+MsL2U2oRJ6uKn880MyJZjqKUWRIzgbx/iLw7
         LGCxQ4U/2YawU92Rgj87J3bEfVeiSj9Yo1ZDB4XrHt3qeiFfOVkn8qnS+wpV4rymMcdm
         3TymOacbNrGODaPZ3xUloZ3IQzAIUvNGR5P3njm//+18ZFuex4/fu4YzBsDYIMIwOBCt
         RwIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790103235; x=1790708035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mk9DB7qPIG0z2a0BppKMxU3ch/ZxTA+4gqsB2SAa/tM=;
        b=RETCNeQuvVm9JTLE1lCy4CsIYJJeNE/cA2myl+TuU7D1MIDOeOul/CwsE6q8scD7m5
         WVODIsA6t7K0B9iTuWQygUWmSSeZmUzvvLvBDTSD63myPi86GWvWRG3MqMYRPwMk5wkE
         q+TJEe6B8v51PCjt5cXZVXfTRij30TLiR9muOA6MNns/GOJC+39fgWqRj8XwKeTbErkM
         MWJVnBi6TE7+Zz7lhsxsZbZQf7DlgSTmmk9tqPJnyuzLq8WDCJWOoKJkhgz9UZxY/Fvv
         jYdcYfTzpBeEztYVBVESm+u5IHxaYnPsvtRRvsyuUzvc69HgDcJD6m0fbe1t/y43UuCK
         1+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790103235; x=1790708035;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mk9DB7qPIG0z2a0BppKMxU3ch/ZxTA+4gqsB2SAa/tM=;
        b=nFp6/Tx5ZT/mPgSQFqSaCKHV2pSHSZS+BbDgNS5qBjwG/h6V9UX2tLxJespKGFw0eM
         FIM25ubBWO8NhySiZbRgzkm7hilaj9ldImai1j2h/ZO09ZtTmawWYZFLKNaelgCw0ef+
         rr+3b1FFZJaXUXxzQ5fAbe3eYCIcXdCCXwyfk6FzGV5Hkh4v4Np/HbthX1BT1W0qQtvu
         HNABDibo4wifJ6w1xv3SAXj+kKnpUxXCYSQTPh5wHQCMCtZrYFh9sfPX0d+k4xgyh0vP
         xijyRgCrY8SchmpXCrgKwn8ILz0GJE+z0nW2aKx7R2Mdo9mTO8bSTCzxPfUHe40sOCJ4
         TZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwugJX29ukp77rMaIpPUixe4RAFsCcysga7chYmFoRachkLjcmbKtBkHWqkCxOnN7CnWftMKxDlDpY=@vger.kernel.org
X-Gm-Message-State: AFuF++mvd1mcwV0/rwdjsJoIE7y7qTUdOESkC+fge3ygkOI9jz0nbtbd
	GN4rdouICGtwL/KmeGtfDLT+VFL0LysI75P4Npx1a3xVt5XJ0FNkI5w5qOE+j4YGzYtQrSE7Vnv
	9wD3hLvf/pNASp8vYIhGohJy67Av37qx0+uP2Rzk3
X-Gm-Gg: AYBFou1/PP8gVL/nJYRcMPh9v5K/NpZ7cjCnFZm+frjLuu8ATYpY7f+gMVzYc4hgUwh
	//ROA2IPS8DrpcOgjrPKra3JOsv/h0xbBDtHFUlBbcsEZJjZzMX2ocPrQD+4aYld3+6JJthCDQy
	LSrQS6vXDO88mB90JaC/qMIsxHiR1OC0ya94+AzmVmIIKcSHGuqJEIWq8D3ay/yWGJn+g0LbLBi
	kh/MW/pLbdyNqW+1FBk73cHCmfXzPutYixltDPiU14GqVLz/8Rt+XDUkar19Fb+DiQZ6uwyOLNd
	ZZ3DpyfYpYiXNCUD1DIPQOW65X+rF+lZXVeP2Rj3qh5lPiEgLuFxpDYDJw==
X-Received: by 2002:a17:906:f58c:b0:c29:448b:f5d4 with SMTP id
 a640c23a62f3a-c2aae2b0595mr11895766b.35.1790103234240; Tue, 22 Sep 2026
 11:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918200640.887030-1-dmatlack@google.com> <2e88b92a-d3f2-41f7-bdbe-11fd71690606@linux.dev>
In-Reply-To: <2e88b92a-d3f2-41f7-bdbe-11fd71690606@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Sep 2026 11:53:26 -0700
X-Gm-Features: AclHuK_mAcmGN2d4gu0q1ERBsbnyv84fOIFniqxdriBGbAgM5X1zIuozEi_ewvI
Message-ID: <CALzav=eJU+fnPr-QN4s7gY_Lj8Pc3T6KXfC9kiQQ=g4rPEDMuA@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] PCI: liveupdate: PCI core support for Live Update
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 11:36=E2=80=AFAM Zhu Yanjun <yanjun.zhu@linux.dev> =
wrote:
> =E5=9C=A8 2026/9/18 13:06, David Matlack =E5=86=99=E9=81=93:
> > Future Work
> > -----------
> >
> > Following this series, we expect to make further improvements to the PC=
I
> > core support for Live Update:
> >
> >    - Allow P2P across Live Update by avoiding resizing or moving
> >      preserved device BARs and preserving all upstream bridge windows.
> >
> >    - Support preserving Virtual Functions by preserving SR-IOV
> >      configuration on PFs and enumerating VFs after Live Update.
>
> Preserving the PCIe topology, bus numbers, ACS, and Bus Mastering across
> kexec is a foundational step for minimizing downtime.
>
> As we look toward complete end-to-end support for DMA preservation
> across Live Update=E2=80=94especially for VFIO device passthrough and dma=
-buf
> sharing scenarios=E2=80=94IOMMU table/domain preservation becomes crucial=
 to
> prevent IOMMU page faults when devices continue performing DMA during kex=
ec.
>
> I would like to ask about the current status and roadmap regarding IOMMU
> Live Update / KHO (Kexec Handover) support:
>
> Is there an ongoing effort or RFC series for IOMMU handover / page-table
> preservation currently in development or under discussion?
>
> How is the coordination between the PCI core Live Update mechanisms and
> the IOMMU subsystem being envisioned for preserving IOVA mappings (e.g.,
> restoring domains or handing over root tables)?
>
> Any pointers to active discussion threads, RFCs, or future plans
> regarding IOMMU participation in Live Update would be greatly appreciated=
.

The first IOMMU series to support Live update, can be found here:

  https://lore.kernel.org/linux-iommu/20260921004834.2601285-1-skhawaja@goo=
gle.com/

The IOMMU series builds on top of the PCI core support (this series)
and the VFIO series linked further up in the cover letter.
