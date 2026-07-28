Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE031A08AF
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254768; cv=none; b=JieiQfq1adE9trfQzHl4IKwXNnDdoHI8Pv2te+FCcjg2j/CiQvFDBfhMNmC7xbEnA+dpjhhdfDk7XeAOFpe+6w75GV9P0JCs0x9GBl1g1QLCpgEAEiOb5+8yPxYU4rnVaBgJGNSJzHOYAdZCs2oK4IjaYRkDp0vPKM+sF5H7/g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254768; c=relaxed/simple;
	bh=DNsTkFlO0CdBWXJX7em7LE9NvqjUJ/svAuqyve6z7tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXExoNc6BpDjeB1AHVnxDJolGC3nvldnLplqvk2aCrTJhFKH6vNC567CrjBWJmR6817UNpbumKAdq9Q2R3foQg0PYcmB5L7XH/4oWKFL3mTQj2/80S5PL9hiQGQgC/5C4K8yTvOAOHo+hebVbH+SH2V7NDSoMHAiHgInf3nY0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=UYc6MnuA; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="UYc6MnuA"
Date: Wed, 29 Jul 2026 00:05:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785254764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNsTkFlO0CdBWXJX7em7LE9NvqjUJ/svAuqyve6z7tA=;
	b=UYc6MnuA3u8fKNOion9H/ceGX0PzoI/6OC0mSJQyawsV2jNXCTq+H427A0pSSiytTai8aA
	XBu7N87MPDHUf5yV1QUg1uQF/QlXkNDUNMSrDr+giUxPWimJvlndYHPzXaej3S8wkdm04b
	Lxv9mhrZ+buOkMB+kPSNLZrC1tKUT3l1scN430q8ftWkIdNR3n7Hbjtdq86Ae+dw3JkxEV
	/GKYFgxnQtvTNxFUtwTr6ZpKTisVezyb3HX8CzJGIr5wZEaYffxz903kHwkElcM4FR8bcO
	K87A9akur+wsSHnrpIkU7tnJVOyJsSlNfdKs4/n0n76C0VM/OO04FTt70mLyUQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] Plans for zh_TW: prioritize maintainability over coverage
Message-ID: <amjTWBRGxzt1jknK@wyuan.org>
References: <amcZ5SI3-Hzw4HkJ@wyuan.org>
 <87wlugk1ty.fsf@trenco.lwn.net>
 <amjR4_X_C1mEPtfY@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjR4_X_C1mEPtfY@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 11:59:39PM +0800, Weijie Yuan wrote:
> Thank you, Jon, for a decade of tireless dedication.

Sorry, decades, of course. ;-)
