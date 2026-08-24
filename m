Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393B429016
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578995; cv=none; b=jh35dLDo4YTnjJaPKbwsalypytOT5bFCL86wBjUslZv7cPlDg0JL+lxVqWqiEI84XtASwN+vz0zs1WMq2D3ns0imHwyFfckIbtVU/bHsuBTtTVBhAaXauvIkozPTQU0NQcqOlghOJJMKoaj7iQKRPlj9D2UyAb8sP+MS/sFbIbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578995; c=relaxed/simple;
	bh=t5Dnvpr75mSiRYxvcDa5qq9C4XOlypp3dsvqxmbZkvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUbfAU9lfKNLUApcVHzCS+aoSeVHCpasCkO4TGCDMCrM6B9NBmSb2CYDMd7b4/xJYI7KoZMznEMPQyPNkuO5v5XfhCksVI+2JJRnh0HDZne0fqv/YIySo3z1LocwImcWF1k7RiP1PCSXyb34hXT+LLFtbaJZ49KcafZMtSJk/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckDW2Jo3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckDW2Jo3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d3b445a84fso140645ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787578988; x=1788183788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCw4dJI8ZifsRp4I78bl5/NA1XA7Yj79m2p41cLSM34=;
        b=ckDW2Jo3U3yFdou3e5NiXT7pndBkVD7Wu4uHHJ1VKvoACfXivDdSxfZtDfkha4MAgd
         hwFwbuE7mNWsPQPvh8ZO94pjFCEY1HCr3Ge95WrGVWibhVdpZroV0SzLncFaGk4xfojE
         CoR9fDq1i3nBufWmuikM2iz8CbrODqGpePGyb5kZ6cNPVN1CzPNCCObtz25TUcLYPr9w
         SBd1eFm/gGkOMOlX3WrKn0Mq6EM8M6AZ1suMjaNWKS4QQE9XPXOdVK+1IBywY5pwFhm2
         UgTb+DjaAlmaOF2X62V0tuLNJmgvbABZkrGBCSZ2TmRQ7Myl9xBfewBCTysCZRxYZlH4
         aVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578989; x=1788183789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCw4dJI8ZifsRp4I78bl5/NA1XA7Yj79m2p41cLSM34=;
        b=PQAi1gDu6T0Q2O7sayEtJHPCWkLr+p7JGz0jV20EGpBqUx88bdLphEOJoQHJg0kPPQ
         x+noxnfyw4u44YOaTDYivkvohaAywOeUHEURxiGEGwrqueaxC+/HMK2w4L4+QedZ1FTe
         ObeKa6sflbmyJTd93JZln9U8iuaixkyANDv2noKYy62VB5nPLZ157YFg1Ug3ulo0Ezz4
         xtvq0RtpfDVZtAet9EopDiw7VVOT2q9hGQCegfVdjOaaSHUkWQn+aPylY2aQOl711i7d
         s4TmlHA1W4Q9+LBBZyhpyqWDcRFUlT3rBdt7T97UHiuXlFnE9sDcKGcCJILLyA6kRS/e
         41jA==
X-Forwarded-Encrypted: i=1; AHgh+RpaKOgcLLdehzpCq1QbgQvVL+J3qR8fP2mwxmRn3Co19ES70o4nqz1rVOSi9CvD1PTKK6aL9pNUEUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k2dtNDX1Vu+VPEr3CPDwPqhZnTHR97AFSZQ1yJv7WBHibEfYE6
	IrzqP+5qsEd5XwXI4A9U8yJZ8nNIJ6EkgRnwhk8XRlDG4Z7LYfHnpb7psXNFRos42w==
X-Gm-Gg: AR+sD10FQ6cEoDQq+8Ov7Md2QF9k5jT8Os9FWBsF1fg4QInKX0YIe6XQb0ne2TGW5cd
	uAG/WYqm1Oyz07mGdX6vzrRPlUd4a247JX5Kq4CAd7CD9+u7Eb5VgVPaaNmgM38f8eszv2QmvfJ
	Gt1BVF6NBmiLRjoBsGZorxJ7O6sm8GpJITpeBHB1syKruzzbn2cvU92edMM5OqkEsD4gt93f9+J
	Wqw4jIsP9sGUk4nYhQGMXtGS+v3K8FDMwUA5F6IeJ0o5+bl/mrz6/ZRGzzJ2B1b+mQxygp59ZPx
	etKJue3Y7JkVgvYnk5JVH2J3tTAMHHKFJ2HsXay8tGRdOa4X9MNh6oAJRwEVNp25wDjAkiAzSFT
	K1bEPfVClHTMkGUtNWc71wkyXz31ke3InFVTslzEQ5z3boQYbs8FMCCzIB/l2nRKK3lebnPeAnL
	X9EyuJlWrF8JFmnLUbe2/9miUNUdo616ErKe/Qkg+5lKVtaEHAg2oW+YqRQkrzSJClUaR10kHPN
	Z/+AYa3LyI0ZJEPUZpk8/3r9nyvc9Dvbaye
X-Received: by 2002:a17:903:2384:b0:2d5:db3d:1a44 with SMTP id d9443c01a7336-2d673bfffd2mr8845215ad.17.1787578987936;
        Mon, 24 Aug 2026 06:43:07 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b2b97fsm10656102a91.16.2026.08.24.06.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:43:07 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:42:58 +0000
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
Subject: Re: [PATCH v8 08/12] PCI: liveupdate: Adopt ACS controls in incoming
 preserved devices
Message-ID: <aoxKYg_9BXs3U6fN@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-9-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-9-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:10:02PM +0000, David Matlack wrote:
> Adopt Access Control Services (ACS) controls on all incoming preserved
> devices (endpoints and upstream bridges) during a Live Update.
> 
> Inheriting ACS flags avoids changing routing rules while memory
> transactions are in flight from preserved devices. This is also strictly
> necessary to ensure that IOMMU group assignments do not change during or
> after Live Update.
> 
> Cache the inherited ACS controls established by the previous kernel in
> struct pci_dev so that ACS controls do not change after a reset
> (pci_restore_state() calls pci_enable_acs()).
> 
> To simplify ACS inheritance, reject preserving any devices that require
> quirks to enable ACS as those quirks would also have to take Live Update
> into account.
> 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
