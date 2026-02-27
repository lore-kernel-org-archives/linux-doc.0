Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EB41325C
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212803; cv=pass; b=BjKvSypcR+w4xhRIta4oxyS9Xg1wTKXUQbUbnGVdX7EjdGUAUQJQb4GouBq/eS4gUSToQk/N6f8PSogwMXZdUlfi4BYeIHTh95mAbEvuqSAwU/2xzOsKzuhCYQ2Mh3+G+L0evHhQ7FUzs5nJeXIyofeLaax52yMeXyCtKMj3nAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212803; c=relaxed/simple;
	bh=SSENmwLLmfNwcsRg3YsbfFMJCVOVJDpYAbDWxLRiUJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNjBG7GAiUCWlPkxPG3PoY/SydWRvjQLOcHmuLLcRZFbaSwkGhLdJvQcfveyP1gr6ZYbpma4W9m26fEsb/Phhr8IJouek/8t++V9bJhh8gAev1FsDebvdOtqtyfMj+UZmsD8UXM4HgeMswWeQwOIo/nypie2vDVf53jrXBlAN1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dAQx2BDl; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dAQx2BDl"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3870778358aso1192781fa.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 09:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772212799; cv=none;
        d=google.com; s=arc-20240605;
        b=Sb1UQP1Q3/BOrXyo6pze482FYscBY0brHUkGDt1RwaUgOmHt6RtZThLfpw8+Ov7UPW
         mSuExCI7n5Oq8A/v4PNaC6DZ4K9tf7NPq7VOuRSahDj2vHO4xhqvKfKP/IMsICKG2+ol
         tbwiYcW66GinAXXsHvFSq/Ij1BBgnK7v3ofwIlqKd59GgfL4bOdBfvERSwnL/+zGrX34
         xsgTPoYBMLmFLyH1kWyZeTloh/uTfvfQ5MxwJsMEJ69Vw/xOfK9mPMettH0DgzDvOoVO
         FPlEICNrHYItrAsI+AWcdD6efugRUk18w8JlKNMIsgdnbJACmbmtkOZR1jxVam9UChir
         /u7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TlM+Kfuyp7z6KhXNl7/hdctuf7el0QWvoUeGk1mQs2Q=;
        fh=OZoNTcPlMToFxVOYFmuoVcYFoLSLboquvU+wroWROOI=;
        b=ZVBgVgljZd2TaaexGpiuGI+tfAwCUoeD9/W7ZmjwRvH3pN5Dcs3v9BNAN6apFbGsGv
         yrWZl8LLBmsxyWZ6+Or+vyyQhpbLX8UjaQVsm3QtbzFlEv/Ngt1qIN+swl4QZNeEp9jP
         quSFMeFhuP5VUwF2+IAqq6jsOgUQk+99rQW134b7H4QatH9ImEtAZX1DSIrf3UDNgje9
         ttWsp52m5euOoTZ3JolF+ijlWtonJiisCqt034pq9+3ScIGq3/tR03p5n8rX1V+eoboe
         5XwFXSb/qdz3W9RHj+nDumITYVAq551vny+GHzB6ACxzhbvC6hpwnIQtYJm+nqkMS4lG
         AWMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772212799; x=1772817599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlM+Kfuyp7z6KhXNl7/hdctuf7el0QWvoUeGk1mQs2Q=;
        b=dAQx2BDl5oFx+BqwmXycWV/kpTkkGnIYsfZYgEAGg+qI3Y4zelfdWAT8Jj1fGKH28/
         zaXnldaNkzP5SAo6J94CbmL2NNGwtyDO2Jd7ejvYYZZ9CSSfxEWNfsBWUseJ2mutaMCW
         +lIadTM4AwSC85kP+iZBs8E8GmtOaw8vJlQ9FCq6C9lmYis/5VrN6orqZPllMFcctJlK
         ocW+MDJynJc8HRM7HVj467T87NA/k7ZCNhZrYXhcstFkRHcU8fScSvpRemuZwoS8sgee
         +rIBM7fCm5vaeDURjKqQEeCMSTituBlGUOIyuCjAE6kaqHKxLNzea/pW+xeN+Zqng0YZ
         5WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212799; x=1772817599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlM+Kfuyp7z6KhXNl7/hdctuf7el0QWvoUeGk1mQs2Q=;
        b=gochXmt8xhcNfDJ9Z6nTBJQiouUEYt8T6LJiZmln7uoQ4hSnVSF3SFcitHVAyakmco
         Y94BvfZvH/otU4arToso6z5ABDg1spi2Qba/d6yN8vhzrNpFJCTc/x3h6LQiel+g1QfP
         8PV7FJOwlJUg9bo7ek1HYIOiQiDpECIt0psp3fuRNLVKMSTdgWpDu5MAejGdguJuVgYJ
         TlDXfdNPYnOXhIFp6r2rWpeMZ17eNPotVNA3F0zuVL8kYrYDB6L7SSl0Gc3MkNczkv7+
         d6hnX4At5OevJT7l51WhV2gGNMhtukIIQvrWYuHsm1ictB9RiuVT7p98y/+Xh5r8fPAm
         j0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXalziODu4cG6gP6nU+uww1b4Eemsb4EBqZ2TAbjha3Z7BdDPkqlDH9Bh+jcqp0CxNtfOk9AswrSa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7aCHlj39GhDDvbG49F+Rh8od72qjah1B2ShgYNJZKsKtHIaxV
	qH1tfh++0bKW77GLqUWjaZ7+HXRiJUMl/Kfz/1EO5qhAzyDyyAE/J/J+hMEW0MnjXsV7Vso062j
	udrttqI+D1jwhIrXUWy/QDE0GuddO3L6X9WSpzaeL
X-Gm-Gg: ATEYQzyMB+bTcpYibc3Ud2vYhbM3ezA1IpwoU1H9byrW8UlzWOMPY5ku168OxKb6HGg
	ph9mi7tmMkPSN+DYxTEems8zwUW7Lv1WxxLMjpYtDLdncU67uLxBXj1Eqalc5ROsmg82bvTUQHb
	dOlHbfWWiLFsir50jFbZF3bfvg1Y5PROdIgLDAP266ROOsov+NShJx4ejPLuYlxuEJKTihkjvb8
	gWXR6S5Nqt9EGVv8X07GHn9vcsJVoIO5KVSwjuP5pU+KTB6J3WZ2oOXGylrs3uTqfdI0OZ9G3pC
	MIwF4h4=
X-Received: by 2002:a05:651c:f17:b0:385:d0b6:6c44 with SMTP id
 38308e7fff4ca-389ff14567amr23252321fa.18.1772212798094; Fri, 27 Feb 2026
 09:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-3-dmatlack@google.com> <20260225224651.GA3711085@bhelgaas>
 <aZ-TrC8P0tLYhxXO@google.com> <20260227093233.45891424@shazbot.org>
In-Reply-To: <20260227093233.45891424@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 27 Feb 2026 09:19:28 -0800
X-Gm-Features: AaiRm514TJvedInAnynD285P6RuOXX1FfRIbxiQr5Hc2znqJUuMLjDSPlZjM6yI
Message-ID: <CALzav=dxthSXYo13rOjY710uNbu=6UjzD-OJKm-Xt=wR7oc0mg@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Alex Williamson <alex@shazbot.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
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
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 8:32=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Thu, 26 Feb 2026 00:28:28 +0000
> David Matlack <dmatlack@google.com> wrote:
> > > > +static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
> > > > +{
> > > > + struct pci_dev *dev =3D NULL;
> > > > + int max_nr_devices =3D 0;
> > > > + struct pci_ser *ser;
> > > > + unsigned long size;
> > > > +
> > > > + for_each_pci_dev(dev)
> > > > +         max_nr_devices++;
> > >
> > > How is this protected against hotplug?
> >
> > Pranjal raised this as well. Here was my reply:
> >
> > .  Yes, it's possible to run out space to preserve devices if devices a=
re
> > .  hot-plugged and then preserved. But I think it's better to defer
> > .  handling such a use-case exists (unless you see an obvious simple
> > .  solution). So far I am not seeing preserving hot-plugged devices
> > .  across Live Update as a high priority use-case to support.
> >
> > I am going to add a comment here in the next revision to clarify that.
> > I will also add a comment clarifying why this code doesn't bother to
> > account for VFs created after this call (preserving VFs are explicitly
> > disallowed to be preserved in this patch since they require additional
> > support).
>
> TBH, without SR-IOV support and some examples of in-kernel PF
> preservation in support of vfio-pci VFs, it seems like this only
> supports a very niche use case.

The intent is to start by supporting a simple use-case and expand to
more complex scenarios over time, including preserving VFs. Full GPU
passthrough is common at cloud providers so even non-VF preservation
support is valuable.

> I expect the majority of vfio-pci
> devices are VFs and I don't think we want to present a solution where
> the requirement is to move the PF driver to userspace.

JasonG recommended the upstream support for VF preservation be limited
to cases where the PF is also bound to VFIO:

  https://lore.kernel.org/lkml/20251003120358.GL3195829@ziepe.ca/

Within Google we have a way to support in-kernel PF drivers but we are
trying to focus on simpler use-cases first upstream.

> It's not clear,
> for example, how we can have vfio-pci variant drivers relying on
> in-kernel channels to PF drivers to support migration in this model.

Agree this still needs to be fleshed out and designed. I think the
roadmap will be something like:

 1. Get non-VF preservation working end-to-end (device fully preserved
and doing DMA continuously during Live Update).
 2. Extend to support VF preservation where the PF is also bound to vfio-pc=
i.
 3. (Maybe) Extend to support in-kernel PF drivers.

This series is the first step of #1. I have line of sight to how #2
could work since it's all VFIO.
