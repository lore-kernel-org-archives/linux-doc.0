Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9F3446C5
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174871; cv=none; b=n82wfPs5FCGVSqHSkbyHzGOW5MmGlPpiDRhXvo86QoMYRdsepf6vAmnwJhw5vEUJ/Sf0EufBPgIUQtPUlv1+DYseN8ceH53MILMM+f6q8L0aXNAxpAXFF0bF7zwQssudDIPfbCeyxQ7ZvxHnHwQsYU1RrEvYEzg0FL1oP8Gq3Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174871; c=relaxed/simple;
	bh=+NwSn9E4Vt+J97kS4pYG61XeBvq1k4YjJoaM+ItuDFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQ9Bhgqb31s5WcR172CTTcXZ0W2mH2XNjbRnqv5BbnCyNauCdpIqwYoRo9X2r4iFteu0g8V+roRg5qwYVuvzhPForsEFeQaaimI1l482Jax9c326aaXRYZXhiDFL6nmPEJ6HIUcQePF8tGkJ649LZQ9j6DfENttTOjSDwyXZ5R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xzadhv/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xzadhv/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF41E1F000E9;
	Mon, 27 Jul 2026 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174864;
	bh=+NwSn9E4Vt+J97kS4pYG61XeBvq1k4YjJoaM+ItuDFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xzadhv/FH9BLM+OSq1Pzdbwv+qSWZrSPVB38opaTYqvEybF59n/SXCK8fG1PH3Aml
	 xGwgF9BaggG981UtGQxHnsH/mMlGIgCjKKAx35zHmLpjeJ3pN29zcfw0zrFH09C7Nv
	 ZpO6qMkQweGw8kyycIxGhCjyL3HFqcP4m3rQNqg7ka2OZB4g3pTWzooVXZgsb955/o
	 j0KNgr4zUuTtA3lRaidomJ93RDPkfa1IIs1jywmxaIftT2VVCvf2IgoyWB/pfVMMB0
	 /0HxjI2ErtsFStrkYQBB6DfpfFZbuDagrCODyF/b62P096CvN+l1WydVLq6p+s9iwB
	 up8cSfQOcM3GA==
Date: Mon, 27 Jul 2026 10:54:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ayananta Paul <ayanantapaul@gmail.com>
Cc: donald.hunter@gmail.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: netlink: fix spelling in
 tcp_metrics.yaml
Message-ID: <20260727105423.66851240@kernel.org>
In-Reply-To: <20260727144613.12381-1-ayanantapaul@gmail.com>
References: <20260727144613.12381-1-ayanantapaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 20:16:13 +0530 Ayananta Paul wrote:
> Correct the spelling of "reordering" which was incorrectly
> written as "reodering" on lines 113 and 115.

You have to repost and CC netdev (if you haven't already)
