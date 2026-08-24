Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826C42B749
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579050; cv=none; b=kYDLEG6PwbW+oSqK4JXGL2nrX3LbXcVy5WBXjvLgrC4FCWqGs2jJR9M5UE5w1XN3vwrld2QW/5Tl86isZxX02w8cQJBU19KkQC4+LRmF6NVOhCO9ZcJbAYhLyqA4fqLRhFT0J7RWPy4i9kUFsdsLaeDpCYCR0yKgEpPz8+Rcgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579050; c=relaxed/simple;
	bh=ELFORdSD94es6O+4UQqUAHjGe1+4/GgRtSjv1Ewqh6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhKvJ8JPLmf7mj0wyF0BaLxiSv7oWpq9KmZxmCjIwANuwkusUlPIs+n6hSanZn9O5xOUINHAXfZfFdIJuNQPkIZAfTHdczleO9p9e06MRLTJGZlZyMFYfWVsswGl8CN6ApC9wy+WlIQ+Hmg3VFaOCKcod4LE9fnLztNH/ZPaUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UEOR9tjw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UEOR9tjw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccdf36f63dso158845ad.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787579048; x=1788183848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxE7O9ZFmLE9ZVAOicUw4dBWt6/MseNUe3p/fLErz18=;
        b=UEOR9tjwuvktOwweyYgnqWCq5O3smDTRXLbh1f6oZH5vSid70WkBYzojUSfmg/lNI1
         3Ivepb70a/Uj9vG5zpc3GrUYA4kkOkdAsDgTfvsIcelmKJMuQZJmJMEihNjW5QYkeDPP
         kWL7i1SXFkH8G3Lxs28uFIF0eLn4puqFRARlceAi1RNG7+H86y5z4p3ltH0RdLFZaww2
         thJ6UDAml+EmMstqWBlKq9EVYJ2+HSkmG8jNkfiZFeounoBA1+ix7/cMJ+sciRVR2yKx
         Lyw5eTZqc9y0WRASTEQVmin+QRQE7fDNJwjcc6cT2VdInnkL6n2XvFwRBX5LJtNXXa2U
         r0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579048; x=1788183848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxE7O9ZFmLE9ZVAOicUw4dBWt6/MseNUe3p/fLErz18=;
        b=B7NDXnx80PTXEdycaWjZjgJ2Ggr1c/OR0FX4el+6V1JN6j0oQPgPQpRGBwO3O33dHQ
         rQsvT0rKJBaSoIlpegvQhWP2qmet1Z2Uh56flVwcoDt3MkocQSIqM9eulHvWZsng+2zM
         muhcOuLKh8vLdsKknJIsdCnJnyu453BxAq/zUFuwgeRbUT4YG1sprI1rvQzcfZISBkmO
         Jt1FmgBGR24t2lLil3OvDSsqWuf6OyiCRKwO88kQSiF8z3R3ZUyWb810ZFjg2w5+xtzv
         PHwdySgM5tOaqBUcc7TOJlaDjnFAgfzZSKRzlFxb70lRIvhp93EP8iFLCPpJ6g3pJ1o7
         MkFg==
X-Forwarded-Encrypted: i=1; AHgh+RobztgVdohiLCvH9YrN5CcT8J2UUtzsd+SrtibYwARYkIeKv7IXH2wZnGPyQlyY9P2jVAK0QRCUCSY=@vger.kernel.org
X-Gm-Message-State: AFuF++mhdLtNMoq97EW+EB49t5T2uk5p/WtCS1x5ZmwiWpUHcUGvytIS
	vXFrwirFflbcs2gN1nwSSO2ON3EnX4RqrezvF7BpXXZlyZZ7cbOe/6LefXFwcQyGMQ==
X-Gm-Gg: AR+sD12qbgQrHybxe+Y6rXBq9yCSIPqLxudmtk3O2TFTRO7RYVxLahh5ZcbAZaTwJX6
	O7S6HF2euYwfB+AWl7pr7KkMyDPtO9XXLHXm6GZoSn6hM1+wMs0o+A7jj98EW8dqhEEQ4sxaHht
	ymjTJ7ARxdmfdyvFL59HaOOo4fgnc6+yXUnBh6s9r6gFepePxYZm2L+sDgfoASrY/rpm7/O99hV
	8RxiiNsR11uhONd7rI0XCQ7nISyOD0Rt6GlSjllmO56a6A+ySARSurnZACIcVWvCfhvqSq7Wctk
	qztES14GTOVUDs8hj6SJIjujbJ4n0D9DeFvzT2rPu45Q6gTHHm1ic7wkzkZj3oS7uT9t9iWuIEt
	shiPDVYVincC7Ulge3cr+gRF0r0bgxCjVJKPkSowqQYeDQsw4n6dPS5CgVj0aw6ahrUAT93rbbO
	2V9poQFktkRbSw5p+Sj1h+zrPKQYSIuraTP3at1q4pt3T8GbIcBjaQPaiPnopKOVyhAbaV+kfBD
	GthBiVdMfjJnQZATYifrYzdrw==
X-Received: by 2002:a17:902:d592:b0:2ca:bf8e:360b with SMTP id d9443c01a7336-2d673b9e9f2mr9511405ad.9.1787579047148;
        Mon, 24 Aug 2026 06:44:07 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676792e1fsm18085525ad.28.2026.08.24.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:44:06 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:43:57 +0000
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
Subject: Re: [PATCH v8 09/12] PCI: liveupdate: Adopt ARI Forwarding Enable on
 preserved bridges
Message-ID: <aoxKnSgUp0m625EX@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-10-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-10-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:10:03PM +0000, David Matlack wrote:
> Adopt the ARI Forwarding Enable bit on preserved bridges and update
> pci_dev->ari_enabled accordingly during a Live Update. This ensures that
> the preserved devices on the bridge's secondary bus can be identified
> with the same expanded 8-bit function number after a Live Update.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
