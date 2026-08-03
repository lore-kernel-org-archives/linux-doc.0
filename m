Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F236369236
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773406; cv=none; b=PEv9+X51kLGjufGR+28yQxAsCwdsNDc12MQNz00KTg/VbUaQapVseM++5MZeGOhI8PssFwDTavWjiJF/pcu21fzkOKAQ7l4uqEX2NPSi7QFYg0HB1MD5heNWn9gTDutTYnEvyvkJ+sF/T+1LR/+WWAKDjBmkCDxxJrQXhvN8A/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773406; c=relaxed/simple;
	bh=yHZEHs9eSe+uxBacZJG8fGg8Yso8VKsxurssYB1MVMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWtfoAdp7It3cig5NSOEQs7KWCwCUUhOFMv+cuG62WwmHqLtMNID/DZbQUQKupg0eU5Gxe3t7OpZaZNxyg4vjT63v4kdKbYuMBVycXKH0hZvwmJWevdtMnFdUlqDk675my8AsFRp9+lHmcuYcImAaDFN+cm6emhJsNdFAgHqfrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=SN2BpvEc; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="SN2BpvEc"
Date: Tue, 4 Aug 2026 00:09:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785773399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScPr9jxqBfM8Jd436+TgwwTjhiIIk9axND33YiMK5HM=;
	b=SN2BpvEcHbpoHWaVMCQ3Q5hq/vb0CU1wXg6rlMdWxmVlDHkxxP1LgI1lqM+ACjL/aDjGkJ
	1uRLlxT7B5LXmO0iW83cEPpztf3h62nLu00YxvSYBoFAguIyakssavz/l/3OSvhdfnXnFD
	R/fiTFe9Q3iVM+iErhAJDLfcLpNh4epi3AY5vB3Y+UH7EUvq3d0vdRM53dkYA9F8gbkwQx
	Ev71yM1WunDsALoiWUkzoxp+aNY5KDsV3QHNKoFU9o8mJhyFuXump9NW8QNV9IAQMn2oZq
	DJG3A1IYqllO++1Dc4asgsZqg6C6Izyn2JtZYUijOwIYdjgz3+1B/RzpDv7WcQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/16] docs/zh_TW: process: localize terminology in
 email-clients.rst
Message-ID: <anC9TtvEltKql5GX@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-6-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-6-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:27PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (文本→文字, 菜單→選單,
> 設置→設定, 鼠標→滑鼠, ...) and sync with the English original: mention
> the Thunderbird "Toggle Line Wrap" extension as an alternative to
> editing mailnews.wraplength.
> 
> update to commit 4971ca2007e3 ("docs: process: email-client: add
> Thunderbird "Toggle Line Wrap" extension")
> 

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../zh_TW/process/email-clients.rst           | 185 +++++++++---------
>  1 file changed, 97 insertions(+), 88 deletions(-)
