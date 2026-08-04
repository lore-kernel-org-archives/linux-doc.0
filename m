Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC90367B74
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826882; cv=none; b=AF6Ak7z1rwSw/nXP2B8kW6tT71mMFd5X42k4MAGYg/kiuY4/1a0qyBIpPbXvR9j5Mnp59jkkg993UI87Ff1sEiVEY0GZzXVEH/DkleUUhNLZIA2GUmG3qQKaZeamLP85vOAi7xVbxqXlj30mjlZldYFIZZKWdU/Vam5ji+LhiLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826882; c=relaxed/simple;
	bh=mBSsXVt0WN5enn4Z/hBPVjUCrYh/wi/Nv9LqigZRkAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Fe7cHlcB8jVhXHoUDQHjd0hQ+2figjz5tAacr9XQsSfYhkUVJtKgb07V8yQjRcNg3nK3UDW8ErD44HawNlxd0UXbmtbRqZxiUkQ3GHON/OvF+7pEzXuZ5oEpxx0NJH+FzIZ00xsKOjAydyRXA+0yh2ommWrj95H0UYegJGsRtxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r7nPMT4q; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r7nPMT4q"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260804065129euoutp028ac6b878870abae370c8bfe8d91fff8d~Ih4yH8Rom0154501545euoutp02M
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 06:51:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260804065129euoutp028ac6b878870abae370c8bfe8d91fff8d~Ih4yH8Rom0154501545euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785826289;
	bh=JXE2Em0fDmwmDn+ZED6OpcGydwsHXkapV9XebT8FZ3o=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=r7nPMT4qCrlnGmjXVcQCTeqmBvhISK3JGhDZyJjrEtP+q8x9DWar2XInl3BeB3Wpm
	 GTCzz9w3ZqqSgtiAphIlFDzy6XUq+NHHYxMzbCQEPcLSaCAery1mQq37J9YxXpm3xI
	 0B8fhqN2vGHu4OzYgsKO9LmKiFNN0a+XNq1Etu40=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260804065129eucas1p2d2dc0876b75c22d0d39e7316d691d37b~Ih4x35vH_2098420984eucas1p2N;
	Tue,  4 Aug 2026 06:51:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260804065129eusmtip2493c2192bb64d370a5a0f00dfa851614~Ih4xYtVTw2119721197eusmtip2k;
	Tue,  4 Aug 2026 06:51:29 +0000 (GMT)
Message-ID: <692c582c-1849-4ee5-9d6f-91761ef5c80b@samsung.com>
Date: Tue, 4 Aug 2026 08:51:28 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] swiotlb: introduce Kconfig option for compile-time
 default pool size
To: bibek.patro@oss.qualcomm.com, Robin Murphy <robin.murphy@arm.com>,
	Michael Kelley <mhklinux@outlook.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Jagadeesh Pagadala
	<jpagadal@qti.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260702-swiotlb-v2-1-9205f3ba5408@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260804065129eucas1p2d2dc0876b75c22d0d39e7316d691d37b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260702140941eucas1p22e5e3363c7e9338f18b2e050b0ef564a
X-EPHeader: CA
X-CMS-RootMailID: 20260702140941eucas1p22e5e3363c7e9338f18b2e050b0ef564a
References: <CGME20260702140941eucas1p22e5e3363c7e9338f18b2e050b0ef564a@eucas1p2.samsung.com>
	<20260702-swiotlb-v2-1-9205f3ba5408@oss.qualcomm.com>

On 02.07.2026 16:09, bibek.patro@oss.qualcomm.com wrote:
> From: Jagadeesh Pagadala <jpagadal@qti.qualcomm.com>
>
> The SWIOTLB bounce buffer pool size is hardcoded at 64 MB via
> IO_TLB_DEFAULT_SIZE with no compile-time knob to adjust it. On
> memory-constrained embedded or mobile platforms equipped with a
> hardware IOMMU (e.g., ARM SMMU) covering most DMA-capable devices,
> reserving 64 MB at boot is unnecessarily wasteful — the SWIOTLB is
> only exercised for devices that bypass the IOMMU or have restricted
> DMA address ranges.
>
> Introduce CONFIG_SWIOTLB_DEFAULT_SIZE_MB, an integer Kconfig option
> (range 1–64 MB, default 64) that allows platforms to set a smaller
> compile-time default. IO_TLB_DEFAULT_SIZE is updated to derive from
> this value when CONFIG_SWIOTLB is enabled, preserving the existing
> 64 MB default when the option is not configured.
>
> The runtime "swiotlb=<nslabs>" kernel parameter override remains
> fully supported and takes precedence over the compile-time default.
>
> Signed-off-by: Jagadeesh Pagadala <jpagadal@qti.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Applied to dma-mapping-for-next, thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

