Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542C4A8420
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146027; cv=none; b=u2fz/EYpZO/PRrj85ibmTHVJTQACFQnZv7lHilV0VxkvgdbYKHap1vAWXxLIo5rP612npXS15ojbmgjCiVBY4prY7tuE4ZCmww4a1jZE1Z3R5QCsTu3fG3XRexvBHu4avN1mSuh5OgJpaddZLQeO6r2GXNAIZlMPzH/5r51JCx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146027; c=relaxed/simple;
	bh=pKfXcTh9ufGXtOnZL+dqvriCFW8mQUY1BS2IMX9Ms9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4PEzbmv/bhIRfqR24Q0Tf0rEkcVNwVR3yrTUOA6xwnVEDlEC+zI8H7vWtcFArDfaQplUNkULP4juf+N4CK/SQVoBXaesqJhJ1BjrpYLu2VnQvxwW5qZ6bBFAm7aNv5/QGzvCxc3MgxEYUDEINjatlj745NOPB3QYeZVyP70V00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v9IZvae8; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v9IZvae8"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-475920b9ca2so422743fac.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789146018; x=1789750818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwDk3fh+JvGyN78BSU6J48zvCwmsI7FUHYkydOLS1VI=;
        b=v9IZvae8x3v7JgAqqSmQc7lofPXLQdMwsx7ZhjXhc6Rlpl2KXPkWOgZ7a+IWL1nWMu
         +DP7CEjyls27Vt8D1cL0jT+Md5SqE0bLYtHiyKJI+uqfPE9PiFmcr6FNR2FzmWN97zh1
         E6BDQ3j9Fri8ayc2ozmMvpEO05vlOeAd7hkh805miCy4eRQb3DJR8eU1yyinK9jeylJe
         7z/suCBZ489WUbR1mp71Z8Xy/pqvoJtchYDW9KJvtxm1wv2YWt1EMsbNq3PvIb6XW7Fw
         skXJnHHu+m4b2yqsY5m7z5talvSxE0sgVpsj0+2v33enKhdmqMwoQY9as3qhj2+VVyoy
         tR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146018; x=1789750818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwDk3fh+JvGyN78BSU6J48zvCwmsI7FUHYkydOLS1VI=;
        b=HcK78Vps8qST6wKE+FW4AEZsazJlkxwGM0AV85+t5VQv7jSkVGaMZVGpX7IM1c0gbd
         aSeytHKm8nZ8pYyJGb+4I7tFB7KMhejhiPH4wX6MZe3zPTgOWhr/kNSfDlY4ZExY8yqv
         fLgaMl9b4ZAnAHl6gbDHCYAn1dij5xIMO0GENchRPDsLRYvUGrSIHHLfNHnYyRzEGw2i
         aXSqdzosz8a8S8Y+W911udHniCmei6C94HSdwBmBYbdXABOLLarUMiT9dwV8wnoa9oNz
         tc3ISgVMjq+lWPUfzqz8OUqs3VW75Y7jKMbQQqtmjoTbaNgXlcV1P/cTbWfR6RlgUVU7
         pC8w==
X-Forwarded-Encrypted: i=1; AKwUvBwDpRBPazK9pLMxxcQHcQVczTG1wynbAVAAEzh/OT7Fn859y6HGYNonzkB5XvxbQqNdXYQ1HFcmXVo=@vger.kernel.org
X-Gm-Message-State: AFuF++lyYU6fNGacJ7bRHCzp8k92kxFouUoLmWBcz+SjQDL0EHLxjSCh
	rZ48oenTr7dHC41dIQz6/kmQwLSdHyzKeEYosrO8dh0vd7XAbQSstuhxWf78/Tv8zw==
X-Gm-Gg: AYBFou3X9oRV0/IXV5Y7WNt4nkIkYc2o7mWfRKAILwhuI5+8w9NUdFYpKEF/tglhohg
	rJMBZt4r3lk1p/LYVQOYlxXmKM6mVFwpzGgflBV5AGurWWMiMxRIoAQlI+y+ZbPDdoCICCzBzjj
	zlYcamMTsR5F5NaTMneksy4jQYuhx4ldqbs+CO587ewSRIjUTbwikX0cIhavHEXo29ifK0Glcli
	Yt/JyaBQbd4U9woENVlry0+YN8OHOo2iOmy9lMQ+dDrb8nqFeEcwveXHkgHCBnbBmL8RFRDyl51
	J38p/4YGddRifX60V6v87yOUYk1i7/fD/SiQ/QSPNil1Y8wTQ6YfFpfCpGai/AFu3j/Iu/ngYNO
	n6gxum9RUgsVQpUcWudUNGtvhT4RE9yWvuysdnbapMncGO8z1A9/PjIIYmQeTHZIPEkMLQ/y2Ng
	BrRintTEWVnemNnwZCJv6hWbN0qnz8XaK2GXEX6cyjLfIJewrtC5ZvrFNEEety8mItjflOFmK5A
	MmjoErYl6KwFo3feQ01NKku9lf3vQy16jSgi9Ms
X-Received: by 2002:a05:6870:7183:b0:475:a112:1275 with SMTP id 586e51a60fabf-47debded110mr3337322fac.34.1789146016740;
        Fri, 11 Sep 2026 10:00:16 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8bd0284sm2467114fac.9.2026.09.11.10.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:00:14 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:00:10 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 06/12] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
Message-ID: <aqQzmvgILmU8F4TR@google.com>
References: <20260728221007.2098560-7-dmatlack@google.com>
 <20260910235126.GA367952@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910235126.GA367952@bhelgaas>

On 2026-09-10 06:51 PM, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2026 at 10:10:00PM +0000, David Matlack wrote:
> > When a PCI device is preserved across a Live Update, all of its upstream
> > bridges up to the root port must also be preserved. This enables the PCI
> > core and any drivers bound to the bridges to manage bridges correctly
> > across a Live Update.
> > 
> > Notably, this will be used in subsequent commits to ensure that
> > preserved devices can continue performing memory transactions without a
> > disruption or change in routing.
> > 
> > To preserve bridges, the PCI core tracks the number of downstream
> > devices preserved under each bridge using a reference count in struct
> > pci_dev_ser. This allows a bridge to remain preserved until all its
> > downstream preserved devices are unpreserved or finish their
> > participation in the Live Update.
> 
> This seems to hint that we're going to allow bridge reconfiguration in
> some cases, e.g., for hot-adds.  The simplest case is "leave config of
> all bridges the same", and I thought that was what the previous patch
> commit log said.
> 
> What's the benefit added by this patch?

It is used in the following patches:

 PCI: liveupdate: Adopt ACS controls in incoming preserved devices
 PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
 PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec

to preserve certain configuration on bridges that have downstream
endpoints that are being preserved. To support P2PDMA we will also have
to preserve bridge memory windows (future series).

If we are ok with applying those policies to all bridges on the system
whenever one or more endpoints anywhere on the system are being
preserved, then I agree we don't need this patch. But I thought it would
be cleaner to track things per-device.
