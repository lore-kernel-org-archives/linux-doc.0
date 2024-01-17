Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F113FF9
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705484541; cv=none; b=a0WvfpZohDdT/nRGRgmpDjr/SBibP0A2syDngen3DGqbW70OgH/QhR3Qh2k3RGX86U2eT/Xw5a1YJNZxvq29pie4mGbGH29nOWNlzeysXitVgzTlOKJdP3W2oXMktzj1oripziyQAWPH4C1fun2MexfH2KB0qfbVhfxdC3AbdG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705484541; c=relaxed/simple;
	bh=x4fY/wxyDIcPHn5r9HOMBTEiwZQ5upkgfRn4PdrdZ3Y=;
	h=DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Sender; b=SzFbObMyquJ88gQDed+lIesW3cPwi6K/CdxwZJ4USp70B0fNxxBYcnOIputJwhq3ufZ3vQNXHdTLJeegyqlytg6l0WQj2fSITozDkBEsJYGC+0YohjsuUE3sFS2X/ijaaRpUiJAbJ505sMWvw4YlMvaMdVZTnLauFD7O+Grzkv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=NUiP+zlU; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NUiP+zlU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0GcailXVX8bScB3XQ4DwyyM/w3Xe2yfasUDf2pmHVyI=; b=NUiP+zlUdCqI9vW37szSMPp6rA
	tmjv06xetGCbb2DgiGxmgMGOPlE3/a5kP5PxHi2jh6+tSENmd8lkepDLUnWvk2BYC1wT12CWDKKIi
	OrD7Z2fYWfm3eMY/Q8w6LQ6aHpqyyEvA2lxoygF1zKG7XnKRt1xzAeSLDpm8JhW/L1eRHvP3nGgrE
	Bm18N2kjBqK/9RJyjN+sVnOMISnPCwui6nkdCMElh81r+iFMvicnLSvK5eGOzAJbsV3sZ1QHFt9MY
	WHtQnmd45bqc57d34KFGyTfJao6H0SEespH8nZuQRflOd97pY3ZIGpRDyee07mdjU86EuHC/xVuWH
	8+9EC6Uw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54068)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rQ2Qr-0004WL-0H;
	Wed, 17 Jan 2024 09:42:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rQ2Qk-0004gU-M3; Wed, 17 Jan 2024 09:41:54 +0000
Date: Wed, 17 Jan 2024 09:41:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Hao Jia <jiahao.os@bytedance.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, corbet@lwn.net,
	will@kernel.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	root <root@n144-101-220.byted.org>
Subject: Re: [PATCH v3 00/19] arm64 kernel text replication
Message-ID: <Zaeg4jw3TFBUBL8m@shell.armlinux.org.uk>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jan 17, 2024 at 04:53:38PM +0800, Hao Jia wrote:
> From: root <root@n144-101-220.byted.org>
> 
> Many thanks to Russell King for his previous work on
> arm64 kernel text replication.
> https://lore.kernel.org/all/ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk
> 
> After applying these patches, we tested that our business performance
> increased by more than 5% and the NUMA node memory bandwidth was more
> balanced.
> I've recently been trying to make it work with different numbers of
> page tables/page sizes, so updated this patch set to V3.
> 
> Patch overview:
> 
> Patch 1-16 is a patch set based on Russell King's previous arm64
> kernel text replication, rebased on commit 052d534373b7.
> 
> The following three patches are new in v3:
> patch 17 fixes compilation warning
> 
> patch 18 adapts arm64 kernel text replication to support more
> page tables/page sizes, in addition to 16K page size and
> 4-level page tables.
> 
> patch 19 fixes the abnormal startup problem caused by module_alloc()
> which may allocate an address larger than KIMAGE_VADDR when kernel text
> replication is enabled.
> 
> [v2] https://lore.kernel.org/all/ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk
> [RFC] https://lore.kernel.org/all/ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk
> 
> Please correct me if I've made a mistake, thank you very much!

Note that, even though I haven't posted an update (I see it as mostly
pointless because *noone* commented on the previous posting) I do
maintain these patches:

  git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/ktext/head

currently has them against v6.7

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
