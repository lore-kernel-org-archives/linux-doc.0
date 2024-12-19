Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFDC78F55
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603160; cv=none; b=TpgJ7qwfHTuh9I5KDYNtl7qBtWTsRSVj3okpeD2DyFxIq43fvBLpTE5DQaoah4ckSzoyo5LJIM6r6ZPk+X3BaB2/jB+kymtwvVBSXLqLdwyvLyXlErS2xNYm+ZrlvZ1/nntPRdmxXA8e6p+321hDXc3mOnXldCOgGffvo6HL2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603160; c=relaxed/simple;
	bh=0MwBKViglJdUaoIVCjo5Ns6SGdqXKKET9+GVzeoVgJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arwFXSo6ff4YdVKTjM6nXddfqiSBTPvW2IjTC1coUoxwilcZ5JZU1AEOFHky+raQeRmdo7gUnmzrQH9eZLZg0zlzIoRxBirAgsCR/+rE+5rtP3COySVRqlp5RJzqauIhyfZOX3ywvgU62RciJrcdJPsmAtFwJwdZurm6ma0FlRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZtGFb50p; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZtGFb50p"
Message-ID: <af1d4d2c-b26e-46f9-9e39-5b9b68537494@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734603146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IYOxRLYvQ9caWFjdAPeY2F/TSbvx1QHHAcimpUQjoW8=;
	b=ZtGFb50pTg/bIrdsGiFmC3fKB/vnI1doaz1G3WQGE8oS9pGIqTX6ZacJ4BnLg9/9+9GVMR
	VS70JBaCl5kg0Vy7pLeXgtJnwWbn6/reLWGJavHrauk7X98rNSAIOo6/kQIEJSFSQ0itB/
	WaoNmVKrwYOZjWnV97dIZL6nZhxoXEk=
Date: Thu, 19 Dec 2024 18:12:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Add security index Chinese translation and add
 security lsm Chinese translation
To: Yuehui Zhao <zhaoyuehui@cqsoftware.com.cn>, alexs@kernel.org,
 corbet@lwn.net
Cc: dzm91@hust.edu.cn, mic@digikod.net, gnoack@google.com,
 linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
References: <cover.1734575890.git.zhaoyuehui@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <cover.1734575890.git.zhaoyuehui@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Yuehui

Good job!


在 2024/12/19 14:30, Yuehui Zhao 写道:
> Add some blank lines and modify some translations in security
> lsm Chinese translation.
In the future:

v2:

Add some blank lines and modify some translations in security
lsm Chinese translation.


v1:

xxxxxx


Thanks,
Yanteng

>
> Yuehui Zhao (2):
>    docs/zh_CN: Add security index Chinese translation
>    docs/zh_CN: Add security lsm Chinese translation
>
>   .../translations/zh_CN/security/index.rst     | 34 +++++++
>   .../translations/zh_CN/security/lsm.rst       | 95 +++++++++++++++++++
>   .../translations/zh_CN/subsystem-apis.rst     |  2 +-
>   3 files changed, 130 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/index.rst
>   create mode 100644 Documentation/translations/zh_CN/security/lsm.rst
>

