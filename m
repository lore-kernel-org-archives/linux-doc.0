Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE8426ED5
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 22:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584851; cv=pass; b=Cl8xBoHh8bc/f1WXBCPEGOuG8FkGMT0USxfp1jtbinha3Z4h0A+YuURBBjLgLABcg9F9pkHNLdrMnawMfnYB757CIxKK0a9kmzJJcn8UzdgYaBsK38gAsAvPRdmi1piFmFews1ujGtu85Mwpufz1R3Yj4TeCmwTIs62YkhBqLsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584851; c=relaxed/simple;
	bh=qeXXYXXoXBC9W4dpH975rfhTdv1IzKjF3KbKsLbRmhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqWZtzMjvlZWGz1/IIDz9bcEnWQp/3e/h33zX/ror2mFsltYj8fnhKeeUqXesS8zFk/He1n5Q7xmdt4TJlGdp3am09/48bDcjGhDZ/JCc/dHEq0Vp/yvxJvmPqGxC2f86gB5ScC0L2e09Jezx6V5AYsIy9pJgoqfdYbdywisW60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3bgXtky; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3bgXtky"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso6826396a91.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584849; cv=none;
        d=google.com; s=arc-20260327;
        b=BUSvZgK1sjAGi2Y64D/t18CQb9rjC52yuNtEbgFAPu/IhtqQHAf1EH7Rek1LThdQn6
         hteZcrxlvFIFpghnXfIgB/utHzY+TCTcTBN/JHRf4V62GCll7/GWkC14I63k4P+HeBfe
         877gkzNQrBagN/7Ags5aD3B1vF56K9Y19M8ZbLGkTdHjhhQlRSlHbIWCxH5EiWLQzOJs
         /rqQTpGruBPfCfwZO0KYpf+/8GT3r5n5aCDVjMAqT4MkClongggk3UubK4qOjeEsocBf
         vLB7EkBYMHkF6d67CZ+6aKEqdTmvTfAFs22qRyWvD9QDaTEJkjGC13PMNRFMyHAxql30
         CBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gj82UvWIC9kB06K4+/XSzH6MrQ6ehsQ00zZOFqHM1MQ=;
        fh=Y3FFmmyn+YFBNpqJUoyQ5d+geQzPPW6sj769IfBG1vg=;
        b=bBst2FgY7rh48st8bsLpmTDi9W3ePpubDwt+6uPfgfF+nQyyOPw7mndKbgQM7KE9YY
         JMRe+iDCZU2Fd3LIcVGOaqgiuqUf8R4mkbVcxdWDIhyXQeAz61ksGqXfeaK3HO/fVQX3
         FVx2DxaEa18x+pua/mV063Lqvo8gb87iAtESL9Y0RVvBrxt0nlu8CFcSYNF8pYhqkANr
         kFRaRCVZq4Nwi2GP3KCeGWoo18rE7unh3hdDm5xaGJN96AU3NAtNDTNn3si2ApLSB1wV
         mqkqq44FliH7s3Q76v+DHwum/PkHbi9emM2w9n9avoMGO/JGOPtB9cZpf3dod8WWmOs9
         dwCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784584849; x=1785189649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gj82UvWIC9kB06K4+/XSzH6MrQ6ehsQ00zZOFqHM1MQ=;
        b=Q3bgXtkyzflaUSwFiUtY6GhqD8Pgb9NCzdLPnbs6mdWr7CPzFcNFwi0rTnvbn6PGLy
         sMuhWZoxHQEuBRAQfYe2+Ba6J2lcwlSDIZUDY6SJwako+hSXlC5Umcpwj3bJkaSstKIo
         HOgQNnxXcj0sp73aSCT43pxrvcNybpKVGVs80gzosfwyyWGFLhAf+uvKEkdhNGR+iJSb
         aRFKRavFsdZCrk8gMc5WXlhZJksddF/Lbwu9ZB6v8ERwar/WevMtbOddQav1bAtxx0cG
         Xps0R+7o5qi3UKpq4IWG0Cgu+3o+KejGI8typMDidiK8XCpy/YnYp9YqD1zqMyPtjfXs
         UJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584849; x=1785189649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj82UvWIC9kB06K4+/XSzH6MrQ6ehsQ00zZOFqHM1MQ=;
        b=PkZMdkR8xArnNfJRu4x5sGs9ot/xFn0A+3nnYs9VO5+4H4DyMLvEOVLXX10Qz+ZKYe
         V/2z1OlkhryUMevR48N0jw78PzOzuLdapDN18Nfyxk20UYTiapE28IZgoMwHbRGUKxHy
         IB2VA0bZLfPdIyeRmJ0csUKIvzy4sCmjnvR1VED0jK78AGQX+dgTR9Lz7C6E26e/NODR
         7h+0rBV9tPLruA2H68+kuxG3iuKmVEFd60L8Bj0ygNVTS/0DkWgA35+um7RwlAheTalQ
         kOJeZY/Z0LumnKk3d5uQBcJRmkK2mymovn5//blUe5BI7xOcygQfd0Upc6net7ALH5lc
         pLaw==
X-Forwarded-Encrypted: i=1; AHgh+Rpd1ss6rZdn/copUB9viHVhw597ZLk4IcnrBkM+EmdZqShYsfHDdyrjFVky9B9QqSaqBvV9BEzQSTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz/EK+yHOScDJhGI3yfznZJTC4KqjQCPV+GyF6YfrE+w/0gwdq
	3GMZd1Hy9x69UzwxNNaLieTVbIa1mpDuES2eNWtzBSiQZ/5SFAtE47cYfTwH/7cQIRN/+3SXI9X
	JNN2sABe65Gi/8iGBrKBSNucV+3VobUQw3iSFPIHu
X-Gm-Gg: AR+sD10MNx65Z2rPFWJyzXzCpkbvfHMgnCmyyi5R+//XMH3y/csD2XTlVOyHnkJh56c
	agYmgzozmS+W6n1mDiFNqpZE13/E+n2N904mdcR3EK0iyoWcV35oZ2t3zSw8AeCsc10pRiiVVLY
	62xw/RuWfcA/v8UnCyKP9F8tOh0exnoien2LUD8ARnC02zUyeuI1nV+tVE1f1I4BUsOC/OLE9gy
	P5sDjPE2WDoF98X89yJ0P9dFjyZvtqX3tNxzxSTQdmB3OkprMGZEPoJ3pxOEA==
X-Received: by 2002:a17:90b:1dca:b0:38d:ef48:b04 with SMTP id
 98e67ed59e1d1-38e4b454d1cmr17323817a91.10.1784584848356; Mon, 20 Jul 2026
 15:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-4-dmatlack@google.com>
 <20260717163820.6bc8c13b@shazbot.org>
In-Reply-To: <20260717163820.6bc8c13b@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Jul 2026 15:00:21 -0700
X-Gm-Features: AUfX_mzNR0w-MD4Mb6dfdU632NpNdotxFCmghB3mJDm5NOOEi_E54XencSYW9rk
Message-ID: <CALzav=eQ-0rbxh6Eekbt4zUoNGNZc_THmSCvVWVwE3om1BPtdw@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Alex Williamson <alex@shazbot.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:38=E2=80=AFPM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Fri, 10 Jul 2026 21:26:06 +0000
> David Matlack <dmatlack@google.com> wrote:
>
> > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev=
)
> >  }
> >  EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
> >
> > +static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void)
> > +{
> > +     struct pci_flb_incoming *incoming =3D NULL;
> > +     int ret;
> > +
> > +     ret =3D liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **=
)&incoming);
> > +
> > +     /* Live Update is not enabled. */
> > +     if (ret =3D=3D -EOPNOTSUPP)
> > +             return NULL;
> > +
> > +     /* Live Update is enabled, but there is no incoming FLB data. */
> > +     if (ret =3D=3D -ENODATA)
> > +             return NULL;
> > +
> > +     /*
> > +      * Live Update is enabled and there is incoming FLB data, but non=
e of it
> > +      * matches pci_liveupdate_flb.compatible.
> > +      *
> > +      * This could mean that no PCI FLB data was passed by the previou=
s
> > +      * kernel, but it could also mean the previous kernel used a diff=
erent
> > +      * compatibility string (i.e. a different ABI).
> > +      */
> > +     if (ret =3D=3D -ENOENT) {
> > +             pr_info_once("No incoming FLB matched %s\n", pci_liveupda=
te_flb.compatible);
> > +             return NULL;
> > +     }
> > +
> > +     /*
> > +      * There is incoming FLB data that matches pci_liveupdate_flb.com=
patible
> > +      * but it cannot be retrieved.
> > +      */
> > +     if (ret)
> > +             panic("Failed to retrieve incoming FLB data (%d)\n", ret)=
;
> > +
> > +     return incoming;
> > +}
>
> I'm having trouble following the error escalation here.  What's
> fundamentally the difference between FLB data being provided and not
> compatible (subtle log message) versus FLB data being provided and
> compatible but we cannot access it (panic!)?

There is no fundamental difference IMO and I think we should handle
them the same way (panic). The problem is the PCI core cannot actually
distinguish between "PCI FLB provided and not compatible" (should
panic) and "no PCI FLB provided" (should log). I would like to propose
changes to LUO so that the FLB handlers can detect the former
situation but that requires some non-trivial work that I didn't want
to block on.

For now, I guess you could say it is up to the user to not perform
Live Update between incompatible versions. I can update the
documentation.

>
> Don't both suggest devices are running but we can't get their FLB data
> to continue letting them run?
>
> The errno interpretation is also slightly different than the comment
> above liveupdate_flb_get_incoming():
>
>  * Return: 0 on success, or a negative errno on failure. -ENODATA means n=
o
>  * incoming FLB data, -ENOENT means specific flb not found in the incomin=
g
>  * data, -ENODEV if the FLB's module is unloading, and -EOPNOTSUPP when
>  * live update is disabled or not configured.

I think the only disagreement is the lack of specific -ENODEV
handling. Is that what you are referring to?

>
> Thanks,
> Alex
