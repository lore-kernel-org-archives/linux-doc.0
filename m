Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7736655A
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 22:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059861; cv=pass; b=P786UaUCcy2IUTj5TJpsQEKgUL2cMfDEnCBsiwQirtfhYTuS17rb41K6sRAMusJJsJ7j2LO2vqrfXiPRpgC1uW3C7NSEcO8mZnqxXQOi7CGHjL/osJlQFalXnT/0d2cl0J94H3LvjeIJ/hbSrdzsjyblsM8/N/QG5e8v42ukYsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059861; c=relaxed/simple;
	bh=7OqNOR2pf3cTOCHBcFY4ktMJJpHonFJgCAwij4qDwtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vk+LDlTxkhCEzNuOCu3FFQgNmfAtAj5Q4ViJ0hTmbwMGZLjEl/6QFQ43PFglt4dFIZ2fsTQ/jVypRwOpMryKTz5lT+npT72GLGOBgZdSbd9ctWecTdlQfMuzjopXFNkxnB7aNF8JL1Tos1a98M3wDv4CmVsabP835MCI/0sLf3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WVRV/1XX; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WVRV/1XX"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5033b64256dso193311cf.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:51:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772059859; cv=none;
        d=google.com; s=arc-20240605;
        b=VARgSSj+Q4x2g8NRV++XQXJSz1sdVzj6uLzuBlziisD6Jvlcqp/LHRE1nGettZGgut
         2ZVtcYTp8/PtzH/+eVEit6dhTY312v6/c3pdk7Zp3/ZfBRSrytaLNTpxcYIy0dkNwYfj
         q3t/9h+xOs/pmCwGmMXH3XftheHrDboujQgfW6j5nLiq54hS8RqvjvI1rnAwctryDa9L
         IrXVXqDgu+o1GU0/MWkxEOngFLc6n0Q5mnkrI9yV1YUNLYsPaWvYmAad2HvQrElY2bn3
         aQr73qJDC3llqeXT/V7kUte4oKx90SV31agJ7hNpZgKO12eusfQkMgM0zw+D2qLqcIWa
         NVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsOXiL/6Qn9m7Yd1SU2mFbssuofZOBkFUGv1WIDmPB0=;
        fh=E37zBId6OKnr7xPgSfHjYWIWgK+ocwzItVXPbSp5wAQ=;
        b=QPdQqn7OpIPE4iRaWY07e58K1fhSdcP4rHf2F+T+kod9tTSvVuDEcaWPsA2mmdgeF7
         lsZ64TmiJQJ/hmgNi2fdpU6bcGIAxaZQBN5SmN22D1gYbNM39Mpj4wV6qgFCJc1xnVvd
         cDHDAJQiifi7g0urI2nToRMG6UaCE6c+jYeI0pV7dugXtVj3SAsJLWGbwYWkA+jm5ZSI
         obUeR/zpZ5C/iXQd1cuNpulfbNdSwK/T2Qm7dyNW53V9ckoUiuJrsXZ6sPmFt5VJidTj
         N4Lb95tSoNylcenCAPiaCqXdG/YbNPndnrJ5Pgo6iyaLP0/N1jU+uQipDHECGjCko1DL
         LvxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772059859; x=1772664659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsOXiL/6Qn9m7Yd1SU2mFbssuofZOBkFUGv1WIDmPB0=;
        b=WVRV/1XXo2nnw8gzHzdS8IksP9JKJvN3r6Llnl75OoENUwU5YDeA9MYBGEFJ9nBAd9
         J2IyxpI+5I8/f8KlhHspyQxqjMQqFVdGuyY15FT88FsCEbh0Gnrx3OQwF8uAVf+Y/wXH
         udcDYJpAudc8TDhtI10nVAMJgFuFYzKKqOotF1h3fiM5+i+rswqgvv605CkgnyXgjh22
         2P/0AfOQoYmBaoOiaIPsQAcgXxM7WW3G21sByw1cq3WvPBd/UgRbG0bRapKQlaDnnpxF
         1/N3w/nSBohJrJPVpdytsvq1ReNEffews0/3EuPaAR4TVp4MH1SO5aTam8noYyp7wwfb
         Nc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772059859; x=1772664659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MsOXiL/6Qn9m7Yd1SU2mFbssuofZOBkFUGv1WIDmPB0=;
        b=pWQWK8gmL9jaO7fo1axzkVBgjmEvCodYkvrY+iFFVZvcjjGZaQLbgImizFugGSk4uY
         IRkxMm4Ypas2M7iW76o8jZ0G6wkQ5cIvF29yzliYk+cXVPas1DydDtC5te/hJw8LYWas
         uaJ+gSaZKexLxMSCrBtvuFXYO/ShFR/jQo3uy+9+G5gS7JGkRXr8vDydYaA5SMbDr/Ku
         ZUi9ILsFqRpFxcA+stszb1ndoilS1i0cToZ0gYbQFkyKIMkSzg7skXfp4T8Lm54Htakz
         Ru3RclnE4oaQlWD4MKVSClxSdCC/+TM3tNEnj4qbiu91pfrtL/byUT+/X0N4zT/nHBCB
         0aow==
X-Forwarded-Encrypted: i=1; AJvYcCX8H+r/mLbusFmi2W/m+m4zYPrHSuDyXw1onyFvDGhbKus4H9+ZQgg/Zic/Jes6gLWlTrY5Qfwjpjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUPG+1hVFDo8uLNNDMwScys8aO1QVGXXWN+1zY/0tTD5xcQIqU
	ir0HWa8Oi7QQmsM0pfUgOofWGQLNKtk32w7eeTGnebBd43Z/AS/4fRH59ebrVRw5RQ7MeBJwgJ4
	Z5GhsbrZb93pS3/ujmWrgDmQpdc0xMTE3NUUzhscp
X-Gm-Gg: ATEYQzwqz7CoQYgMY8GIQ2rny1KRNWubasM5jmZwAgS8IO6SV3s7KsSeY2FRAJghWfc
	imCdTRmFnuzc8exxZD4Tdj/ZABvV1JYU3nuDBIToqA2G6fMshvJMF7ESVdcGvq+qtUm/Y70vqcD
	1JVhFiBgk0/6HPxA/S2HRo0PAAVZ/a91DlJu8Tq56tL9OuZaE1l/5xocohPmhha+7/4HnbHwShr
	aKtkoQiYB4YcSoVCyiE3jR2ghC22DMe8WB0DCb/9rOaDQK4in//k4U4IozsxCV7pHciwMhXhvVm
	nhL+vu1nTEHKc9woae9/yROwxY+MFdXahWlHptdXocSxR/PJvQQ8
X-Received: by 2002:a05:622a:10c:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-507441cb73fmr3920551cf.8.1772059858971; Wed, 25 Feb 2026
 14:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-5-dmatlack@google.com>
 <20260225143328.35be89f6@shazbot.org> <aZ9yWlcqs2b6FLxy@google.com> <aZ931bYILhhkhW-Y@google.com>
In-Reply-To: <aZ931bYILhhkhW-Y@google.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Wed, 25 Feb 2026 14:50:47 -0800
X-Gm-Features: AaiRm51aoTymXymwCHLQ9gcq3ldQPi6BvUrjqTLQO_zSuAjigNCnBqzqKSIxD-4
Message-ID: <CAAywjhShWTQbkwhDYB=9a_PZjGHnJ-=HTLAzDBvnDsmtvP=Auw@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] vfio/pci: Register a file handler with Live
 Update Orchestrator
To: Pranjal Shrivastava <praan@google.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 2:29=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Feb 25, 2026 at 10:06:18PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Feb 25, 2026 at 02:33:28PM -0700, Alex Williamson wrote:
> > > On Thu, 29 Jan 2026 21:24:51 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> > > > diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pc=
i.c
> > > > index 0c771064c0b8..19e88322af2c 100644
> > > > --- a/drivers/vfio/pci/vfio_pci.c
> > > > +++ b/drivers/vfio/pci/vfio_pci.c
> > > > @@ -258,6 +258,10 @@ static int __init vfio_pci_init(void)
> > > >   int ret;
> > > >   bool is_disable_vga =3D true;
> > > >
> > > > + ret =3D vfio_pci_liveupdate_init();
> > > > + if (ret)
> > > > +         return ret;
> > > > +
> > > >  #ifdef CONFIG_VFIO_PCI_VGA
> > > >   is_disable_vga =3D disable_vga;
> > > >  #endif
> > > > @@ -266,8 +270,10 @@ static int __init vfio_pci_init(void)
> > > >
> > > >   /* Register and scan for devices */
> > > >   ret =3D pci_register_driver(&vfio_pci_driver);
> > > > - if (ret)
> > > > + if (ret) {
> > > > +         vfio_pci_liveupdate_cleanup();
> > > >           return ret;
> > > > + }
> > > >
> > > >   vfio_pci_fill_ids();
> > > >
> > > > @@ -281,6 +287,7 @@ module_init(vfio_pci_init);
> > > >  static void __exit vfio_pci_cleanup(void)
> > > >  {
> > > >   pci_unregister_driver(&vfio_pci_driver);
> > > > + vfio_pci_liveupdate_cleanup();
> > > >  }
> > > >  module_exit(vfio_pci_cleanup);
> > > >
> > > > diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/=
pci/vfio_pci_liveupdate.c
> > > > new file mode 100644
> > > > index 000000000000..b84e63c0357b
> > > > --- /dev/null
> > > > +++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
> > > > @@ -0,0 +1,69 @@
> > > ...
> > > > +static const struct liveupdate_file_ops vfio_pci_liveupdate_file_o=
ps =3D {
> > > > + .can_preserve =3D vfio_pci_liveupdate_can_preserve,
> > > > + .preserve =3D vfio_pci_liveupdate_preserve,
> > > > + .unpreserve =3D vfio_pci_liveupdate_unpreserve,
> > > > + .retrieve =3D vfio_pci_liveupdate_retrieve,
> > > > + .finish =3D vfio_pci_liveupdate_finish,
> > > > + .owner =3D THIS_MODULE,
> > > > +};
> > > > +
> > > > +static struct liveupdate_file_handler vfio_pci_liveupdate_fh =3D {
> > > > + .ops =3D &vfio_pci_liveupdate_file_ops,
> > > > + .compatible =3D VFIO_PCI_LUO_FH_COMPATIBLE,
> > > > +};
> > > > +
> > > > +int __init vfio_pci_liveupdate_init(void)
> > > > +{
> > > > + if (!liveupdate_enabled())
> > > > +         return 0;
> > > > +
> > > > + return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> > > > +}
> > >
> > > liveupdate_register_file_handler() "pins" vfio-pci with a
> > > try_module_get().  Since this is done in our module_init function and
> > > unregister occurs in our module_exit function, rather than relative
> > > to any actual device binding or usage, this means vfio-pci CANNOT be
> > > unloaded.  That seems bad.  Thanks,
> >
> > Hmm... IIUC the concern here is about liveupdate policy if the user
> > wants to unload a module which was previously marked for preservation?
> >
> > AFAICT, In such a case, the user is expected to close the LUO session F=
D,
> > which "unpreserves" the FD. Finally, when rmmod is executed, the __exit
> > (vfio_pci_cleanup) calls vfio_pci_liveupdate_cleanup() which ends up
> > calling liveupdate_unregister_file_handler(), thereby dropping the ref
> > held by the liveupdate orchestrator which allows the module to be
> > unloaded.
> >
>
> Ohh wait, You're right, Alex. I just realized the __exit won't even be
> reached because of the internal pin. The current implementation creates
> a catch-22 where the module pins itself during init and can't reach the
> unregister call in exit. I believe we should drop the ref when the user
> closes the session FD? Additionally, should we move try_module_get out of
> the global liveupdate_register_file_handler() and instead take the ref
> only when a file is actually marked for preservation?

If we don't do try_module_get during registration, the registered file
handler can go away on module unload while LUO is using the handler
during FD preservation. This makes it racy. Maybe register/unregister
need to move outside the module_init/exit.
>
> Thanks,
> Praan
>
> > I think we should document this policy somewhere or have a dev_warn to
> > scream at the users when they try unloading the module without closing
> > the session FD.
> >
> > Thanks,
> > Praan
> >
> > >
> > > Alex
> > >
> > > > +
> > > > +void vfio_pci_liveupdate_cleanup(void)
> > > > +{
> > > > + if (!liveupdate_enabled())
> > > > +         return;
> > > > +
> > > > + liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
> > > > +}
