Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F73BADA9
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161164; cv=none; b=GYnOBL8RO1J2gMZRMfocN2CoiCQeCCmMdB6yyxDGXjvyp9nYQpXXEeUltgiy9r4y7WSP7Rs78PpN39Ej8mglweNqGhsmwheO9ME/kywmHD4dGJVO8FaNlpFmY1C4UrUdRXudPLF5nCNgBi5KtXZs3nkbnvAELMvy6PzWVcIYbH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161164; c=relaxed/simple;
	bh=brehqtzE+XcXcHcsldBTlr5pecEDm3Ni+ORGZH1Cc6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M422oT1rkxLqDuxqRlibcwwd6l8Cc3NNct0ykz4xCv32RgSRwHP+BY+PERvhfY8sXI7M7wewnZFYqiZz6LyBU60rZPjcqyLzmtFrj7nFLCBAcVuTFsD8lFGX2wjyaCqIJV6aydfkb6hVvAkQWZ0qVxGyTMMMnmtPvREtO6hZS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqtstzKW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqtstzKW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-444826c16ffso814340f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161161; x=1778765961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MirORJ/xODrUNsE9K1GDry31szTlmO/Fh+672eoJv6Y=;
        b=DqtstzKWZcShAedXREaw35RWUzDoYgjx448z3HgIgkWEWiGVar4FxMFbUZVNo4h+Zx
         CcLXh4j9QI4KEymp10Oi+sCf4Q1nkfGdEOTQXG0pEep0Hp/KcIsBFD/OYLwFPAHSOxiQ
         tpSgYAEIC4vdoC2A3tb/LMrZy4BhxfxhFH4fFXKRj/z9G3Leyz6nV1zLXxfu1hpMnBuC
         6EemyrdXQ036krFRqLdAo0ZaoPHq1dgqTbdoJ3qAHKlo4F0HFg+idRK2PobZ7SeDd//c
         0EWayyNNMouqb0yLWPBHwBr4PB1EdMsF2viJ7nLgYgW4SIr9U04lLrh5hlhrqTJSdD1k
         Yn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161161; x=1778765961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MirORJ/xODrUNsE9K1GDry31szTlmO/Fh+672eoJv6Y=;
        b=VafsTnBLcq6WOrg+YPb84hz9f2VETvXdDKDFWC3gCLhjJfCzUfGsKlaPElbdGS5yks
         hfcnojQiS6jQ9+cawcziym/mp4qvH2ZazhgQ0KyJ1eT5sGtZLdCXF5t6fGrFcbHJ2q/k
         sS25YPYyxFXp2uwTOwnrHVT8wGSLbGdV5EOFr1gkPFhrMklyHhoTIw0pYueh2OyGGGDy
         +hGa7WHUt8Zu3HCy+olvTNJeh9n1PJGNq/SLIPOufswJo1WBVH1LrWIX/z+ncP57KhlM
         XBS9HELgvFDxRw/yAelssGjOQ7LUq9cr1tBIisZHGg9ODoeKKmiz3o65ZGBv+Ci9pOYS
         NbIA==
X-Forwarded-Encrypted: i=1; AFNElJ9KV9cJ/nEoFDs/g40gAwpWy6MD3683CzJ9p45NRTPCBo5wLwE6ImFucw1xbLs+j/YnD5gudXwx6Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjFPJxnvSqlhrAIkeQNzhLFkOg4pRyqoKSK9fvcdiPpXHFH4S0
	RLcllVVHkKFlh10E1GQdJkRG4iGaIkzeDtdCKAlXD0ZITOhzVn9NQyXe
X-Gm-Gg: AeBDietWze+sEmMx1i6CRBXGownemhVzQ92JrEokeiNMUVG6k4T8Tpc68KaU9Z32niX
	swWIz2wcYNX+lGOeACNWpmklvdb4er3y4R3Npgrv03bzXDHPza0xP7fKPPtIgdZ8kycxUZqtD1g
	acU2mfbbES+2PF30Dg03V0p7yHLyZ3RFovW3DTU/7On3sfQR9+1gtlZeZ+eEpCuFhc5sMhWsNz/
	qxDSV4s1wgTLyaXfalfsa17oCxntC11ASIQinrrcqnAUJbP8i/L+kokqLvxbZCBthf3G/dl246+
	8MV+GRdUrMgnANwFtBI9ki0QC5K+J9qVnW8CUHeIyFGYG6oph1cylk8V2ldO0sYCawJqrVXRmgz
	Q680dk3YSU5AcMGfVICEzrAcvxltove9nq2sPlNyU7Q9aypCrGGxbcIU4RlS1U4QXygSZXZB00x
	eEZyCOdAZgqQjlGw3wwUD6nHosHo1mY9sT42GXEu3PU1r0OwfF2chatKTiqakyIgubrUdvzxhC/
	PFWsPKM0j55r7OHTvyayx86
X-Received: by 2002:a05:6000:200b:b0:43d:7b85:6c95 with SMTP id ffacd0b85a97d-4515d5c567emr13185884f8f.33.1778161161071;
        Thu, 07 May 2026 06:39:21 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02802sm20939063f8f.17.2026.05.07.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:39:19 -0700 (PDT)
Date: Thu, 7 May 2026 15:39:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <afyU2Doug7zK_p2r@orome>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260506-energetic-azure-pig-2b6ec4@houat>
 <20260506125015.0108ef44@fedora>
 <20260506-golden-python-of-aptitude-ff972a@houat>
 <20260506170515.2d8511c3@fedora>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="asfzz3x46tacowfj"
Content-Disposition: inline
In-Reply-To: <20260506170515.2d8511c3@fedora>


--asfzz3x46tacowfj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
MIME-Version: 1.0

On Wed, May 06, 2026 at 05:05:15PM +0200, Boris Brezillon wrote:
> On Wed, 6 May 2026 15:12:37 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Wed, May 06, 2026 at 12:50:15PM +0200, Boris Brezillon wrote:
> > > On Wed, 6 May 2026 12:08:24 +0200
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > Hi,
> > > >=20
> > > > On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote: =20
> > > > > From: Florent Tomasin <florent.tomasin@arm.com>
> > > > >=20
> > > > > This patch allows Panthor to allocate buffer objects from a
> > > > > protected heap. The Panthor driver should be seen as a consumer
> > > > > of the heap and not an exporter.
> > > > >=20
> > > > > Protected memory buffers needed by the Panthor driver:
> > > > > - On CSF FW load, the Panthor driver must allocate a protected
> > > > >   buffer object to hold data to use by the FW when in protected
> > > > >   mode. This protected buffer object is owned by the device
> > > > >   and does not belong to a process.
> > > > > - On CSG creation, the Panthor driver must allocate a protected
> > > > >   suspend buffer object for the FW to store data when suspending
> > > > >   the CSG while in protected mode. The kernel owns this allocation
> > > > >   and does not allow user space mapping. The format of the data
> > > > >   in this buffer is only known by the FW and does not need to be
> > > > >   shared with other entities.
> > > > >=20
> > > > > The driver will retrieve the protected heap using the name of the
> > > > > heap provided to the driver as module parameter.   =20
> > > >=20
> > > > I know it's what dma_heap_find asks for, but I wonder if it wouldn'=
t be
> > > > better in the device tree and lookup through the device node? heaps=
 are
> > > > going to have a node anyway, right? =20
> > >=20
> > > I'm not too sure. Take the PROTMEM (name=3D"protected,xxxx") dma_heaps
> > > instantiated by optee for instance, I don't think the originating
> > > tee_device comes from a device node, nor is the underlying heap
> > > described as a device node. The reserved memory pool this protected h=
eap
> > > comes from is most likely defined somewhere as reserved memory in the
> > > DT, but there's nothing to correlate this range of reserved mem to so=
me
> > > sub-range that the TEE implementation is carving out to provide
> > > protected memory. =20
> >=20
> > Maybe we should be working on a dt bindings for heaps then? Something
> > simple like we have for clocks with a phandle and an ID would probably
> > be enough. In optee's case, it looks like it would map nicely with
> > TEE_DMA_HEAP_* flags too.
>=20
> Sure.
>=20
> >=20
> > The only two that wouldn't be covered would be the system and default
> > CMA heap if not setup in the DT, which shouldn't be too bad for this
> > particular use-case.
>=20
> I'm not opposed to the idea of describing the association through the
> DT (with a <phandle, ID> pair). My main fear is that it drags us into
> endless discussions around what's considered HW description and what's
> not (PTSD of all those DT-bindings discussions I suppose :-)), which
> ends up delaying the merging of Panthor's protected memory support.

FWIW, I plan on doing exactly that for Tegra. The way we wire things up
there is by referencing the protected memory by phandle via the memory-
region property (and a memory-region-names =3D "protected" for context).

It doesn't support passing a specifier along with the phandle, but maybe
that can be added (using something like a #memory-region-cells property
to mirror other similar bindings).

Thierry

--asfzz3x46tacowfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn8lgQACgkQ3SOs138+
s6G3+g/9HA74siLrq2Ig7isjRJFtRcHmFnjq8EblmmVUlYSar61ejku2o14ju81i
ybe025hgJcVIPKuiYXscduXk8eOdVzix8Os/oFh3ZPHyMP0tuG8zC1HNjqsnLWPd
eha1cnD27rsFPgnSmhFFIYiThWDUzf2ynteIeul4Ax4z1LL1oqSpD3WH+9brO9fC
aUZOdU16WSEK6O5Yx/g8zX3id2trZzYfWCDueg0tGGLwcMvfXTuuSbz9e59C5EBj
SyMPiOrwT+EERP4FUfqPEnbt0CLnjhZnxekp//Lv2DwjzSSNIlFoeTczP/qjoeTf
iIf4FfLI1FA4zODWgX+OWlD9iq1QyDEIjzM0EHsSz9Fr1QTZeuvEN8C4gwMF8ZJP
nfejV/U9HvsE4jOuv25o6XSpVUXVulF8cAmWSb2gzEe0L2r3S7SJvc5fin5zY+ui
X4VlDMkw1XflRl+fte35xoi829RIFJkYC8drCV/mrP/ORzUwa/cO1MDhn7yougGH
bEoX4HFA1dl+rscnYASEUeoQP+1z+7IMdifsCZTMRUkPEOPmYXqVSIQkFEL/S00Z
46wlyQT1DP+De2fxipN4WUpaKmS61pjCibQYO/RO3sRSXUEUt/Hz2MabLrSy9QHx
J6PCv2dsBoF9pjVW2+kRPnxCm4AsjRJ3lQFHjh5HIZHWWs7ir6A=
=H2su
-----END PGP SIGNATURE-----

--asfzz3x46tacowfj--
