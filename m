Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003614;
	b=RsssYlLGN94npI9qb575sXFyTGHHIBDO2zYw3aNTALQq53BLuHDWcPxnbI9km0FTH9+X
	 3cEWBAzJAThiCNKl5z0p1t9uDRBcK498C31/cgMCC4RbVty1JPYxkKYhXqtYkDASUorvT
	 Huaa5JsnSLsH5LW2h+7C36iVHcGr3K7JiLq5BdY7Sa8BUieHgS7MSbY/hdIqfgrtUlu46
	 KW5M31bfh3LsJxLn3AMzpJIvlNrZF3vB6xtj20JbkTN2mZISdKBM2qf6nXqWBG0pXShZq
	 kvwXJx+BEKQzkHdpHCNLtkzLR5ZJ5eSMle0FetDm9MBoUuOTYlTBvNKRETXPolq6TqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
	b=BBuJOX2L2UYNr54AasvZIo0rwgRT9k3b2aDBG3vDGSMP16lRC+CYBn5PeW2zPHMjo0Jo
	 4uYTpOkZHwGO1fLdeZVMkrXQXaSBAu6oXP3KWL2KNy1yb1KE8rnYEGjJlIi2xNrWUp2ad
	 yE82TUa8T/4YePFA866oBF83bvqIJ4KuuSPrfDpyCpspbtmDI3ilwn+0ZUOiXWFSEDEln
	 6jQ8Q36hGuT0UvzdcuDWQ3YwkDMJktz8XRPq4nMvc6+9/bB9vQ3dNqJZfnMkTmda7JdFj
	 c8D4jUGNPF0vXY+b7ndPgsByDVmXeCtfPN5jEXSi8jtmZGFz5f5Yhtoi/d97cSGXLZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LXEDKNDB;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16012606A338
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 22:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16012606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LXEDKNDB
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso549941a91.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 14:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794003613; x=1794608413; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
        b=LXEDKNDBLRIJbYbtObAwr4pGaCKvFWMV99QdmyNI1LdRkb0kyu8RPs5U/rQq4a6M0h
         5ASlz3BmDk3LbCaPAyYM+ml0fpr0LBMu3Q0UZRphZODpbT5qLOGmsnp2iuyMGrmWopeo
         0rfHxzgGItR2A3RsjfMqH1RMIqnPHk/DKQcOT7SxsJPifbZx3trsUOLshBP/kzfGPp40
         jwfo6kRiQl0dxVV33yemWrOK969JVlnLk1sX53xxNvUOyU2suRXcmx/I4zRoch0SsKrQ
         gy23ukO+EfJuK2oVUR2elXb03hZSdEx1PEMUCYg04OuYdXw6vsu9TD7Y/3wa6Yuenl32
         VwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794003613; x=1794608413;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
        b=x2Yx4fD9vaFbjfRop3/VlRofeQ9bZKyc1o7FY/SKLkeDH9Eq+wEQ3ChqK8nZmilxwa
         L4vKfgyhE9W4F2PBJ9czV42mfSB/T8fFe/mq0fKmGMjG5zMRmeWNyC0kBWDV7Vpl4Xmw
         WxFB1L1upyTbAhxJPdkCqp9aJ4+jM7UGgjc+KY3tGmydBauj0iwIaLXXwfAr9v8VVeOs
         MAS15X2VDAmVfZh4gMTRu49/Uq+t5RdHqWpZU7PJS1y0nY4aDZ0osHo/olJa5YssCujb
         LzQc0dfkPOeGwZmuGIf3QW1WPjW69fpvXJ5GbunjxxVWAneX/1ipeoWZ52Dvs7EYQEq+
         TcKA==
X-Forwarded-Encrypted: i=1; AL+hErGpfnVdRC5/I0M/mytzaNeYIx9G2eduJ+qk9+fXaqyq74cFw8/1Y/6mANw1hvaoCCXJwNTqo6U7mW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w9uWfjwwls2NtRZTojS0c8yYd//Pkn66yK7W9OmdGVgDBy2N1
	6zFk7nLVDWmVDVsTvcKOlRSk0n+lz/8yAL+FY+Bha7mRgaDXlgQ4goSjqrsfXckzFA==
X-Gm-Gg: AYBFou1RVWe5Dp9qSrA65e+7aAmfrI3jR1CDIBg1eDA2/mleSS1A7Y/EZVzXXKnwGPR
	SMBlVNAFClgWd3yAqrTZUe2xuKDCrQ9xUPoj1TbEPPYEfyPws8d3/5VULDF9O7IalnNusLkiza/
	GF2WM9ry/WFMc2ryKnnC2bmP2EZZI/xwkYfkexBAvkcKF/PSul4FmRpGnghKDsL3cUoykTwTo1X
	dODIf2lfmMggMDvmn0B0KbpF1yV6vWLpGLmgVuhhehgZ9g/TwNAOwq2cOoyh2KSHJUEU/w26mbb
	O49+58kNXrTq6c6Tqdh5ByPDum7fOMf9XbBgKa+76XmnYoY6xwEwuSHQOp63SVkcgleLP9vIQiG
	HrfS28d6iB6ktVr+yjUIHrX5U6Zp8lWkfgPxLVMMcqKBKYBi/vHUUgr+h8uzE4SO6PdeiAnf7yb
	i+8X0LxjUln/ukCNMbeZD61+w6BQgGvnLVupLVWE4QAZ0UySGWDQrw5mp2AmtJSd93Iq2IDkYe+
	l/x5cyOxRNhVHsuXNj4JilXRz281RQoLL05kOvfdFa7BwTf4zni6W2+hRyB4c7gmxCsI6827Qb2
	6P0xWk1Php3QuR8N+EX+UAp4KflFg6n8v2G+Qmg8StHZh7n7g6Ao4VFA6xUEl9fSq1rMSQ==
X-Received: by 2002:a17:90b:3ec8:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b0db726100mr3762406a91.64.1794003612758;
        Fri, 06 Nov 2026 14:20:12 -0800 (PST)
Received: from localhost (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm528979a91.2.2026.11.06.14.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 14:20:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 22:20:10 +0000
Message-Id: <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 00/27] VFIO PCI Live Update (noiommu mode)
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>

On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:

> David Matlack (4):
>   vfio: Enforce preserved devices are retrieved via
>     LIVEUPDATE_SESSION_RETRIEVE_FD
>   docs: liveupdate: Add documentation for VFIO PCI
>   vfio: selftests: Add vfio_pci_liveupdate_uapi_test
>   vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
>
> Vipin Sharma (23):
>   vfio/pci: Factor out the reset logic in VFIO PCI device close path
>   vfio: Export various helpers from VFIO
>   liveupdate: Export symbols needed by modules
>   vfio/pci: Register a file handler with Live Update Orchestrator
>   PCI: liveupdate: Add helpers to preserve struct pci_saved_state
>   vfio: Add helpers to identify device files that can be preserved
>   vfio/pci: Preserve vfio-pci device files across Live Update
>   vfio: Introduce vfio_find_device() helper
>   vfio: Refactor vfio_device_fops_cdev_open()
>   vfio: Add API to open cdev device for Live Update restore
>   vfio/pci: Retrieve preserved device files after Live Update
>   vfio/pci: Protect incoming preserved devices until they finish Live
>     Update
>   vfio/pci: Take over preserved devices without resetting them
>   vfio: selftests: Build liveupdate library in VFIO selftests
>   vfio: selftests: Initialize vfio_pci_device using a VFIO cdev FD
>   vfio: selftests: Add iommufd noiommu mode
>   vfio: selftests: Add helpers to map DMA memory at IOVA =3D=3D PA in
>     noiommu mode
>   vfio: selftests: Add helpers for Live Update DMA memory and sysfs
>     state
>   vfio: selftests: Add an attach() driver op
>   vfio: selftests: Test preserving noiommu devices in
>     vfio_pci_liveupdate_uapi_test
>   vfio: selftests: Add vfio_pci_liveupdate_kexec_test
>   vfio: selftests: Verify that opening VFIO device fails during Live
>     Update
>   vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test

This series is getting quite long. I would consider splitting out the
selftests into its own series and we can iterate on each separately.
