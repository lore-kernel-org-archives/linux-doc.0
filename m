Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A013DEAC8
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785912255; cv=none; b=DtWszTUsHdGOwlCPy9nM/8ol/r6dAshgCJA6AJtVL0LD2HKQ1MEWeMZpWBMpDRwkVAgsdWk4uJCH9SVW4Zbgm+gzNoQfO1vmUorPBeqo0PLIIW8qkblCZluEYav8x4Gbz4Fy2aae1If6do1Sr1RN+EghadykZN8+SKZ08L89OQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785912255; c=relaxed/simple;
	bh=O46pAf5nvsfqQBz3ymqwqJegvxG8j1yAmAuzy9+/o0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMuYnyW75z2azNWT5A9QfY5vJEm5BJ1Ef7lneXyRgCLXFvQ9SXT3Ya7tWEOlKeF6lPz7cjOWeMwPeRHAw3DQ8uQI2CLaA1JFSpDsHiqK3vttgaacLp704QWfbdy/zeLZPNWrzVSbElyVdtWAOR+pgWYjbIp6dY1K8DWLW6xHiN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Eb1fByJd; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Eb1fByJd"
Date: Wed, 5 Aug 2026 14:43:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785912238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjJrcymlFmXr8TjQXBGSti3fWQb+oiGugU3ZryKFfto=;
	b=Eb1fByJdylvZ5RP9DCjREmdlRYCu2TCPMCU4+YQ8VpDfZIuNXovlSC5NqMYZhe7dGS4Rz/
	l8xR0JrVa8ChTnehEHFzICOS4C2bwZ8PCU8tQgpmEde7x7RDhED7w3BF6MHTtVuj8FfIYa
	WnWhMyCDxy3/N+aouAErvI2Hd59nrgm9OCWHITK6FUOhLQfSUlq230qXjaasrqBcQPDyyK
	yNFHE/g5V/OpMx73Emm9E+/L5Hp2klprB/YdeK644M5q5cQFUvzMXqNnZjonlMcfU4ZEH7
	w6O5EFUgP+4fOk1TTpJeJS4O8Z9mBONjjAocy1bLy/zX1Igg6giPujx1m/Dbdg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/16] docs/zh_TW: process: localize terminology in
 howto.rst
Message-ID: <anLbjl7bGN1GBRkE@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-12-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-12-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:33PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 軟件→軟體,
> 社區→社群, ...) and sync with the English original: update the
> man-pages maintainer address, the linux-next git URL (also dropping a
> stray full-width question mark), and the mailing list links now
> pointing at subspace.kernel.org and lore.kernel.org.
> 
> update to commit 413e775efaec ("Documentation: fix links to mailing list
> services")

All of my comments in v1 get fixed in this patch of v2.

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/process/howto.rst      | 344 +++++++++---------
>  1 file changed, 173 insertions(+), 171 deletions(-)
