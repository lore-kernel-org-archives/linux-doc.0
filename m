Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC253AE712
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 20:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777581905; cv=none; b=UWJy2Arw9V0OW9XR7o3pIgDpQOT59qHywHdaXZ7zB5A2ppCsbrbgoLt6iCtMoKrpfLjkrD6EHpRs6Zh6yiy05W7ivYbK5OfflXsoedWk3lwQGFZjoPEI8sVgsq+yJ+Sp6+5tG1EAw0DHUqJQFoP+3wEE8N73q1gYSlC0dC/2Eco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777581905; c=relaxed/simple;
	bh=NfdHaeQSfqq3H+A37t2n3ZLxXNIDGtu4NkmeTlmQkBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNa3CeLRzXhXlcYwh+P76qm+uDUrp9yGRshJGystuY3hOLK+3E2f156g9zZx86GVzAaxvuigYquDVQnll/vCEMV6NCHiS0C7WgHAkWd6prXw2QjWTJ4aKEDC9EFOcgVOqbvwHVOACneNfhWX3IZ0asAordiV1j3u1dvtHdwbBUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pd7J6bFp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pd7J6bFp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab46931cf1so16921345ad.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 13:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777581904; x=1778186704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JvD+uC7yGlafUSeu2Mn7DdblXz0CDLD8RU3/xZfrtps=;
        b=pd7J6bFpyX5ChGy3frsVicyYh7uMv12e0mcktdF18SC964r/CnxUWZByuml0ihS2Y2
         xi2daOhvIgAqgyeTMegbsErrnEw0kQkBUFV8DhztWEbc1CJhoUSN3HfrqVNpCe+sPXME
         HuovXcuChcN6oO+d0/bN3xe5tPR7zS5389J2xz+gVLw2Lmk2vdIh2Vu/6BZBCVnRKSiw
         4mAQ8bhs8AiO94iMTJkihP0bqdH+fDRYuRZTFXZci7vXX2I8fK/sDb6lJlrz2qRNZix0
         udpf5KKiOI0DaeuoA+M6T5sKg53xCxPYadDRzwHiX6+3YFycyz1uzAK6uZ4dO9JgtTob
         KAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777581904; x=1778186704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvD+uC7yGlafUSeu2Mn7DdblXz0CDLD8RU3/xZfrtps=;
        b=hJfZ94I06CAggzKGWhGMtZcorfBc/y1/4VG/wG5G3L5jd0zzFo9MNonZPyQBSQtS/R
         FWdfLkUvNeN/acWhgHEkflv8gxv480Spea+tBImV5JMtAX5Osp1emUe5knuxltkHfFWq
         ywIITkbT+3unOnzIrdEIxjVNS1njny2/JZELyzjhCiQbynuDcQFFcPu0YKUN75+xkitD
         df3j37YJHOqRb/iacQpxllnJNisAb2kgMuzzoLXFaBqDzjc9QophmZQzpkCBAh/+h/Pf
         lvscDh/Tmn5jEcRJ6sq/ExTYaapoC4fNH7xsem5ZpcgVyhrriarJIMvircDWyoiTHJG8
         TOkg==
X-Forwarded-Encrypted: i=1; AFNElJ80xvABAR9YV9jjb9fKWNkCTzNkE242DlRNDDMi1mcFzuEmzvaibl9R+io5kqOF/P55S1OCPRu4qUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc2QQ2HMUSn5DlS1ntCO9Y6mtlBFPa/aEonSsdFcaYUhLhQ+J9
	pnA2UtycXLVbjwnHhteTfORZePEE7QeM8cxQPYqUp66q9FtlyvvegywNdOnkyjqiBA==
X-Gm-Gg: AeBDiesMzacQYA/1iUYMqDbuc62gHbSP2JVe7zpZhGAmN3r3DZRZU75zQDTzmMU0dAk
	T18FviiRlWk/PyNsZHpar5aHvPGqJBMUm4x1mu7xzF3mZqlWTGM518mgDsn7e+lz05ziwv5cV4K
	vrKYC6alIE2q1+GCpafrcaILpRMrmroypYTh2YWLSXV99vmzWn8Whf0FUl+yF7Bnv3X2r/aioeB
	P6eoguxnGK7POps/U8FayBaZVcaWStAHHgdmja+BIYC/rboynzv2RjdAKfnVPB0pE1aobwSE3uN
	Dum8LDe7i3SRbRkU3l730/os8qJdmVHzmgtNZMMQSFssFQu5TiG0YuEJ3Sf1ki6Dx8xTQCPXLOt
	lNTWnbRFJxo1laYmGtUyLzSTcR+6DOtIoWlF6SBAMJBULYDcN1iMFoGcmqESzijhNNBEpPqpX5J
	FwIazGpMOTdGiCcH+WUJl+2LpcRsiJCI9HowawXNUlRf0oQW4eoxE+8mULCjBCvAG4fvmOfvxZ0
	uvn2Q==
X-Received: by 2002:a17:903:200a:b0:2b2:6cab:3127 with SMTP id d9443c01a7336-2b9a44c5da2mr25533465ad.20.1777581903207;
        Thu, 30 Apr 2026 13:45:03 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae5cc52sm4845105ad.78.2026.04.30.13.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 13:45:02 -0700 (PDT)
Date: Thu, 30 Apr 2026 20:44:58 +0000
From: David Matlack <dmatlack@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 01/11] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <afO_StuvUj1Rj-5I@google.com>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-2-dmatlack@google.com>
 <20260428185242.GB3825533.vipinsh@google.com>
 <afFICT9mSL1XG0v_@google.com>
 <20260430182532.GB13902.vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430182532.GB13902.vipinsh@google.com>

On 2026-04-30 11:48 AM, Vipin Sharma wrote:
> On Tue, Apr 28, 2026 at 11:51:37PM +0000, David Matlack wrote:
> > On 2026-04-28 12:45 PM, Vipin Sharma wrote:
> > > On Thu, Apr 23, 2026 at 09:23:05PM +0000, David Matlack wrote:
> > > > +	pr_debug("Preserving struct pci_ser with room for %u devices\n",
> > > > +		 max_nr_devices);
> > > > +
> > > > +	ser = kho_alloc_preserve(size);
> > > > +	if (IS_ERR(ser))
> > > > +		return PTR_ERR(ser);
> > > 
> > > Should there be a similar pr_debug() in case of failure to denote that above
> > > "Preserving ..." message didn't finish, or, maybe just print one
> > > pr_debug() after the error check above?
> > 
> > Hm... I guess there could always be more pr_debug()s but I don't want to
> > instrument every error path. I could move it to the success path but I
> > don't see how that makes it any better.
> > 
> 
> In current way, it is printing that it is preserving pci_ser, but there
> is no indication did it succeed or not in logs. If we are printing the
> logs then may be complete picture will be to know what is the action and its
> result.
> 
> I think moving to success path or printing again based on the failure
> provides assurance of what happened. If this gets printed in happy
> path, then we will know it succeeded in preserving that struct on
> kho.  Absence means it didn't. 
> 
> We can also remove pr_debug(), if this is of no value.

I think I'll just drop these. BPF can be used to trace this function and
what it returns when debugging issues.

> 
> > > 
> > > > +/**
> > > > + * struct pci_dev_ser - Serialized state about a single PCI device.
> > > > + *
> > > > + * @domain: The device's PCI domain number (segment).
> > > > + * @bdf: The device's PCI bus, device, and function number.
> > > > + * @reserved: Reserved (to naturally align struct pci_dev_ser).
> > > > + */
> > > > +struct pci_dev_ser {
> > > > +	u32 domain;
> > > > +	u16 bdf;
> > > > +	u16 reserved;
> > > 
> > > Should this be renamed to 'u8 __padding[2];' instead? This will allow to
> > > just change the array length based on the need (0, 1, 2, 3).
> > 
> > Sorry I'm not following what you mean here. What is the reason to rename
> > this field and change it to an array?
> > 
> 
> Having a padding explicitly tells there is a requirement of being
> aligned. Reserved sounds more like don't use this u16.

It's documented above, but agree padding is a better name.

> If someone add more field down the line say u8, then to make struct size
> aligned they will need to add another u8, u16, u32, and name those
> fields padding or reserved. IMO, having a u8 array named padding makes
> it easier to just change array length as per the need.

This field does get replaced in the next patch. But I see your point
that if we need to pad by an amount other than u8, u16, or u32, then we
would need an array.
