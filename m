Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ECC4657F2
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 23:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784677619; cv=none; b=QcbAC7BsywWfd6v0TR27ZYdb4oNCLY5Zw6JdGT9Y1H10BwQ2bbr4CRn0xMMvitrElcbW57dG0nEUcZDiJMUztIjIVZR/NXg8ABrz/gesmsYAHTets77+b68heGsEMh+vB4N7JIsKtF0dQpyD94SuzTc7B8i/8lW8pvQIOrm0VJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784677619; c=relaxed/simple;
	bh=wVbviz0qfo+Bv2vFsUDapUTRMgIfvSB4Zhg5g5F3XJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3n+Fm7jfUchtWlUAq3sz6Ve+rxn6+dUq5GhDOuSJgNaXla6hOstpvVMCfL2J2m6ZSlNM5hZX+niuWBgvjKMdJqdf2p7fKbZ0MiuXMG7oJ6pJ7BKhEtOTXlp8VDmMxSEdU3BbFALy9oyjKsXyme+Fq9NOjf8JIT3BuxEYfVJk4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GOz4GjG+; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GOz4GjG+"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-930f4e5eed1so21455385a.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784677617; x=1785282417; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAFJIXu/UVteHEvaICMncjgcIn69HtrYqtQZR1t34RY=;
        b=GOz4GjG+XYzUgxmWCaQJPjQtF5K3pd0bdL9+mY7WvSNIbP5sOrIaQUvzAcxhZUSb8z
         AT1LjmY0Rb4gL6AjUtaL9+VAMMb8OLBr9d7LWZ7s3P21kwwvC9bjr3tM+VxCIGdrCt7N
         ETnRMJnQwa9M7JPq/g8B9voc99FuF2rvaHD4kHTy2fl+KTV2RWK0G9XvhU7+UTexBQ+0
         kSkotj11AKHsPk5D+pJHFnXN329ko4onJjl6jQqvtnVC7Xn5YBPTilChr2WJMFuF3wA7
         fD2RXsVG0IwIq0FeiICDGYeHywGt+6YAI6GZdr/C+nt8bPhSWGJWNRnqY8wx7AA3pEGt
         yaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784677617; x=1785282417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GAFJIXu/UVteHEvaICMncjgcIn69HtrYqtQZR1t34RY=;
        b=Qw6NHGtfO4BsjK+R1TQVdA2r5J5/E8ovrxUrem08EDZNTneJMMNXd2xDYx2PfNJ0ZB
         UyypxbBzZEjZl/+gxnW2mqHsesZi/PTPodiTiFeJcbDKPcu57nWYgYYyvY3+l5vgkuhn
         5ki4N5ISTeGwv6jfLCiljVGMpmt0g/Q45LmpR/yd8QTQiY9EKqGrLe9WFO6RlDCgIM5y
         Tmo0QUKJLSR3U8/NVnCn1xJBpwZFpznBmQ6gqd/FxjcWPDoIVaPIDyaOTRhhpo4Yd+Qc
         2uKrn69XjqIT0PKc3NyuozUiqcn7H+gZDWTVWWsAhLJEXasz6IFUTnok9H/5tG69Ef2Q
         lI4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2WxJS67ISYWgjVk/8YEDOFr7sUKuobk+d/9gIpMj9hz8Ay8DcUpJYlDy/9FDW6/HjzsxklyIJ4cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZeCKR9UeZcBQEyle1E9Y7LOiYn3CGAkR9oI2uDkHoY3YsBwi
	HvUdxz6MvZcKpp8OvXj2cMmwn8/S+VwM9n5Y4m/wnlycSAxRkNkOQHX4K12CmhDSCGI=
X-Gm-Gg: AR+sD11S1kjcoqflPoZPrRR82LbSPvWPyVP3ijOHyJBVGkFXQGzzPBhMV8G61zmapdP
	PWSm4kV4WlDnp1pcwIaF7hsbf1cbNFkekZYBJ1igrdDJK8qluM1y8N9Mgbq3tFiKa3M8DQ2/ljr
	tWdpV6UxQWmXDP0W+81BWmJQDYHtuhT8XWGIr+nlJOIqmO39usM21octtPH+lg6C3e3ZZV7m0N8
	98O7jLP+rysoUdg9HQi2IgWcR6R5ni6gnyWSX95In4mraeHyecmVxbFwtknQb37nUSNWmYcUHbC
	nD7XWsW4u8fGcQiBc6jiAi+sC6qOA7A6/lWyiUFGm2Z+yJzXlheRCa8OtCQXSRiDQakwCGlOWAo
	u3UINpBoqJB+8Egdb2m+2561h5uM0HzQrmOcQLXyzbfz3JK6M+T9eb5Mop2Xdxs9HuKuAGs8nDz
	QvXWtALjl7Tm60rlvpoiXth6bg1gmiPA==
X-Received: by 2002:a05:620a:4546:b0:915:9fba:8795 with SMTP id af79cd13be357-930b3ec6bb6mr2023091185a.1.1784677616667;
        Tue, 21 Jul 2026 16:46:56 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a41180sm18815485a.34.2026.07.21.16.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:46:55 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:46:53 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, 
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
Message-ID: <amAExy1vqMbx31WU@plex>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4>
 <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
 <al_3nOssZoa6RoCq@google.com>
 <CALzav=dvc_bdmFtV1U2APfs1FM-6Zi5=VShcAYQjZ0wwNRfC-Q@mail.gmail.com>
 <CALzav=fYx7R7c6FTQ5bC4bbQ+_KNaC3gopcPihOtKmHGaB6s1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=fYx7R7c6FTQ5bC4bbQ+_KNaC3gopcPihOtKmHGaB6s1Q@mail.gmail.com>

On 07-21 16:18, David Matlack wrote:
> On Tue, Jul 21, 2026 at 4:16 PM David Matlack <dmatlack@google.com> wrote:
> >
> > On Tue, Jul 21, 2026 at 4:02 PM Samiullah Khawaja <skhawaja@google.com> wrote:
> > >
> > > On Mon, Jul 20, 2026 at 02:54:51PM -0700, David Matlack wrote:
> > > >On Fri, Jul 17, 2026 at 2:47 PM Pasha Tatashin
> > > ><pasha.tatashin@soleen.com> wrote:
> > > >>
> > > >> On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@google.com> wrote:
> > > >> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > > >> > index 03075ce06ac9..df6a02240aa4 100644
> > > >> > --- a/drivers/pci/liveupdate.c
> > > >> > +++ b/drivers/pci/liveupdate.c
> > > >> > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
> > > >> > [ ... skip 76 lines ... ]
> > > >> > +     /*
> > > >> > +      * Hold the ref on the incoming FLB until pci_liveupdate_finish() so
> > > >> > +      * that dev->liveupdate.incoming cannot get freed while the PCI core
> > > >> > +      * has a pointer to it. It's better to leak the incoming FLB than do a
> > > >> > +      * use-after-free if driver does not call pci_liveupdate_finish().
> > > >> > +      */
> > > >>
> > > >> I am confused by this. Each preserved PCI device must have an associated
> > > >> FD preserved with it via LUO. I.e., vfiofd would need to be preserved. If
> > > >> the vfiofd was not reclaimed, and finish is not possible, that vfiofd
> > > >> would still be owned by LUO, and therefore PCI FLB refcount would stay
> > > >> positive.
> > > >>
> > > >> However, if finish is possible, and this is the last vfiofd that is
> > > >> finished, FLB will be freed as soon as the reference count reaches zero,
> > > >> which I would think is the expected behavior.
> > > >>
> > > >> What is the point of holding a reference here, instead of only for the
> > > >> duration of FLB access, i.e. to make sure we are accessing a valid data?
> > > >
> > > >The duration of the access is from here until pci_liveupdate_finish()
> > > >because that it when the pointer (dev->liveupdate.incoming) is
> > > >cleared. So that is why the PCI core holds the reference from here
> > > >until pci_liveupdate_finish().
> > >
> > > I think LUO gives you guarantee that this pointer remains valid until
> > > the FLB finish(), because all the vfiofd that were preserved have not
> > > finished. And when all vfiofd have finished, LUO lets you know that the
> > > pointer is becoming invalid so you can unset these in the finish()
> > > callback from LUO?
> > >
> > > If I understand this correctly, I think by keeping long references until
> > > finish you are replicating the vfiofd bound lifecycle that LUO already
> > > gives you.
> >
> > Yes that's right. I am taking the approach of not trusting drivers
> > (i.e. VFIO) and having the PCI core maintain it's own references so
> > that FLB finish() is guaranteed to never be called while a device has
> > device->liveupdate.incoming set.
> >
> > Alternatively, the PCI core could avoid taking a reference and instead
> > check for driver bugs in FLB finish(). I previously explored that
> > approach and ran into a circular lock dependency between the FLB mutex
> > and pci_liveupdate.rwsem. But I can look into that again, or just do a
> > lockless walk of all PCI devices and panic if any still has
> > dev->liveupdate.incoming set. It will only happen if the driver is
> > completely broken so panicking seems fine.
> 
> Pasha what do you think of this approach?

I like it, let's do lockless sanity checking in flb finish callback, and 
avoid messing with references.

> 
> It avoids the PCI core taking a long reference (your conern) and also
> avoids the PCI core needing to take lots of short references to access
> dev->liveupdate.incoming (my concern). So seems like a good
> compromise.
