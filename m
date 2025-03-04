Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4456F073
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741072064; cv=none; b=Ee/EQrxD8JoyoFrg20F7AHaJDIHHMm2XIO5zhRpA9jznX31S3IhkBZK7aZXgJR+PsL5EQcEz4hg+wdMMPAAiiKLcyqxcNTs4xT7DZ+lYoomrpwoTQRs+gYFKp39jlAIbfCCFkNIVoPoxOz0HjJGgG3F2l5Gl/mX/zS5cOWvcO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741072064; c=relaxed/simple;
	bh=9ue9ehgR8/qxkr5xWt9z+zKm6GCIUfvER4D+NSJjpJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuaKzyR4jctmgKz77a6fFS9BitDXz/5rWrE277K2kRiD5L7bPUi5QU4549NIy3otRDj+iU5QhZDycK+985tSwgbpVa3JNSqnyj1b4T8d7NCKNBDJbtki7xMeTn30slFMgNBDtT2aqvbW6trtkR/NOfH4qX/cRpKgIdSUk7Uh+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WYoZtOMo; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WYoZtOMo"
Message-ID: <9ebb6a57-8683-450f-9126-4a68bd2bfe3d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741072059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nyqLYjSOtyeCvxYC8V0SaxGkPZpjNikOidq/+0pocQg=;
	b=WYoZtOMoPffS0Q4adv4GO6O2eAcxypYKBf+c8uU7mmqaoqZle/6zh5myMOTo0iLzGc0Y+S
	FtH95C3IfuHti5SXQjnp/F5VGVSpvhs9pqE/a0uLKGsu0ClarhrC+m326QxAMbXMdcw1ww
	+zl3GiJWol5HZwRlwxqjktf5/8NUbpI=
Date: Tue, 4 Mar 2025 15:06:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] docs/zh_CN: Add how-to of Chinese translation
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250227103602.321198-1-si.yanteng@linux.dev>
 <CAD-N9QUgstCA+nGb=b6DBe+C2eU180YKn=U7x1WKS-RqyJVaxg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAD-N9QUgstCA+nGb=b6DBe+C2eU180YKn=U7x1WKS-RqyJVaxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/27/25 8:18 PM, Dongliang Mu 写道:
> On Thu, Feb 27, 2025 at 6:36 PM Yanteng Si <si.yanteng@linux.dev> wrote:
>> Many new faces keep appearing on the mailing list from time to
>> time, and there may be many potential developers who want to
>> participate in the Chinese translation but don't know how to
>> get started. As more and more documents are translated, it is
>> becoming increasingly important to improve the maintainability
>> of Chinese documents. We have a lot of conventions, but currently
>> these conventions are still being passed on orally. At the same
>> time, during the review process, especially for the first few
>> patches submitted by newbies, we have made too many repetitive
>> comments. In order to address the above issues, I have drafted
>> this guide, and there is still a lot that needs to be improved.
>>
> Quick comments about "b4 am", the warning needs to be addressed.
>
> -------------------------------------------------------------------------------------------------------------------------------------
>   $ b4 am 20250227103602.321198-1-si.yanteng@linux.dev
> Grabbing thread from
> lore.kernel.org/all/20250227103602.321198-1-si.yanteng@linux.dev/t.mbox.gz
> Analyzing 1 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH RFC] docs/zh_CN: Add how-to of Chinese translation
>    ---
>    ✓ Signed: DKIM/linux.dev
> ---
> Total patches: 1
> ---
>   Link: https://lore.kernel.org/r/20250227103602.321198-1-si.yanteng@linux.dev
>   Base: applies clean to current tree
>         git checkout -b 20250227_si_yanteng_linux_dev HEAD
>         git am ./20250227_si_yanteng_docs_zh_cn_add_how_to_of_chinese_translation.mbx
>
> $ git checkout -b 20250227_si_yanteng_linux_dev HEAD
> Switched to a new branch '20250227_si_yanteng_linux_dev'
>
> $ git am ./20250227_si_yanteng_docs_zh_cn_add_how_to_of_chinese_translation.mbx
> Applying: docs/zh_CN: Add how-to of Chinese translation
> .git/rebase-apply/patch:454: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.

Will fix.


Thanks,

Yanteng

