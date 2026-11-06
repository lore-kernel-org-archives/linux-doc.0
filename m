Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794004152;
	b=jlJaqgqy4nZJX6wmh4GpJG1i0d113RJYZIictLyjwUaEqsQ1B9YA4bnLZXLj++OW0JJU
	 Z5vIcS+capwEtvOPa603wFeYjMqV7RqQ9rK5cjDFVu0w4jOhVtOsOAXYCIpxZl/wOMkMf
	 Zn52yeaM0AcL/2r0JQydhcuA5WQ0+agwdGYtZWbRdgRvMzB0Jm79sg9cJb+5zPNBZn08z
	 Nab8CoIoMbZXYimnH4El/bZVoSJsjFc6S++yq1tRHhTdaIR2HTjrfv2FK8wSGaBiDL121
	 rSYaaJRWY5Kzdzd+rAsR/O6F9aMUi30o9dRNO5xpcdclQNwUUi2sAuYf6oPrSeTAbMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i6wtLwteYwyUZUWdoRocIhX8iiQGzMdlm5waC4g0QLs=;
	b=SC18WmEeDjScAUx730v7PqpNtzvRdQPxIbjCqwxa64Qdal57xXtNZjaHVl9v21tGwPSy
	 zuGe7K8cwiDH+FEMHkcEe5WhdbjeApZLbw/LkJaVlQ54VHAWLfg2DO64uXB+4To/vEJf0
	 UOI562KhH2MV5cVRSAxB95YgZDfZ0dw35FResOkjaN4+b0EBU4WdpbA0knFQ7yUucLpXN
	 LPRrpKybAH5+ffxUSEfzh8wSu7SCMsUcN8LauNX8ojSRW/+SFjciPqvXFFEdfjrN8GufE
	 qY5v8hEZXi9LG4h/daK6jpD2zCH3IrQTK8+OI33vUdwN6nlPzecKAkCQAzXtcU+jAfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gkl+CmfF;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E09606A32D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 22:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E09606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gkl+CmfF
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed3f563739so11665ad.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 14:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794004151; x=1794608951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6wtLwteYwyUZUWdoRocIhX8iiQGzMdlm5waC4g0QLs=;
        b=gkl+CmfFQ+Co71nT6Egy2HcSuWbxjmTrMcP4xLom+yPt7cEbNxsDoECW+9ukC5saGE
         +AySoNHT/voHJzM5UxjovhfbBA4XVMmOzenTYYDHMTsRbS8yBDI6QJCC/DhqETSb9rfi
         DOMe5p5m8Jf6QID1xENOM2zAR1ZJEac4eAVE38l+dObMh2ofbhr/jGqeJ6w/wQziIRyG
         7e0XENuBRYE2xUyk1zPMSoXhVrt2mPi/FAktijRb4aYgmhwzysr64/2u5MQmgud0WLGQ
         edRQIb+VHahReTzYz8nVaVx/ZTWIZiGWFzXVnUzS8RaVeSJDFuxuhL+tw/ESiAOBb6g1
         rz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004151; x=1794608951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6wtLwteYwyUZUWdoRocIhX8iiQGzMdlm5waC4g0QLs=;
        b=rkXWGgnFa3dlGGupsTCoYUQNcFEb1k4U4bvp/myNRZIy2fjJEl9itnTxhPbHvw3Gs+
         LQu7qb7jtT9yu/pkDD7wLxtlWDPOHNVNuXOLbQCLbYwlafbwrSd87ExO1VGIRkCDh2yo
         B1KE/lSFr5okCX8w3GWw9hmYmmZ9OJRwj0+WboOfJ+21hCptu8/RI+7DHLFJBjVTL/Et
         JrPMvsqp457//yq3XwXeVGx/bk/tREdk61KrbF/tSlIB83W1dahJU6PZOBA1ms5xAv2g
         EJBhGlPG8mMKB060jR2zk5tiA9ELEcX/dGRw7Ed+H74n8vnqgCKDhWgPbTxnBit3Jksh
         fpBQ==
X-Forwarded-Encrypted: i=1; AL+hErH0tkBAIvbSgr165r1kpNdMu/ubC51XspF4l/5M3whuH8UzCLB4M8SesdywGuAM8WwHJp3mDPJICLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z82VCGFo6mjV+3hk+C/s43QdVW7U+9p3gT4hkdBzNrNze7gvCBg
	n6njsoWiP61PwwuYFF2AvX351U3nbCk+Y2jX6c10XI4dA2gerLG3KiZvRo4Ag0R6dg==
X-Gm-Gg: AYBFou2yAHUtH16QS9TWX3gcn0+XaDHMFM6vwUSCj9OvPbbHrminW9m2fX5VZVGft0D
	7nnAQDHG534a8oxR1amyjSNFtKpX5scmAx3A5omQOL7SkjX5Jbh2QFuy/7kJtYd3LbjhuKPNc+a
	XibrDt11y+Uq7hyjSFh7fJApw48v9dWSyYIEKBW6yIzYbbGSOCDRzVq5OhKi9rEgLuVjvD3qiKa
	Hofp+svwVEReXA0BOdfaX+fAo3VhYXvIr6iCY/h+NzUn4PbSBIW/CrU6Jm2MwgY+x+utkizlWfN
	Z8R6lSugdLw3sqSYurLc2Ppt98+hKifDuWxKEo3J2DHT8auss3ebyzFbwFbJXM1D0JUx5JFBsxc
	xnO3NJC5vtwSxMqKsCcC6NE0r80o8yO3m3Uwxz9i78rTIEgxp/uMUs4hKPvZMRZFCWCGV1b52yM
	0OFpVtjeR3nzFPtoSIyTif2fSBVrK/mF8vl0XRIVJ/iCLY2oAIhvtT98EW0mOeXyRtyM4b1Q4/y
	8SQaSBls8pA95rAhdBaSWYzwgm7kh3IlytDldgojl0bdXkyooj+BxcoX6Mmo8RE62YfrMKh+x5W
	d1djLF4bNu7usLskYOGOPtUq9t6c56KmujsHVfvOPaEveYmV9Say7sfxC9cEn7olroPo5VmZ6RN
	IhPgXZrsG7GUGoTy8upwsk0YrM/D8NAInf9Ky6i6e374=
X-Received: by 2002:a17:902:ef11:b0:2eb:188a:1c06 with SMTP id d9443c01a7336-2ed6a865b76mr263955ad.9.1794004150728;
        Fri, 06 Nov 2026 14:29:10 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm775868a91.0.2026.11.06.14.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:29:09 -0800 (PST)
Date: Fri, 6 Nov 2026 22:29:06 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 04/27] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <au5T7qouVfxJSDmr@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-5-vipinsh@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261102153656.1431701-5-vipinsh@google.com>

On Mon, Nov 02, 2026 at 07:36:33AM -0800, Vipin Sharma wrote:
>Register a live update file handler for vfio-pci device files. Add stub
>implementations of all required callbacks so that registration does not
>fail. Register it with both live update framework and PCI subsystem.
>
>This file handler will be extended in subsequent commits to enable a
>device bound to vfio-pci to run without interruption while the host is
>going through a kexec Live Update.
>
>Put this support behind a new Kconfig VFIO_PCI_LIVEUPDATE. Initial
>support is added for no-iommu model vfio-pci devices.
>
>Co-developed-by: David Matlack <dmatlack@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>Signed-off-by: Vipin Sharma <vipinsh@google.com>
>---
> MAINTAINERS                            |  1 +
> drivers/vfio/pci/Kconfig               | 11 ++++
> drivers/vfio/pci/Makefile              |  1 +
> drivers/vfio/pci/vfio_pci.c            | 11 +++-
> drivers/vfio/pci/vfio_pci_liveupdate.c | 75 ++++++++++++++++++++++++++
> drivers/vfio/pci/vfio_pci_priv.h       | 14 +++++
> include/linux/kho/abi/vfio_pci.h       | 28 ++++++++++
> 7 files changed, 140 insertions(+), 1 deletion(-)
> create mode 100644 drivers/vfio/pci/vfio_pci_liveupdate.c
> create mode 100644 include/linux/kho/abi/vfio_pci.h
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 5d1b58271989..167aa9d66ce8 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -28662,6 +28662,7 @@ F:	Documentation/ABI/testing/debugfs-vfio
> F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
> F:	Documentation/driver-api/vfio.rst
> F:	drivers/vfio/
>+F:	include/linux/kho/abi/vfio_pci.h
> F:	include/linux/vfio.h
> F:	include/linux/vfio_pci_core.h
> F:	include/uapi/linux/vfio.h
>diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
>index 296bf01e185e..e8285ad93a69 100644
>--- a/drivers/vfio/pci/Kconfig
>+++ b/drivers/vfio/pci/Kconfig
>@@ -42,6 +42,17 @@ config VFIO_PCI_IGD
> 	  and LPC bridge config space.
>
> 	  To enable Intel IGD assignment through vfio-pci, say Y.
>+
>+config VFIO_PCI_LIVEUPDATE
>+	bool "VFIO PCI support for Live Update in no-iommu mode"
>+	depends on PCI_LIVEUPDATE && VFIO_NOIOMMU

Can we handle this dependency in code instead of doing through
configs? Are there any build dependencies on noiommu?
>+	help
>+	  Support for preserving devices bound to vfio-pci in no-iommu mode
>+	  across a Live Update. It enables a device to continue working (DMA)
>+	  while host kernel is going through a kexec live update.
>+
>+	  If you don't know what to do here, say N.
>+
> endif
>

Thanks,
Sami
