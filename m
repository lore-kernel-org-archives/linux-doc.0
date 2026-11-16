Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794847566;
	b=eA20eo8rynKamEl08HXi1eqmsss7JuY7TxFAJUeq1H6jOI52bJql8noZBLVixgRphV5T
	 CUpFWsjMUtdq4wORW5k9XpLe3W3ifvjEsD9MNz4jT6JWrktQLERfvTiZjmhvlhEK/VcFX
	 Ysyd96igZNp3tRZg/IuSYpSW+u+iqjOijULmz5ERV/rm+A3LiResR2w/2j5PEpVqQLbf6
	 7DxMxBhc2D3DOcdf44xbAvHn/Y6VhKIWHKLj1ZzhuxSjtUu0yLscQP0sb8uXNEkzqkIgY
	 TgoH9LACkhfZNMBeRHFX4qE7/4eFcLp1zgyDtBk/zfaLBXGJlTpj7DY2d1fgS05dwPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
	b=KZrXxpKiCTjPiopMXyf9zVvJqHszfks8NUc0HfXEyN53M3wIvtOzjlnPy/lZgW3gWwr1
	 RPqxfavBEya2UsZ9mV9nH5mJL3AC6OFTWYVkAddlbk7GmsiZfuBXTHv9iPzEVbAqyfUXW
	 Wzm6wmppLZ6z7Cjf+pHD2fl6jCK0BDcsF8mFfk+KJMl0zwdVa2R5026lbHAfFWZBf9mxH
	 JFD7B9CQScTM0/VVuO4T1TJHT9WkmdwVwfwDTr9+3W2hcVxs79MxJ4/6qgLakFD6uK6pu
	 22mWKNwY7wWhRGsNlKrHy97B6EsmNyyd4O5sg5ewj23qISvpYrVfvVv8KKVLYStTwSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lI0Cs7lw;
	arc=fail smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BD9606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BD9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lI0Cs7lw
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so677218366b.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847564; cv=none;
        d=google.com; s=arc-20260327;
        b=kW7JoQfEfgMzsY7hpkRAdZo1zFjG8ADWXDOEfQg3YCLdx1FDx0XGdH2MxLNyyTv3d9
         +lKJtoiMhkX8yhZoxpufkmi54+uNhSLdTnSP99whVY8LYg07S7/Noy660cYt2HuvrK5x
         /r4eI3OXxR3WY7iSh5wcz3WNXbZsUItESRAjfTqi//bDmip6be+kw59Hw5b6aV6KjycD
         TnFdKV2tRjd7+1mj+aPVEYNJnCfUdbPCbA0uz89Cmub9FTAOGjMq49C7oh8v+ysZ84eZ
         Wts2ds7Ifjo5FfHQDoQ6YvGSpIVcJxFSEbNWkV0SLeHizBy4V2XtosvQx3hBKQyb+Qd/
         9WXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
        fh=QQtlweTyp6cugXUKfg1ov4OZFwt1qSSGRYoxNnqltTI=;
        b=JkEBZo+IyCRUzVnHBXu9851Tj9U4H8xB2SdoxC/SBvOce7o3Y84AJIjaLniqdWnh0h
         6TL17LUvm9byOArRkaOTCOSeieX8vKEtqdhCaUYe3+oXj+N45vAeSIMaHvuzi+vuzdiL
         TmQTkpkQGcWO6kyf9+Agq6wHVEyAi6re6z3LpnvaBwudY++Np4CsaepVcB9CdcH6DsYA
         Ywk4jgDAl3L88RNeHl1F6lFu39pqGHiQdel9/h3XaLrJl5lpEzRajFroXb3Ra7lJGjck
         HcZbmUtWVkO7j7QMRDrnOhMORUm5M2atd4md+L4g4uIFsb7/Mxs+19wr/RuiVVY8UmeG
         wN/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794847564; x=1795452364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
        b=lI0Cs7lw34shuZu+TXVsC1heBq13ajUejoM8zrjtRGUIcFIkn6ckIcMtCD5SHslIhU
         DegAUND4pUx2SZ38i2W2dqZu03y0oEwKYp2LHD2Pu/lEIKtNgwro+5OKfOwiLl9Lvhx6
         N/0ZVMD5ih/TzHBzc+5heCZ1CSOHaNznRiEJsMm3Cl3H6VgrGzUPbrHVMYb6EyyiAJIS
         2GqsePXkKSc6UbynzvtHYn5eBMYugxp782hHnck6/PkmwM0oGfSWDCz9b+diBKixfh57
         KlA2QQg/yaqKIEdMnVkLvYwkrBxu71jNHvLKdzi9UG1Stv9p0IaiEButyL+yewlKqEkf
         MuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847564; x=1795452364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
        b=1eryV5YMlBy9QlQgFO2Hl5YsEdy9hqHaL0K7VmxwyQgzSy9RTeLDSS7KCm0lW9M0qa
         L0a+cjfsiF283nAT7CRRy6D5MGva0UemJkcVv2eE4+8rh6HsRclMOR6p8TB5g2Q9BXhZ
         iRcWKRwhJL3qKcrk2GCgSkb0EyERBMGsGf+t3+pWKJupjoDG2qtEjSEmqatrAsQm/bav
         sOXBqbws4UFpXZqYA9J8IEuhUw5yRQvAdxLhp4fFC3QAiWTPeG+y7H9xsoV9T/m5UgA9
         muH0GXrKB1QDTOx9OSGGmY+baLJO/C+WtG1qt71k/4IdAiLBc2Qut9B4tz+cWEzjSmSl
         W3Og==
X-Forwarded-Encrypted: i=1; AL+hErF0HnbPJdbmfAKk2bNpL+xvCAAIFKmsSHzYxutXiQpXBdPpamhEwKB8A0EtnClN1UfJ7FQMi2Y4D5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gexqcBVF22+F405ZujHeNMaqL+QxIa1VkT2x2OpHIbWfFUEiK
	rvjqlk71kPqE+V5WiPQ73XFQbSnee99DGJYd6gh7Q6Db00x9KC8vd5eZ/TZKiBbti6V6SzQlZB8
	a39bXl4jtGEYX9kcp2Rzh549VpYmqtO5Cm3FF4cud
X-Gm-Gg: AYBFou0Gj3HWlfYcJ7OWsCdXF1xb2iiTyyWQZ6B/aqu7OThM6E++KimWnvezpC5M//a
	nBztQiDdkXEOVFs8jbaQmUIlb59RdsiJ56cixbk0cFbjQ6oXCCznH+F20Hbfd9XGynwQzyklrZg
	P+POI0QrKXHYG9ANhrWmagNma/RGdBN0hl77JTupaFD4R8fqEPMN8hqZffU1M7yb48AAo45/86i
	HPn7WXFLQtQjffmmDUpRkxVxf3utSULKoWVhD9X+HjnE4oE156DudJak0HdW/gHlxiQHJvysy9f
	iQUQkMuHHjwaDleWuXbsLgTXrdsopdMRUsVnmPEuJFUZ/6DqG+fWXmMEpzx1hsrNrDRrQ49fq/A
	/0ObEFitPUcenD+y/dkgyNOi8qP8RldpLA+sa4g==
X-Received: by 2002:a17:906:c14e:b0:c34:83c0:b92b with SMTP id
 a640c23a62f3a-c509631747amr801733166b.23.1794847563720; Mon, 16 Nov 2026
 08:46:03 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com> <autxCZPJ9yiE2ucq@google.com>
 <aut0H65XKAHUqPR9@google.com>
In-Reply-To: <aut0H65XKAHUqPR9@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Nov 2026 08:45:36 -0800
X-Gm-Features: AclHuK91dkLFtARHO_doZgjfYRJFT_5pDlpQ_hxt-2ez4dAgAMEfCzexcKbTDgA
Message-ID: <CALzav=dp8HvdK=9cAkGfbsJAeckyU3_y7rCRM22R7+AmTTtxMQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live Update
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 10:06=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-11-04 01:00 PM, Pasha Tatashin wrote:
> > On 10-13 16:25, David Matlack wrote:
> > > v10:
> > >  - Save and restore the ACS Egress Control Vector along with the ACS
> > >    Control register, sizing the save buffer from the HwInit Egress
> > >    Control Vector Size field (Alex) and drop Bjorn's R-b tag
> > >  - Make CONFIG_PCI_LIVEUPDATE depend on 64BIT from the first patch
> > >    rather than adding the dependency later in the series (Pratyush,
> > >    Mike)
> > >  - Reword kernel-doc comments to read better in the HTML docs and
> > >    spell out "reference count" (Mike)
> > >  - Replace the version number at the start of struct pci_ser with
> > >    required_flags and optional_flags, and record the size of struct
> > >    pci_dev_ser, so that the PCI FLB ABI can be extended (LPC BoF)
> >
> > Hi Bjorn,
> >
> > I am planning to target this series for the 7.5 merge window through th=
e
> > liveupdate tree, as we previously agreed. However, there are still 6
> > patches that lack an Acked-by from you. I believe you might have
> > reviewed some of them before, but the tags were lost during subsequent
> > refactoring. Could you please take another look at the following to mak=
e
> > sure everything is in order for us to merge the series:
> >
> > PCI: liveupdate: Set up FLB handler for the PCI core
> > PCI: liveupdate: Track incoming preserved PCI devices
> > PCI: liveupdate: Document driver binding responsibilities
> > PCI: liveupdate: Auto-preserve upstream bridges across Live Update
> > PCI: Save and restore the ACS Control register and Egress Control Vecto=
r
> > PCI: liveupdate: Adopt ACS controls in incoming preserved devices
>
> Thanks Pasha. One more for Bjorn's list:
>
>   [06/13] PCI: liveupdate: Preserve bus numbers during Live Update
>           https://lore.kernel.org/linux-pci/20261013162529.1928093-7-dmat=
lack@google.com/
>
> Bjorn's Reviewed-by on it was dropped in v9 when it changed materially
> (albeit based on his feedback).
>
> Alex, could you also take a look at the two ACS patches? 08 includes the
> Egress Control Vector save/restore you asked for in v9.
>
>   [08/13] PCI: Save and restore the ACS Control register and Egress Contr=
ol Vector
>           https://lore.kernel.org/linux-pci/20261013162529.1928093-9-dmat=
lack@google.com/
>   [09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devic=
es
>           https://lore.kernel.org/linux-pci/20261013162529.1928093-10-dma=
tlack@google.com/

Bjorn and Alex, these 2 patches still need your R-b or A-b tags, and
then this series will be all ready for 7.5.
