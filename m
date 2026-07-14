Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88C1C84A2
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 04:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004482; cv=none; b=LX8K5WAUiDhiqr11aV4M6GsdCBURSRli5emQK280aGRcFyEgbxvB6u+k47C1FPM/xBHtl/BdtRyfkZBfvJjIhVn5/MTDVFrdmGUKX4Deubw5X2ToBO/1jnynqqwulmbL4NXqC708mbBtLvlETLChqitBTSfZQOHQhGIode1+ejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004482; c=relaxed/simple;
	bh=1DTL3lad3DsRbDrAT57k9DdQqCzT+1nQ8QxATbjq2ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EO6dkwf0APxrQXmlgpUeTBSp9d5FAXRzwIiAg+J0oAiU5pTqEdALlGwN6v4TtzD8Ujv9uGauqEUdXQRi5fgVjxIQoIWZNRmWQzfElBTja7MLeQ2Kr9MO10IPFggo9vqcfeZdXQ6dp8j7/3fKg8fpN+ZhKW3W2Ej6Ym3FveVKcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=a7+dW88j; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="a7+dW88j"
Date: Tue, 14 Jul 2026 12:47:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784004478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UqlEIwtC4H5pWHc3e8YOykFGMkRR3yx/OjqBvHx3Mhs=;
	b=a7+dW88jC7h9pr6LmVA6U9avtFizlukEcgjgPDmMzoKvPEaZK+a9dVN6VI2hDo9fSPS6Rx
	+XYZptr+6wos578P6VfzX4EEWmE+NYl1KV4i+8yzC5BmVaKBPJ1BwW3Edsesvqf+DjDkA2
	7jrvyvwpmJYdaDYxxhjAQ7RM9DQxdCI5zp68iN89QwmXDKOP9K7cj2J+Wte2KIq75xb/U8
	7xfe7cBjRqfHeVVVTORP+HLEUaRGZCsKz4M7C+l45KEc9SV1BYEtg8rxLJNZmSQs8N9ace
	aN7twf+5cuc/n43QhLeQnAqK3aOxiWU/A60596wBFE5T7NPakJ1/PtPJHsOF4Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jiandong Qiu <qiujiandong1998@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
	Yan Zhu <zhuyan2015@qq.com>, Doehyun Baek <doehyunbaek@gmail.com>,
	chengyaqiang <chengyaqiang@chengyaqiang.com>
Subject: Re: What's cooking in zh_CN (Jul 2026)
Message-ID: <alW_di9bNNK9-zqM@wyuan.org>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAAJ18eFxjotuhggQ=wkSuXfyz5yVHE0LiP26STdcJwfdwAfF5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAJ18eFxjotuhggQ=wkSuXfyz5yVHE0LiP26STdcJwfdwAfF5w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 14, 2026 at 10:30:24AM +0800, Jiandong Qiu wrote:
> Just a thought: zh_CN/how-to.rst currently focuses mainly on submitting
> patches. If we want to encourage newcomers to review too, maybe we could
> add some guidance there on how to review, what to check and how to give
> feedback? Curious what others think.

Yeah, Although the current situation indicates that the pressure of
review is not very high at present, gradually distributing the review
work to the community would definitely not be a bad thing. Finally, it
would be best to have Alex, Dongliang and Yanteng handle the last pass.

I see that most of the patches are currently reviewed by Dongliang. This
is definitely fine, but having more pairs of eyes would be even better,
just as Linus Torvalds said.

For how-to.rst, maybe we can add a section?

btw, Git has a doc especially for review:

  https://git-scm.com/docs/ReviewingGuidelines

we can have a look, then let's see what we can do.
