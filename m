Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD73D955E
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896071; cv=none; b=kJp+XTjEwZDvAn1Mso1KAOPiOm83Ymtcpo1mAOLNeHOORllnQdF+LEu8JAkbvZN0sQezlyiVDswya465M8FFt6DFJKw5M7wVnOUG4rqPbIHG/RiFTvYaRwXq0/kmh1Cm0Rm4j3PH5boDUj+8TlMyUybig2yzs06twcqQrNQVCY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896071; c=relaxed/simple;
	bh=RyjPINFFycKJyTxNib/YCVKGYLh2rvNw1PebGF55o6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNVPga9v11YaAF0avO6EXOvuFsr7o3S1Wu2NwkBIdkhdKXin5wTMTUkIG1DPD2wccCcVQ215nKgpIORUr7/3Dzbx5W6DePhYSO+wQWgclNX2BTj9c727YZYuUX3y8fJG5nLotS5xZSaFT3lbBmf8ySLzWXv7osG8A5VwtW8cZ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=UI/z1Fgl; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="UI/z1Fgl"
Date: Fri, 24 Jul 2026 20:27:38 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784896064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lIchsjQq5G7rqz7or0L6hBbFrzvzoQQrC43AKcC560=;
	b=UI/z1FglEaxQsQpuvJclwtT4sniGqWflE+ARnmIqpw31TfS1pyA/Abzr8dXWZWVTpdMXNF
	BT1gFNWyBZIaJG1BKIgYLBp694FZKbNI6WYwWRyD2XMxNm3lY62KgPIFv3XRGGXEjJhrol
	XWhUorx66I3taG3Crry1ckDcQ3yPpxHmUwIiOuXX1K2Hp5eN+wP7i6p7km7Y9/o8w1GoKj
	V8ARkR+u6H51GHZKbgMqtWxlIT2PECUJ0g+UFItb7Z37wzg3D3r+L5upEflXbaJzAcc+0J
	1ihoE4BkX4EPv7dPBeNp3HBCIpB7sIOo41ifL93RAN+wyBVgpWVnGimNEWuiXA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/16] docs/zh_TW: process: localize terminology in
 index.rst
Message-ID: <amNaOvJKwrQb3HN3@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-16-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-16-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:41AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 社區→社群,
> 文檔→文件, ...) and sync with the reworked English process index:
> mirror the new section layout (introduction, tools and technical
> guides, policy guides, dealing with bugs, maintainer information,
> other material), keep only existing zh_TW translations in the
> toctrees, and track the still-untranslated documents in TODO lists
> following the zh_CN convention.
> 
> update to commit a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")

Wrap, then:

Acked-by: Weijie Yuan <wy@wyuan.org>

(Can I ack? ;-)

> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/process/index.rst      | 99 ++++++++++++++++---
>  1 file changed, 83 insertions(+), 16 deletions(-)
