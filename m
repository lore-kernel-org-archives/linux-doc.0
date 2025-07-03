Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E73E24B26
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506976; cv=none; b=BD6BcyjuY3zw5+lS63SyyqEJ5NQ+1K4VPQkGbZkP+Fi3fEugj/dT3x+5Y8+dkLfz9RctjOl2c39EJpY7Nl+fOZKqtNwZgdd97jwKZX0zNJrkQ/XtrrpAtG1v4ZWCaa5jt0+K+cuMC7wEWymKLYBo9sN2gpYTPqzLf30ca0zuWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506976; c=relaxed/simple;
	bh=WdX87jL89BXqC/BfHJAZb2cTkRID9A305W2MUF0WbnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNTXD2trdd5x6Q+UxFM6EY0IVWCphpW9ENZPyzaQU7galaGs70E3rU7iQHunO5lG4V+hHLrKcWWuNKPqKtDA/AYWVzsMinCI59LMsIMRGXA7VwVx2oJG2RcWswq3ZxQVUeUpothb0dnM8/BI5REUQ1gPEweu9mdcVfdVRHSpG/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NyuFNzp6; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NyuFNzp6"
Message-ID: <832e6925-8258-40d3-8fc9-17713f40009b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751506971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdX87jL89BXqC/BfHJAZb2cTkRID9A305W2MUF0WbnI=;
	b=NyuFNzp6tcLbJGQLXSyhnsbCUfTruT/ZNgAMY7ecqwWEsumyyIWUgSFOIyiE756fNK4NVs
	wDleO2p44xqLDYQiDF7eI52ZX+8AmqemH9MOZUpw+7yd+2GmzOB43neoVgxH16e4wvF+LI
	wSsa7OuQh47xG2oQ3SjUMpegHt76VX4=
Date: Thu, 3 Jul 2025 09:42:44 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: add translation of scsi subsystem
To: =?UTF-8?B?6YOd5qCL5qCL?= <doubled@leap-io.com>
Cc: alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
 linux-doc@vger.kernel.org
References: <20250630022934.1600937-1-doubled@leap-io.com>
 <70da9d7d-9040-41fb-8af3-33723b650d83@linux.dev>
 <220d7401030e8c57cb19a90642e0e0ae27071c38.9f9c8c60.2744.44cc.bd7a.c6eb47a4a3f8@feishu.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <220d7401030e8c57cb19a90642e0e0ae27071c38.9f9c8c60.2744.44cc.bd7a.c6eb47a4a3f8@feishu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 7/2/25 5:10 PM, 郝栋栋 写道:
> Hi Yanteng,
> Thank you again for your kind suggestion.
>
> Sorry for the mistake. I will split the original patch into a patch set with one patch per file and resend it soon, to make the review easier. Since this is my first time submitting patches to the Linux kernel, I’m still learning the process and might not fully understand all the best practices. I really appreciate your guidance.
>
> Do I need to do anything to withdraw the previous single patch?
> Or can I just submit the new patch set directly as a replacement?
> Should I mention in the cover letter that it supersedes the earlier version?

Maybe this document can help you.

https://docs.kernel.org/translations/zh_CN/how-to.html


Thanks,

Yanteng

