Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4D3DFC9C
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 17:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777915458; cv=pass; b=kEWVufiT0aXMTK4w2buF3DDW22EwbAJAJCP1HTvDbY0R0zWvreIRT9J5ULwQ7y0Ggfiz/C92Eo/OEvpWPX/IdSFC6Vtf3j0ZG8wNvHMp22HelVWbwAGd3Wg9AXXZrpI9YfSUYPflF7o/BM3ykHFkFChvXwc0gJD1wXE89Inn8l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777915458; c=relaxed/simple;
	bh=GyTv8qCOVeKZc1v9heh9q2u8oTrZt8SPcXhTl05cfUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azTMse3KThw6lEb124suYPV0Kh+V4iHfBCtyoLlablBxraPqTMJETOGuFmXD9uPwIcGi3EtB2poFkuX0D0T7/1vePsaOfM6dzI4Nkwb89S3nOuEOT3KewgQ8QX7piSjISQJ39R86KryOziRU5wevVnuW4/zgb2ZM4Of4cpCcgIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E1+T0jvX; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E1+T0jvX"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12713e56abdso3028563c88.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 10:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777915455; cv=none;
        d=google.com; s=arc-20240605;
        b=SzLiTZOR0W54uVPa6R2r6w1LBgxFlpMtYdT/ICJA2xZ+HdfE3/n+TLOx90cnbqIu6+
         OCY/NBHWeVbArSbYWCu9nKJpSuv95zu9s6aui099Iv8LuuJFisn1XMPhj+4FLz+jWnEf
         uxUXcnxsuaOyEEuCfN+neUzvWL5aOPBpO9CScW/np52zbWGku2OeHSB2RmklOIF+bSzg
         OZsJluTqr1yXZg4wmubfruvAfqCP20uzw8svoHzjzc4Br8OV2Dqym9wXN3eTvwRDeyeg
         GGKXVKIPa+WVFa0r0aOefAue4qfGk64kyeROJrHLY9q26XPi9BqTwnepdTgyGlbpa6YT
         +PHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8DRIGBANyTxbRVKczgT9uBMklmvWRVuW0duqUNmLE+k=;
        fh=8vH602aQqElf7eWyrWHgw32uBH8p804DU1dqoTsgCSQ=;
        b=ZHqGCDE6uvFyn2oxwllft/ZdAsLEW5IG1HvVn/KvJoov1YyoPgv+80pdCJhMChHxdt
         CnoJdaqO52HyF0moSY34EWkG+BY3ZHtPdQdCXAceTU4rOuQX3xAEDa/4Bq/TEkTu/y7Q
         pCGFK9PYXl2H+rkSfiI2uGgl++rKUyK7encuaNYU6jRljoP7h+oI1k4DAF2L5fEmTsT7
         fqv+yf8NavPdqKCgIUIBCRprxIuwXpOru1XK709Mofwe7BymE8HbfkrxZsMVVHumNppt
         DTsSNRYCFGsy51GLQmASi8rotL5juJZtmlwYO5M00nnRfyt1rXaoX1D6tX1EPOtpfWPO
         wwJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777915455; x=1778520255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DRIGBANyTxbRVKczgT9uBMklmvWRVuW0duqUNmLE+k=;
        b=E1+T0jvX2+/WRy3DTsXnIl7CYn1i4mjob4uTOWQngmm2jkAzedB9fvq5SiLlpk9YLI
         bZTVRQFgJuYwGBPR82RVZfFPO25+1FIt05UZd9cFtskm1SQVjsyV/0C2ZhxOcuJapdO6
         sSR0oQ4nG1NPmAUe6gn0jN41odnGBr1w0NN22nBznpYUeRbfTijXL5i0B876nBIZxt5u
         iDX0pp+DdWzKUqsEE3Aib3x5L3StwYYjxhWAvRLu4BXkc2PHlfzX/zgALCfei5l3syyI
         QsPqnN7kAXsb5zfRCwVuPRAZ1qnbCA617AxEa9T8/80/XBJtJTO7LDTju3E41ulOkh3o
         kM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777915455; x=1778520255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DRIGBANyTxbRVKczgT9uBMklmvWRVuW0duqUNmLE+k=;
        b=X9WMssHxt6UdBlt6eBAEQUm5tuZZO+E6wxr/UcIR01nmAeaJN5LQGHPWbCGNFI4DF0
         NuOgCORSLsWfBKSZteHuFgArn6Pwmap2Kl/ZAX1PTqOoy7lrQE5D0C85QjuzT93a348R
         q4L1pg5fJBfUD5UimGrTswCQ9ROLrYHtYn3Fuf5/pdXvQS5caTdDE6L+AiEeZ8pC68e+
         ltqWPDPAHuYh/mvo2VWlZOqiR+EydDPhFJFSOnueWvxCvzt2Aq++6Ip/Lnge1t09EJdn
         w1p73+5R6icT6hqQldwRgYEGdcpZuo5/O97lo9FQm/lcHY09eMvQjpYpWNROkP4YOtxy
         Q35w==
X-Forwarded-Encrypted: i=1; AFNElJ+U6BrHw5rAkE4TzOETa/whYrs4AjhIk79f6L2S/2/HCzJlLLVMtxe03w9PnDyyNs/0rUfjK4g3qE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo6e9Z2edx0sruXfuakPaWsSHf7n+VDsHuxZM9VNGjkaLfisEm
	n11OrPm3o5Kqn8NTEWTaHL1asA5UenoUCOqGjeozs9Ylcl5S1xrcEUJp+iWuOIJe8f20rlrRjTM
	TkR/DyS6sNRohkASOZkCShaR5gNREBeXsUHhTTNerKVIxc98wRBWtxRUBtCw=
X-Gm-Gg: AeBDievOWIrAwg5fhTKzgYmy4HzrJL6u4OGqASG4WTL4tgwsa6ImoJhK/fgf25CN0dV
	TVCHHkUDbBH6cICG198dGaZ6jTpS97a+0vJPVUeGOu4pp26D4chaQzm1OuC7FFgDXj09LyPrbeq
	KT1QzkSVkTQwnONjkynyMup7JymvE2Se+tiyE6qOoI7WJo0YMPK/kd46srHQYndd/sMM8G1bVRi
	ZmIqop3yXa4IIjFeoHL8qr1wLy1F2x/Ik1L4Frvff4MGDZ7iMTBlvIwJObvpJ6Cs1JxQ+VDAkxX
	vt5UL5/Ma5OR78weKVE7bBLi2ofiYw==
X-Received: by 2002:a05:7022:497:b0:12d:de3e:86af with SMTP id
 a92af1059eb24-130a9fec67emr177647c88.18.1777915454575; Mon, 04 May 2026
 10:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com> <20260423212316.3431746-8-dmatlack@google.com>
In-Reply-To: <20260423212316.3431746-8-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 4 May 2026 10:23:48 -0700
X-Gm-Features: AVHnY4KOWy2Xw7Jao5yCErgbS2iXWpg2-ZhNYfKSnvLQBaJlNVGZseag5k_UOKw
Message-ID: <CALzav=cmZzNetCqWjQaG=VO+Fs=TTL3izU01vDUFd-=mRnDAuw@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
To: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 2:23=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> Inherit Access Control Services (ACS) flags on all incoming preserved
> devices (endpoints and upstream bridges) during a Live Update.
>
> Inheriting ACS flags avoids changing routing rules while memory
> transactions are in flight from preserved devices. This is also strictly
> necessary to ensure that IOMMU group assignments do not change across
> a Live Update for preserved devices, as changing ACS configurations can
> split or merge IOMMU groups.
>
> Signed-off-by: David Matlack <dmatlack@google.com>

> @@ -1017,6 +1017,15 @@ void pci_enable_acs(struct pci_dev *dev)
>         bool enable_acs =3D false;
>         int pos;
>
> +       /*
> +        * ACS flags must be inherited from the previous kernel during a =
Live
> +        * Update for preserved devices (which includes endpoints and any
> +        * upstream bridges) to avoid changing routing while memory trans=
actions
> +        * are in flight.
> +        */
> +       if (pci_liveupdate_incoming(dev))
> +               return;

Sashiko caught that pci_enable_acs() is also called from
pci_restore_state() so this patch needs a fix to ensure that ACS flags
do not change or get lost after a save+reset+restore.
