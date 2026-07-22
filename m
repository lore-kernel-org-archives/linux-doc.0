Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C840B0E6
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739639; cv=pass; b=afyRUTKGWbotGBhMPutWOHm67aIbmznRc5zstd+t7ggTfc9G5J3qDiszTLoFQw2gw8SSL65U93K8UdJEGYMCCERAH9ODazF3pgrgRERjRA0sc3+cNzxG+E1cZaoJgh3MK07dOyYYr3LGToLtX37qhdxSraXt+ycYmumBP4ZbOeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739639; c=relaxed/simple;
	bh=6V6kom/z+kESg4y/hUUgBifatIFy6BKWqM8OtFqWQ6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6DwQIzMxHx7kcgTiLtm40iaLn+mp1+WjlwGxq+rLu2m3VOvjYwdr7HfJOIFJ7OXAAXwfGrVmOv/fTwRJPC7FuJnoR+W8jbsmZLBuJAgnEp/PxQfyJUamjneQt+NmiZ5RwGt0SUzJJMJ3OeL6ppqSlZwHW0PrOfyqbGmgHT8aTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dG7JSt3f; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dG7JSt3f"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso718345a91.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 10:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784739635; cv=none;
        d=google.com; s=arc-20260327;
        b=GL+fzGo/M3ElnBVchGLjA93oG9uoo9+uJsz/M18rb3PyfKSoRngN9dWE5NroQ1eyhH
         UocYN5XGxkwXnu2ZT7ULls1fMvTW2SROtd7fiMeIhtvT9qi7noq8MnSwkKd4QejlTMEY
         nkcN0JTGUg0OFoJl+aNLrqbBd0Sk74nk85kIu9LS2nMNbOYtSgOqtFzcQICYxaNgjoXZ
         v2CSIL7H82VVkPR4uF0KMDckA0EflII26zJDv0RMCh+5bBhJOGLoTBV5CyDFVqGQXgMd
         k2qbvnzn80XnZhDHjwxGRHYPHYYkpJo4AAdgSH99jLVvVmoLJEaUHSn8/MEQhRLclRkm
         7mww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b6BLtSCxCp7M8WEIqu/WUMj2zfCCYaejhLZ7J9DExtM=;
        fh=QAvZpOPhErIhRShWlu6VM88GhkeSHznW0SbH14fd0ts=;
        b=ZJ+Jkjx2UcIG5ldy13eXUwj73x4ygqFsW+fbg9xSia85qoCt7v5QrKqEiB19CmiQ0S
         y6Fx4p8qR+T0HUIdT8NINpH9rU8p2zC/nxAPhF9UBt9lNvGuChkFo8DBt+lRSzIVCmNE
         QUBiZ9qt564dzR31B8eIqqaVyOAH8t7Nr6Zp5XKVPaWolsuMisXa9VCznXfB/YTyh00H
         D3fOA2nmEmNnlmPgFLVbdke3POynmjg2ZO6jSIo6gWYQ86YxXJ3vaMeIbgg2Nc0b10Af
         dRHozyZbwth8B37sTPk20FYdzda1YJxqbEGe0fuKDHURB8UVA1RBPmEe6Fe51zw4pTNq
         01Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784739635; x=1785344435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b6BLtSCxCp7M8WEIqu/WUMj2zfCCYaejhLZ7J9DExtM=;
        b=dG7JSt3fnE13iaRvAmoo9g4yjRs4OFmIAYoHp2m/DY1Qb9ajfooO0zJFa6rVXb+/S7
         92oQv0b25KU90cPvrxQ7gT/H//rFfG8Abgpren+PQzksQwX3wHM11GjhPoWoEyetaKBj
         P1LwiU7BVGzQUtVR7+lYai23ZfodmXNeBQdvI/IrRdeeMAIBLIdxRXvwfhynywh30pPP
         j/+AjrSg49qDTOs6Wrh4OLYauPaiZT/4f/q+55CuW6pNp+m2MPs5wJRQ1IHj5CHh4YNd
         YoBeWthpEV7B6R+oEwliHXWiOeaJyPfHg7XaoIZ0gH8C9XyVSWq9E9ZxCZBnSDZDQkWd
         Aufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739635; x=1785344435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6BLtSCxCp7M8WEIqu/WUMj2zfCCYaejhLZ7J9DExtM=;
        b=E3RQ+UHDjZYmRZDVI0sqnRmjYpkFmXM8EpwWUZzCtumqXayx1pV3orfQIWKK/C9+Ax
         kZVVz1ZB0ebKzvVz6rcaMq6mastSvSvkl+SL4NIcEB77GP47MW4YilyPam6B7nWDkvQ3
         9y881lNzWbI04ssifuKwzdSXm6CJ5fzFEzc7wVuc8mmlU8si5tNXJ2ByQo6wsGXdmuBH
         WJ7PQDwX9dNI04T4wAN0q+cjDTwzaKVg8HvPKh4b3W8+dtm3Ke3XM/ST27aXT74R2Dw0
         dpoD7mSA1ElfZ8LvKETvy9Q255oUv9iyBD0wFbQQs5J7J/4Pa49IZm9F4Aj5Zyb+xQSb
         MAZw==
X-Forwarded-Encrypted: i=1; AHgh+Rp50FmrhbtLy832ce4/oyBqSYC2FqXPIJS1aEztHWHYsb8mg6K7o63YbN3h5RGP7/ffvCkQkym7qNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8DygVW+Gix7JqYkZrXxuLH7aFe0FDtlRe9KghAp10+FydrGE6
	cb3eSLTvD9hIPBySRvqsbapPVTD4TpeVt9FuCP+P+uXogyNZPfNK6tjoFtRXZjsDc4BUaka1I0c
	3RMfCZPagLzw+F5hXwJj5NTBFb8plgSNxMmzfgcwE
X-Gm-Gg: AR+sD12P0I3srZFnKT8aPA0FrPmUhfA3+zvyIwc9tO5pcD+KuwinHU4uTsWEQ5swN9Q
	qBoVL0QlElaIMZ+PUIEyX4i50Z3pvvHyGA3P5n6KnXvdHgbJ+sbDxNGz7dTWCSgoGQgbqCidmxp
	5A0nE05U4y3tuvvEIkuERhGXxpLgchcoGCjcoZ46SlY7daS7kVjhEG0ehdpN4Sdd4XFXEEM7QEm
	UCBhzEstcjqz3lU4ZSvVUb6Z5WnaKC3OKJmRwAQBbgmZvcIg8xdGXnZ674UMMD9qZO+BC8rk1PP
	EqdvSVflD8yrVXM=
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id
 98e67ed59e1d1-38e4b537bedmr20414674a91.33.1784739634476; Wed, 22 Jul 2026
 10:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4> <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
 <al_3nOssZoa6RoCq@google.com> <CALzav=dvc_bdmFtV1U2APfs1FM-6Zi5=VShcAYQjZ0wwNRfC-Q@mail.gmail.com>
 <CALzav=fYx7R7c6FTQ5bC4bbQ+_KNaC3gopcPihOtKmHGaB6s1Q@mail.gmail.com> <amAExy1vqMbx31WU@plex>
In-Reply-To: <amAExy1vqMbx31WU@plex>
From: David Matlack <dmatlack@google.com>
Date: Wed, 22 Jul 2026 10:00:07 -0700
X-Gm-Features: AUfX_mw9U43t-da8vfCp9-yZYFJuwnLedP2gk2wgS7EP9CWA2swr-hVEqcna6rY
Message-ID: <CALzav=dHJ6g9FZmoWC5hFRCwCtf=BTHOmEFqbFFaDZiYDbRBvw@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:46=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On 07-21 16:18, David Matlack wrote:
> > On Tue, Jul 21, 2026 at 4:16=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > On Tue, Jul 21, 2026 at 4:02=E2=80=AFPM Samiullah Khawaja <skhawaja@g=
oogle.com> wrote:
> > > >
> > > > On Mon, Jul 20, 2026 at 02:54:51PM -0700, David Matlack wrote:
> > > > >On Fri, Jul 17, 2026 at 2:47=E2=80=AFPM Pasha Tatashin
> > > > ><pasha.tatashin@soleen.com> wrote:
> > > > >>
> > > > >> On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@goog=
le.com> wrote:
> > > > >> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate=
.c
> > > > >> > index 03075ce06ac9..df6a02240aa4 100644
> > > > >> > --- a/drivers/pci/liveupdate.c
> > > > >> > +++ b/drivers/pci/liveupdate.c
> > > > >> > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci=
_dev *dev)
> > > > >> > [ ... skip 76 lines ... ]
> > > > >> > +     /*
> > > > >> > +      * Hold the ref on the incoming FLB until pci_liveupdate=
_finish() so
> > > > >> > +      * that dev->liveupdate.incoming cannot get freed while =
the PCI core
> > > > >> > +      * has a pointer to it. It's better to leak the incoming=
 FLB than do a
> > > > >> > +      * use-after-free if driver does not call pci_liveupdate=
_finish().
> > > > >> > +      */
> > > > >>
> > > > >> I am confused by this. Each preserved PCI device must have an as=
sociated
> > > > >> FD preserved with it via LUO. I.e., vfiofd would need to be pres=
erved. If
> > > > >> the vfiofd was not reclaimed, and finish is not possible, that v=
fiofd
> > > > >> would still be owned by LUO, and therefore PCI FLB refcount woul=
d stay
> > > > >> positive.
> > > > >>
> > > > >> However, if finish is possible, and this is the last vfiofd that=
 is
> > > > >> finished, FLB will be freed as soon as the reference count reach=
es zero,
> > > > >> which I would think is the expected behavior.
> > > > >>
> > > > >> What is the point of holding a reference here, instead of only f=
or the
> > > > >> duration of FLB access, i.e. to make sure we are accessing a val=
id data?
> > > > >
> > > > >The duration of the access is from here until pci_liveupdate_finis=
h()
> > > > >because that it when the pointer (dev->liveupdate.incoming) is
> > > > >cleared. So that is why the PCI core holds the reference from here
> > > > >until pci_liveupdate_finish().
> > > >
> > > > I think LUO gives you guarantee that this pointer remains valid unt=
il
> > > > the FLB finish(), because all the vfiofd that were preserved have n=
ot
> > > > finished. And when all vfiofd have finished, LUO lets you know that=
 the
> > > > pointer is becoming invalid so you can unset these in the finish()
> > > > callback from LUO?
> > > >
> > > > If I understand this correctly, I think by keeping long references =
until
> > > > finish you are replicating the vfiofd bound lifecycle that LUO alre=
ady
> > > > gives you.
> > >
> > > Yes that's right. I am taking the approach of not trusting drivers
> > > (i.e. VFIO) and having the PCI core maintain it's own references so
> > > that FLB finish() is guaranteed to never be called while a device has
> > > device->liveupdate.incoming set.
> > >
> > > Alternatively, the PCI core could avoid taking a reference and instea=
d
> > > check for driver bugs in FLB finish(). I previously explored that
> > > approach and ran into a circular lock dependency between the FLB mute=
x
> > > and pci_liveupdate.rwsem. But I can look into that again, or just do =
a
> > > lockless walk of all PCI devices and panic if any still has
> > > dev->liveupdate.incoming set. It will only happen if the driver is
> > > completely broken so panicking seems fine.
> >
> > Pasha what do you think of this approach?
>
> I like it, let's do lockless sanity checking in flb finish callback, and
> avoid messing with references.

Great! I'll take this approach in v8.

> >
> > It avoids the PCI core taking a long reference (your conern) and also
> > avoids the PCI core needing to take lots of short references to access
> > dev->liveupdate.incoming (my concern). So seems like a good
> > compromise.
