Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752668;
	b=o3A4/h5rPvTjhqx27LzUg2Lz1FBSjheFSl/Aq+VaK7NqCgukBJ66VByhuQtYWMiL1uhi
	 ileHeTV+pciXpsiNsqwSyaLoUqnSwnqlvVrpWgrCkvvHj3DqT9PM672qFSxGQRBV03XRx
	 1UhVmw44UZMMbOWeeiwcY/XKqZl5IUFTSQzncir+bl3XOPR5YsGoH54NBMLhYuRZ+ppjJ
	 MGVBgLaAvuPuZPnmrbj3ExGFyYbr73t20hsZNR7rXCbZga4EeQbLNzG6sqTji6GATHGGa
	 fj8BJVLsea9uiB5So81zMIItGcG/BCTJ0bxF8w5pbf6Ty6VIFIXRAsmPjWIXfk1WtRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752668;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ma5fVbVqsuTPHL3uo579JA1YqK1wZC2YyyAKMq6IkV0=;
	b=A19fPNWJKGvdVu/HZan5bXma15rUFc0QhPXP7PVBQBm0TPQWFIkpNYbGAiDRWy5wXXf5
	 zERKwJ3UpFwCfBOmkOZsG61A4FbZ5LQiv3eIU51PixTwX6W79Zs7p3/nF+QxzQZkCc0Qc
	 7tly9G1L+0lmmdkT8gmhw/aPO76VV9ofdJVclcAgVhTcm4/jPkSqPHUP5K6LCwxz3nAj5
	 loENgYM9f73eLQPPagIpy0sl9byc2PVlJD13n138ebjj0MaNF7YPgKFn52p1Ag9Fss9Lv
	 gS3Zusku/kpMXEq2Hc3tiaIBiByAUu2qRB6X0KKvJi74hUkEduUIEXyq4r9Miw2R74A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="w/2S2LBs";
	arc=none smtp.remote-ip=95.215.58.154
Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F469606A31E
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 04:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F469606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=w/2S2LBs
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aXjlXeLzw2qZstyZgpc0LEAZitvOS6XRlrVaFNAG5Js=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795752665; v=1; x=1796357465;
 b=w/2S2LBsg1ssjUHhK9SDl9E28oO3QHF2MZqkIsqxrXA3itlJEAXnWpABJQlE1oDJa3XFMSNE
 byxuxzZdFGRZpMryYN3ACXuC6VkSakkkR4hs4zA2LOVFOFr5gh9Iygytn/QdMUJc4yp9+FV9RQe
 g2Ml57IBq1sOmz+Cp9ICBqjik8Oxt5GMOBOhlkJvMxrnp6mzKjNsW9XN54ss8tFgHNDA1SYBql4
 IWr5I2HTCpCtsnQ7QM8w7Qt7SlMp7u1+nKdPSzXny7jNorLq4BbUv+ZaQhCPYizkcdNm/d804a+
 FmyhpL3+XoxuJrADvc58vn4Dv+pVRbvXbLD7vxGDNBeDQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d4c1a30c01a366e5;
	Fri, 27 Nov 2026 04:11:05 +0000
X-Mizu-Trace-ID: d4c1a30c01a366e5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 12:10:58 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <seakeel@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #05)
Message-ID: <awkC0plVerzZe-hi@wyuan.org>
References: <awRWXw8KsV_TJs9A@wyuan.org>
 <5bcd13dd-5164-4a0b-bec0-c8fdd795cf11@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bcd13dd-5164-4a0b-bec0-c8fdd795cf11@gmail.com>

On Fri, Nov 27, 2026 at 11:13:12AM +0800, Alex Shi wrote:

> > * Weijie Yuan 2026-10-21
> >    [PATCH v3 0/2] docs/zh_CN: cleanup headers
> >    [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
> >    [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template
> > 
> >    Partly reviewed by Dongliang with an extra question to Jon.
> >    source:<cover.1792569583.git.wy@wyuan.org>
> 
> Can not find in linux-doc emailing list.

Ah, so sorry. My manual operation at that time must have gone wrong.
Now I have a script to do this, and should be much better.

They are here:

https://lore.kernel.org/linux-doc/cover.1792745468.git.wy@wyuan.org/

Thanks!

