Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914703B47F6;
	Wed,  5 Aug 2026 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943967; cv=none; b=uyanGOweSXFDZ+c+o13qJMwHrLis7qST+gRd3VogLtogQIz2aTOTaMyoPAk+BLY0dWutVWnn5OnyKbdQ1gLmKmXHQEsUfMdqPGqiLvOU3jxM84tT0BZDsIdEqHhMVLQmUZUvm/vhNq9SKSqHyzfuiNTRjnSqPdYBP0U6VT9ZHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943967; c=relaxed/simple;
	bh=egSkI3/8O2d+T4Z+DjHOWQSxrGXZVFpX8Bhs+dpAVPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih3IWqA1R6BX0f7Ssqr2KBau0QbB+C9GbAIfHLQZym46sWr+ArnCq9QGzg9b3+vM5ZhTmo7qB0veybm5u6MKnXfQy5AEetLGEPNVVaKDTxa6pGz9K9JbX2RhLwJiO2de0KN96nnJbgXViaMAJoE3Vxi01veSFov9E8uFCurzeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=CmEpqvCR; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="CmEpqvCR"
Date: Wed, 5 Aug 2026 23:31:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785943957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xm5hsHN+ogJlNQXRNc6/yrSo2Oyud8t5eb4EX2piMtM=;
	b=CmEpqvCRqBrhXHFfgC+lHs3WUWOuo3gVuQYYKl31w5Nc0+5Rx8CZT+K+VNcyk3iBfm6HoO
	TMzB1HFYY1VyyPma0TiBvAG49AN7+IUCkxwIyyLX3PNg2RslmJz+34dGc7tGfK2f0CwXBj
	qJ9eKibmHOidnclF05MSTwtAZVs+M3Nk1S44yTrUlu4VhwzLLE6qzu0RWltp94lx8r3fzt
	erpgoOgfoQkBOzo2tVIV92O72OfweZaLs79OaHjCSeVwf+UYOcGHCkT5xqTPi+xIBswvvg
	Ia7FkoKJG0tUCHtQqPmJYy5NlyVWOCyJK6CNilDSx+u7GXsX01hMT9pE2mPHOQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: update Traditional Chinese documentation
 maintainers
Message-ID: <anNXXwe_f-3iDdE4@wyuan.org>
References: <20260804201012.110713-1-chenyou910331@gmail.com>
 <anLkaTxwuklKyNq9@wyuan.org>
 <87ecgcr8w5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecgcr8w5.fsf@trenco.lwn.net>
X-Migadu-Flow: FLOW_OUT

On Wed, Aug 05, 2026 at 07:31:38AM -0600, Jonathan Corbet wrote:
> Weijie Yuan <wy@wyuan.org> writes:
> 
> > On Wed, Aug 05, 2026 at 04:10:12AM +0800, Chen-Yu Yeh wrote:
> >> [1] https://lore.kernel.org/linux-doc/<20260603082531.263115-1-chenyou910331@gmail.com>/
> >> [2] https://lore.kernel.org/linux-doc/<amcZ5SI3-Hzw4HkJ@wyuan.org>/
> >
> > Sorry I forgot to mention this in v1, somehow I'm not sure whether we
> > have a strict trailer rule towards this one or not:
> >
> > Do we need to change the "[1] [2]" into two "Link:" ?
> 
> It's fine, no need to make changes.

OK, thanks!
