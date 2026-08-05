Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E53E1736;
	Wed,  5 Aug 2026 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913661; cv=none; b=ilkltUyQwthRsGFfekNg6ntqOUieuThY0YD6u14PTmQPPnnyQSyyOTXfVUDeHfbSeS1kkTVKOntHJQR5xZxCOMYKw63BgiGfmWktulxwpbM2+3M20F06gd4tDf+eJKIpT1UnrHp6niodyibxr3EfG9CHTXFpeaDs9UkQdl+B6Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913661; c=relaxed/simple;
	bh=vLE30tvVreHCvA5okuWxgLGz4Y0iUZS0H+FamnyBuFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiGU6tq/Q/IL6ZL+DUXsr8pXQED1VqtDoAr8o+rL81PIiPZr/c4syfIWxg9cT8nFVp78gtagBeUqD1DNgI/ao+5slyMoWGBtwn1bXAVrD0u4tiGB+udI04Sy2b4TBcgw/OF+96tzuzgtEh9C3jBPfKjVQOxZeyw9ZxcU+0pZJmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=EASA1Nev; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="EASA1Nev"
Date: Wed, 5 Aug 2026 15:06:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785913657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3lFAipVy0uXfi4rgmX5lkZtrX5LKKFuMjEHAMdNk+w=;
	b=EASA1Nevl41t3rA32mD9asMukYBhyQSLKaKHdN14w8R8eC+zr7xI0ZBYycuPBCbRiuLgVX
	m4PmEq0orOUcwz52NHtDmmh2MyJJ4jy4jDZUPWXT5OkdwV9qWbhsXtFoUb2xM98MYzrlFW
	xa76VUxHcqoy/uo8Nh/Q2l9DxJlQbRlXBsIiB6zNveqoD7zrt3TgZ9N/iRUtXQHvsZedyb
	0PaeQzgM+QM3UtmYRizmbLLCtUo6B2HmwEMV0hxr0a71jKYgDuniJ2njURa6qcmfv4IU5h
	mazipP0p7Y3eQsopMY6tyT8/ZNb6bZYXrmNOA8xPPNAmNs3+ud9Pygy1uXd/Lw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/16] docs/zh_TW: process: localize terminology in
 submitting-patches.rst
Message-ID: <anLhDcWtzAfuxyef@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-14-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-14-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:35PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 文件→檔案,
> 代碼→程式碼, ...) and sync with the English original: subspace.kernel.org
> list info, interleaved-reply etiquette section, reworked Acked-by
> semantics with "# Suffix", tagging-people permission rules, the
> Assisted-by: section, canonical patch format subsections with
> affiliation format and previous-version links, and the b4 tooling
> section. Cross references now point at zh_TW translations and broken
> zh_-prefixed ref targets are fixed to tw_.
> 
> update to commit 48c3876a6a6f ("docs: submitting-patches: Clarify that
> "reviewer" is a person")
> 

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Note: The legal issues regarding DCO translation will be addressed after
      this series is completed.

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../zh_TW/process/submitting-patches.rst      | 556 ++++++++++--------
>  1 file changed, 325 insertions(+), 231 deletions(-)
> 
