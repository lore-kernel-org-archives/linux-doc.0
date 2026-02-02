Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5842DC35A
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056128; cv=pass; b=j7en1/vC3qtcBv2bGERD8Q6HldlKqXalMPy6lYxNQ9rfTiL3LNjGsRmRmQ0um4L6y+/kRXUtZKTdyYLynWoIzTVWHbaUDadSo6JXMBXzRtgtLuzdSa5LdNNLag8vaipjyUtZQGQ+D7svqNS6c2cgSQPg3r1UJJPhyrqHTbymFD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056128; c=relaxed/simple;
	bh=hfLkISPUv1gvXr1CboqWBn1bs3Sd5IoZNOLzZg55skM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iF3+Vcj9hY3LFdVkbqT7NpezdvuXAj73tke4Ebb5qL/3YekiQctX4+cJoZ5yWpqzrbFupi+5+yM6Y0cB4Qa1MnYffbUi487OBQ5S2WCMOpDgRZUO8+Ne/irZGx2WCaWqo38gfpfQqPkpphWIM+XEm+iZ8HvOyYRXz8EcJ7UhPVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSJ2pVDb; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSJ2pVDb"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-383153e06d6so43313271fa.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 10:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770056125; cv=none;
        d=google.com; s=arc-20240605;
        b=TmC2eVK8+DzCoZuu3Rizu1pRJo2VPv6ar7+KLSh8AW0jL15qRg5wd2v4zI2G3N8YaI
         cwMQ/UecvRSRazndflC4S6D4nsj52QV9kPG4GYe30j2W4xv9sgDCczUxwTpOMSKfAir+
         9Ji++YDiVLxr/TtC6SBqmqMx+2cSr+FC50YcpcnNzXxYf3/xci+mzviaHYl3RId0Mmd5
         0wqm43rTP9VmqwI7bbht+rnHzSaQKIbRn9OS+3gUAJdQemNeBOcqrUoDuNyDbo0ezUZG
         vPB4Qph8ew49R4+1VmUGk0m3gfzJBKaQfGuoaZiolQrj6UUIW6nbH6MxZ1MK7JYk5npy
         p3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIHmbN0vtM4SeA7+jGmffdOqzfQaVyhc47MhdLc1+1s=;
        fh=kf2RxElrU0vpVBhQDXH/4cp7bw8DB6GgNuZjABZ3j2E=;
        b=lU1uCuEUT0+MAnaMbQyBWsdCU4XwzjhmrL/ct/dlivTErIvFxy+milyuodcp+nWQOg
         8NYKZu2FqOC6ES362iECwtBgv1MYprZPCWTCnn9RVhj+U09iiIddauyJyiQPx7oM9WqL
         awgiylnzt+gRTgqUM3N5GGG5yspBTwbOMVca2sI2Gi+JScDoPGl7WrpUQ4//GhSl8ICo
         fgJAut7mI0NN/5fH2J/BfpBZJ5fqH0OB4W/TSLfuZ/gJNnY/gJtGxsODRqK9LkvZZ5qa
         vxeWCp3jFx3cDqICLsDwm1P62WflFPUdImMG9GGIpKTYnLfmd3zS2kw96YhcKfW4CEH9
         x6vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770056125; x=1770660925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIHmbN0vtM4SeA7+jGmffdOqzfQaVyhc47MhdLc1+1s=;
        b=PSJ2pVDbNQVnPXrXNjymko4FOE40C743kvBmJ86NLSh4GircZENoqWveK5OWNMFOO9
         GpNsC5mwmhTxifUlf/daWGwYTrtNmBzSI9eXvPrODcez7DbDVIYiqvcyBy8amLYrrxVp
         DLhTd6QbiVH1AZJlMuR6iTv3Niiaa2lm5P9p2E6o7tcArvBjQTQzHxA7WxzzMWq7visY
         Ddj+8fe+ab5vxCLuvIu9gW3nb9y1abZAGX4BKFdWVZfyFeTp3yFB593U7yT/3WYrmVXT
         hClbGiN6g1pDtf0H+z9QDhit5pfuUP7PHyl+0qS9jvPbM1Ti2diqJ0edF/uO0rC2wXpJ
         ZfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770056125; x=1770660925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIHmbN0vtM4SeA7+jGmffdOqzfQaVyhc47MhdLc1+1s=;
        b=LnwTgNfRQfkBBeCbADWTkTMA5Sz+V89i9BT8DpgyZzVLS+nxjxHIGz+m8LSIg5j7D1
         9xOL/8PuJ5PeTmcQp/cavMW24HkH/YK12S+lEgaTyhUjPY8bAwA6pf4cqQ04/J9tolH2
         K4et8Ux+FI3zT8FJo6WeYN+wKi7/c6NLPy5NIvj6qZeqrdQ7D1XL1Ze82iM94rQlIqGO
         jhSywadUpsCUT0+9RweFDkbBUa/fJhbeeQqOvVvPUFpUXfaGwN6Mod3ca4w7vhYQTKNC
         xb2pB9+JUL84MSt8S6bsOo9C4eCpky3TKCBSIU9Azik3B3Ri1NMZnYR7N2gcWbjkNtyb
         z5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXdKMKWDXvq9ClOIs0/H2s+Wf/DdilCT9crMIqNLN0Tj8udjcFqrGoaalqqoOIxMfhFcPG+Ri9KXcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5OIwj8n5YdGXlRyRLC5Txeu5VtJ6qv7TfkQMWNP1m/P2Pl6+
	zVJlUxg3mV48AMCCNeSp14gFLBxb6HTelWoVBr8vKLEMs1HOTqj3REfReDqe9Y08QhPq+Z8jKY9
	/rulgeJ+C3og1gP5/I/d1I5FVn+yRBPjJe00rna7F
X-Gm-Gg: AZuq6aK4jvK2/I3KWJcIrrOavtTOra9R/HRZhRAIaFj2DYMBLdqm+QUoAEHNgJxNaJ8
	bIY2sv+HT/mmRf+RbYrSjEBrlU0xZ/xkmn9MHuVBdXqD8ykH+jYWY2gK5WRmIzvVBdJ1OxJC7mG
	LNpUNQEIglNW0fz5cNz+Urn0q6JuoV9vTQ6ttfb5WV6SdBg6IPEkFF6hw0hL2hqjN1fDXcCp921
	/Nk6uTAePF0MKYzqC/DVgC388JRlXCmqxF3jcUNrAyH0nM2wvtDNmrFkG7/eUAuh0EB9A==
X-Received: by 2002:a2e:a54b:0:b0:383:1c18:ade6 with SMTP id
 38308e7fff4ca-3864662d728mr40696471fa.20.1770056124374; Mon, 02 Feb 2026
 10:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-3-dmatlack@google.com>
 <44484594-5b5d-4237-993c-ac1e173ad62e@linux.dev>
In-Reply-To: <44484594-5b5d-4237-993c-ac1e173ad62e@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Mon, 2 Feb 2026 10:14:56 -0800
X-Gm-Features: AZwV_QhgTJZ7rnxODmCU1qhjsI1pWSHh1k-rPTozueyr5OUveeJ2FC59ISanCNo
Message-ID: <CALzav=d1ZrHrWd-HhZJ8aY6aqxkBcLoet_5+-LL1mOakVTj6Ww@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Zhu Yanjun <yanjun.zhu@linux.dev>
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
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 10:38=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> =
wrote:
>
> =E5=9C=A8 2026/1/29 13:24, David Matlack =E5=86=99=E9=81=93:
> > Add an API to enable the PCI subsystem to track all devices that are
> > preserved across a Live Update, including both incoming devices (passed
> > from the previous kernel) and outgoing devices (passed to the next
> > kernel).
> >
> > Use PCI segment number and BDF to keep track of devices across Live
> > Update. This means the kernel must keep both identifiers constant acros=
s
> > a Live Update for any preserved device. VFs are not supported for now,
> > since that requires preserving SR-IOV state on the device to ensure the
> > same number of VFs appear after kexec and with the same BDFs.
> >
> > Drivers that preserve devices across Live Update can now register their
> > struct liveupdate_file_handler with the PCI subsystem so that the PCI
> > subsystem can allocate and manage File-Lifecycle-Bound (FLB) global dat=
a
> > to track the list of incoming and outgoing preserved devices.
> >
> >    pci_liveupdate_register_fh(driver_fh)
> >    pci_liveupdate_unregister_fh(driver_fh)
>
> Can the above 2 functions support the virtual devices? For example,
> bonding, veth, iSWAP and RXE.
>
> These virtual devices do not have BDF. As such, I am not sure if your
> patches take these virtual devices in to account.

No this patch series only supports PCI devices, since those are the
only devices so far we've needed to support.

I am not familiar with any of the devices that you mentioned. If they
are virtual then does that mean it's all just software? In that case I
would be curious to know what problem is solved by preserving them in
the kernel, vs. tearing them down and rebuilding them across a Live
Udpate.
