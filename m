Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CEB31B80D
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793262; cv=pass; b=I/er18MKJN0DkGifDfAPICXS4sG7Asv3ExcwMjg1oq9p3AD+jt3k2mA/gE4BeSpL8R15EB+pkUxF59mj+j+yFj7kkVeAs6FwYO7pC2T+roD6UkJYYlaOn9ZGtrOXK2V6URBMPOA7Lro5SSaoWdMlOPoLwdeRwL+6m4jZBGmX7Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793262; c=relaxed/simple;
	bh=tCH8EMRzy1X9IMXq6R2TSgftHF1nceCRK1je/4RFR+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=App1krrbtv9zKl9vRQr36u8bz9Fw7kU9Bl7tgIEIkH9x8vjEoKGZKvtEwnPfGTL6Y1VIho4rKm+kSQVGzyB0JJntHSD4ZyeooQe4MZ2nAHLNkMQeEzxdYlenky0IX9aXRDoipQrId4cWJfAa4kI7ytiKqwiWpdGXH4dudDHa10Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fbjgHHau; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fbjgHHau"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38dd9f11a09so42186191fa.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 10:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776793259; cv=none;
        d=google.com; s=arc-20240605;
        b=XfqIxEPdQiqQ9cHPq+GFShUZrEISXAbyz9c6rJIxVDXQh+JJdYGqtnZ6jOA8t8B6oE
         HOSLiKDtGEoCLz0NYjHata/DJigjlN0boAoqJy1IRGTlZrPtxr7+99BbU1lWySoBC69S
         rRl5jtklO/48kh1DZ3rFOc+90JvlCmMgqLYVx/Gx0NTe+pUST4SB2ZEb4hS8vyWQj5Xd
         MgohF/Xvgc2wkbxJWfzssUGYQueNGxc7EAlT60ucimx+0poLwUHZDxEiELDaD8AvGPqd
         udL+UjvYmtSaB3Ke6oTA+KN/jBIjDyceUZnxOD8LXcqUyzu3gZ8feqgj3EkcIQoHy/EC
         DZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gAM3zLbl9RAB5ix2RgDFnveQg42iFe43IZ/4vSwL0po=;
        fh=EnYdoF/IvY/OQU9c04et3+Tqvm6B2cd7E/T3EzJ/vVk=;
        b=BmkBmqQeiqx+weVbn5z22J75McKplQWtrytzAX6nZd/wXXdrZ4DVXdN38SmMGMDh/K
         hcqYxqeSDJ+Foki7sqAJqlhXFaqUEO1qXRNYUis/HaHuaryk4RrS3uEc9U675pBDO/cv
         Mkcf7Z5Hk8M5CvIJ7CXYVvMT+rfV1yWyePO1fP+qJBxRcPPwyLp/4RNY07eKNU1t4WJy
         5XBuYpJJKsOxahk04lq8DG/OdKzI49CJmEQoyqQLt1NjcdbzkrNJkTX3XzzMWoNgkDLQ
         MO5y/oVNOsBq/VvhU0w/ajg87rRiUERrML3MjloUM94cWu+vaWeaYMdtUr4/zfBPmpY3
         30IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776793259; x=1777398059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAM3zLbl9RAB5ix2RgDFnveQg42iFe43IZ/4vSwL0po=;
        b=fbjgHHausqRnAQv/Gm0WB1KYT5Ef+TjO137SVJmjln5wwrHMvzEM38YMAuW7lI2DTb
         NmEcU9H8n+70Xuk4H9OKhUBfjM+y8aqzI61ep7qrPQsvQuLY4PBSJrvyNi54ZOD0lQEb
         hc9TLUSu55ru6RHCT9SmkNPdZUWzQ0RwesPUupmg+Vkq0H44zIrr6UN1iMayAsCbIDYP
         w2pI6PeAKZlgHOp1DYAQD7SK+YIsZxubN5NKtf+JS68fS9biWnuos4dDvBonRAl2iC0d
         1nUIA2R+ep93u2n9Fq+p91C1rVCx8xwQHIcIpKSIVBGgn85bcpA+5RwGL9/kDfPaelwF
         fr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793259; x=1777398059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gAM3zLbl9RAB5ix2RgDFnveQg42iFe43IZ/4vSwL0po=;
        b=MQ6oFR0SwAOEPUYA++u+ZqND1aTCXb0q3NU+eRWXmPBAPguKakBax1ddyKJWrGUDlG
         +jURG2kWPJLQ/OCot0YkH/jBBIDY+6xQSZCylXtF/wKtb2DcGpdJblkCdrpRjZHuuyKP
         oQwXDRhRL+2L7tj0825VlVhgZyPly3aXwVOI/xNpP/8dt7HWAENpqEzxho8dVmTdXRNG
         Dhk3CnbW4MRtC2K48gNaHWtZMsMeLmDqFZ5IlgfVb6vJCqAjjjFRsyKmef0FNM8xjcGp
         M/+eExtzl1AYkjnc34L4fsp1afJ1wB5yjeSJb39SGFgpbHYBKUrB/Xkl8ixJhE8zkYVx
         mA3g==
X-Forwarded-Encrypted: i=1; AFNElJ+FZ2WqiajApT47WbjoZgojEyeTrOZjX1bB+Rs4S85Ffetb/9r2jdqVaa79wQM9P9t0WKzQVErcvws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85gVLTDhWwyNoCR4xkjE2VXolXBZGvNEk1yNCUh08Rxt59d+/
	SnabguQ3ZUiORL2lOs1sw0+2BcXpUCsK8PMWuo0lUZ7Cmo8gEtz1ZUxQc3RmRYx8jOyBVqAhT35
	cVO7EHg+6pGgyYCAj0Qq7omPUrbZf7zQfVnyk+rYl
X-Gm-Gg: AeBDietUOvEN/TEctIwtQDAtW8XEJY3ZBMTGH+RRsrPdtuv7I4gASIDBpc4ipcHiXdb
	qiJf2Z4Zsn4y1qmq+jDrowDN6ZHBBzFTag6rW4Y6OeqdJzFkfaDe27E9kImdmgq5II4uxWDjKqd
	/PtMVJeu0W/3aNvFfXdnU2+X4LEe3dIaQfPNlfrflh5zEv5Qi/XrLNypSgbxSuUYBMCIC16/5Uq
	VXErtspjUlQs3ZkvVKiYZQF00X93aZjSIKxGpLSy0sgDUa7AJaH/E7zIafPkZPznZwRl93Z1wny
	SHUS3b1+Xszl+oPtJ8l+8wPu4WAO4w==
X-Received: by 2002:a2e:a594:0:b0:38d:ed62:f1d5 with SMTP id
 38308e7fff4ca-38ec7aa4a03mr63977601fa.17.1776793258292; Tue, 21 Apr 2026
 10:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-8-dmatlack@google.com>
In-Reply-To: <20260323235817.1960573-8-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 21 Apr 2026 10:40:29 -0700
X-Gm-Features: AQROBzAxQqecIHMlVLo5_fKuOniGGCbgFfk1LcXxhbCrQbMNTrTkqomhARN-2eM
Message-ID: <CALzav=ehpWA=XchL+XLZuaYfYmBTPNWDYt1W3LFY5-6+US4E7w@mail.gmail.com>
Subject: Re: [PATCH v3 07/24] vfio/pci: Preserve vfio-pci device files across
 Live Update
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:58=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:

> +static int vfio_pci_liveupdate_freeze(struct liveupdate_file_op_args *ar=
gs)
> +{
> +       struct vfio_device *device =3D vfio_device_from_file(args->file);
> +       struct vfio_pci_core_device *vdev;
> +       struct pci_dev *pdev;
> +       int ret;
> +
> +       vdev =3D container_of(device, struct vfio_pci_core_device, vdev);
> +       pdev =3D vdev->pdev;
> +
> +       guard(mutex)(&device->dev_set->lock);
> +
> +       /*
> +        * Userspace must disable interrupts on the device prior to freez=
e so
> +        * that the device does not send any interrupts until new interru=
pt
> +        * handlers have been established by the next kernel.
> +        */
> +       if (vdev->irq_type !=3D VFIO_PCI_NUM_IRQS) {
> +               pci_err(pdev, "Freeze failed! Interrupts are still enable=
d.\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D pci_load_saved_state(pdev, vdev->pci_saved_state);
> +       if (ret)
> +               return ret;
> +
> +       vfio_pci_core_try_reset(vdev);

I think a call to pci_clear_master() is needed here to so the device
stops issuing memory transactions while VFIO is trying to resetting
it. Otherwise I see these timeouts when running
vfio_pci_liveupdate_kexec_test with Intel DSA: "timed out waiting for
pending transaction; performing function level reset anyway".

Sashiko also wondered if pci_clear_master() is needed to ensure that
the device has bus mastering disabled during the kexec but I don't
think that is actually an issue. vfio_pci_core_enable() makes sure
that vdev->pci_saved_state has bus mastering disabled, so
pci_restore_state() below here should guaranteed it is clear during
kexec.

https://sashiko.dev/#/patchset/20260323235817.1960573-1-dmatlack%40google.c=
om?part=3D7

> +       pci_restore_state(pdev);
> +       return 0;
>  }
