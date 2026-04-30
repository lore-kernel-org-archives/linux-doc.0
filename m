Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE9829CE1
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584181; cv=pass; b=XKyoOFRWbgljDnOXzHvezdDJIwvfpTDEKBILzJPAaHmIM6+A/WLT2mThW8Vzv30al0RsHQgyHZbFOmgMfa98gIZRT9Ardmve7qYoQwd+Z8piwCqacQ+uYetfDtyP3DM7Um59xPT72wERSB2GEsaDxKwor/VHSEd+00dljVpqXv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584181; c=relaxed/simple;
	bh=M3mVujZnSbDcky4ImjiZHpQ7MdR18QqNyQGKAVOs0Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3KszDxp8O0rSBc+UTs051AbQkgI44MSeeiFJziy8TlhbajxcyMpEpha4pTXF8Nx3kP/s9XBW7NUYa3Z4Kx53aCd4A5y+F65AwCFJlUKM/dCLoB40dX/1QkohavIcKuOOcmK9mJeymLiP77rjQmvQsADPoyg38nV815b0Y2Y1xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4yBkh4+; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4yBkh4+"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-60580b17793so505822137.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 14:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777584179; cv=none;
        d=google.com; s=arc-20240605;
        b=MwLndURklhODUadBtWww5t5bA5/CPdWob/IjHb2omaE/x/MVKFCGZy9S8py/ScHNvr
         txwOkGzwG9iNhUvIWc7/bsf6uNpqkwFit8nYP2jjSQht0xX/T9UfJ7vXPOIFJxa85EG1
         iu6yjwDxW2l7c8E9Js59BkFUjquQ6RjBbOcV5sFUNEMQUBYDgW25Pj+4RfppkFIu29h2
         D4pKBx5i9vZhXfCY/3UU81nffeROToWn5+Ijqbu+M7IjVqvzAkU2/sNTYbKzUzzc76uE
         sKDW/0h7McLi3WQ8cV3fck611L+jSJ+rCdaW31peXa20gwAjT6TJbOTItrJhM+yVDgqr
         C7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VDdDBeOth/GyO4S6LG5C4tIpCfmXMPVkXYvoyOVLmpc=;
        fh=djECgHZqB+PitJSTJrUZEIGBLxpzOZxWQILlBngrwxE=;
        b=OQ23pX4S7a0eDzMkXOKzT4H8GdMifMtGmMRSTrlOrsGxphsPg+erXKoqw0pzdHAils
         PmFxJNrh8dLPsZKrUuNgpDRC+AV19M3sPVrcgj/oHBAny20RcKRwd4neKeLIzHuWFi6F
         bCwzorDNWstBxOxpennfyZc1579vCgVj0qiK+ENI4HkDWUrwCJiawPwmWCD3kAScenBu
         TbIrrvfWY3Zoc8HMmDXfA3dnf90dcyNcDti9yNCOmxlIz8gYErGDhsTfc9Sfnsh3uIgc
         Y/S1RwR4yfw5UOEpu0IrMZ6eEBYJjDbeA5+rqU1sWEE11n7mDF6jb2gy6xUMKDZWOWOa
         wHrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777584179; x=1778188979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDdDBeOth/GyO4S6LG5C4tIpCfmXMPVkXYvoyOVLmpc=;
        b=H4yBkh4+BAYyAGuckmnPx6xuGsf4yyYrGetfI4FJsnhTSELM3EMJpKYEPTp3h0e+4N
         ZjjBod8JdKCA2drHnl1Ks6jJUp1vhixNgH6nMZs+Oijf9OBOPU5cH5Xqn+aDvzbRh619
         OlQfa32S2RpAhYC2/lEEo09u90+JBedJ6Vl452vVeRxtzjKQ2x33HlMtHsnsvsfyuOrU
         s/5bwAtoTVuF87HVpHblBMHqXcspL4kyOU1cflNJQ/NiH/4qQZiSTT8yJkW4AonttLWS
         R+Irjc55IPVsaIcL1fHvr6/2F7poILOJOFjwk8WBYOhJDMNAoOrH9ErUO9vsc66MwDj/
         BK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584179; x=1778188979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VDdDBeOth/GyO4S6LG5C4tIpCfmXMPVkXYvoyOVLmpc=;
        b=CewSRabuswbRo/lOjYdh/4tiuZBQfxRENMNWn4o4X8XpvGyzlPoKkVIGRzi1rA3H+q
         jxlfnwNKAs1yW86O/R97+5uXVHM2Bd0asy4Cq8i7MTroPw4tMfPSn0X+2lXgvpUueCuI
         aizGkPXoN9qnNxhr8uHPQcreUdOGCDdIN685MfDMCDSd7cggo011BV19OMUp3c7TQXIH
         ssqe2ZLZF7jXrSJX89aChy8KcEiO3sH5COa0XHMDTB8PBY1bmbjegbFjU2Ee45x53QXP
         XgBGG8dfXxIlzZoGlIbI9/Qu3uNAdNid9cEitgVfMVIQbM3RlsPgekferJfILJq/fyYx
         7qqw==
X-Forwarded-Encrypted: i=1; AFNElJ9A6GyTVDpFIez5kuNBS/NPnhujR3f3bEdlMiIAjRxPm57iQtI1IF+5z6IBg7SMJoshi8DG6k0PWbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySF9dLNSnsQOrd4j7XJN5DqfWBvoVSbbCwGw7nCjNKgW7H8lY2
	+CEV3VophaCta0Y5nYopKgGX9SjrhqkkVzLuj+D1GoTybG5mDG/jcECFAvDwYhNSQFjrTxUKazg
	1CSqCExQYDkCThjmN3ohY41/yHuMwsagaM/QCAIzV
X-Gm-Gg: AeBDiesXuRPNU3V2lFKJS6mrU+CGk3DKHUtk95AXklCfjXiwBexCcbN1yac5dRJWzk8
	vxRwtA9PbLSXWlm/5aduQJB0Eq4vC69luX/f/y6etnCBvSFGkN4MZrKotFZEhdijCOoQ15wRGFJ
	Vu2CY/g45jay9mgOXfM5pW7SdxOmehYT6EeMHLcUSoBp6DQdMM8Xm6/0uAVRzp67dGlpzQjNd08
	9I48qUq5eIfSCok+IwRJ+EnCvWB5uNaMb1jKP2ljv4rE/7GzQvAEJ8MJ3/J3aUigCuhLTlyV2ZK
	wV2hxb/VZKe3qKEKJQpwKaP5YA+nsg==
X-Received: by 2002:a05:6102:808f:b0:60f:7499:9b6b with SMTP id
 ada2fe7eead31-62ad51bb6d4mr2567155137.29.1777584178374; Thu, 30 Apr 2026
 14:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com> <20260423212316.3431746-3-dmatlack@google.com>
 <20260428201231.GA3885809.vipinsh@google.com> <CALzav=dfLtdrPhkBkGwHpDAWUBMHnbGPccwhy1__doziNVZQJQ@mail.gmail.com>
 <20260430175916.GA13902.vipinsh@google.com> <afO9VOckgyiiokw8@google.com> <20260430204009.GB22297.vipinsh@google.com>
In-Reply-To: <20260430204009.GB22297.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 30 Apr 2026 14:22:25 -0700
X-Gm-Features: AVHnY4Ikcvel7QdyZYGumdrGxwhKO_qS6LiUUIjUSJt8Np0PybdhnEVt0dyw8U8
Message-ID: <CALzav=dsQ7fj3MJ8Fbv9LZMjeayOgM31c-PZZd5JVL2gov+3=Q@mail.gmail.com>
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

On Thu, Apr 30, 2026 at 1:42=E2=80=AFPM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Apr 30, 2026 at 08:36:36PM +0000, David Matlack wrote:
> > On 2026-04-30 11:25 AM, Vipin Sharma wrote:
> > > On Tue, Apr 28, 2026 at 02:12:13PM -0700, David Matlack wrote:
> > > > On Tue, Apr 28, 2026 at 1:20=E2=80=AFPM Vipin Sharma <vipinsh@googl=
e.com> wrote:
> > > > >
> > > > > On Thu, Apr 23, 2026 at 09:23:06PM +0000, David Matlack wrote:
> > > > > > +int pci_liveupdate_preserve(struct pci_dev *dev)
> > > > > > +{
> >
> > > > > > +     if (ser->nr_devices =3D=3D ser->max_nr_devices)
> > > > > > +             return -ENOSPC;
> > > > > > +
> > > > > > +     for (i =3D 0; i < ser->max_nr_devices; i++) {
> > > > > > +             /*
> > > > > > +              * Start searching at index ser->nr_devices. This=
 should result
> > > > > > +              * in a constant time search under expected condi=
tions (devices
> > > > > > +              * are not getting unpreserved).
> > > > > > +              */
> > > > > > +             int index =3D (ser->nr_devices + i) % ser->max_nr=
_devices;
> > > > > > +             struct pci_dev_ser *dev_ser =3D &ser->devices[ind=
ex];
> > > > > > +
> > > > > > +             if (dev_ser->refcount)
> > > > > > +                     continue;
> > > > > > +
> > > > > > +             pci_info(dev, "Device will be preserved across ne=
xt Live Update\n");
> > > > > > +             ser->nr_devices++;
> > > > > > +
> > > > > > +             dev_ser->domain =3D pci_domain_nr(dev->bus);
> > > > > > +             dev_ser->bdf =3D pci_dev_id(dev);
> > > > > > +             dev_ser->refcount =3D 1;
> > > > > > +
> > > > > > +             dev->liveupdate_outgoing =3D dev_ser;
> > > > > > +             return 0;
> > > > > > +     }
> > > > > > +
> > > > > > +     return -ENOSPC;
> > > > >
> > > > > Since it is executing under a mutex, and we already failed
> > > > > 'if (ser->nr_devices =3D=3D ser->max_nr_devices) check above, wil=
l we ever reach
> > > > > here and return -ENOSPC?
> > > >
> > > > Yeah I wouldn't expect to ever reach here.
> > >
> > > Will you be removing it or want to keep it just in case scenario?
> >
> > I'm not sure how I would remove it. The code doesn't not compile withou=
t
> > a return.
>
> Oh, I meant, inside loop a break and outside just return 0, that way it
> won't be a dead code.

That would hide bugs if the refcounts in the array got messed up. How about=
:

  /* This should never be reached. */
  return WARN_ON_ONCE(-ENOSPC);
