Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD63D952A;
	Tue,  7 Jul 2026 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463314; cv=none; b=ninqd72a/00aOpBDZLWMfBUMvQQPdZtREBtTgokXUh6XQQg7wwHVuwchNJJPUqJSB0XdmuAhxkwEyWnIvrd1qOSvNL58rDksQefFph7G2Hbjaqf5Q+nhG+vVKuxCqc9Cib2SWL0BW7Mu17a12Ok8vzXuYbL1n3pSQ5En6v6+Ycw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463314; c=relaxed/simple;
	bh=HVkM4+sYTTUEixg6lUlR80nOrvrs0NmBv/cpnHTEzYg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=cWboZfrfnH9YFgJMQ2sjv3E53maTPhDT95HIq68TO/gNPtLJD12cchE7MI1VT5OsjgxrCi6cVM7gBa7yfJbZs3CaM/2xS8ZtKXFUKSOLbc3oqTECPtqOSCANu23YH2ab5ZXM2eNfeDsfW9lH4ims3K4+SkxG1bzO21Ya4Z+afWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbSHJjuO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbSHJjuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302CD1F000E9;
	Tue,  7 Jul 2026 22:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783463312;
	bh=HVkM4+sYTTUEixg6lUlR80nOrvrs0NmBv/cpnHTEzYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GbSHJjuOLOhFlaX/xK9LmzOFdDwZk8v7dYTE7E8J6Fo4rEVst3kq1AQzLQLq2R/Nz
	 EiBUiIa4YrUWx5mAykkZ6rTaIYfIURANrqEzp7XQLTrzltf5KiZQYVlLGy76wyxhgK
	 BQjrRvpvO33oaAXMK7dZZWN1EJmNuNCjgMvzcPw8jyVPoTqXpty4SxotSyK5p98GHf
	 IqdJSU1NLru0Phg6m2ZznNvj9JbFJdkZQnqdpGMsfoaKPzElKfGftWCliKuL7aQC8G
	 caKPjJqKvz+Sh/ASXGH17eMrK2f0Xtq2PBEtjxQl2aP0CRErhS9+ZvMCTpoXemQFLY
	 biHafNuMtvQYw==
Date: Tue, 07 Jul 2026 12:28:31 -1000
Message-ID: <7eebc05a44cd64399bc2d16691222ae2@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Liang Luo <luoliang@kylinos.cn>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrea Righi <arighi@nvidia.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: Fix ops table header reference
In-Reply-To: <20260707094538.3033292-1-luoliang@kylinos.cn>
References: <20260707094538.3033292-1-luoliang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Applied to sched_ext/for-7.2-fixes.

Thanks.
