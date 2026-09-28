Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462F13C0634
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615994; cv=none; b=rv8UdG4vvCKbMhCBCqD2BypcWYlK+hjrvwqe53FJ84c6dxHvc4pcPiCH/fPim4pXa6H+mQjfors3RgildEGn1WGlPtsESMJ13lL+HQiFLbYlyy5tgqGpg2Na83gedTCp5PAy4c9vN0vYJelE0lYZ49wnMDi7BC5wT52sVl4Kta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615994; c=relaxed/simple;
	bh=9bVXZ77Pzbh2OYLwrCoAhJ9SNTHguTxHVRc+s2gfuIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raO6Usr4wb3xheUZrg3AoMG3Ys1WLS6qXfdt7n7WNaOwI93OGNwcRHFWjqQlcmSxBNLxhZQCJID6Fy0t/eG8WtTRr4hOR3M1mrDO5XhKGdZwnc5uRW6pRkFcuiBPBSm/LbTZGlklU09pHLxGh0OR1huQSjSXU5MB86EVw3VdodM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBDq4Hjw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBDq4Hjw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d3b445a84fso3095ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790615991; x=1791220791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWEY4l/bIKaUQ0LkmUfe65oGxH2cGGoTK+zPHQ0IPQM=;
        b=hBDq4HjwxP1eGmrlPhZ3odGGR3Px9kfWs0X0sj4G+s4xv1n4iSLw4UzrLWKbX1MWcu
         +l95p5GNeDwJNkb2CTxKGkGgTMY6OS2lg0xqK5yGrWP7ems0dbFxwmVGGlskcXr/0bGo
         nQZlJxfySz/Ki4xh9+ZlFUm13+Mts5WCKAMP/IdmCXjQF/oVLQzvimqKRhHGzSyfBsq2
         iFIysEZ3S7yHOoWxk4jYYDSWAT65orvKrzsBBw45YXUDCxxPUkjTwsvgJ+73g7Cyu0Jg
         u6Hc5fIUQyylVjn0X6koEM7ca8J5IqxlETirS0AvoIEiGjxztMj5zs3yG5vQxSNcIp21
         Mq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615991; x=1791220791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWEY4l/bIKaUQ0LkmUfe65oGxH2cGGoTK+zPHQ0IPQM=;
        b=VVW5GM53qs/SDZPYeCglGLVWBeeogmIZZUZ/R4htsYktQ+IzLElkgikWn95UKC7Lfv
         DKPBa/wU8c7oVasgQK/uC09tuQXw3+qL+nbl4c6i6js6PqYr7Mgr6QUdKeZ2hg1xAVNO
         WsIHxGavEPuIc6PE6o8pdZq0CCg8GS7c2KM2FfJL1xXBt2Otke6YmJLIcYBwmCzBO+Jj
         31jk/UXSM0vngu17fqvI+vnilQtqL7E0eeCXN3ehRnHznBQSOdau4PR+LKYu+p3io3vN
         8wqN9o4GCB7d2uoEW0YJJjp7NzctFB0PvAClYb4Hz0seQsVXJVxb0irmTvzELma+iBA6
         zpSA==
X-Forwarded-Encrypted: i=1; AKwUvBx+gB+rlUAByvVMwGVtuDHklHCUK5mLVXypw172+CMQ8OuB1m5/lTjUWkXJ+ocE5C2jN/aKhtO/ec4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIEpNNJV4XV0+mPgbpeNh8RQ+stL2xrLyKptiTksEFKC6AazNp
	0Z8Uka8PKxHK7HmFts0pJvHymCAnFvpVrV04whya4OXL6LDN76y5AHx/zhVTPuvdLQ==
X-Gm-Gg: AYBFou1cTC+oTU0+5pN4OB58VGsG+19jZ+F1nENkMNAVTD170TiMoB87dMyFqzwm1me
	hKmQ+wlM3FotAvuWwAOxrQO6v5SDWwa2t2SGkCpVKwXKVNPaZUqUH5wlxgIFs14GM1gWGdGXFJ/
	mi4alQ1N33kXVuao6wMIq11+zic+3WVVzBdjUi/tyFTuHzIB0I4dO7S4ZjtXSQB79R+xMuMYbj3
	T7mFyc+xlpsDdccxSKjte0XPKgFwB+8R38xBENM9eUosjMv4AJc1IZAm0u9OcyXav4synlbupKs
	Uj19Uq8rDjBB20Ke7Liuptr250v85R5vEz4jWLtgGqBeEFYk0AC4j8cd9lR5qO4Bi3PN+lqeY/m
	Baw2HYuWEcXe4vhqdJfWOcwnnjDgoBvmUWOOxwhhP4AoJOF1kG23hIK4ik0VADyosbt+CS5f5Uh
	1rYw3rHxykfpVUK8tml7y/pMfqTMKt9XY7IRGcUO4V2RiRNKQ0YOIfNdUypznWn18BKDo5l/Z4z
	iLa6nndYUrylyoSHd7jvtnKGAEUm6znF2NA
X-Received: by 2002:a17:902:f54b:b0:2c6:99be:9dd with SMTP id d9443c01a7336-2dfa6248695mr7310435ad.12.1790615990264;
        Mon, 28 Sep 2026 10:19:50 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858c123sm538411a91.3.2026.09.28.10.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:19:49 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:19:41 +0000
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
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v9 09/13] PCI: liveupdate: Adopt ACS controls in incoming
 preserved devices
Message-ID: <arqhrVi0YfFNwKuS@google.com>
References: <20260918200640.887030-1-dmatlack@google.com>
 <20260918200640.887030-10-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918200640.887030-10-dmatlack@google.com>

On Fri, Sep 18, 2026 at 08:06:35PM +0000, David Matlack wrote:
> Adopt Access Control Services (ACS) controls on all incoming preserved
> devices (endpoints and upstream bridges) during a Live Update.
> 
> Inheriting ACS flags avoids changing routing rules while memory
> transactions are in flight from preserved devices. This is also strictly
> necessary to ensure that IOMMU group assignments do not change during or
> after Live Update.
> 
> The adopted controls are recorded by the pci_save_state() call in
> pci_bus_add_device(), which runs before drivers bind, so they are
> automatically reapplied by pci_restore_state() if the device is reset.
> If that save buffer could not be allocated there is nowhere to record
> the adopted controls, and they would be silently lost by the first
> reset. Program ACS from scratch in that case, which is a better outcome
> than leaving ACS disabled.
> 
> To simplify ACS inheritance, reject preserving any devices that require
> quirks to enable ACS as those quirks would also have to take Live Update
> into account.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
