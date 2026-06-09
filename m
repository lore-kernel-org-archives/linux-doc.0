Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8E48B38A
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025626; cv=none; b=TZ+15IQvpOaJqD9Wf+93AS2ywUGaVt70fSX4gmAlbEjOGCV6GhiGS97KwuvyT4ymbuuemOAS+qxxQ2cVm7XishLrDhEFw4EjofC6FZGe0G2wCijWEL1kSB4RQJSimPrFaKo+uqNLaoRcsVCFd7Jd/58K+7yjpxiM5e5ZHYmiLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025626; c=relaxed/simple;
	bh=TK2+t/up9BNHR7cWnWPkUKbCONbG+0KU9N82d806Hmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MynMHtFeJwqYqZxff19nEO3k0QUctXStEqBqHQWybh9p05mzHgE3m6g/7+MWEE5XHJK/aqA2CJmhrQFjiIkqTIXlL6pMd3zq8lBB7ZhBpDr+3eyzWkkgy5urYt0ktkwbHYG1Zb7/XTJzsw5oXUCNgHIkbwvRwHrOKmHIt+zRVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LAtm0tOB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LAtm0tOB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2911f93cso461985ad.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781025625; x=1781630425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01u/8EAi6NGn4gFgEAFXoW9+VQRDowjxcP1j39dvRbk=;
        b=LAtm0tOBO31AXYeLi+UB/W5ChfPBv3oU+N91irOeaQv2UaSvc4ibQqfOhFM2llBMnq
         9c+zb+lQb1MJoHIvMgh5a2fef7nDaqbOF/tV7o412PzQUtKoHlqpD81ryv0GWb6TtyNU
         KxiGVOXcdiwTR1UK/SoPG9h9psrI4i3uoRBXBL3hTf1kSwY21797gp4coe3iLLzL9JB6
         QXRhFmgnggvxP05kngC+5yWNlQuPldM81OBlBnScOp3j8gm9eVcmeiLnEM8SruNTfe9h
         e82pHa1gA7J6PxbVTQr9HwTAPTe7v1x0eLnFc+SDiR7R/GoPIBE9+qO0CLvRTWg5ZYpy
         LIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781025625; x=1781630425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01u/8EAi6NGn4gFgEAFXoW9+VQRDowjxcP1j39dvRbk=;
        b=GOfkiEPYOEjzdWoSqgzC/sIfXTbM9Mxifl07IYpoT+/lz8TFtMUqdTnFky+EbIoNSw
         X7loORuZ1Tr1jZX7hDp2Mhz9iwLPMFIn7LmPXcXtlf2XNIz993dxrCCESYiLGRY66zFK
         WZVyOg1XTmUMvsFL2ooWjfHCEf8w1N+uLtfVatcGokT2aV5hHqcgFMkFRkNLNt6Y17Hz
         NILOJTf02H7QAfaCLrnmmCuVASYbYNFJGQqsjCCXmqqwkEhyUY5q5et2fW2QZSkYPNKI
         9VvbLPcYe2lg674RfAUWrV34Tx3MxUhvBwc4NSLO+wTL79aiiexQEbgECg3mFIuVbX2M
         cDTw==
X-Forwarded-Encrypted: i=1; AFNElJ8dT36LA/wJ9fvu3YbfOuZEb9klrvyjI2Ysr92rCcVq0hbQspjz2LSZY05OlOb3DfjYhu0aNbmU+SM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh71OIuM2iNdl2wO3wj5z4fCG/Szwg2NFdEOYH5cY38h8OnlUc
	QFTrYZcsfoU/slpI+bjzr3gy+PDz+m39wITuy3GjlRH75ZIUNho1407Oiwit6kBZ3g==
X-Gm-Gg: Acq92OG5LTvmdYCuHsfqoLcIO17rVcux442QU7h8LvKVj1HHnbfqxyN6MZbSa6pg4Lh
	S4itABiP72Z2wa3CYC4JJpNxKb+ltV4hUg22/ZFub3t/mA9AZzAVxKZ2vT1CHdWXK1oQ7kUa9rf
	F89zBH/7ZLFi6FeOX7wcq4R7nXy2Gs0ncoPhaJ+2Be28qDnzC9tLeegJqzgbqn7x2zAbl7EdpLC
	Bue0ULgSqR0310lVH8vE08icEoZZjsRKZ69uMFy6YMl+j3hRo0bAuNjkpif0DCt/owiD2nX7C/5
	DnGVfPTGSv5ja04ySpkhrXxRSfeY3M1EYSuoxIhkNzIv/PzIJrW3TWZlxjgiOEe8SBPHQWpuL83
	FLYiDR+BxacO4DqlGU8z4V04L6aXOe+C6Re0uVS3XJYuYRYnhW0GBLE4+KCoM42koZ8kjuPWwYr
	0cynUkCkLVyp0smK+HXGhnULjLzn6Kbj7KGjbDrlH8lNvB3cbOlmKSdeTbdiTlCswb9VaDcRJl1
	QKu7QzpQA==
X-Received: by 2002:a17:902:e744:b0:2bd:907:2ce5 with SMTP id d9443c01a7336-2c1eafbcbdamr9084545ad.7.1781025624007;
        Tue, 09 Jun 2026 10:20:24 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm25059778a91.1.2026.06.09.10.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:20:23 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:20:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
Message-ID: <aihLTgs1Y49OXQaV@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com>
 <aic6mdiZ0qUJpFca@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aic6mdiZ0qUJpFca@google.com>

On Mon, Jun 08, 2026 at 09:56:41PM +0000, David Matlack wrote:
> On 2026-06-07 08:37 PM, Pranjal Shrivastava wrote:
> > On Fri, May 22, 2026 at 08:24:06PM +0000, David Matlack wrote:
> > > Inherit Access Control Services (ACS) flags on all incoming preserved
> > > devices (endpoints and upstream bridges) during a Live Update.
> > > 
> > > Inheriting ACS flags avoids changing routing rules while memory
> > > transactions are in flight from preserved devices. This is also strictly
> > > necessary to ensure that IOMMU group assignments do not change across
> > > a Live Update for preserved devices, as changing ACS configurations can
> > > split or merge IOMMU groups.
> > > 
> > > Cache the inherited ACS controls established by the previous kernel in
> > > struct pci_dev so that ACS controls do not change after a reset
> > > (pci_restore_state() calls pci_enable_acs()).
> > > 
> > > To simplify ACS inheritance, reject preserving any devices that require
> > > quirks to enable ACS as those quirks would also have to take Live Update
> > > into account.
> > > 
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >  drivers/pci/liveupdate.c       | 68 ++++++++++++++++++++++++++++++++++
> > >  drivers/pci/liveupdate.h       | 11 ++++++
> > >  drivers/pci/pci.c              |  5 +++
> > >  drivers/pci/pci.h              |  5 +++
> > >  drivers/pci/quirks.c           |  7 ++++
> > >  include/linux/pci_liveupdate.h |  6 +++
> > >  6 files changed, 102 insertions(+)
> > > 
> > 
> > [...]
> > 
> > >  
> > > +void pci_liveupdate_init_acs(struct pci_dev *dev)
> > > +{
> > > +	guard(rwsem_read)(&pci_liveupdate.rwsem);
> > > +
> > > +	if (!dev->acs_cap || !dev->liveupdate.incoming)
> > > +		return;
> > > +
> > > +	pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &dev->liveupdate.acs_ctrl);
> > 
> > I might be thinking out loud here, but as an attacker, this motivates me
> > to somehow hack the EP FW to mis-report the PCI_ACS_CTRL register across
> > a liveupdate to fool the incoming kernel. If the FW feeds a 0, it silently
> > strips ACS protections.
> > 
> > Should we also serialize ACS state in ser somehow to ensure we aren't 
> > fooled by something like this?
> 
> What does "EP FW" mean?

I was referring to the Endpoint Firmware (basically any SW running on
a downstream device)

> 
> Does such an attacker even need Live Update to attack the system? It
> seems like such an attacker could route TLPs in whatever malicious way
> they want regardless of Live Update.
> 

I agree that compromised PCIe devices are a menace anyway. But I was
talking about the potential window opened up by Live Update here,
suppose we have Device A & B assigned to 2 different VMs (implying they
are in separate IOMMU groups because the switch set ACS_RR = 1).

Now, the attacker has an opportunity with Liveupdate, since the devices
are already assigned, if *somehow* it flips a bit like ACS_RR, the
incoming kernel might see both the devices in the same IOMMU group.
Who detects this case and what happens if this happens if the devices
are kept assigned to these VMs?

Thanks,
Praan
