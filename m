Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B86194C6A
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728578151; cv=none; b=DFOAI312VdYO4EIYFCKFJmR4zncHB2P5dlBXkVt14YxyMsXkzyP8vvdBIHR1a5ZAW/BJgTlvkz+nQ222rJZ7NySTwFN9BXUW8o39zftgQ/YO+rlmGm1a0bfZpDWhYO/J70owMXwhnQOr6rbCfUcJOuB5jVDS8EY1KNAzgQZRBK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728578151; c=relaxed/simple;
	bh=K/rrtjjNtaOqa0vDLGxMlVQQYiQd64BJVvfcAydB9/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClPAATAUiTnppTxQn6FZ6sKMz2R+1bDCw+jm1XuNaVI4gJvpezRWnz3rwVmrK1GiK235r+JawdoqR4EG+TDOyVPCpGOVNjf9rfBplUIdUvwLmbfZ8H+cOV1xj1bLMVsUv15O2g2MaVM5qbbg8mOD+EUOrznxFV3mA1MA3UYx4OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cFQcmmXI; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cFQcmmXI"
Message-ID: <72fc3cca-9d31-4733-a683-62b332a296bd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728578146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIkjqZKN61dewomW51a/Tay4bybD57pDagj6pATYUGA=;
	b=cFQcmmXIAVlZ8b+J49e2VIi9ct/nVJ9POlqSw4Z3i7bDKnakdTUmR8MqTAgn2Ll4RzvmSg
	JCQ7Vq/DlSTYEFlgTNQpOLwmF1iK+VW97Z47qEoHf1E3v695BdjMKOyaPWXINI/wCz+Qz5
	152lOkkxg76UpwGSwlmjcJN/53b/Mms=
Date: Fri, 11 Oct 2024 00:35:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] Docs/mm: Fix a mistake for pfn in page_tables.rst
To: Pengyu Zhang <zpenya1314@gmail.com>
Cc: corbet@lwn.net, rppt@kernel.org, linus.walleij@linaro.org,
 fmdefrancesco@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yaxin_wang_uestc@163.com
References: <20241009144135.12453-1-zpenya1314@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20241009144135.12453-1-zpenya1314@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2024/10/9 22:41, Pengyu Zhang wrote:
> The documentation incorrectly calculate the pfn value as 0x3fffff,
> which should be 0x3ffff instead. It is obtained by right-shifting
> 0xffffc000 by 14 bits.
> 
> This patch corrects the value to prevent any potential confusion
> for developers referencing this document.
> 
> Signed-off-by: Pengyu Zhang <zpenya1314@gmail.com>

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
