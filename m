Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA057334C2B
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 16:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678160; cv=none; b=MY5LSycbkrEZNVcWdRk0NcQCPlUsSqNMJ/jRFcbKMLWsoRdZ+Lb/UfE5i3UlAVgmbGjUy/596ZhXtVgd2FcZc/y2NLHV2fxPc7aFKduJ7UUeymxfN/X+Tb9XM0QKLQhsjTpqL356LZrjZrUDlPW/5yNz4D5IKpc82RpBZnYzMOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678160; c=relaxed/simple;
	bh=zApGoFyAcej+fGePwU6DOnsDPAGQmLesVQjqihPzKsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMZZWRPSGc2gjab4szWy0vwWxiMeWkdXVEFqBMi3FW53zET84rnryl3usuJSNujq6wpKXlDiF8qZWKjROGl0kY+g7KlnDKn2749wwGzNusxrnbhdrRJ69tcJhayRT4hWPkuFFfpbaEYgQNd3A6I7bJ1Gci0zKxFlMpNxNPc0KaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cP3lT+zh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cP3lT+zh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b04c9e3eb7so103615ad.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773678158; x=1774282958; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qInQBteouiFFrqfiLhXSZXU3zqWyev9a+m0PyBXHRjI=;
        b=cP3lT+zh+FCJ6OXDDpAVgw6whOWVihSt3nqNwNsmunvouLZgjDIjh5VEVp3qQzC8ON
         y5OVa23XQU3gefsNcoH1w2TzBPnHXXH3cEGZ1UNQCxl3Rw6Gn9ZRvnqVzVDLYGIAex1O
         suEN6YKSY9UPiDUsSfDxuJhG/KKUFxFsHZv1pZWWIQZwiWpuRWznzmCVy7XcuNk7FpLI
         L25bBlW4x2j4pvKX4Zwta1trY9msxi+Jamna5W7QowfX6Axy7FM5QCnobU07ZqX5398L
         W/UwdWNaeG1V1met9yniQe7a72OPyHTgm0q4VpUnHnOAl6I0oWiM7WPy4MgCo6CmAl1E
         8PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773678158; x=1774282958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qInQBteouiFFrqfiLhXSZXU3zqWyev9a+m0PyBXHRjI=;
        b=BlNh2KKN32wDI6SlWzaQ49sXU4FCjmACpZmC/0ytWk900Wzet2dCSpDIwSrR2f1g+b
         /w8QqkDw91SoacGUKh/V2tc/veFI7rEAYi5G6njYLjYjj8ahWCR/7F/FZXDh+BpJl7EB
         Dd2riICDBP4JxgXalcP4xrIMOVlA8/0iBQY+FMy6SUK9dHPOdn3sRTpfSv3rqpPAbYvO
         4Ku2nVD0/Vo9ht38sqn/Xq8n/5y/XRogOMkA8/XYpaoSo/xmUmNw9DljgOF1UjxYQBD9
         HLbs6dxW5EF05PhL3tYC5gszkRq2IRwAN4sCxYXghtpkiw0QMbwNr57x6UqtWzcZBipq
         esNg==
X-Forwarded-Encrypted: i=1; AJvYcCUt1P/CavVBP19dUMH7qcdNnSFYYDlKKDCgWTq+4POu0RpKEKBSaiad30TsdrVfoszQg0x/QswHAHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2QQS/p+IY18PsBhYpp/u//Qyp7TRJ/kBYl/7MeqMIZ093vzm
	8lXavFNkpCElhsmlcj6oERS2Sm+LyTwotPM1h4wkblDkpC8jI4KoKnNrnF5add0bEg==
X-Gm-Gg: ATEYQzzzFLoKI+k6kD0WHnpsvg0WDEL1zH9uO5jVASRFzSLWwjMWYuIh0Zhk08bPinn
	xH3LxVGoKU+Cb9FeEXw+mhAj0Pt53r8IpJtA0QzZ1Tx5vydMsJ9yEDdFzt1hUS3J9b8X7RPyzqP
	aNovtRJXTynLz+J4pFktZwlzTEFUKfjso9T6nd65J0bN577BIQr0CAwIdeMJK4pVrZTDxW1Pw8C
	FWCdMAOxdCAAaVl4thJZ94R2nZDgeeQmClAzmQSd3isbM06M8PObug5xU8Goa3nCTdoRg4km06y
	xJAEOLW1c8TdwmFRcvzLD3jMrPWgqSb4jGUoM3fN4hCCtQRmdMSPMfIGw91nVloor+K3M89v8Ig
	LpkGnyrKfRB/jWyYtrdSpISXhQ5xIOsUtje/0JmZQ58649L8TZqI4MCgb+hvTdI1tuX6fdEFgb+
	dSq/sn1vHyz+k6hVfeqbE78umDM57ckFO0zfIXZjjUeByX4tCWRia8ydOj3PI7
X-Received: by 2002:a17:902:c94d:b0:2ae:4572:50e8 with SMTP id d9443c01a7336-2b04208841fmr5460915ad.8.1773678157593;
        Mon, 16 Mar 2026 09:22:37 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada43329sm111822a91.6.2026.03.16.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:22:37 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:22:32 -0700
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
Message-ID: <20260316160759.GA1767448.vipinsh@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org>
 <aaDqhjdLyf1qSTSh@google.com>
 <20260227084658.3767d801@shazbot.org>
 <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
 <20260227105720.522ca97f@shazbot.org>
 <CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
 <abNOwcOTXqxCxNzt@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abNOwcOTXqxCxNzt@google.com>

On Thu, Mar 12, 2026 at 11:39:45PM +0000, David Matlack wrote:
> On 2026-03-09 10:32 AM, David Matlack wrote:
> > On Fri, Feb 27, 2026 at 9:57 AM Alex Williamson <alex@shazbot.org> wrote:
> 
> > > Sorry if I don't have the whole model in my head yet, but is exposing
> > > the restriction to the vfio user of the device sufficient to manage the
> > > liveupdate orchestration?  For example, a VFIO_DEVICE_INFO_CAP pushes
> > > the knowledge to QEMU... what does QEMU do with that knowledge?  Who
> > > imposes the policy decision to decide what support is sufficient?
> > 
> > Hm.. good questions. I don't think we want userspace inspecting bits
> > exposed by the kernel and trying to infer exactly what's being
> > preserved and whether it's "good enough" to use. And such a UAPI would
> > become tech debt once we finish development, I suspect.
> > 
> > A better approach would be to hide this support from userspace until
> > we decide it is ready for production use-cases.
> > 
> > To enable development and testing, we can add an opt-in mechanism
> 
> Here is what I am trending towards sending in v3 as the opt-in mechanism:
> 
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 1e82b44bda1a..770231554221 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -58,6 +58,27 @@ config VFIO_PCI_ZDEV_KVM
>  config VFIO_PCI_DMABUF
>         def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> 
> +config VFIO_PCI_LIVEUPDATE
> +       bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> +       depends on LIVEUPDATE && VFIO_PCI
> +       help
> +         Support for preserving devices bound to vfio-pci across a Live
> +         Update. The eventual goal is that preserved devices can run
> +         uninterrupted during a Live Update, including DMA to preserved
> +         memory buffers and P2P. However there are many steps still needed to
> +         achieve this, including:
> +
> +          - Preservation of iommufd files
> +          - Preservation of IOMMU driver state
> +          - Preservation of PCI state (BAR resources, device state, ...)
> +          - Preservation of vfio-pci driver state
> +
> +         This option should only be enabled by developers working on
> +         implementing this support. Once enough support has landed in the
> +         kernel, this option will no longer be marked EXPERIMENTAL.
> +
> +         If you don't know what to do here, say N.
> +

To use VFIO liveupdate, user has to do at least two things:
1. Enable CONFIG_LIVEUPDATE
2. Pass VFIO FD to a live update session.

This means someone using it has to know what live update is and
intentionally pass the VFIO FDs. Isn't act of doing this itself an
opt-in mechanism?

I am not sure providing VFIO_PCI_LIVEUPDATE alleviate Alex's concern
about how userspace will know that sufficient VFIO support exists. May
be write in liveupdate documentation (PATCH 11 of this series) that
support is experimental?
