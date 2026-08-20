Received: from mta0.migadu.com (out-71.mta0.migadu.com [91.218.175.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C7387345
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 04:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201048; cv=none; b=aekrKyrqtoBURVJlKlb99Uw8rxGzxaJQqOV37AvFcOW2BARlZ7K1h/0isz+yXnBFJIF4IoQtBC2Qc1OiyBIXxLCP9JLsz5XYl26/76/YB9Vt9Gf26i4mdEntOik9dQcfsaoONQqrNJ1kvZizqPbSBid1UESSQF59OixzzDThqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201048; c=relaxed/simple;
	bh=4hQqCC5P2x82rrO8Ud91ac4zwsZPqoxzCq8LChveOQo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Hd+0FTD4L2PVQ2/a+a62AqztiIUjkNyZBHBGpV7+5Vz+3uLdibAjFCjedKA4GbZS7cEtpVHyGbfVetpEVovB0/QPvhIZsk7SOTfw1j0YnVOhhGGQQVo9Z7tSzuPMvwaZpVZliCGqgQhCB6otp6+2Bt6P+nHgNKXnVGtOS0b/9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=BytLBtFR; arc=none smtp.client-ip=91.218.175.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="BytLBtFR"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4hQqCC5P2x82rrO8Ud91ac4zwsZPqoxzCq8LChveOQo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787201044; v=1; x=1787805844;
 b=BytLBtFRbgeGOkMMTM7nC1SZxvqRL4F29M1quRt98GB+u/Nq92Z+o1IUWUITo4PGzrdXAx+p
 X3RSGS3MaHC08Yl+eIAZfjVCuwPMA4HTSA6mOXD4k4gvbZ/boAgprrMRkvJfNQybOWeU8Ju8XKN
 Vxiu6qqyT5I8eADKHBqSH0/ekTvmEJpIPJkc5wIxidPj8zP0LzWikGYdHdPaV0boFWSAlVlUczG
 75RFSBeOm0X7XEwhG9G2csIwM6RI/CkHdk+f3zOozrt8jtBkINC5XMbXSMnn9FKp+EWOeKdWwOa
 Me9I8AN2SSR/kmlPSOxE25lWn1ub+hcWr3St33v8pJYxQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 885c47e57a3a9fcc;
	Thu, 20 Aug 2026 04:44:04 +0000
X-Mizu-Trace-ID: 885c47e57a3a9fcc
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/7] docs/zh_TW: arch: remove maintainer contact
 information
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819145808.291567-4-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-4-chenyou910331@gmail.com>
Date: Thu, 20 Aug 2026 12:43:39 +0800
Message-Id: <178720101976.15514.17524044147551392316.b4-review@b4>
X-Mailer: b4 0.17-dev

So like what I said in other patches, many of the translations in this
subdirectory are outdated and lack sufficient coverage. So I remain
neutral on this change.

And also, just as you said, hope there are no omissions. ;-)

Thanks.

-- 
Weijie Yuan

