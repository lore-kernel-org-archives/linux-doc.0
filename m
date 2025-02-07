Received: from mail-m49219.qiye.163.com (mail-m49219.qiye.163.com [45.254.49.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B112D1F1
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 01:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892807; cv=none; b=spiJymewGtMlsQ5Xy+PN5d5dejDsu7leOV4xTDQiezMM6hsSkrqb/1gT2D+4QsL52b3DHZiyvKff4zUwGu/kXiOexsQY6OuA/+xwxAOKxYJ2tMRz4KScf6s35vQk0vJnohY4hKSnS6bweTawoZyOgdQDlsfwqOs0Ex5Qi9THV3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892807; c=relaxed/simple;
	bh=sO7ypkh0njmfTQ4AaEczXXl+MPk7aPlJ9v1Do5eIT/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcnxDrA5TyvXSDig3lO2EW1Nge2YN+Uf7QfY2YgFNOHQvDc73AOtdJc0BJElKJG0qQc5MueLHlBSVglS2tQF7ISM10vIxI3ZdP2dmrSvWm9Hbh5xhvTv3px/MYePP9jIzM8EtiiX8e5ugQqSSS17xLgWNc5kfXT6G3HOtvpuiGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=jMFthfll; arc=none smtp.client-ip=45.254.49.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="jMFthfll"
Received: from [192.168.5.131] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a5da4430;
	Fri, 7 Feb 2025 09:41:25 +0800 (GMT+08:00)
Message-ID: <21d7d8b1-947b-4c14-932f-f5401644c8ae@cqsoftware.com.cn>
Date: Fri, 7 Feb 2025 09:41:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Translation self-protection.rst into chinese
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
References: <cover.1738833098.git.zhangwei@cqsoftware.com.cn>
From: Yuxian Mao <maoyuxian@cqsoftware.com.cn>
In-Reply-To: <cover.1738833098.git.zhangwei@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUlNVhpNHkNIGhlDTRgYT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94de11a25e09d8kunma5da4430
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MUk6DRw*MzISKA4UOBMiFSsR
	DRYaFCxVSlVKTEhDQ0JJT0NOQ0NDVTMWGhIXVRYaFAIOAxIaFTsYCggUHQ8MGgkeVRgUFlUYFUVZ
	V1kSC1lBWUpVSkJIVU5MVUhNWVdZCAFZQUpKSE03Bg++
DKIM-Signature:a=rsa-sha256;
	b=jMFthfll5n9+aDgaXCq5QdNxHwV2rP4cuyT7Nwy7MvwdHXaiQ9SyKdoRRYfaiYDiJC7414NKnQnuleafdm91u9KW4MCGAUQau9wIValqTuOk5M/bI1k3caCA1KEXnDiYi6CCQLRnNi2NfkQaWzKrH5iJJFEavI3KMT7nSXJeC7c=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=WujXnyLj28sXhKuyfBE1vdMpx6Rw0R95M5QoA4rzXnk=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/6 17:38, zhangwei 写道:
> Translate self-protection.rst into Chinese
> and add index.rst under keys and secrets
>
> Changelog
> v3:
>    * add index.rst under keys and secrets
>
> v2:
>    * fix remove the unnecessary blank lines
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
The patch contains whitespace characters，please modify them before 
submitting the patch.

Thanks,

Yuxian
