Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185889;
	b=HUNR1mL/In7SlqAKuO6bbvrCSU6y1L4ipp+MeJvYvGoPjfqxc/u5yy2p6FSmFVTKSghr
	 fh0lrKpx4agnkwwQEO0dKvd4kVgv+TC3spxso1qgjdOYIhKXILIY+w1dF232dgaVRewbr
	 Y0FbSxGH9k3X7CiwiRDWtbeyoP4529/VF4/dmVi61ObxzrVgTfS77OrzGg8rMvqrpJnEZ
	 ytHgo/m8czJ2ZgdXn6dBdPA11Jj6gAuae1G6px4sjE5RsWmQ2u9jlnNNUgws9B2SQ2DDo
	 Ap/i7AzuwHK7f0xrg1C9Vy3CDRxdqHT0EytPUhASNJVGVZeY3YYotdZDCNS8Y9Fs24w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UAmEuVaLj2um1QYSHCqaR42KS0RtEEeYHE8D0ahDr3M=;
	b=hsXA6i7mYlRoNj9WNzxUXk6NCX8GpEPJJXYy8AJ5lTK4u57b5YGjgIop0/W51zdfR3/h
	 4QC9+ua1po13r0Soy8WIfm13uK8BkU/CXb+Cuxii+IGH1NHRyGv6U/T7hNPpuKlo+rswZ
	 1L9HtRW11ltjqQGsS5BTviR7zhlPm2dNV5aAumP/ev/SWc9VuC/ArDVsLVaHFhTxG90o5
	 NwAC0GBh0ZD19CdjBQhVMLGjOBmgOTiwCKYclzjTipOTaqIhssRllLPmywytoEjsWSwjD
	 kh8WWSPR/FVgy1qnlnS8KLUhw9I0gO9DbzlabDNt9jfCT2WrGnB9OwDEoThP1MLSSSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UafOjWj2;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967CE60A2605
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 14:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967CE60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UafOjWj2
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so308671cf.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795185887; x=1795790687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAmEuVaLj2um1QYSHCqaR42KS0RtEEeYHE8D0ahDr3M=;
        b=UafOjWj2qya2A4DjUwYc1dvmiVY3y7Yj84AgIaf3lwE0VabIzpOxlh7v0dWgybaoRL
         f+aEIbwPwYlQLKv7D3DVSsUs0eD+0/W1mI33E7/+1DoAhkbeKlWXpPAhmzPfaTLMDfU4
         osHhLK+HYgmOncAFpueqSfQ6v1hud4mzsTL2cPBHj91sHw/ySocCzFWPBKnbqJQAGNDZ
         xHZLzqv3XpioTqUPROOKnkyzw2Km5eHTcu2FBj8GTdQVHdVJiyDISBZoNV/K7nqDfV/a
         vtYdN1Jv8PFRaEuA0eiZVJuhAYqD7JedknH3AF/gCHF4iJL5NAyOUZT+BOQlH6aFMGRe
         sawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185887; x=1795790687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAmEuVaLj2um1QYSHCqaR42KS0RtEEeYHE8D0ahDr3M=;
        b=YqfLr+a4y0ZHd1XhvNJrwwu7frMEEb9RCKKyolwelr++wFSfOuBHWYVaSyttNQcK5V
         j5kuPF3xkxCFwmk78ZRXXUMoelgrY3VaXqu+ez3SOVy9ZY5pNLEMc78KCtWJ52dehurK
         FyDF8xxN47i4x6CEGgXRe4R1ETv2nfPws/Xy+JMW/px9qWzYMntDq+wIxIER6q8OlXGI
         ICCXhrdbaiAUJVRvFHmM8CV+2oskXrbywsAqu175rdpOEHUtnXnvscaixfv0JVR261C1
         YAibBcaHb9ilOW5oT9KyQggMBaFVYPhY8pYeKeOUeNNTp9EpGY2yDcjw/sZgTlaCfepH
         ZgXg==
X-Forwarded-Encrypted: i=1; AL+hErEZoONeL5/enojthHjw6MIPxrcRNRWL2Q89TueuRgPAi7mk+X21EA/2yloKDN+jKL2w4yj/oAj217I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z/YRZ2kuuFHaeLH+Pmn249z5qccB8L9iPpbex4bCD2AJQ59PZ
	3177XI2a0I2MZQQwosu8/Yj+4sfZhDZJGgWSo8o+UbjpF/gyk0tQycPMRB/8UL1CsQ==
X-Gm-Gg: AYBFou0iwJyZXYTcj6PD8WfAb5veLWAyDI8pz4q3vriAWLi53XQC0PGb3A3jL5k51Xu
	GOobiPDOey5TaEs0oI8crU4ACcbOsoC/j8RWfmQjtWM2UoDAUKFeSiZ/q2C1TqwyjBzUMTMUGc/
	C21lW+oyGk4VznndOcDEc/Delp5LghUL2QtgEEhn2mGepkzh3R5KGo4IFoNsgyaEHIQ726+97C7
	jp3VhjTWrcbl25+8UOfPR5Uoy3vXKb9wacOCWOpzkrxgv/kAMSNYHmsx6eQmdqFtjtWCLTShhq8
	P/KLvaQROlU4rBS1MWhkTs3HBIhEgZzEbDd6D12tccKVQ5yokf4SHk8PLhbfleir8x4uza94Xj9
	Ov94nL1DYduchZPIUe32m69MYwjVoGbvjQjGGBvA9wUKVbhTWQj5rhHCqZyqrbdrJQATsxc9JAV
	TO7AWWhrKybidbgbuliuWh0lS9ApTDSA7UgKVDhhyD6SPFBhW4XT2SIRb1WN7pdqRLc4ZmQ88rU
	ziR/7/yzNZ8GXOmWdpYDEPfCtkTjGolzsxjG/iHSgGZUGes5B3MgyVTvbPXXpMJwuLIOMUWF4dW
	505+3h8/d/zoeIqOpnefGC6asV+4o1Jl10tuwLMBTxtLwKHUTku+GamZlIiTPno5SUvH1CGexmh
	0WBsLyB8IVtLd
X-Received: by 2002:a05:622a:2b07:b0:536:6ea4:e6a0 with SMTP id d75a77b69052e-55d7a35af5emr17844321cf.11.1795185886849;
        Fri, 20 Nov 2026 06:44:46 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028c80dsm14013017b3.13.2026.11.20.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:44:46 -0800 (PST)
Date: Fri, 20 Nov 2026 14:44:34 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Alex Williamson <alex.williamson@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 08/13] PCI: Save and restore the ACS Control register
 and Egress Control Vector
Message-ID: <awBc0m4oW9nW4hgX@google.com>
References: <20261118223704.3286085-1-dmatlack@google.com>
 <20261118223704.3286085-9-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118223704.3286085-9-dmatlack@google.com>

On Wed, Nov 18, 2026 at 10:36:59PM +0000, David Matlack wrote:
> Save the ACS Control register and the ACS Egress Control Vector in
> pci_save_state() and write them back in pci_restore_state(), instead of
> recomputing the ACS controls from scratch with pci_enable_acs().
> 
> This makes ACS symmetric with the rest of a device's saved state. Today
> pci_save_state() ignores ACS entirely and pci_restore_state() re-enables
> the ACS controls from the kernel's current ACS policy. As a result, a
> device can come out of a reset with different ACS controls than it went
> in with, e.g. any controls programmed outside of pci_enable_acs() are
> silently dropped.
> 
> This also lets a later patch adopt the ACS controls established by a
> previous kernel across a Live Update rather than assigning new ones
> through pci_enable_acs().
> 
> Save and restore the Egress Control Vector as well to keep it in sync
> with the Egress Control Enable bit in the ACS Control register, which is
> now restored from saved state. The kernel never enables Egress Controls
> or programs the vector, but the firmware could have and they need to be
> kept in sync to avoid changing how P2P traffic is routed.
> 
> The Egress Control Vector Size is a HwInit field of the ACS Capability
> register (PCIe r7.1, sec 7.7.12.2), so read it directly from the device
> to size the save buffer in pci_allocate_cap_save_buffers(), similar to
> how the VC capability relies on its HwInit fields.
> 
> pci_enable_acs() runs when a driver binds to a device
> (pci_dma_configure()), i.e. after pci_bus_add_device() has already saved
> the device's state. Refresh the saved ACS state there as well, otherwise
> a subsequent reset would revert ACS back to the configuration left
> behind by firmware.
> 
> Devices that rely on device-specific quirks to enable an ACS equivalent
> keep that configuration outside of the ACS Control register, so don't
> allocate an ACS save buffer for them. Keep configuring ACS from scratch
> on restore for any device that has no saved ACS state.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Reviewed-by: Alex Williamson <alex.williamson@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
