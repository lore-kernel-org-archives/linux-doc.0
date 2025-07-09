Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2991BC41
	for <linux-doc@vger.kernel.org>; Wed,  9 Jul 2025 01:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752024850; cv=none; b=P37ZVmAL7oGqG/ybXCzQ63TbdtmpjrExMuFawZsP+CIr6SRGegv3IENHNKX++6UB1Pf3fMee6oBMd3ngeOc6EWijYN96RRCSb/P9Zxj+3HftwhctDu2p5ss/pUHKaEnp/fBQmJdGb2GAdWmHzGpwgNMXZMjiM9/6730NX8fS8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752024850; c=relaxed/simple;
	bh=7VECp15rKavK+lte8lG2IpbaWwBGoYdQyAx0iC9L4kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEVMj+q4a52DK3WOYl1yhrTs9iv4bG9EjQOtlAYE1hrAubeS5TmHI3k9bPIHvaw/N3OxbbmVkl3ltQhNRyJybg3AlPLtWCIk1GuAtfqFgi1pydEVb8kroTcsar16Rm+939VV6/+Pp8mH7WAJJvBPyd+Xp3JV9vJ8gMLzrzA7MyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SRluVQXF; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SRluVQXF"
Message-ID: <1bb11814-4def-43ae-8ea8-64bcd05aa3c4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752024846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eYiwQL9fcAaF/hYzacteX9rto8aL9ppp5ovZfuPUoiY=;
	b=SRluVQXFtzJiDzjMq+yvZGmpyYeQTSYw/rSKqZCOl01Us+OMSsEfGCB7GNoQAcrHhEUZCK
	MfhxFN/Pzetj/lbr0ajB3HY7mmenaUuLhG0VLQ3fZTuJyTOhtMZJcl67NXroJHYuM4D5wf
	YuRu0VvqJIVMgbvj+cr/gAvE5Kl+ayc=
Date: Wed, 9 Jul 2025 09:33:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] docs/zh_CN: update subsystem-apis.rst translation
To: haodongdong <doubled@leap-io.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250708024139.848025-2-doubled@leap-io.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250708024139.848025-2-doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 7/8/25 10:41 AM, haodongdong 写道:
> Remove scsi/index from TODOList
>
> Signed-off-by: haodongdong <doubled@leap-io.com>
> ---
>   Documentation/translations/zh_CN/subsystem-apis.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
> index 8b646c1010be..0f121f9b0f70 100644
> --- a/Documentation/translations/zh_CN/subsystem-apis.rst
> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
> @@ -71,12 +71,12 @@ TODOList:
>      :maxdepth: 1
>   
>      filesystems/index
> +   scsi/index
>   
>   TODOList:
>   
>   * block/index
>   * cdrom/index
> -* scsi/index
>   * target/index
>   
>   **Fixme**: 这里还需要更多的分类组织工作。

This patch should not be split in this way and should include at least one rst file.

Thanks,

Yanteng

