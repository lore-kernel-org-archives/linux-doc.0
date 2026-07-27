Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306193F822B
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174082; cv=pass; b=NRF2mTxo1CcC+ff3uNtEu7TrbnUvVe7dKBty+c6a58vgWqnwYDfl0BMSlPRSjmwbo9GUjnktXMO6DoxBM1lt28OMV7LVNa8ur3XXmQk7hzb5M8HjUzaO9u2/JTxZB2sUN3gVQfL5S8Ok4cmakGmM9sDUHXvJ2ojuB7Ta68TiunM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174082; c=relaxed/simple;
	bh=BFAKGAXMoTfNxPRg9rdsHFVakpPjLQ89eZWkvu37Jk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQhllh4r4DnGEU8Pr1ro3wwq+fcu3Txf2ebupglXZ2u65spHbqNgzKT6GVJkSDJZo0P0a8R1WEfkg3V+XJPvtUtGffaMhhwGtrptnRXHlm6Vsaa0ltaWDX8mljTWmZD0hp6RtsQhNtEMmp9X0U2rAWmb3v8rKC/nOhetXN/36E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CSzs1T/M; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CSzs1T/M"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2188145a91.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 10:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785174080; cv=none;
        d=google.com; s=arc-20260327;
        b=NR2kI2d0kpJjIHACzm3Ybrcmfsm2rs3lrqvb0dI3LbTp7gW5zjtff+6hNYUSc6/pvr
         GxfNVNBNOayrLrAte6QxLNwKorqDVUk8PJj1k0kQAqXtA7kyyUwQ+AJfxwz86iCoID+N
         RdnrXISQ2Dj912Qnx6Sx6/NH1gUIZOjbG8TjLkURbRDuiqk1R5s7V2qg7irHYLBKkN4m
         TEp3knW+U82S0zw0Zd58HkIyReZz0KISixKLpSZrTFNlnewtg0mdA+QQ46sNBGQhLoCy
         WwgkP5cC7Kkd7mdEcazz1q9p6jAHQnCtOxjgPI9pGXjFQ5kXP+Kbuc7J4B+1h0cP9CSL
         bX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=goSDZrkoP4CAKwXn9vTqQBBWqi12AJrVoF+aHToitxQ=;
        fh=rBAxItYYt46Z1G4XitH6vXM4EReow6nWTsneMSzz2L4=;
        b=Jf/htWeTj8zUS6FIFtZf6L14VqDWie1x3pTF3GW7LLF11luxWppWapnPsJ5Hh8Hob3
         5VppQ31T+Ihmiy2QYkD+kyulGp1uSo8riOjMlR+IVwIcNNPapl7Qw8GOPnlVi26puRwU
         m5DYDJECXHxJcQKoCuOrnr08vUQ14AS9ckLegsViSNx2XWCoAMACpr4EEemFEiEUDFp4
         aQFKLbrMCQJYvdZTPpPmYqSIw7faFJdpebi6YJtCn0ytYPj27HZi5eCjSKhhFo+BKCIk
         rngLFv58+lbbU+cHorjzhgY5DOR143qJNFkAz5b2RNNNNJrMMRM/G6nQDIWuuj68IiIQ
         brmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785174080; x=1785778880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=goSDZrkoP4CAKwXn9vTqQBBWqi12AJrVoF+aHToitxQ=;
        b=CSzs1T/MrOG1PhucXEYwHCTzp33LKREOCVS7cNbaXv1uJpw+ZLQuuFnJRCk9/HxVDk
         Q1zm7CJsw7f26LPoEBq9qoM3p8soNbMaD4LbE2ZJkkbqnk5Rc0CYVqZVp55KOBldIirl
         v6bIfpwKIyEBPg4KXUF0v5Hf5ZNnwPxIq3Lvi87tJZkE6PGH2tQjSD+KJbolf3m/LvtI
         03jxtf8ufdwGBo75RzvsskSngs4z5z5kCj1bBUjy+DJEkNMovXC0Wi+Nqv+/kxjS9BeB
         2S4Vsjd8bVXoXZlOJ+UkX3nIjj/xwk8XZ414qr7OgNnwR5q76VCF9NOS2gPZ6ZejhHH9
         9Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174080; x=1785778880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goSDZrkoP4CAKwXn9vTqQBBWqi12AJrVoF+aHToitxQ=;
        b=RwAcH0v9sj22+2IjMLvI6vBo2CizlSgBw8646k/FBxlkhfNx73IJH8PbD/V2VkvVoq
         YT6BckE/a804/RqOAfZ+x7+2FQ6ZoRbUfBRP9gDce9fBa4CM8nVr8lT0B7+68mTLqm5S
         hefBTAJVqdYUYgXi4fA4NzwmvWn48hXKINOwuhUMHp3otBkwAPHZHRjyZA8ydxgmiEGH
         tbmTIxnEMrWSaUtgctEHW9BXX+6pdTRAIXqetLuy0jwsDRpf16gocD0cJNDAt5vzHIT3
         GjeFOtNQgBo6bL33m8XsDRfOxaYxccQ0+BHD/FkHRJqVx+FVTuLN3KXcne+R9Xq7cPvp
         554g==
X-Forwarded-Encrypted: i=1; AHgh+RqguSEfD+HMbnB3RM2dumakmV+FzZ34dKzDzmgwCk1xT/lLTnVOplgEL4Evq+brmagJyH7peuX5wKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQetUwm9bL/QAI6fwQ9fVlzbgB8I55YzU/eczI8gBf7Zfq9adu
	g1a+pxVtkp0wC6+IkH4jHWkJRwENWZuLanpHIBokmXvkmf2pmUN7bz9nAbxdmYsZK89BkK5Xats
	1evwPNwecKYVdm5NxHs8GwUtpibDqRAzDuTd0XOhn
X-Gm-Gg: AR+sD12xajVaHCw8kgsxiuv4PVESm84SWH7O1XnQP1aCZwfrNhJhZxfK+ofnVjAGI8k
	Iql3wWlcFwnrsQ108zMcxwvfTfhi5A6YXx1cOa6hNvQMR0CgCg9NjuuLUiX7+Udm4KmqW8OEBNC
	avtkKuwGJEFF5CTJOk42/BFpXl4FLwf4t28dSNJqfo1iieHF7lJ8jmqntLNhrZH1EfTTeyX6Xqk
	5C4IDtWhoVYrHVuMqDCuU14rdL09M53h+uHTTvsMuAKNkMMz//kgMy/xIFmRaidU7IL7BHEF27O
	T7L2hPZAOgzvT1v71mjYwbDVMrNYkUFi7RsqciuSUgzi
X-Received: by 2002:a17:90b:3c8e:b0:38e:69ae:7148 with SMTP id
 98e67ed59e1d1-38f2960cb21mr8640703a91.24.1785174079933; Mon, 27 Jul 2026
 10:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-2-dmatlack@google.com> <20260723222106.GA867236@bhelgaas>
In-Reply-To: <20260723222106.GA867236@bhelgaas>
From: David Matlack <dmatlack@google.com>
Date: Mon, 27 Jul 2026 10:40:52 -0700
X-Gm-Features: AUfX_myC2ShwJmehW74tz8H5rliP_ZZpqbkoGqNrvu-bKZjNzGADgRSnjM8EYT8
Message-ID: <CALzav=cRhFW+zNX6xCnhjJXXDHgyhOxuoX26FG2Ve8+wMccypg@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] PCI: liveupdate: Set up FLB handler for the PCI core
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
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

On Thu, Jul 23, 2026 at 3:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Jul 10, 2026 at 09:26:04PM +0000, David Matlack wrote:
> > Set up a File-Lifecycle-Bound (FLB) handler for the PCI core to enable
> > it to participate in the preservation of PCI devices across Live Update=
.
> > Essentially, this commit enables the PCI core to allocate a struct
> > (struct pci_ser) and preserve it across a Live Update whenever at least
> > one device is preserved.
> > ...
>
> > +#define pr_fmt(fmt) "PCI: " KBUILD_BASENAME ": " fmt
>
> Is KBUILD_BASENAME buying us something important here?  Just from
> code-reading perspective, it's more work because without some digging
> I don't know what it will end up looking like in a dmesg log.
>
> > +static void pci_flb_unpreserve(struct liveupdate_flb_op_args *args)
> > +{
> > +     struct pci_flb_outgoing *outgoing =3D args->obj;
> > +
> > +     WARN_ON(outgoing->ser->nr_devices);
> > +     kho_block_set_destroy(&outgoing->block_set);
> > +     kho_unpreserve_free(outgoing->ser);
> > +     kfree(outgoing);
> > +     pr_debug("Unpreserved struct pci_ser\n");
>
> If this pr_debug() is useful, maybe it should include an address and
> there should be a corresponding pr_debug() on the preserve side so we
> could find things in a crashdump?
>
> > +int pci_liveupdate_register_flb(struct liveupdate_file_handler *fh)
> > +{
> > +     pr_debug("Registering file handler \"%s\"\n", fh->compatible);
>
> Is fh->compatible enough to identify a driver?

Not necessarily. VFIO could theoretically have one file handler that
handles all the vfio-pci variant drivers. But I suspect we'll end up
with 1 fh per driver in practice.

Are you thinking about how we can ensure devices are bound to
compatible drivers after Live Update?

BTW, thank you for feedback on the rest of the series. I am addressing
all your comments in v8.
