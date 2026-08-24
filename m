Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662C38D3F0
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602495; cv=none; b=VePW4rBRD6rm0IpebCCD2QSOz0kka5SHDek9Ut7EtBca8x/V39LAUeUIulMX7/jhnShaB+6SmOkbL8IIeUJ9OFxcQ0fo/vzx2KQ8W2OilaeZNbsgmxBHa0rnZxz6SLPKKqEsGLY3b3uF4pWzSIS8scezLKvO92vkMaJ9XwvQVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602495; c=relaxed/simple;
	bh=6uYCxul9owyGxBZ0PI9XPIFrx9QWJZNj3NMHAJSJZJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btvP+Lt0Zv9gVH3tW5SIgn/97bjhB74fUm6c0h5hIlNsQkvnEHtwFx13EDKpctJndrVOgbx50adl9w+wqH0f/7Gv+YaDFd89nGkYnYC5iswl9BCL4syk2gTjuBj+y9x/CPIeQzmHCnEOUi9UKeZQyu3VpHJ52gGq17ZwzsvATRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZEcx9ywU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZEcx9ywU"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cede6375caso36425ad.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787602494; x=1788207294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lbrx60MJW7m62aJUfR88Sv9pb7keNNeDEwmAMWLXqMY=;
        b=ZEcx9ywUhDixJ9glR3dGXDNHIVfeIzIbWvqdTreHNEMmsd//zuagIsdZhZLV2MFwmw
         PUXONUWB+2rpbA9fYN4/hHOjtFXLeIF54AIqEarN2UNMS6ZaYiJfjjWJcDRQs1XAqFdl
         2A6rSmEFHkZbO40Sx0vt/vkUv2FC8F49hLaOTBBgJpo5TUpJ5rmuqadqL/j09Qww/tM2
         MMX3kFr8Jzr0aFFGSVhxHY2LyFkITaRdeLQFE5alVToNxwEP3K2Cy+tPq8+IKxR9UNf3
         wGRefqVEJ0zvCOYpPTKOkx1Lr7AwV7a9i6lWt09eZRnzYt1IpN031wkQCQI1RUIsaJ0v
         8EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602494; x=1788207294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lbrx60MJW7m62aJUfR88Sv9pb7keNNeDEwmAMWLXqMY=;
        b=QwoPSSpoHJ2G0XBXTJr+LtWgXfhs6Kqx5YsexLJvFCYp6NN3RqLopUUUZMeNBx+SwR
         aMa3d7KAIQCqNj8OATl8lliTRjEut2qKYqpET7ITcw3G0B+clFVKX41tBXVlYSebdUkl
         SAfP92fyJ8LmJMRvldS1kDmzoL1CBLPYgkG0l4f+0eLh9BRCC9q84SU5DC11gFYAMwod
         jKm05lhoo6tQ+2OpKntpcVb1JnLZnRh/vMiJMXzLZDWyRgq8w3xJKEk1Adcm7HgX4Hxg
         yR6cINSuRlkG+k/3FjbWheVArXgvWK7HKgiNrF24RwTw6FSVoWlLN0nZdqRVecDkqe82
         GfUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpw06AgqPT4MQMhIs8Wjuc3Wo06yzPGAPcfgXY/WltJ/LNFwsZR9NF4g4m80xuMz/uxzaua52OfYE4=@vger.kernel.org
X-Gm-Message-State: AFuF++n/NZXSjJCsL2GWQK3cA0fsYUfynJFuRkxrbI0Y27BizgBy/IrT
	F9c12v8tCiRsvTtIo0hajuYNcOAIBjJn1vaJOyWStPpP5SQfZ6iSGEeimaurzWvB8w==
X-Gm-Gg: AR+sD11qOGQk+BOpPSYpkXtZiamVEYJ8yTnt0jT0YRrzhiSy3xfIK26Yc+dhzdYc1Q6
	m44uTuPwi+DFrhVOu72luJF8sDWoLa5wLw2zevabGJweuf+/IDildjJF7GvvWI/adJpZLZ0MxaI
	6pOoaNV+MaWBx+ItyTvIy0N2LgcL54VHxkw9oY+OORbFrzPXxt3KKqk4a1ZnRAn5I/VB+wN1hgT
	BpHlv8uHoklhDSlfFZnCMhwwAQizv4/cABv2RHTHS48K7LoyuQRpRJQ9a1k4HCrnzpHELILI1fn
	OBWZsJNeSx+nC+rM1Unv6GcNVo8sS3l9YueGyg1V+qtLyJiNZscszE1BWVKM/6BAU7q6GftJppF
	hm1sTjX04EF+WBg8/iVPWOQ/PcL9Y6BOq8SR7AIh/V4oKVIRtNbg4DT/xQZJ8atmVl1FqEePypR
	vycJjCcl0AtTBQf4PWT0I+MX0eEq70aebREUUpXPKJ65Di60or996yD3qjO2Jkzbf+OUodXJ4Oe
	MhU89QWX64f5Yj1wVPTDINKnE1pCkHxhp6LR4vCgwSntoUWA9YJThjWSw4=
X-Received: by 2002:a17:902:f142:b0:2c0:defb:557e with SMTP id d9443c01a7336-2d6e07f52b9mr751815ad.1.1787602492814;
        Mon, 24 Aug 2026 13:14:52 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b49e76sm811208a91.6.2026.08.24.13.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:14:52 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:14:49 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 02/12] PCI: liveupdate: Track outgoing preserved PCI
 devices
Message-ID: <aoymLetUiJPsqrfI@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-3-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-3-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:09:56PM +0000, David Matlack wrote:
>Add APIs to allow drivers to notify the PCI core of which devices are
>being preserved across a Live Update for the next kernel, i.e.
>"outgoing" devices.
>
>Drivers must notify the PCI core when devices are preserved so that the
>PCI core can update its FLB data (struct pci_ser) and track the list of
>outgoing devices. pci_liveupdate_preserve() notifies the PCI core that a
>device must be preserved across Live Update. pci_liveupdate_unpreserve()
>reverses this (cancels the preservation of the device).
>
>This tracking ensures the PCI core is fully aware of which devices may
>need special handling during shutdown and kexec, and so the list of
>preserved devices can be handed off to the next kernel.
>
>For now, the API only supports preserving non-VF devices on a root bus
>(not behind an PCI-to-PCI bridges).
>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>---
> drivers/pci/liveupdate.c       | 210 +++++++++++++++++++++++++++++++++
> drivers/pci/liveupdate.h       |  21 ++++
> drivers/pci/probe.c            |   2 +
> include/linux/pci.h            |   3 +
> include/linux/pci_liveupdate.h |  21 ++++
> 5 files changed, 257 insertions(+)
> create mode 100644 drivers/pci/liveupdate.h
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
