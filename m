Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com [220.197.32.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796A30C601
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539029; cv=none; b=p5dZLPhcux5kwRM5wO3pfopZsONGXa5h+pj+LhX2Gp43d+lUK9/1cL30R7BMkVz3dLcslo71d8ZdhAQokVfwc9E6gDc3oQH2LbpU9NjVC7i86qGiD/FFMrNlVL258nJVxbCDUqqjz0S0o0/b71HG8g8LGbXLsG+cmZ+KE7NDWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539029; c=relaxed/simple;
	bh=hZPh2/FqLJDdfMQ+u48VxQfUx7m4NNuINUQUbhqdzDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atCVfqzHGzMCIW4eJKQQRklYOylsnYjyPTMWTWahIG48zMCjJQriXV8kTzgNMIUI0zlRa8oBwbLmo90mte+HZ0JKlv+fWM8xlYN/ZClg2H18D7vRJeCY82xGzvoIfNQHKzYztIKq4daxsybqtp22+XXULfqLjREQRWsvRwP4O5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=LFWY06qF; arc=none smtp.client-ip=220.197.32.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="LFWY06qF"
Received: from [10.0.66.19] (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a1cbe3b4;
	Wed, 19 Nov 2025 15:51:54 +0800 (GMT+08:00)
Message-ID: <2d85a076-b398-4e0b-8376-0bc7f1236708@leap-io-kernel.com>
Date: Wed, 19 Nov 2025 15:51:53 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] docs/zh_CN: Add block/index.rst translation
To: Yanteng Si <si.yanteng@linux.dev>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 wangyuli@aosc.io, doubled@leap-io-kernel.com
References: <cover.1763535919.git.kezijie@leap-io-kernel.com>
 <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763535919.git.kezijie@leap-io-kernel.com>
 <e2a979ee-7dcb-424e-893b-e60333259e15@linux.dev>
From: ke zj <kezijie@leap-io-kernel.com>
In-Reply-To: <e2a979ee-7dcb-424e-893b-e60333259e15@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9b193de109d8kunmac7a11d658fd9fc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSE1DVkwaSBgZS0pIGU5MT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=LFWY06qFYavghA0nbukOUaqbNSxz8V/2rw1PlAdH73TE+zV8uUoblMK/hzzpCtyzlYtsPijbQJB1ngT5zh1QBwQEvhQspIEF/H9QYyz0IhkOC/MOy+ShAvhkbq2W9yu1MhiNcXZMONWptIQeiv3kw8bjWF1dJdA+17FSuDgTGYwbltd7rgj22q1PiqzXw8ZKDTHWgF3zpdJo9p9dvGtYEzHpPBS4XEQrzt6wILMivEqV6ZTFBKRN0YXoFWw3M+4k5OguN/tWZgfcx2w4rlmDUnyunUXXeru36VqbUjx3bfOCr0viDZu68CtBbyswnv6VkOOq72hCraD8JqQRLansJw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=GAwSn5kRXMRW/plLwfvoTyDPutgbpgLNR3gUQev72es=;
	h=date:mime-version:subject:message-id:from;

在 2025/11/19 15:21, Yanteng Si 写道:
>> Translate .../block/index.rst into Chinese and update subsystem-apis.rst
>> translation.
>>
>> Update the translation through commit 56cdea92ed91
>> ("Documentation/block: drop the request.rst file")
>>
>> Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
>> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
> 
> So, what happened between v4 and v5?  need a cover letter to write this.
> 
> 
> Thanks,
> 
> Yanteng
Hi Yanteng,

I planned to add your
"Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>"
to every patch in the v5 series, but due to my oversight I only added it 
to one patch.

I’m very sorry for the mistake.

Could you please advise whether I should resend the series as v5 (fixing 
the tags) or move on to v6 to correct it?

Thanks again for your review and patience.

Best regards,
Ke Zijie
