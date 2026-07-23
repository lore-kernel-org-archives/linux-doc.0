Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CC3E5EEA
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784847534; cv=none; b=aFwVIUc+o9c7K8xMpby2mq6ICjZH/vhjTfxILTgybmsJ0xrxPIOTFths0Acmv6sCfURcMwBvX9Lh+yYYWalpF7I1kXR6fwn0sADGO/tZIg9XHsjO7lr8HpOLaW6CHA8NWbIAF7Wpiwvawk0U7v3tEJ2dx4xZ+TaInWnLPLxZ7hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784847534; c=relaxed/simple;
	bh=yVe6z1RcUZaY3Sf56/QfYhtCxfjWa8zL2up9uH95h30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij2mG6c9aq9NbJQNmELHTX/mGM+vlESsQF9VOw5Y5iX4nwzQTJpRkftTHykGb2PhujEmsJrghSBGAlFx1OSA+4jEeobcpTIczqxifgr81O7Xcpj5p+7WuxkbkTPVwJPuCQ/r95VQu/H65pmWzvDUUkPEqQJdwP80tuV4uIj0Hks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mn4LlFnP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mn4LlFnP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccdf36f63dso4935ad.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 15:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784847531; x=1785452331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zj8yGGu0ZvQspv+dm8spEGL6AmJp5gd8JQ+4SasQ24M=;
        b=mn4LlFnPZHnhq6bgD26muuFAuTY3LEmaHjdmqYiV/FOtSRLYtcs/IryJ8ya5My0fHX
         DjwNelgeHWvdrC4iZSQvHMhwQjSOspc0MhoZ9uuia8dU3h9HozAIlHkScfQCljztzp39
         KoX0g7l/df5N/BMI/6WjwsVmI6c18nDM+N7Iwk/rHFXKoiZh5nVm3XIRg1WJOfAUQ+4V
         xfEGYOfo/wqmxDgJDXTWS//xj+3YdcnRqjLm77AgBw+utfliuI1fUBW0BMPcupzfKG2W
         O+Z3gUNErYx3rWxI16VN/F2xsD7i69tFm/Uwk2ERnWPHBYKHsMSuTFXDUtkkb9ja0KJr
         bMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784847531; x=1785452331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zj8yGGu0ZvQspv+dm8spEGL6AmJp5gd8JQ+4SasQ24M=;
        b=bku/iFya6yrbVdA/O8HX7M1hvTFHeJVHfnQNJZIieXqDzlvewMYgIrhKrA5j1ny7Yw
         ipGJZMUpSBQvYoQWc3sbMfPb95/X927lpkxEdn0AdnpJzUQKl3ZZi/YKL99SefOSQrP9
         J1jwlsdHU0M+O9reM7OYZl74u/n2Z23TFQ9Wlz6eA4Ia+1/7/3RXHLcnyIJFaoIK2LIH
         bLzNmFQ1HbAuthZoqM3ttukestSSS4Cvgh8eIfuYE3f3iOZ4wK2ZV5HxKtNvA26nSHkm
         6HzAFWdu1nWn0hdn4ws32CsWc5YprmtTk1087MTx5tvVQk3JKqecDDccWCsKCs6Zu0Jc
         QvFw==
X-Forwarded-Encrypted: i=1; AHgh+Rrj7bGS5Vf9E+aEaEyfOXMcv7CSq2FkGvEi4wsEWPatahIgxtq72h13AT9VPvsYV8b57B6uIX2qZac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYstgtaR+v+QATxRzr82tHRePpxNtm62Vf4Gm2d9riQOFdsv7X
	CA0oJGsrr19TNFalqMAHr02CpDJnMJ1ar0VnpFFP1iNW6efew7nrT4WkLtcII3cRqQ==
X-Gm-Gg: AR+sD123zSKx50XxJyTUhYylboGadrp5dhZpIKwJ3GDA2aMizSFWQVJ9B5bnAv3lQA4
	lulN15bYWXdP8bBJn/2TWE5y7190hzJoalkIGH+flI9wxm068eM+/oqOm2SCnh3s7KKqMSPubAo
	FTQS01hjZZDwXN1eu8Ia/G/Dkl8bdqgmawiLBiJGXQ9zixNodMCvsfc4bXWmoBTTxzyAkAFFugF
	nuz5JMy8T9NEn3s+X8YyA/pZSt5xVUfvyLw0emrgWPWQPxOq7UMUdEghu78ON2g3NggTBa1NERO
	mrvBg0wke7wWGFOZlHVLQDT5eNhVfPYw6IBsiX+MoVuEMMy9Uptf9RDtg3cMPkQQJQtYMdmu5it
	Vi0W4+4mtGafmwMi/rNk0axX2eXGBMNNNbJOfwgBY5VetyJ7FnmVWFk/tGl6lDaMFnUtFEdh7qQ
	9BLqgZyDeh1qgYO5eDYqSk8d/mV2ECLsKrMz8FQso=
X-Received: by 2002:a17:902:d4c6:b0:2c9:a222:47e0 with SMTP id d9443c01a7336-2cfc049d8efmr1917685ad.20.1784847530903;
        Thu, 23 Jul 2026 15:58:50 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17236924sm3686474b3a.7.2026.07.23.15.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:58:50 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:58:45 -0700
From: Vipin Sharma <vipinsh@google.com>
To: alex@shazbot.org, rppt@kernel.org, pasha.tatashin@soleen.com, 
	pratyush@kernel.org
Cc: ajayachandra@nvidia.com, amastro@fb.com, ankita@nvidia.com, 
	apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, 
	corbet@lwn.net, dmatlack@google.com, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, michal.winiarski@intel.com, 
	parav@nvidia.com, praan@google.com, rananta@google.com, rientjes@google.com, 
	rodrigo.vivi@intel.com, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 00/20] vfio/pci: Base Live Update support for VFIO
Message-ID: <20260723215749.GC260824.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>

On Tue, Jul 14, 2026 at 08:14:45AM -0700, Vipin Sharma wrote:
> Hello,
> 
> This series can be found on Github:
> 
>   https://github.com/shvipin/linux vfio/liveupdate/v5
> 
> This series provides the base support to enable Live Update feature for
> VFIO PCI devices using the Live Update Orchestrator (LUO) and Kexec
> Handover (KHO).
> 

Hi Alex, Pasha, Mike, and Pratyush,

I'd like to discuss which maintainer tree should take the VFIO Live
Update series.

For context on related efforts:

  - PCI Live Update is targeting the Live Update tree (maintained by
    Pasha, Mike, and Pratyush, with David Matlack maintaining the
    PCI-specific code).
    https://lore.kernel.org/linux-pci/20260710212616.1351130-2-dmatlack@google.com/

  - IOMMU Live Update is planned to go through the IOMMU tree.
    https://lore.kernel.org/linux-iommu/20260614233728.2212104-3-skhawaja@google.com/

Given these different approaches, what is your preference for routing
the VFIO Live Update code?

Thanks
Vipin Sharma

