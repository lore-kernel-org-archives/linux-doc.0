Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EAF37D132
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771888130; cv=pass; b=MxSSxFjXdbpUF6qkgL2ktuAGxHq+FKXEtD5s2SSL51MSJpf+QRCHPtMI2/2K6W0YHFRmz+BxNVg4J/eD/zf1+v0Ha/Xw7hZ6Pg3aqcwOy6zdfRjXJ/sH8oatHXqJy5IC81TvW9yOoJDvgZwaIXhY/79x3PBulyU8WftMCO8So18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771888130; c=relaxed/simple;
	bh=Ydbc6rbyk4KLWrkHSXSI7j05eAvfIq7SG6ROABriCE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfDqdAK8XFjClXEnGOJKspNWbfl8Gx1ZeEDyDwzyDZEOzMEewzfrcndIS6nfYoWMbmiWRF1odjQYF6fdQNSTqNX1nxdNfitf1ZDTw2r7rsvEPvkVhi46MclzVpapqCRs0a2WPrs1AlQhtDAFNcrIbDOD+1uh/NgYAA8xzbRQyys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2jOm9V3; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2jOm9V3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59f850cdeafso5160733e87.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 15:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771888128; cv=none;
        d=google.com; s=arc-20240605;
        b=dQOpT4q0paA/+nMiVX9vTkDsLABjkWPH89MSU35zxt0gnEuVJPctMwLpMAIL0nGsC/
         unppgKhlsgYI53QRGj1+Gj9BO5eoH0AY9npWF5mj2XDZm762164XxR4czjK3iYssz0dx
         XkDUJhOWG/MW0qtEiZAcNKJtKW0YcnpcT/PXOCFGw0tqx39WfaRJkfPHFAmQrAitJJzI
         Oo5GiOBYygpdW2cnvc3zwDdNOhiDWkl8myq72Z7Q+RMjmu50l+VYHOiLLkn/cTZ2Fd8p
         L+tBM5TBzLAvBniFaYi15jMnadtn6vhEwjf6o68xhRXgaON686r270Ra3cuC+k6NTOLA
         9wiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c4ne1Ls/uKmuDNTWcMVVG01PBoi2SfFbs/naiop9R80=;
        fh=X5YiWpDXP972t7ljMfWDfktg/0cfWMpQfqdkrHJUUtM=;
        b=gUEXlFfrBW9N8FP+yMvF52dTyuWsh8aMHF4PC7WS5WaOYoMtitkX7ZTkfZ73XdRg3F
         Ko7ciPmsNSCGPWb2IkX3QCAWLLW0Yn5XMhUs/OMTSawo6UpEQPE3LlzIQC5l+MRECODk
         aaQzUsD8vrS5x6yO9BodN93i4nmeCMs1fVmg7viG+MRjjXNFamtutmIBMgErm1SHYw/v
         ZG+Lt1nRsYRbhi1kOtfiWT/qE07MY2mns7ZLVky13hTOsDG7ttHvnxekffa0/W5cgCcI
         d3g7x1RzueZhXqM3n7XMRMVEPi0EhLnoIAhDnWJgIUDRc2pLZT+q4TWPr1ydqOZbyyh+
         ZxLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771888128; x=1772492928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4ne1Ls/uKmuDNTWcMVVG01PBoi2SfFbs/naiop9R80=;
        b=d2jOm9V3cdZfFgFgtcOR6roP0zV6o54zg6vrHNIGDgRJKHwNbJiF1oKLByePDLu+RZ
         RvMt3et4QhS2OXYEZLCppfk879ITR1XE3hdUPE0ThGM4C5mKeUT1c6Dnw3A0lQECdVkl
         MLoG2wBeARg8OaPUQOIlRAOfeFOFaPvyTTni1e89jNXDRH3Y9eV5MY26WNXGwo94WMnt
         BXxRYZWJ2B8+cz37pMBIO8DoV8yI9noiFuHZhCyj7m7o3+hGADuNCMWgfkYrPxRDSG8F
         BiW+Yp8TW7QxilchJG8UantylCuotfQo/2+FVQfg77AktnxQ2HvZ5eoU2Dy5tsafT9wJ
         KNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771888128; x=1772492928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4ne1Ls/uKmuDNTWcMVVG01PBoi2SfFbs/naiop9R80=;
        b=ccgh22SCzKxaBzETVPIZcWf5bEJeT1CRuii+VyvaQcnszPWdDF7g+ltxcIUalUVxgg
         aKQeCKhJpeZcMibfBJMo4EZDbpaOSgyArdMLeA62fB9NT0BA9fhxvv3UcHtYTqTnJHY/
         6QH5cZGtnvLSdkh2RFCvNYaBhPkpPFnQ5la2b4XHzMENX3ByELyWjNO5bhMZC9jCE9hQ
         LTlkdJ0t9CHPq65b7qRJdOCzXnXD5v60d5MPEvp/czWnokTfw4kIy+CmP/xrH0EAZsaC
         9jokhptAAGBOk6n6SwAPrePZiL/lrWow8ZfjfBvhXSHFDDrbx3Wj8uKVVkFP20e48BpD
         K35w==
X-Forwarded-Encrypted: i=1; AJvYcCXKZFpccNYX/f0yXVKng6jKJBicckEPxdvfyvTPvehWjSUZzdBhZpCfV6BXNd69nnvPAXBKo8X2yCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+tnPUAIHJmwcwwioxzFD5l10SbQfaeP7cD+FSC8dEQZuBS3G
	1ifbWJI1M6+dCCIMjROEBFyKB8h/LxJ6sSCVg6cQ50N4DibFlf7GpQgOYCdWCJhRW9kSTcWYyYe
	ZfAEobTKIf+tsTEiFWABQ2lvg1uVgOipuC1V2j0Aj
X-Gm-Gg: ATEYQzzRVMAs8EpR15cKXJNhNIPrzbKhRJNUfj3LdXsQf5ppzSyg2dchTeAbnPH9BPn
	8foUn2bRlqJ04zN88htqLTwQX2QBmBtrvz//lCXe78cQ9eyV+YjTU7R+0TcRIfYUdWDeAXGyjyO
	o8bp799Jg6dhfdfpxDbOgE+XX0gIiLqiNDzAN7rGS7Iw+vBOMp0QoWAE/wbkfrDQYPYbwywZugl
	9quOAC/M35Q+9fR9qG7Bmhzkk6OrRV+Rxki4vIiQTg6m+xTeji1OcwhgcEMJhWgPAdCtDR6iwyZ
	zJbIGHc=
X-Received: by 2002:a05:6512:3b9c:b0:59f:8546:1899 with SMTP id
 2adb3069b0e04-5a0ed87de41mr2986457e87.11.1771888127316; Mon, 23 Feb 2026
 15:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-3-dmatlack@google.com>
 <4mbhcmimhin2ulz57mbzpe5p5dkhfziiyep5k3vgls4zmom3sb@g6jlouyvmpuz>
In-Reply-To: <4mbhcmimhin2ulz57mbzpe5p5dkhfziiyep5k3vgls4zmom3sb@g6jlouyvmpuz>
From: David Matlack <dmatlack@google.com>
Date: Mon, 23 Feb 2026 15:08:19 -0800
X-Gm-Features: AaiRm50_OD8BarR0N1ju3iFQZFALazFmYS4w16LFHF58C19D7VPNrgpsKvMORCE
Message-ID: <CALzav=eXY=ZBshmpi9axt+_0SxaAm0Xbo7w==nCWJwKK3xcThw@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 2:04=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
> On Thu, Jan 29, 2026 at 09:24:49PM +0000, David Matlack wrote:

> >Drivers can notify the PCI subsystem whenever a device is preserved and
> >unpreserved with the following APIs:
> >
> >  pci_liveupdate_outgoing_preserve(pci_dev)
> >  pci_liveupdate_outgoing_unpreserve(pci_dev)
>
> nit: Preserve and Unpreserve can only be done from outgoing kernel, maybe
> remove the "outgoing" from the function name.

That's reasonable, I can make that change in v3.

> >+static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
> >+{
> >+      struct pci_dev *dev =3D NULL;
> >+      int max_nr_devices =3D 0;
> >+      struct pci_ser *ser;
> >+      unsigned long size;
> >+
> >+      for_each_pci_dev(dev)
> >+              max_nr_devices++;
>
> This will not work for SRIOV as new devices will be registered when
> sriov is enabled and the max will increase. As we are not handling VFs
> with this patch series, this can be fine?

That's right. Since this series does not support VFs
(pci_liveupdate_outgoing_preserve(VF) will return -EINVAL), I dropped
the logic from v1 that included the maximum possible number of VFs in
max_nr_devices.

Once we add support for preserving VFs, we can update this logic.

Another way that pci_liveupdate_outgoing_preserve() could fail due to
running out of room is if hot-plugged devices are preserved. But I
don't think that's an important problem to solve right now.
