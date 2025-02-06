Received: from mail-m1973171.qiye.163.com (mail-m1973171.qiye.163.com [220.197.31.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7DB1FCCE4
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833947; cv=none; b=l95M0lON6ggFg7nV7hg0vkyMq/CLTExBbL/NFyFvUVg0D/DyaLXfINXdEE2LMFO6jyusUakdCH18XpZsriOk7j5biCHg6JrIq1XC5KVwhm4GiI5ZjnI/+JrLOp5OJ5SpNRi1wQmTmQEMNXFxNErcBtUzHnNnfiX+WFC157fzjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833947; c=relaxed/simple;
	bh=8Wd/00C/A6R/PW6fEizTG2/KyMxLNUP43T8DNu+k63w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqIn3YYqYGxo1sSThaAi8+99kzQxLMALC0Fe7Xj87w+MNRzzVyq5HeHiwfyun30iq54oV+ePsC9/kxn/GdqF1shwN02jynjYYlbCHd81vkSDRMSUL0ehNGtxlbSN+X3m0swMrmN3UQpNeVAQ01RJfEhl6imTLymefBMHJaarys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=itGR2muV; arc=none smtp.client-ip=220.197.31.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="itGR2muV"
Received: from [192.168.5.122] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a51107d6;
	Thu, 6 Feb 2025 17:10:18 +0800 (GMT+08:00)
Message-ID: <a4cfc03b-61c9-46c9-bf0b-f1e92ed8b599@cqsoftware.com.cn>
Date: Thu, 6 Feb 2025 17:10:18 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: zhangwei@cqsoftware.com.cn
Subject: Re: [PATCH 0/3] Translation self-protection.rst into chinese
To: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1738807847.git.zhangwei@cqsoftware.com.cn>
From: zhangwei <zhangwei@cqsoftware.com.cn>
In-Reply-To: <cover.1738807847.git.zhangwei@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGk9DVklJTh5PSR9OHRoeHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94da863f4a03abkunma51107d6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzI6Pio6MjIXSwgjHyMILAEL
	ThIwFC9VSlVKTEhDQ0hIS0pCSEJLVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSktLQzcG
DKIM-Signature:a=rsa-sha256;
	b=itGR2muVzJi0Uivwo06/EFzyXs1M8lGeCuhC4xSY2RLgkXMKAXE1tSIPIfg2zlWKjZw3kFguBRTysIuS9col+8gf3k72Ekq0UNBGTQ+XaIK4C+4JGacqB0GZogneZkzV5B6U99IH5dRvT7EwbQAbM6uLE895aSd19A5o/8rwqm4=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=Yh6yCllE/e0fq+wL0g60xubcR/dSxKSANRb5Z+7MIxg=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/6 10:26, zhangwei 写道:
> Translate self-protection.rst into Chinese
> and add index.rst under keys and secrets
>
> zhangwei (3):
>    docs/zh_CN: Add self-protection index Chinese translation
>    Translate .../security/keys/index.rst into Chinese
>    Translate .../security/secrets/index.rst into Chinese
>
>   .../translations/zh_CN/security/index.rst     |   2 +-
>   .../zh_CN/security/keys/index.rst             |  24 ++
>   .../zh_CN/security/secrets/index.rst          |  18 ++
>   .../zh_CN/security/self-protection.rst        | 271 ++++++++++++++++++
>   4 files changed, 314 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
>   create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst
>   create mode 100644 Documentation/translations/zh_CN/security/self-protection.rst

I forgot to change to V3 send and forgot to add changelog,

I'm going to resubmit

Thanks,

zhangwei

