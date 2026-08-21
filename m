Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B3474258
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321877; cv=none; b=f2zOC3YfSee12in6xVYinLp6RM/73ySZUAyv0Mggex48a9iKxBGz/nknMUXMTo1UweslfnvtuGnuF48d2QUePTOtIuw/Tn9kqdBqzf4C2qDpeHHgYIHrSrll+/Q5XPtJYqPTDQDgelk2JXrbLgVB6keEuc9S1GIKl3HAMkec6Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321877; c=relaxed/simple;
	bh=6Dc1uj76PXzahLbEXG6AvZYaX/LTli1K1ud4Mr/TZVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYI2jXMaetxcAuwXmn1BBVgOzt6l2x4Typk1BSx8rZLXMtnMUwnGheY2voiDrK+ao6RitUY35WTmuNUhz9JLkfHV1Fafuc1s/nzBekQLiscSf5KeE5A13SIc2x8oZun1fNuPqUnOx/b3qpvtmJx+N9uKGj/nbenkn8TdAOhraMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=QPp3Ty3K; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="QPp3Ty3K"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Dc1uj76PXzahLbEXG6AvZYaX/LTli1K1ud4Mr/TZVU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787321872; v=1; x=1787926672;
 b=QPp3Ty3K5uMpdepaFB5Lpo7RbfMTKYCYdKLZy0SFZAPeTBknzNG4TpF880M+eX8w73filSOh
 3C1o3B8DHNgYadBLzsOs7MLLhxRWcKEeDZu3xf3BjFk4r3MHYWiUCqa9fN7RvduLEyddypjnDpy
 Oe2DYO7yvV5lJ08QKLXNg7HcMJ5l43KKFFDBp7bqvIcJYsrlPCGY5p0foPxipEaGHiMF8OUj52h
 fzwYP9IwBaVztfNYx82mXmcI8565AcYUH8PkyN76BLoj8wKSZoKiE8530HIcFHBPk3xCfFR2vVE
 DoQLft8B3YIzZSW7SozWCtmNpBKisKfkWKu2idngsj4yA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id dc02663f8510eeb6;
	Fri, 21 Aug 2026 14:17:42 +0000
X-Mizu-Trace-ID: dc02663f8510eeb6
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 22:17:34 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: What's cooking in Chinese docs (Aug 2026, #01)
Message-ID: <aohd_tB47nF0kKgf@wyuan.org>
References: <aoLkMBQszbzqYowy@wyuan.org>
 <ae0b74c4-e6c2-4240-96b4-66c3415e8f79@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae0b74c4-e6c2-4240-96b4-66c3415e8f79@hust.edu.cn>

On Fri, Aug 21, 2026 at 10:11:25PM +0800, Dongliang Mu wrote:
> > [Stalled]
> > 
> > * Haoyang Liu (2026-03-05) 1 commit
> >    [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview
> > 
> >    No response for too long, will discard.
> > 
> >    comment: https://lore.kernel.org/linux-doc/29bd0dbc-c6f9-43ce-b95f-4e787e3fe9c3@gmail.com/
> >    source: https://lore.kernel.org/linux-doc/20260305192048.16405-1-tttturtleruss@gmail.com/
> 
> https://lore.kernel.org/linux-doc/062e7436-20dc-467f-9a4d-787eeec19228@hust.edu.cn/
> 
> Your cooking bot seems have a bug. This patch is already applied.

Ah, that's because in his v1, he used "Haoyang Liu", and later he
changed to "LIU Haoyang". So my rough script and manual search didn't
catch this. Sorry!
