Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975ED1CF280
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725444075; cv=none; b=Sun5jCrfk4JjBEmF84so4ta0b5Mbnj6QF7BY5S8bWzedGFP5qKXhYJOCXBEWrEcBHtrc3Cti/6YI/tT6Dd1a+R5O6r4rfeuxKBb9BZDuCk9SiTfaGlKC6HjsAc6utXIH9AW/h2zD0BdDP0FbaS7glF6jK1VTIFdjfr1vV38FClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725444075; c=relaxed/simple;
	bh=20FzVc1qxcL9ZFjpAHoKYsNtTB2NLdDySBEg3nccnBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubDPqlgV8c4HS7iryfKDsvtFEcsyGnrxrrb9NfmOcFysy/pl5uBgLzJbS7vVoqDaMMszxLeEBFfcoYP3EAFN5oqGbnYMZe6rMlleVeh7DyMnAGifKNqI3FTZ083aksliLhOZabI/kGGLq2cL6WAiY5m4kUm5X0iWJvoXAWE5ISc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hvXCXtoL; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hvXCXtoL"
Message-ID: <f00dbf6f-4bc0-4874-b13b-0c5892b83399@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725444070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bHgcVXUSvLOMRFFNLpPfOQYuBKnRiD/QDv3hmSqmlM=;
	b=hvXCXtoL63wj0s3C3RK7FaT61EjYyl6azl6F/ovbdAblA8N/vNwJJiVXWX5ECN9/CtPFch
	8aE7yCoZotQeykG3+WVyner0riaFOx6ONj83JrgEmh1vYCPnSWwrzxwkf0niM4RJpZ50/Z
	yE7QKrC4je2NJ0tBavlPy2ZZjACm41Y=
Date: Wed, 4 Sep 2024 18:01:03 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Docs/zh_CN: Update Yanteng's email address
To: corbet@lwn.net, seakeel@gmail.com
Cc: dzm91@hust.edu.cn, hust-os-kernel-patches@googlegroups.com,
 linux-doc@vger.kernel.org
References: <20240904015502.1502827-1-si.yanteng@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: YanTeng Si <si.yanteng@linux.dev>
In-Reply-To: <20240904015502.1502827-1-si.yanteng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/9/4 9:55, Yanteng Si 写道:
> I've permanently lost access to my loongson email
> account, and luckily I got a developer email,
> let's use it.
>
> Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Sorry, I seem to have forgotten to modify the
mailmap, I'll submit v2 later.

Thanks,
Yanteng

