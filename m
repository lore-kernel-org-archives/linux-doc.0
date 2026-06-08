Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259F22DECDE
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915781; cv=none; b=TIJK6AwfRBUAov4NAclQHG+pntohOooavISJeqOkGvxNvkQPe7Lou89Crk0fqOCGeu+G90vba2emL9/v6vxj4glMYaK7TDlcXyc/4nHzr4m9J6VpcPsOspJ+ynsKPK3IxePee+GYE18M3hhX62PViPswduDnCpKIQ/ghxw8t0kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915781; c=relaxed/simple;
	bh=eed3wx8kSh9cvFIuH8h1g7Va9HBHOdti091cZ6XjzuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qd38Q1XYl2ucxMv7Yx4fVtqprXOI6RtiKjcKz/kMmfOhktbFJ8YTjbY9mRl5I2gqbYRWLjVb4GOe/K43B71WLOxzQZzuN/MBdiZ+fh6IfrQeeVQbVoZwtt/d6Q+oCYibIJh53wtj67Ngz5d6T+F/+QdRricKCNPPtPrry6JEhBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qJ/SVItb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qJ/SVItb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf22c18ad3so368935ad.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780915779; x=1781520579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmn+PdTc6vMvIeP/V6J1RAe1SscwIO8ISTB8QBGG6KU=;
        b=qJ/SVItbRXNSBHiLcnfG5JzHGRMU1n5wfZeE8A7lXjQ4jVVQplBI+OPWx9CH2Tpp7C
         F9u34LLm5QyTlSg8/cuQdVrEeL4dVGo7RPvXJA+CLbuX9bYQ4Qrl0wD6AjmE4mGeWrCG
         R6fH5Qo15fVB5GS5+ZSlpcDVWLvh4qTSeNWnJM70kTUw7b2dH7Bhes7W4ZXGCvJ3fu+P
         DINne3vj25nMCEa5LwQ9jWOtKnoWsMR5+G5wV4MMuwBcGMwptxVP/qYNpsCyvvj4lrGM
         Eyb3Ro0YNBnWYZeCLh+9fUyDsym8wceWipCz06QbSVpCRqkWcW/W/a+VqIB5KcyNSpsY
         j+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915779; x=1781520579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmn+PdTc6vMvIeP/V6J1RAe1SscwIO8ISTB8QBGG6KU=;
        b=RAKczbTEbjEudSp1CCFR0dOrUjAXUhfoyBaxG1R3Dj+auQ2s9oJfKVJnodbm8EApeB
         P4152tatmLeeHoKzPx07JSdKZJbTsw44effQwqJYNy/HrbAOvkExNDxUY2j2WSSC+ZmM
         mSPVcD4L53P/NjDuRXDlha1QtmfUmEeHNPfurGBJYjpSCN6GAKetLpM/Yev4MW8i/oxs
         X+JV8SKFP7h+xBvPCKWxy6VWk4tdO6sYaatEQ97YZvdXLZA9ToajeYvikwxT7yJ2Svpc
         r6VnZwh+gVIqQS8UgnFOVSePC8liL0Dmg1ozB4SU4hl2SWVsYduUkfY47vWNDcZUn3vQ
         z51A==
X-Forwarded-Encrypted: i=1; AFNElJ/jvgRpoYcMrcu9NmCcrGazibyV4o3B6Y1Sej65162ML8jFgOCVb6UWd+7hc2yAr1sBzLoAeC8A46o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0oemKK5usVrHcFi7eklmMglsENKmRQ3T0R2wwLvmswePK2gLd
	YgxiT3/hCY3DE7O1Nq/qBYbK2l/yYphn4JFLb3SlwpgpQIXbU8UqjbNkfXHtfhO4lQ==
X-Gm-Gg: Acq92OFjpU+55eE8bVTXExX483sLjtjG9CBDU+1zLKzCNvgwZAcFpA8YPDqUatCfMYG
	qV8bsEk7S03MmfuAuPmIXkg1YRgIKvDXke3xGTuxACseg074SYM4BH48uW+VjkfFQk8M4wL75l2
	7sRHLfT/mhe1TcRLHJPUOw/cYcvPU90PxF3DgS6Q1wYpu1wTTDEXocsQxcU/4YfYA746cxPOBxA
	SVkNc9kI9NffMxE+4bwoEDgoGDB/QcfeZfENOR1aNmM0pif3bfvPlGzdQicCXl961u9S967ZeQT
	JzVoQvnYANOH6EERE5yMc+YKcRAO2W9laaf0IirJDUoo0IJGwuk2v0/Se1AIMto8IT4PcDhyrJW
	QvMFhydNxveWunyiqT2c8KjUvnD6lW9ntmiRFiqPeC3+6RVvqC60rSoyjUvRnD+lGtW7ofnjryW
	P9rS23o7GOwnfAq8/ddnBq53UIvAHxi6eeeAsNT0lxqaTRNKkd4S4MN9k3d+hvakGX78n/8o0=
X-Received: by 2002:a17:903:1986:b0:2c1:ee6e:4e50 with SMTP id d9443c01a7336-2c1ee6e51d9mr4607285ad.33.1780915778977;
        Mon, 08 Jun 2026 03:49:38 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm173906215ad.73.2026.06.08.03.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:49:38 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:49:29 +0000
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
Message-ID: <aiaeOVomxQZhoM3K@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiXWmR-ettxin4LC@google.com>

On Sun, Jun 07, 2026 at 08:37:45PM +0000, Pranjal Shrivastava wrote:
> On Fri, May 22, 2026 at 08:24:06PM +0000, David Matlack wrote:
> > Inherit Access Control Services (ACS) flags on all incoming preserved
> > devices (endpoints and upstream bridges) during a Live Update.
> > 
> > Inheriting ACS flags avoids changing routing rules while memory
> > transactions are in flight from preserved devices. This is also strictly
> > necessary to ensure that IOMMU group assignments do not change across
> > a Live Update for preserved devices, as changing ACS configurations can
> > split or merge IOMMU groups.
> > 
> > Cache the inherited ACS controls established by the previous kernel in
> > struct pci_dev so that ACS controls do not change after a reset
> > (pci_restore_state() calls pci_enable_acs()).
> > 
> > To simplify ACS inheritance, reject preserving any devices that require
> > quirks to enable ACS as those quirks would also have to take Live Update
> > into account.
> > 
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  drivers/pci/liveupdate.c       | 68 ++++++++++++++++++++++++++++++++++
> >  drivers/pci/liveupdate.h       | 11 ++++++
> >  drivers/pci/pci.c              |  5 +++
> >  drivers/pci/pci.h              |  5 +++
> >  drivers/pci/quirks.c           |  7 ++++
> >  include/linux/pci_liveupdate.h |  6 +++
> >  6 files changed, 102 insertions(+)
> > 
> 
> [...]
> 
> >  
> > +void pci_liveupdate_init_acs(struct pci_dev *dev)
> > +{
> > +	guard(rwsem_read)(&pci_liveupdate.rwsem);
> > +
> > +	if (!dev->acs_cap || !dev->liveupdate.incoming)
> > +		return;
> > +
> > +	pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &dev->liveupdate.acs_ctrl);
> 
> I might be thinking out loud here, but as an attacker, this motivates me
> to somehow hack the EP FW to mis-report the PCI_ACS_CTRL register across
> a liveupdate to fool the incoming kernel. If the FW feeds a 0, it silently
> strips ACS protections.

Minor note here: I used "0" as an example value, I'm aware that'll
effectively disable ACS and kernel will enforce more security.

My point was that a FW exploit can meddle with the bitfields of the
ACS_CTRL to spoof and mis-report the ACS flags.

Additionally, we might give rise to use-cases that start depending on
this, for e.g. if someone wants to change ACS policies in the
new kernel, the FW may silently update these flags across a kexec.

> 
> Should we also serialize ACS state in ser somehow to ensure we aren't 
> fooled by something like this?
> 

Thanks,
Praan
