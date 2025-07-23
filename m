Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9181428C029
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265708; cv=none; b=cCLc8nd/1cECf5kGGNpWL23sTs3cnBTcVjxgqBQQLU1WOVka89lAdJpl233WZHr5AMEQCCyhvyog+daVAFlrsIlmzct+9sZRseDBLcl3uPBkS/saQRf1PqJfXQeeHam/c1UIzdFen9MrsQifzUCS6eAES9oxoX9yFNFg6s589LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265708; c=relaxed/simple;
	bh=UFnIexbweYhJ8DGlFunc6oqpk1216FJxBqz2JcjBUzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFnqIK6ad8g4iVi6O3SQfn8QhL5Dv7omFgAS0LvKI0W800y4ShqgA23OCXG91VbXeB+X0qY6XkelcqLCyKImFdh+oC2nKTZIplfleOoURyhndAo++O+R3FyFFVKM4fyWCrrRJ3giuWR7rYZXUdCaOZvcQQkcgemnxqxfmiaR2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qghlqniQ; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qghlqniQ"
Message-ID: <3b9652f9-c8c7-460d-92e7-5e80d85b7b05@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753265702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cj1z+TeHew0z343fwgs64nhtky1IKSQrxi4AC6k9dLY=;
	b=qghlqniQnqu6vhdx+WhGyBrS7aJeDd/TW9nNWobgcm197rmntb5Di99IZJR+asnEpt3sVO
	ainJ/hDzJ7jJZHuT3YYDje9UYrTpGLY6f5ERJgDyYt3zlZvuQbXrTA712/TxsMHI+qhjhU
	BUfDVnq1ORPC8KfYUpjGyB3NQCYbE0o=
Date: Wed, 23 Jul 2025 18:14:50 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] Docs/zh_CN: Translate gfs2-glocks.rst to Simplified
 Chinese
To: xu.xin16@zte.com.cn, shao.mingyin@zte.com.cn
Cc: alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yang.yang29@zte.com.cn, yang.tao172@zte.com.cn
References: <20250721193322167TaEFleLW3vBmZqrNUDEoy@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250721193322167TaEFleLW3vBmZqrNUDEoy@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 7/21/25 7:33 PM, xu.xin16@zte.com.cn 写道:
>> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>>
>> translate the "gfs2-glocks.rst" into Simplified Chinese.
>>
>> Update to commit 713f8834389f("gfs2: Get rid of emote_ok
>> checks")
>> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
>> Signed-off-by: yang tao <yang.tao172@zte.com.cn>

> Your 5 patches of one set are not in the same thread. Please resend them like:
> patch 0/5
>      patch 1/5
>      patch 2/5
>      ...

See https://docs.kernel.org/translations/zh_CN/how-to.html


Thanks,

Yanteng

