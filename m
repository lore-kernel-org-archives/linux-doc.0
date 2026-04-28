Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111AE3290C5
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 21:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410764; cv=pass; b=ecRnXcGCCjRQbM5shHuNycLVdM3q1DQ15qT+ZJjWgZXBr9HuyIM3tGO0/zqyxQuUYElLSGu9FwE2YVHRBu/8CL91hxZgJS0uUayxS48wR841ty9XQH489c9X9ytwKlMRoLCoS+B+pQw6f6Tjx3cWVKT4P/PZ6fg1Jz77kCrHjNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410764; c=relaxed/simple;
	bh=+RPGe3HPwueWHOYhTgYMgmvZA/eWqyQvbZ6YEmo7TUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0yMNgNmiT7Hyy6wDOtF1NXkHp+bKC3YL96pRXXPZ8SHWah4MJj6BFPMIC23NaaaSlb90DmOuCzhECBMSOcKiTg67tmBMdmbBaKiZzy3TiEMtqPlaKMRp12yXl3Aa0tkfBcMCVZEMtrRdMP/y1JYVzN8e/peY3pG/mIXfWiLsSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ua5RxdY+; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ua5RxdY+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a746f9c092so253671e87.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 14:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777410761; cv=none;
        d=google.com; s=arc-20240605;
        b=XEYA15lELPrJqecfX82XUMueSEMvwtwzSSi1gP52wERst5rywVdvnv+Rtecb5fQitB
         xD9dOlhgF9Uqkk2bU3UBgW0WimQrsJ+YtmsyUx1w41y6gTfDR+WEgm0ICb9kg8WbRaGE
         3Zogf5tBbgbflmAyGGyGNxKEMgbtcS3Dj356BEClaBWT8cip3pWYSg2GDz5KBr0KcNWF
         mUQg7CpjrvEqZ3wf8CXWGHoychXq1flsW1ajKWC4E0syg0JoQmoX5H1qVhF5Js5s2HbG
         ECn4yl/pYhat9Kb2ZPI7ZaNggfwEJmwrG6AKanjiFmZ0yxT2439w2jHzp/79FRksANSp
         NDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y1c0hsfQ1G9nhDHLSFuAkEDbfJtF8fRH5TAPVGQIJWY=;
        fh=XCY/QesRyrrt+e/cXwOCcAtjR9IQF14brSaVnlriQoY=;
        b=lyZaUV3poewhlnhhODOzAjbn14anEZw2WltOfOCRTOfiI4KHcwLUdmOzakw5GxXfdE
         UEIkADllZpC5WW12lziVPaD9IvhI+Y0TxjSeAcL10Bf2a3DUXNZ0oexwvZxIwYrKVCcT
         ykQBYplt64pfkErJJhiyNnn2TFdURdha03e3UFnxRMG67PCnMep55aI/z5VmS9UBrMc7
         6KDVIdEhAY7R3Jsz92VdB6QeFaXi8dVYhA4ef+kQ/CRftZd1IHNJWxU7VYqSIV1QAay/
         vQgfgQCTY0ApZXzHEw5AFwqc/lesr0FF/p4v199xh8KafLaUR2BkPp6JN2+fEGseonoB
         42Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777410761; x=1778015561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1c0hsfQ1G9nhDHLSFuAkEDbfJtF8fRH5TAPVGQIJWY=;
        b=Ua5RxdY+nWnHy6DlxMX5GM1Hoqlf+orxmHpa+o5sNDijwNLu8PayPAZp4LPvcykOct
         qHoMqoUGOsz/GOTzthgTmeP9Gb6hxnTrlKDeESTEzGsnCDvwcVlR/ni2kLX0j0sIJMOo
         lBYUjwXVT8ELdD1K5cBIFRyhVF3yDKX5tNddB0JQ7bsjVZs4B0g4+ZYde9VfvoyZpnUd
         3Lu4G81O76e0QbNYzLOL2IWmbrwR33AGqRIYG/wbaOJQFRYXGwuoLzXuNIWr5RAMXhIy
         dr0WwMWYyH40PHEwOq/+k97m/+BICIjkZeRtbV+eC1dVrz0mcKU78OhZJCfiZgKRmZUY
         DuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777410761; x=1778015561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1c0hsfQ1G9nhDHLSFuAkEDbfJtF8fRH5TAPVGQIJWY=;
        b=PSeGqEaSBaethMOUI34WTJ0Ji8M167OaN1aKVAhL+regqpRRZPzd9W79t5cWD1m+Gn
         gR4grJ8SprlhnpgQ1qZXzx7wiw858Tf8UiW4RwPNNSgNv1BA3HQriG+TwWpr/BVkLOze
         8p0mnqiR9+EK4PZFqba2M7ypYY16T9FjScrRd6LfFLq8bfj70/8yvJP3OIAG1NvlaZUg
         CV0i/YSWmUb4hiNdJFOwjEdGiQ8ZjLjx683/v4Oyrq0dqd0JPQZzV93GlErCddSWaOwc
         CKvjzMYpCnx7toBz8Me59VZlp6vNP2HDxmR78KmRwp0USv5fJTszBeXUmZ4IIQ+sUkWg
         +uZw==
X-Forwarded-Encrypted: i=1; AFNElJ/lh82OFtFQRTzAe+a6Yh4clETBiDNFI2w1hfZLNyVzDevYW3mac+XohgQGb1T1ZRggEFYRlYN3pQA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsfz/eM5noJbbVkdkP9bqbDX2WA03pybvj95XPw+/+w4OTio0P
	zS7tzjSENdI/amGOPywVl/0FAQZ3PeP5Jj0s4JyM/dT9CHTtBFoIyUR+INCGCPBS+NmTe1BiFvK
	DkearBpA3U+fIG3e2B99xLyprfTDM5DNCO8hS7EKw
X-Gm-Gg: AeBDieucpacUYnEHSi2QNUACzNl0x8eU473ZBzFkVWPaWFPeKLQt3eFQnqWwCpbqkt3
	BJr6psEWUPTm0A4tVrVS01tCtujJS6OOJWvVazuXmB0dkWNH3eJBOTYsDC7L7C0xueiVfoidiOx
	PFTtwmL+afmSZbWqQ5JnIcyPwG/kiQ6ez5qpxQejDIgf1ETwUurj+27+oFTSJA8SzDwGxhRCfYf
	SvcxvgvQbdlSzKd9Dq2Pj4yNceT9ZB0pzMbgKSHn4JOuHv/wsz4nD+IQtRuyXRhEqAakDLntvUm
	BqhL5TmOdR+XQ3C4wMQTACV84Mos7A==
X-Received: by 2002:a05:6512:1390:b0:5a3:4692:61ce with SMTP id
 2adb3069b0e04-5a74a32f180mr148152e87.1.1777410760874; Tue, 28 Apr 2026
 14:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com> <20260423212316.3431746-3-dmatlack@google.com>
 <20260428201231.GA3885809.vipinsh@google.com>
In-Reply-To: <20260428201231.GA3885809.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 28 Apr 2026 14:12:13 -0700
X-Gm-Features: AVHnY4K7jpha36hMRH-mQGhZech3LSC3uUxVbVP_4PPgBDawCFAtuaz99Nxadcw
Message-ID: <CALzav=dfLtdrPhkBkGwHpDAWUBMHnbGPccwhy1__doziNVZQJQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] PCI: liveupdate: Track outgoing preserved PCI devices
To: Vipin Sharma <vipinsh@google.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 1:20=E2=80=AFPM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Apr 23, 2026 at 09:23:06PM +0000, David Matlack wrote:
> > +int pci_liveupdate_preserve(struct pci_dev *dev)
> > +{
> > +     struct pci_ser *ser;
> > +     int i, ret;
> > +
> > +     guard(mutex)(&pci_flb_outgoing_lock);
> > +
> > +     ret =3D liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void **=
)&ser);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!ser)
> > +             return -ENOENT;
> > +
> > +     if (dev->is_virtfn)
> > +             return -EINVAL;
> > +
> > +     if (dev->liveupdate_outgoing)
> > +             return -EBUSY;
> > +
> > +     if (ser->nr_devices =3D=3D ser->max_nr_devices)
> > +             return -ENOSPC;
> > +
> > +     for (i =3D 0; i < ser->max_nr_devices; i++) {
> > +             /*
> > +              * Start searching at index ser->nr_devices. This should =
result
> > +              * in a constant time search under expected conditions (d=
evices
> > +              * are not getting unpreserved).
> > +              */
> > +             int index =3D (ser->nr_devices + i) % ser->max_nr_devices=
;
> > +             struct pci_dev_ser *dev_ser =3D &ser->devices[index];
> > +
> > +             if (dev_ser->refcount)
> > +                     continue;
> > +
> > +             pci_info(dev, "Device will be preserved across next Live =
Update\n");
> > +             ser->nr_devices++;
> > +
> > +             dev_ser->domain =3D pci_domain_nr(dev->bus);
> > +             dev_ser->bdf =3D pci_dev_id(dev);
> > +             dev_ser->refcount =3D 1;
> > +
> > +             dev->liveupdate_outgoing =3D dev_ser;
> > +             return 0;
> > +     }
> > +
> > +     return -ENOSPC;
>
> Since it is executing under a mutex, and we already failed
> 'if (ser->nr_devices =3D=3D ser->max_nr_devices) check above, will we eve=
r reach
> here and return -ENOSPC?

Yeah I wouldn't expect to ever reach here.

> > diff --git a/include/linux/kho/abi/pci.h b/include/linux/kho/abi/pci.h
> > index 5c0e92588c00..5b4c8d9e462c 100644
> > --- a/include/linux/kho/abi/pci.h
> > +++ b/include/linux/kho/abi/pci.h
> > @@ -23,19 +23,20 @@
> >   * incrementing the version number in the PCI_LUO_FLB_COMPATIBLE strin=
g.
> >   */
> >
> > -#define PCI_LUO_FLB_COMPATIBLE "pci-v1"
> > +#define PCI_LUO_FLB_COMPATIBLE "pci-v2"
>
> Just curious, why did we change the version here?

Because a field in struct pci_dev_ser changed.

> It's not like just
> previous patch is working enough to perform a live update. As the config
> is experimental, can't we just keep it PCI-v1 for the whole series?

What is the benefit of keeping "pci-v1"?

I think it makes sense to follow the rule we set which is to update
the compatibility string in any commit that changes the ABI.
