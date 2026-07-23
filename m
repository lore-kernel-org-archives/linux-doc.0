Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00903DAABC
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790177; cv=none; b=lcVjEXIt7Uqezbm1dw2fBZ+KgtIEhZVx01dCjLtDcqB+Lk3SabBP9xWhpGaQh/r2Qq+3p144NIrXQS6/GT7BSsccnhjfrpJnzHbf4kHvtR2VbkKRcuAMlzKUik6h1FTlXNfx3D5t16KpdJ5a/7gCX/dfettoijOJpfIKs90iKPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790177; c=relaxed/simple;
	bh=v+3EKbhvdIJGRfdTLgrzKkrNot4uCyowTtz8jVpwaoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5w081guParEWw5WWTm7+nwlhbx5X/FOGoigXku3LC1uuA5Pti95lYaS8NkZO8MpYU2I7tSqRd5RQcHAw6q5thPV9fNXHN/Zet7iFmDYs5of3f3Cd60DZTjE33szFqqxjjMJzcM9RZAv943bX8rVMEJi1plRAerjFauYZIMpB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=KXZI3Thc; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="KXZI3Thc"
Date: Thu, 23 Jul 2026 15:02:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784790172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySzJOrqktulriRIC8j8W+IoJlTiMxy/AJcyNvrlQaIE=;
	b=KXZI3ThcJSxorcM2B9NtLEWfDlwyQQWlgYhw5xDDl0IQZpvaWCAAawyhbcT0QxtLR3w4Lo
	IdEl4mEsX4cdaCkoS1wpVl9PICA7kEFpeU/DAhuy4hMe4qk8NQQxcO0oGXM4pJ8Dt1/qHM
	3s7yHJDanGfDZzvfrfLg7kMAYRpltc4ZTTKJjub0DMQdipFXNORynr2XzLpoj+6RlVfb2Z
	UR4RuiEdgXDyKqG3MzspTfdaEq2j+Gw62V+Y9a8/eaSEmbHF/4SoTUc+n2GWpLPGhxtwMN
	ejqLUIlsvDrqw4SxrSKZ/EkMRWJIDf2Pvol5aBYlGLvDMjKRfk12NWuKX1x5Ig==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/16] docs/zh_TW: process: localize terminology in
 5.Posting.rst
Message-ID: <amG8fvBhiB4qb7bV@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-10-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-10-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:35AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 代碼→程式碼,
> 通過→透過, ...) and sync with the English original: add the testing/
> KUnit advice, the Fixes:/Link:/Closes: tag paragraphs, the Suggested-by:
> tag, and the updated rules about tagging other people.
> Also point cross-references at the zh_TW translations instead of
> zh_CN.
> 
> update to commit 0a83293322fd ("doc: development-process: add notice on testing")

Leave a line break mark here ;-)

> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../translations/zh_TW/process/5.Posting.rst  | 226 ++++++++++--------
>  1 file changed, 131 insertions(+), 95 deletions(-)
> 


>  
> -必須針對內核的特定版本準備補丁。一般來說，補丁應該基於Linus的Git樹中的當前
> -主線。當以主線爲基礎時，請從一個衆所周知的發佈點開始——如穩定版本或 -rc
> -版本發佈點——而不是在一個任意的主線分支點。
> +必須針對核心的特定版本準備補丁。一般來說，補丁應該基於Linus的Git樹中的當前
> +主線。當以主線為基礎時，請從一個衆所周知的發布點開始——如穩定版本或 -rc
> +版本發布點——而不是在一個任意的主線分支點。

Non-blocking:

In process/stable-kernel.rules.rst, you keep "-stable" as-is, so here,
shall we change to "-stable"/"stable" instead of "稳定版"?

I don't know what's the preferred one in Taiwan, though.

But if preferring "stable", an incremental patch is better.

