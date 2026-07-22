Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0543769E0
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736673; cv=pass; b=WQZTgtUjJXI05dCj1Z/kci/P66qNkef/CLDxXaE8pDe0BMk+aAe4DmBJz6kNfX8InKPyS4wpAFKG065Y/x66xnSprIbGBtdMjuSKm6EyEZRVL5BUcrDY//0gKmblfd0CKYyv2ntlgyyd5sgc7HL4Ck5vy9q66e/+nRpqlLVZmac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736673; c=relaxed/simple;
	bh=X+axyyoRN6mByFR26fJSK7CZ9lsHionFDsNxBN6Pz3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEIgkc3OT+Ev46eNMp/bhWkxFKOVOgfGmvnvFMHnhkoPRzNmJ1n8Tt87olv88/9vytPtOBwUMcndS7/QONVzUo13h5wHQboxm79iNq6Sl7o0h7qDJb6wyYGxRzcx3zAg4TlZygaA4h+4ruDPnx8+InjZ6jsHQL/zfEStzNC+8NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JvyzGsZQ; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JvyzGsZQ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b159850b16so8985625e87.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 09:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784736669; cv=none;
        d=google.com; s=arc-20260327;
        b=kHxTkgmNhztUcT+D7TNmaEqKMacqTH5W5Vi1A01nuI7RpQqsf4LWCr34dEDTvVl/XR
         CiuTkUv8nZSC/qKHRrg3M+o9pHfRdXhleGJLEUN43wbgcDn8dvlI3/P2UtwQ7ofPCE/Z
         Amf2T7rJbjK/7OpU98rWPhPuy5R3gOWmgRZGKX0V5jp1lWBGc98N0btGxj5Xp6v98i1Y
         ysRvRTHdyy7OPsHZjcwIMeSXnDZxfJb23jNFPYDhKsEjuoZ+EI7OelicNDK+AZeDpz7/
         Vi4ZRGLJXIOSV2JPSLWFJMla5P69EVLJTyWqL5kDafThUGeCmzuicevRfEvCfP8Hxkc8
         uNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IcI5qs7jN/uu8ChWZU0RS5LTqt9hibuExW779DaX+1k=;
        fh=T6/Dn4FR8VXv6ue5mFT+KTMRzh2s+yDIwHXXCURaq7E=;
        b=LCIW1WHWLqqADUasimUDgpXOf8hkanwytazCimCJq11+e76ZXf3QMheQRSNp4/mcp+
         DzPYsgDMT6kehce1rB8L0g2hs+eFzsve1TZuf82ZyEEVS9zqjXNkzGaYqCcGhWhm1JLn
         d/syYUZK8b81wk57xe5cRRFndhW6SEwAnppaFofNx7us8tmxRz1XvLsSzb2W4aylcORg
         DlTBYr4xgde7jbF/Hc4xq/JiacoU08NYN6ucwBryKzIlBXdcqOQH6TX174B+FRr5qHGA
         ZysGvTUiwzUJdWSDZU8PDhl1xNy8cUyDqNawmOLcRx7uhyvSNetjAHSbJSuTJyFO9xxA
         G60A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784736669; x=1785341469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IcI5qs7jN/uu8ChWZU0RS5LTqt9hibuExW779DaX+1k=;
        b=JvyzGsZQFLWXH6vtrVjrkY7obZQ2Boft8iNbpVV3PXM97cg7NQLtsxBNvwQrybU0zx
         1gXMxNv4JX5Ch3uEkUu71jySzryR5X91B1NTSRUINjkHsrXmF77Is1kjka4wba5egCxO
         6grh5npIDC0OMGmMArg19bup4w472jzQnCbrlCXHOM4srlk3htvRadseGDDcLN5jonIB
         OdHRwADoNGp21PKLulu52fze0KdQApMoo2rr/J4tnWDnC8BqLFEo2/Yl0Kk9qknvdQE6
         WXLfzckTPCo3wZ5hmoN1he9drCCBvI1Y3J4Jh1GXPib8b4Q4sYsGDejzmEXmPt/dCFlb
         1gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736669; x=1785341469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcI5qs7jN/uu8ChWZU0RS5LTqt9hibuExW779DaX+1k=;
        b=ParX9NFsspHPjR0mEed+nyt4ViAZeR2001grFmgb7TMzywnnKh1fs8hPdZAStpQpny
         UCKOJCYh3+JR6IlaCpFvO5TyjPJZu9cBX8WD+SvsR4l3WEyuTy76hbCJKRSvfNA2sQ7P
         FidtBdhYOsh8Gp4rmPEMCokov1a74sVYoGJliUr6HwHo0jH3jvfdmKuLlwGJdMi+/Z/s
         8jlLOp53WNz75oHdZ8NaaPRhKRx/G30t6gb4pBwP2H9BNV6JU8LzuMqHz1y1QmR0qyWI
         BTj5o5Uoh15UGITnmQtVtiqeTRkxFfwbsbTAJyQ99iDZHIYVWPWB35kK0fPdlLiWnhKY
         Qoow==
X-Forwarded-Encrypted: i=1; AHgh+RpnXK9wLKO6J7Ys/g5SREg3pQi65zOhsTKMFowS/kCDrjIjSdW5wUE6VkOYPwV/Iie8vLGl4aPw8qs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPOPJwuLLWM2JaS6f/sM/od6U916ZZIjzyTmPvyORmAbQ8DBim
	mrSCBUGXygBPU6EP5MDZS7Apsskyyg8CaPTbbYlfFfSN3MLX9GuM9KQQL2em7jCDmWO4dR9RM6j
	LjbOmmZPGlSz7ZJPKadAutyE+wzGTI1Vp3sA7zxOi
X-Gm-Gg: AR+sD123ORpXaLg3egljqj5dc9rBrNDT13eN6NOAo4QHM8TaaoC4LE+7qs8PqQD7uhR
	gUQ1HfUJeCOEdeTHkrgB6dES7bBZI4ZDxDqb30T+VRvAYSYIUQwKXS8Xyx6iKmQ4oLcP+6wcjuO
	d4oG8bU/YMCdYEKHOuFmuwhANtAqm5wuj3VdqIyQsbGqktTOyvQb0FMZVycnkMf45hN+8GgwrSc
	i6p1KjwYZgzD/0Uu9ykc27U78L53VeoZ3RUkP2tAwATKsn0uek6i//lFkOqlTnvM9xJiPtQTFuC
	yciBffOzetniN1nB
X-Received: by 2002:a05:6512:124f:b0:5b0:1ace:3bca with SMTP id
 2adb3069b0e04-5b28fac59dcmr5709185e87.65.1784736669024; Wed, 22 Jul 2026
 09:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-4-dmatlack@google.com>
 <20260717163820.6bc8c13b@shazbot.org> <CALzav=eQ-0rbxh6Eekbt4zUoNGNZc_THmSCvVWVwE3om1BPtdw@mail.gmail.com>
In-Reply-To: <CALzav=eQ-0rbxh6Eekbt4zUoNGNZc_THmSCvVWVwE3om1BPtdw@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 22 Jul 2026 09:10:35 -0700
X-Gm-Features: AUfX_myAcr2geqnXYh1xnj0XUmNEe2bz-zIOTwyIeRO5MtevXktrjd32lAucA7Y
Message-ID: <CALzav=ej05tZbVJUqZC4BOSCtZ=EkQ8GsckqLN61qKbyMHWfKg@mail.gmail.com>
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

On Mon, Jul 20, 2026 at 3:00=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Fri, Jul 17, 2026 at 3:38=E2=80=AFPM Alex Williamson <alex@shazbot.org=
> wrote:
> >
> > On Fri, 10 Jul 2026 21:26:06 +0000
> > David Matlack <dmatlack@google.com> wrote:
> >
> > > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *d=
ev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
> > >
> > > +static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void=
)
> > > +{
> > > +     struct pci_flb_incoming *incoming =3D NULL;
> > > +     int ret;
> > > +
> > > +     ret =3D liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void =
**)&incoming);
> > > +
> > > +     /* Live Update is not enabled. */
> > > +     if (ret =3D=3D -EOPNOTSUPP)
> > > +             return NULL;
> > > +
> > > +     /* Live Update is enabled, but there is no incoming FLB data. *=
/
> > > +     if (ret =3D=3D -ENODATA)
> > > +             return NULL;
> > > +
> > > +     /*
> > > +      * Live Update is enabled and there is incoming FLB data, but n=
one of it
> > > +      * matches pci_liveupdate_flb.compatible.
> > > +      *
> > > +      * This could mean that no PCI FLB data was passed by the previ=
ous
> > > +      * kernel, but it could also mean the previous kernel used a di=
fferent
> > > +      * compatibility string (i.e. a different ABI).
> > > +      */
> > > +     if (ret =3D=3D -ENOENT) {
> > > +             pr_info_once("No incoming FLB matched %s\n", pci_liveup=
date_flb.compatible);
> > > +             return NULL;
> > > +     }
> > > +
> > > +     /*
> > > +      * There is incoming FLB data that matches pci_liveupdate_flb.c=
ompatible
> > > +      * but it cannot be retrieved.
> > > +      */
> > > +     if (ret)
> > > +             panic("Failed to retrieve incoming FLB data (%d)\n", re=
t);
> > > +
> > > +     return incoming;
> > > +}
> >
> > I'm having trouble following the error escalation here.  What's
> > fundamentally the difference between FLB data being provided and not
> > compatible (subtle log message) versus FLB data being provided and
> > compatible but we cannot access it (panic!)?
>
> There is no fundamental difference IMO and I think we should handle
> them the same way (panic). The problem is the PCI core cannot actually
> distinguish between "PCI FLB provided and not compatible" (should
> panic) and "no PCI FLB provided" (should log). I would like to propose
> changes to LUO so that the FLB handlers can detect the former
> situation but that requires some non-trivial work that I didn't want
> to block on.
>
> For now, I guess you could say it is up to the user to not perform
> Live Update between incompatible versions. I can update the
> documentation.

An alternative approach would be to make the PCI compatibility string
just "pci" and then put the version number as the first field in
struct pci_ser. That would ensure the PCI core can always fetch its
FLB data and panic on a version mismatch. I think first-class handling
in LUO would be better, but that is a larger problem to solve; it also
needs to be solved for file handlers.

Pasha and Sami, what do you think?

> >
> > Don't both suggest devices are running but we can't get their FLB data
> > to continue letting them run?
> >
> > The errno interpretation is also slightly different than the comment
> > above liveupdate_flb_get_incoming():
> >
> >  * Return: 0 on success, or a negative errno on failure. -ENODATA means=
 no
> >  * incoming FLB data, -ENOENT means specific flb not found in the incom=
ing
> >  * data, -ENODEV if the FLB's module is unloading, and -EOPNOTSUPP when
> >  * live update is disabled or not configured.
>
> I think the only disagreement is the lack of specific -ENODEV
> handling. Is that what you are referring to?
>
> >
> > Thanks,
> > Alex
