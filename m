Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A6355F52
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777582017; cv=none; b=Xobay5Te5rQZ3KzH4cYVq1V36etbJkc44Q9OfAO1gmhSN5WOB0/alGCFT2U0+9T9bIm7ijTUyl/JoAAboAAoi5sxr5CovslL43vhKEot/cwQbF7Fx4TEVSELa5KpDMwZTYSkeUcZFmD/fbaholcc+tdkU/bj8V47a6Bn8fijZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777582017; c=relaxed/simple;
	bh=HekgxlUpgzkukNvV+knf2tm+30reYYgWGhdylIgjWnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ld3f7hnSUxp05zTBsTRv0FkFGk04+szAzLmCk/+B34gR+cU6a487A6s9Zrl2NaS1ufDJBiVOUiM2IHju2viEck13FHKh8n1sgyT9P4MS3TUUdta7NeUYl0O7VnCbC/wPjqAprmH1wkQhTYPxrTqHjl1fIB/ohRsXX4YeVBSA8zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vkye+lyu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vkye+lyu"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f8b60e485so647108b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777582015; x=1778186815; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jkf0FFUPX2DRAnC583F6L6pCpn6Z3D9oHd6oyEqtOrY=;
        b=vkye+lyu9+j32LP3KNqRNBAPXdsB5kRHTrHH7cabMbFfKb5OKZljuudgJAvRTUMXmF
         Md3XXFXxA0SYip1CBPyMRjuNYPAGodiYTFeNah8Zb5nbmKS6APOs16a9epM9w+TF2NTl
         h5SPbemdC2sPHeS42RMnXQLz0cLONy8q8VANLDqTOe8wdB3AZtYavZCFr9kr1u0Hkr4+
         kEL1cUt/rdh60qKNQN/Cfd33CVxYGm412gWmbL8JxwGTSYZtFUR1a5pxnIiNSrF9gYQa
         MRD8iS4iDU2FotFk4gqhFwaQ317kMNI32LoXzpQfdFlECI/l71Xif5lE0Zs8BpGFqGad
         Y76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777582015; x=1778186815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkf0FFUPX2DRAnC583F6L6pCpn6Z3D9oHd6oyEqtOrY=;
        b=DyLPjUbyd22nKHM1BeXRF6mkEpoj5l67iK1OEMLnRRMr+LQE03TeRPFAw3rDu+vUAx
         lUhl7Tpx0uh+9cvhL5MqmZ9kNb0G3o6jIFgWL4kYyKGcfgitnuqLip+/8bG0oiudnZ3P
         9QRJCrTov1S1ia22mSlNlCFTteIfRYMQTE3I18Mt5YPNvQy4HXkWeHE1yHzPOKnC1SwT
         vv7TSzYRgEcEi00hBr+7Ocaj2TsDYsx0ZZ7IGYTnAMNZzQNfF+Dri+AczYgBtNr9NBDG
         JDA0CsRRLushY26slilrOOyQI9hYviwmo2P3c0E0YBz4fRmEqnRx92gSaIvwwB/eGiPh
         mQtg==
X-Forwarded-Encrypted: i=1; AFNElJ9zIYt10G6Ba0ocyeypKEJPPCKOjLFuICXwFeiPLazB/NiuhWyHVcmZ0xlu7TG1A5Z+kIDdoq0AIAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzV/RTiRH4fj48jTLFBBKLLLcisibDia11G7JfbttMn91taHM2
	9ODd8AudIHanyK8iDXeuuz5bAhhdtKMHggA4n/gVaGVFFRXHvEK8SDhVkehz++P33A==
X-Gm-Gg: AeBDietovc2+2VspNLIvhBvG08mIrhe1B/21sSmKoqFl0apikuAY6S0XdctAaPMEHXG
	EUn0MTBA9V8ynu2A/QvWWQiJj6jQNWlglR6CG7wdCrZszijbOInHjNYkBbXhuWJuXMudtjr8pIK
	82ehlq8zeLztUQh9IalEXgZvlKJvKanorMa6TuDhlh6rCFrPO3gi4MyhUvZTzeC5uq/qwjemHox
	AVBem+nco9K09lgWMhClMH/hOUV0eum0/BHEcIORXX2VInDCx4QrUpbUXyv0p8QBnjt/us4C5+E
	22FBhupam5vJ1rEXQvJAmOAhorsbZmeNZK0iQX0HMx5o5nYVuH9oMrd6M5skTEuRNt5e6gHHF/i
	tmvL8P4W2OuDGqDNbX2w9CtJjG2Ccaq99PSNE1QeLU7lsPKnW5Diypkhft2ukBaqwInD4ihqFS8
	3a3KkvEdzp/ks5oyTYmgCD2jPcZEeIfAGezftmR54pDfHTmfxrj9nlu8wII9ihW4foM7DF52zAx
	ZSiCw==
X-Received: by 2002:a05:6a00:2384:b0:834:dfb5:6e73 with SMTP id d2e1a72fcca58-834fe061295mr5131011b3a.5.1777582014798;
        Thu, 30 Apr 2026 13:46:54 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad8eb6sm491387b3a.37.2026.04.30.13.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 13:46:54 -0700 (PDT)
Date: Thu, 30 Apr 2026 20:46:50 +0000
From: David Matlack <dmatlack@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 08/11] PCI: liveupdate: Require preserved devices are
 in immutable singleton IOMMU groups
Message-ID: <afO_ulcut4GNgEpy@google.com>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-9-dmatlack@google.com>
 <CALzav=dGpHEnEjyp8qc50iZrGeKJ47vjLvwtvkLCyNzOMJhozw@mail.gmail.com>
 <20260423225253.GA3444440@nvidia.com>
 <CALzav=fraXLgGs-XMc-=whMPhMbS99twFskGtV5Eo=UQ9mU5Fg@mail.gmail.com>
 <aeqpJ7BeBtzoPIx4@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeqpJ7BeBtzoPIx4@google.com>

On 2026-04-23 11:27 PM, Samiullah Khawaja wrote:
> On Thu, Apr 23, 2026 at 04:09:01PM -0700, David Matlack wrote:
> > On Thu, Apr 23, 2026 at 3:53 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > > 
> > > On Thu, Apr 23, 2026 at 03:10:55PM -0700, David Matlack wrote:
> > > > On Thu, Apr 23, 2026 at 2:23 PM David Matlack <dmatlack@google.com> wrote:
> > > > >
> > > > > Restrict support for preserving PCI devices across Live Update to
> > > > > devices in immutable singleton IOMMU groups. A device's group is
> > > > > considered immutable if all bridges upstream from the device up to the
> > > > > root port have the required ACS features enabled.
> > > > >
> > > > > Since ACS flags are inherited across a Live Update for preserved devices
> > > > > and all the way up to the root port, the preserved device should be in a
> > > > > singleton IOMMU group after kexec in the new kernel.
> > > > >
> > > > > This change should still permit all the current use-cases for PCI device
> > > > > preservation across Live Update, since it is intended to be used in
> > > > > Cloud enviroments which should have the required ACS features enabled
> > > > > for virtualization purposes.
> > > > >
> > > > > If a device is part of a multi-device IOMMU group, preserving it will
> > > > > now fail with an error. This restriction may be lifted in the future if
> > > > > support for preserving multi-device groups is desired.
> > > > >
> > > > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > >
> > > > Jason, do you think requiring singleton iommu groups is still
> > > > necessary/useful now that this series preserves ACS flags on preserved
> > > > devices and upstream bridges?
> > > 
> > > I have forgotten why we introduced that? There are alot of funky
> > > things about iommu groups that might be important upon restoration..
> > 
> > You had originally suggested it in this thread:
> > 
> >  https://lore.kernel.org/kvm/20260301192236.GQ5933@nvidia.com/
> > 
> > > Like if you preserve one group member but not the other what do you ?
> > 
> > Yeah I imagine there could be some tricky cases there...
> > 
> > I wonder if PCI core is the right layer to enforce this. Maybe this
> > fits better into Sami's IOMMU core series since that is where all
> > those tricky cases will be (I imagine?).
> 
> +1
> 
> Also I think this should probably be checked by iommufd and invoked
> through vfio cdev. Basically when vfio cdev calls into iommufd to
> preserve IOMMU specific aspects of device (PASID table etc), iommufd can
> check this and return error.

Ok I will drop this patch from v5. The IOMMU core can check for it if it
makes life simpler, but I can't think of anything in the PCI core that
cares about this check.
