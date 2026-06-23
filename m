Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF8E2DA74A
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 17:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234373; cv=none; b=U8lkuhbt72cauKWoAGT1gSdYSRWpDtM8YuE1pHcse14AvabYxPyjpnETjA5uoc9U/kRqUy0HWY09FUOB6DJ7n2EK2GW6B+bCRWqLK5IkGdbLQ2Htwy5/+HuEODslZS0YkLAASERsExAs+Jvely3QQLKwmTJEzOUsaUR99piKOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234373; c=relaxed/simple;
	bh=+OWC+hm04vkx07o8SXbdOwqEuj7KIn2R19JW3xoiy38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D95HwifoRJwi2tB9PCJ2tpEwh80Eup/T5IPEX6Y98L6lOX3K25rSgZD8d01C26x6bzRb3bWnpmuzRba5MXxLtab0Lo3ltWxz9giK1CW06xgxtvaGS106m6V7O7hfnQG7oxur/S+GD5Pf4XHkmUrMzalqGYG+fSv+IYECc4ma4ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kC75vO2h; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kC75vO2h"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6a4eccab1so715ad.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782234371; x=1782839171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tu79wS1tW2o86htP+jh+vF6ThoZY7vyXOnOxpMqA3sM=;
        b=kC75vO2hVHb4Uj4ndUhAUu0tIFsuSqkz4u8x0WjXIiMceAH+QDZIgbwXpQFgrgLWtL
         555PySBK0PZc2MO7Z5Exv2sErsptb0Oa05GsAWN653A4fTa2Fjp1SLqfA9NTdzFUcWqd
         cGg7iz7NE3dXcHbPmWtxg1dK08cdI57p6sKnjRZ3iVhz0AK13Eq083g9h7mBEyhvcNfm
         e79eYgusyhiN7hnnjIgvoduJZfbqSB574eqRzNdhF5qniBhVBzbsodAGBx3fgW6sFCZJ
         bbA9gmNMT8241Ga1YIjjGszIQkcEGFuv2EMxwBu+OF8pkZ81f9uj86vHCZ8tR+RdlZMn
         TzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234371; x=1782839171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tu79wS1tW2o86htP+jh+vF6ThoZY7vyXOnOxpMqA3sM=;
        b=NYeAd3AHgMNqBT8qZ5D+lAp7SrXNWtDxKz+y0kXurO0xvoAXK3R3NlYPmXBKxZsrkS
         skbThQyxYewhy9wGe3d9J4a+d3UZEKEH9k7fe/8J6PjBD3iQzGqeZlba8NsECntH8muu
         rRTt2ybsjKK0VMlOw6PtSE7OLpvkv5cdY7N49MJBkGy2eCjXVre3kaGq2f0/Znbpui92
         CmUEOBOM4jU3lpqT9J3q0aHojzCn14qyBxC1DUPgg8upwglulMMO4GajdKvvWvBFpBdJ
         O/x9bZEp90afSG30IlrbdQUBVbQ047DE/Ws3j8ScUVmyh5xRE++Uac4M333tFYJrt3/n
         2vTQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5qw3D1UoN3r/9PbEh033J/Bwt5TUps6k3S5vJjx+L12iDj+AyGSkRa9EDom/HVuOoXNum9YgWbfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hLU+1+FDGiRI/kN5y/dj9U/XtzcX3nMuLOrRlWN8SKZ91J3j
	7gyOTVP97DYWfgMCFHTxx712iUES7gzrLYykEzh/8CH/FL8AS5HS8T5tR+TXS1sqAg==
X-Gm-Gg: AfdE7ck5f43kFWaJxBgnoI5B6j+BQFfcAxjTiv91CrYX7h/A/pBi0jIWzufj+tmr5xX
	7+0wYw5G4mHu1+kr6bFYMW4yUPPkA2RnB2GOcsap2JYcQnQ7NiLDni3uJzgtb4BxEWYnZfXacK9
	nXv0nTo5J6QrLwd7ylWuChddiXcwDFbr0w4KVI6WXxTLkAl/LvDXXA7z+Yn0K28y6JLSPdVo9Y6
	5FIFDL4UZlMh/v87qlct8zvjRmlv1zw2FJOyWrb1Na72YE0So6zrAXIfjRAa5Xm1iaW2MvUo3vv
	vDednVjKq4uMmRzye4N9S3mMrKHwYcrZKC+IdCov47OvMdollwkeGS7s5zj4RQTHqHgDTofvtc8
	8s/jp5ocoT/EBsaxyfajgYwqotJp4WLOeU5ZCMQRXdVMQtyJsA38dwCc1K8OQjb71RrNoQI84N/
	YdBvPF31DehULFcs09YHBfl0pzckvAReeKRn4nKyH6aoTX9n0bHBFP25qmArbtjbKiLz4Vdi+pt
	0K44CYG
X-Received: by 2002:a17:902:c404:b0:2bf:749:55c with SMTP id d9443c01a7336-2c7c711c2f1mr2378745ad.21.1782234370647;
        Tue, 23 Jun 2026 10:06:10 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af54dsm113990285ad.11.2026.06.23.10.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:06:10 -0700 (PDT)
Date: Tue, 23 Jun 2026 17:06:07 +0000
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
Subject: Re: [PATCH v6 05/12] PCI: liveupdate: Keep bus numbers constant
 during Live Update
Message-ID: <ajq852qLegjfkP4d@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-6-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-6-dmatlack@google.com>

On Fri, May 22, 2026 at 08:24:03PM +0000, David Matlack wrote:
>During a Live Update, preserved devices must be allowed to continue
>performing memory transactions so the kernel cannot change the fabric
>topology, including bus numbers, since that would require disabling
>and flushing any memory transactions first.
>
>To keep bus numbers constant, always inherit the secondary and
>subordinate bus numbers assigned to bridges during scanning, instead of
>assigning new ones, if any PCI devices are being preserved. Note that
>the kernel inherits bus numbers even on bridges without any downstream
>endpoints that were preserved. This avoids accidentally assigning a
>bridge a new window that overlaps with a preserved device that is
>downstream of a different bridge.
>
>If a bridge is scanned with a broken topology or has no bus numbers
>set during a Live Update, refuse to assign it new bus numbers and refuse
>to enumerate devices below it until the Live Update is finished. This is
>a safety measure to prevent topology conflicts.
>
>Require that CONFIG_CARDBUS is not enabled to enable
>CONFIG_PCI_LIVEUPDATE since inheriting bus numbers on PCI-to-CardBus
>bridges requires additional work but is not a priority at the moment.
>
>Signed-off-by: David Matlack <dmatlack@google.com>
>---
> .../admin-guide/kernel-parameters.txt         |  6 +-
> drivers/pci/Kconfig                           |  2 +-
> drivers/pci/liveupdate.c                      | 83 ++++++++++++++++++-
> drivers/pci/liveupdate.h                      | 14 ++++
> drivers/pci/probe.c                           | 17 +++-
> include/linux/pci_liveupdate.h                |  4 +
> 6 files changed, 119 insertions(+), 7 deletions(-)
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
