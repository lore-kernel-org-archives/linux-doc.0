Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00519ABCE
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244739; cv=none; b=UGXUEs6khOfiE2pJjKSqUYROB8XAfHWPSmpm9eQGfQ3x/lCk+jO+LJZDKj2u1nueD5w6LK9ZczWiRC5BkLJJx2G68E1lfsfegI4vG+n9sJi4XDPob0BjpMP7NPrY1x+sNrf+6Drk+ccUdILjMtC9O30/K8W3d0GR9bgOLTcLm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244739; c=relaxed/simple;
	bh=ttsPJhPOqySGX2RCAhvyQ0FiTpHuJV7dXnoWrd8WeWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdDJUY7fcarxo0avvA9zbunH0g2kvxyc0UBJ+nFNTgcONWkDoJaGMnUWN57XiaFis8YDDlDwAtvk/VpEABHOynOAQGKLdRA0Gkwnrq3zyUVrwNHtiRNsMFmXpGx0+ytIzuDpPwrYu0RITemmrOzmMAEXNegvpSuu+9CEf6XWbNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VBNH/8AP; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VBNH/8AP"
Message-ID: <22c7b835-b07b-4e25-86c4-ea24ebf851f3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736244733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttsPJhPOqySGX2RCAhvyQ0FiTpHuJV7dXnoWrd8WeWg=;
	b=VBNH/8AP/h7OLXtoEKlTTUhKUpxxcoeEowbmVL0sCR6O2OUiYpAU+SnwhCprUKTCS+N1ve
	QIT3HX1VeYZtM46kROvGVMl0dOmKJe3wDE/34+O5l/RB5lJKX3Oo7WVrFaY7UZCU69t7WJ
	Xoi2rQAy3piQ511V7NtXdNSCD2wrFPs=
Date: Tue, 7 Jan 2025 18:11:09 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] docs/zh_CN: Add security credentials Chinese
 translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net,
 zhangwei@cqsoftware.com.cn, maoyuxian@cqsoftware.com.cn
Cc: zhaoyuehui@cqsoftware.com.cn, linux-doc@vger.kernel.org,
 Yanteng Si <siyanteng@linux.dev>
References: <20250107092318.21371-1-zhaoshuo@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250107092318.21371-1-zhaoshuo@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Zhaoshuo, Zhangwei, Yuxian,


在 2025/1/7 17:23, Shuo Zhao 写道:
> Translate .../security/credentials.rst into Chinese.
>
> Update the translation through commit cf92ec602ac5
> ("Documentation: remove current_security() reference")
>
> Reviewed-by: Yanteng Si <siyanteng@linux.dev>
Sorry, I wrote the wrong email address. There are also  other emails
with the same wrong address. Could you please help correct them?
My email:

si.yanteng@linux.dev

Thanks,
Yanteng

> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> ---
>

