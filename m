Received: from mail-m49230.qiye.163.com (mail-m49230.qiye.163.com [45.254.49.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB931547C0
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894971; cv=none; b=FbbVehqNg7CZAnmIZH22iVsDOXzLTO4or+s7rFe9OeBayP50jhdTmHNZO7YuwMzoLZpE5Vsn6iGj5mRy0YiNHUV7Q9dmShP65QAPZbm9kpUd2AUKzcUgKwdIPCOuXhnbShxRHocI0iV5eWmDfKKe/4xC2A1EGBosyYBnuGbXmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894971; c=relaxed/simple;
	bh=x94c1vOzR94g6cGS9qf8v0kjY7HKujW3wMFsI/omCWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rsSUHnWWiTi11Y9PSVtbytW/nJ63X6rxoMV1VWOHOQ9Urn92gLkPcW+zMofYOgTJmzQ1yZXeGJNztPgsnUTx8ymZpWwu42nKuooqqSa0ef+lT4ckYOUM2sn/CNv2FDvaG3yHPT0z/qf+6CwunndPYVqz9/MCsNFb2clUfiFGAqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=eiRRzZ6X; arc=none smtp.client-ip=45.254.49.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="eiRRzZ6X"
Received: from [192.168.5.122] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a5e4be67;
	Fri, 7 Feb 2025 10:07:20 +0800 (GMT+08:00)
Message-ID: <e04cc74e-2e87-4c4a-87ad-132aadbfefc4@cqsoftware.com.cn>
Date: Fri, 7 Feb 2025 10:07:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: zhangwei@cqsoftware.com.cn
Subject: Re: [PATCH v3 0/3] Translation self-protection.rst into chinese
To: Yuxian Mao <maoyuxian@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
References: <cover.1738833098.git.zhangwei@cqsoftware.com.cn>
 <21d7d8b1-947b-4c14-932f-f5401644c8ae@cqsoftware.com.cn>
From: zhangwei <zhangwei@cqsoftware.com.cn>
In-Reply-To: <21d7d8b1-947b-4c14-932f-f5401644c8ae@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDT0JLVh1LGkhDGk5KQkgZSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94de295f1b03abkunma5e4be67
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngg6USo6TzIRDg4cLi1WDFE6
	MAgwCwlVSlVKTEhDQ0JPS09KQ0pLVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSkhJQzcG
DKIM-Signature:a=rsa-sha256;
	b=eiRRzZ6XI6QJcc7GDEhkrKJqEG21DWS8scPX/GFmLPL8pyrS/zsGhlA+WQoLxiIsARBoAZku4yqnXQWLSKSS7WQeDmROwzLbObg3a1s63gvRFhZ7j3C8juk0TMEGqO2GHEez3N9Qgo3u2s25aEQ/x4GVfUXBlhChmo4FyJx4KxU=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=sBJlzr+CKXBl4YeWDN0nFw5qk9WxmhnS9J2BnuL8tE4=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/7 9:41, Yuxian Mao 写道:
>
> 在 2025/2/6 17:38, zhangwei 写道:
>> Translate self-protection.rst into Chinese
>> and add index.rst under keys and secrets
>>
>> Changelog
>> v3:
>>    * add index.rst under keys and secrets
>>
>> v2:
>>    * fix remove the unnecessary blank lines
>>
>> zhangwei (3):
>>    docs/zh_CN: Add self-protection index Chinese translation
>>    Translate .../security/keys/index.rst into Chinese
>>    Translate .../security/secrets/index.rst into Chinese
>>
>>   .../translations/zh_CN/security/index.rst     |   2 +-
>>   .../zh_CN/security/keys/index.rst             |  24 ++
>>   .../zh_CN/security/secrets/index.rst          |  18 ++
>>   .../zh_CN/security/self-protection.rst        | 271 ++++++++++++++++++
>>   4 files changed, 314 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> Documentation/translations/zh_CN/security/keys/index.rst
>>   create mode 100644 
>> Documentation/translations/zh_CN/security/secrets/index.rst
>>   create mode 100644 
>> Documentation/translations/zh_CN/security/self-protection.rst
> The patch contains whitespace characters，please modify them before 
> submitting the patch.
>
> Thanks,
>
> Yuxian
>
OK,I'll resubmit

Thanks,
Zhangwei


