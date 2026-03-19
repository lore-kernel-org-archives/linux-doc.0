Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED76635A38F
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941068; cv=pass; b=Dno6cQjGAkU53ZzbiTUvvxhPv6ODAQZ1yb1+pD66QI7FEBtmPO1/aCK8rrrI75ZKQA/lCJ7TI6llB87Sb9gFPZNH8gkDn7jn+9pacqj6bkSo8ftGgoCnHXU3ZKDJDVazvoVitkoArBBLlbO3wuiN7248Vc5PeZ1zW+pU6wF8hJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941068; c=relaxed/simple;
	bh=PnRXQ5r536tu9dvMTvBl5NRPrIFr2RFjQXbYpbnAzLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoCtr9t3PD/GNw3Lfskl4pv+aHYIDFuFfjN5GYlGb9YfT1KQIQ9X/yAEmmrmwjcgrnuWKOZzdn1RjqcSoOqkwtP1o5b25EG3QjhgOCExii2hu2modMK2iai2ACGCgttvvWnz5rc8GMf7/JQgrfgqnbTBGq5AzmriNqtBP4niL1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sB5di3FR; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sB5di3FR"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a1307438ddso1157057e87.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 10:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773941065; cv=none;
        d=google.com; s=arc-20240605;
        b=AF0ZlRhBSCFudc49JmB1sB/Uf6vW9v/V9IQB8EiaIJRt6KvptXmzRrwwx1rP1/3D6p
         DHh1KZ9tlW45NlPoAX69oUDmnD3/7IQl2i0Y07kP0hecTcMoB81CSTpxhkqSqMhBGP7Z
         F0oNUjr5UJvZff1P+HV892Z8XZj8CS1ek/J4HuZ2GJ3nMuGa9qRXxWqV8lReK/iZgOkn
         0ucRkL3IhQeKcKx2aW328ZHmmk+C99/5g62AkgexNANh4Yj0aBQq7MUsIl6vEpldGjpF
         hm1WQa7+b93W4twq0vC6oHAKzFnf5SpNVAWPF7p0PiPtASwwT1sch2GiOiIKvynudo3N
         Ykyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWL7Mvz3ZFb3DsvrD6klOpnMDDqkJa/pdjIb2Ow02uU=;
        fh=PLbj0n8DVH2RNy3m2gJAKQ3v4h0TgVenlTdXBdPZk4s=;
        b=CvJamu/tv6ur7h4oQTeJ/+JWq5urfN+GCsHH4P18GtmPknrOEIiv0Ldze/4uFDvSlK
         ywpJmepO3wdmzQAGiJiZ9pJnozM9OyRCJ5B3W3rKWt1O/5bqmp5H2jz8WfcanwqtgPy7
         G//z8WtHNv9jBV4t189iCm/H5uwcB82Y5VBKXP9PhtJYP+5FAg8TzHMS3Q6WW5b5+6x/
         RQ0B4FIZRa4UxRm7bLrBuiJpWFdX8mEfA6hLQ3VD+ETB5obbs8tvQRmzGp/cSKQPHvyK
         KJ8mYknl/J45AOGP8RoWn090Sbap9iWnPSx4sgDDk1gnlHcJbFjHXEdBb+E0pT6aWdiA
         2npA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773941065; x=1774545865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWL7Mvz3ZFb3DsvrD6klOpnMDDqkJa/pdjIb2Ow02uU=;
        b=sB5di3FRgJ9AXnlpTkOtdsmLaYjKyf8sZRsiZOwR5HpmHxIGL2jjU8LyMmZQnHAleu
         ODrpsSSqH5k4tpjlbe1BqR4g0C/xT16CzNerIj6obCQ+CsbtCFO2qqBtRS0Mv+q8lt1P
         d8PpNaiyi+hZcdIs9ovvDvAzKiuqUN4fZ5Grl5FnScr9r8uwFk1TkI6z+oS6rWvWWxMj
         uFIiRzqoc+tCdOawOx8cT2HfgpCa7ryPk8VhHaTK1CX8oWB5nrKOomORqAQskIZerm++
         jGKnE3uIgXTlIkpLLemWDbo/z685KXLGIkfyr0L87hpdUKENvZWhFpPXFsxm6eticyrl
         TSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941065; x=1774545865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWL7Mvz3ZFb3DsvrD6klOpnMDDqkJa/pdjIb2Ow02uU=;
        b=bLX5wQ7Qs9Mss/UsubNN8St9JUjispDC330/1ZBgP5YWbuiddqNIZyBu37Gzb7W2xY
         rJc9doxaO1Y0s3zRbsom5DcM0qeoqy1LV6rMG+Y3xo/KnUndd4uWhQEy1usG2H+yrEax
         IznXazu6d71hQ24Yr/O6z4OoYWGkb7ZXHxeY8kbJL2Qvn9/OuCUkWOWhsHXgWkzeTO0J
         4nZFomuyiQh9IdAKR89OrMJBuNCYI/tmFMDz8PK3WbJq9ISslkG1N1nzWvf4xESEIuU8
         h3DGh+md14QzTNwrhToErSZnuoC2lJfxwpELcwObLJKix+rVKp1HPGlf5VBpUQEPqeYt
         sS7w==
X-Forwarded-Encrypted: i=1; AJvYcCWa6IBa8+za6aYfSg8+XBKSEgfjR3EFqlJtBC8gEq+3gqvEBPqnvKGE8OPu/bgT9o/Vft0vSz58ur4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwctzHDmDEJe/5WrSz185SA9fTryRlLOClOtiSYN52mnsbuAVGS
	Bno1tygKBCy24L5DFhEovQzvJhRYkqUurHkfPEAfks+h6dk93AjkFafHOIYOz8DIK2gSgJUdKLD
	H0vEmK+W1L2CeHUW20+oFiunZdK8OHPBlrdIoHcTz
X-Gm-Gg: ATEYQzyT5Hp/r/INPBaQXBj0uKWNFuqEoDuOjLUgngJe4f0/6kBEob9SpgP4Bj+KrwO
	Vu9Iyp2AESEiZM1fL/aqxOom49+/MHfnnq7EQ+6DGbcar3qhcPRYXXMA4S9kX4Z6v/WMJ4lA7b+
	E2FW+ooO8bzoZB97KEVFRK4diBH+VVkMLJoQ7xmB8fcIXFqjN4ZRqz0blML9DVj6Qfrxrj7HrM0
	c0bb3+Na8dbtsR0K0nPJuTf7Jbft3CqNGWViz1/KMUQXKt84PzSpZq3DrWymmlA/uETnOjeekxW
	KwNrnrAw
X-Received: by 2002:a05:6512:4016:b0:5a2:7e5b:5a48 with SMTP id
 2adb3069b0e04-5a27e5b5b70mr1566015e87.26.1773941064245; Thu, 19 Mar 2026
 10:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com>
 <20260227084658.3767d801@shazbot.org> <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
 <20260227105720.522ca97f@shazbot.org> <CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
 <abNOwcOTXqxCxNzt@google.com> <20260313083918.00005731@linux.microsoft.com>
 <CALzav=eGLpo5nrsHq5L8bUTC=FWZ-SgrTE1FoScrWB4p+NDgnA@mail.gmail.com> <20260319093932.000078c2@linux.microsoft.com>
In-Reply-To: <20260319093932.000078c2@linux.microsoft.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Mar 2026 10:23:56 -0700
X-Gm-Features: AaiRm53rqLDO8igOEPnPEHv7Le9OPlkg99gzLBiOllDBuZj0inzOHo1IukO9vNo
Message-ID: <CALzav=fvG+s6MYNzxhuHFmQkmTRJJASXAGs=zQWWSnSv3Y=J9A@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 9:39=E2=80=AFAM Jacob Pan <jacob.pan@linux.microsof=
t.com> wrote:
>
> Hi David,
>
> On Mon, 16 Mar 2026 11:11:20 -0700
> David Matlack <dmatlack@google.com> wrote:
>
> > On Fri, Mar 13, 2026 at 8:39=E2=80=AFAM Jacob Pan
> > <jacob.pan@linux.microsoft.com> wrote:
> > > On Thu, 12 Mar 2026 23:39:45 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> >
> > > > +config VFIO_PCI_LIVEUPDATE
> > > > +       bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> > > > +       depends on LIVEUPDATE && VFIO_PCI
> > > > +       help
> > > > +         Support for preserving devices bound to vfio-pci across
> > > > a Live
> > > > +         Update. The eventual goal is that preserved devices can
> > > > run
> > > > +         uninterrupted during a Live Update, including DMA to
> > > > preserved
> > > > +         memory buffers and P2P. However there are many steps
> > > > still needed to
> > > > +         achieve this, including:
> > > > +
> > > > +          - Preservation of iommufd files
> > > > +          - Preservation of IOMMU driver state
> > > In the interim, what do you think about moving forward with noiommu
> > > mode without preserving IOMMU driver state?
> >
> > I haven't gotten a chance to look at your noiommu patches yet, but I
> > do think noiommu will probably be a good way to develop the VFIO and
> > PCI support for Live Update without blocking on IOMMU driver support.
> >
> > > I=E2=80=99ve tested your
> > > vfio_pci_liveupdate_kexec_test with the noiommu cdev, and it works
> > > as expected.
> >
> > Would you be able to send patches to add noiommu support to VFIO
> > selftests? That would be very helpful toward allowing us to develop
> > and test Live Update support with noiommu.
>
> It is included in the noiommu patchset; the only difference is that the
> VFIO cdev name is prefixed with noiommu, which is not strictly required
> and is done out of caution.
>
> /dev/vfio/
> |-- devices
> |   `-- noiommu-vfio0
>
> https://lore.kernel.org/linux-iommu/20260312155637.376854-10-jacob.pan@li=
nux.microsoft.com/

This one flew under my radar. I will take a look and respond there, thanks!
