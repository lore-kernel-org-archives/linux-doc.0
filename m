Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1011F1DDC3C;
	Wed, 29 Jan 2025 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162325; cv=none; b=SmEuy7bBvDcIhQqfvhOWf5U92TviigwS9noc1tce9YDTbCzS0yXEhLITuBnTjY/EGW+fraM9s2ukLf+sHNRGr3WQTYFMdogC42LNivRKb4jN91FbVZRvyyuTReW85GLdRmDSh+8iREJm8R/eYeviVnczOEaW73zFigmyC+qCpIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162325; c=relaxed/simple;
	bh=s+3cFktxSJU/Ix7SxHq8c3HxL+XJypbFyvuUA3iqEHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aJCrGyDJJ1mWEVBxy3pV9pARToGA4Nuez5Tfz6OlL02h39D+xPlB2mhOAEB0MCYH6bar1tdZrEa45QGPjuEEsZRozrqOR3FfwK/FhZT35X2rhL/bTT/vp7GYUynkZHu0iY6rDN+yZtKGsWN9Qthov3pgQ3nw+dJOuKmPekzxX7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=b+O8aJ0m; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="b+O8aJ0m"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0B46D403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738162323; bh=37ahB9HQ/vDIBiJCW19w0AzXaK1jlA8lwvGM7DlvZz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b+O8aJ0mrX2RoUVhf+h/GduocissyloHy+j39k7yzymNa0SedyswljG3iv3FkmjBk
	 hVu3ZC+7Fbcw+4A5B1wSk4i7iB2PsHGBU3qE0sUY+YO+EzTa6YWbM/U2JLtEjmA4YZ
	 rjr+5NxxJyxzhxtmIaECi1Vicaj1R4ceA0F7xpFMpS90iQP0pYJgiICl41ImDDJTMz
	 Lg9pA6c8GfNdTvgOQ0378gvaR7IaXh198LesEMWHm9IghvImo6KdwPEVMuWXyDArIT
	 oz3Ezb3Ww33yx2DGD9uqvM9jHR5sSaw6ElyZMt1RwAEHdMTjJZCkVmAaZB91X19Vgk
	 m2rHlmRuwybWQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0B46D403FA;
	Wed, 29 Jan 2025 14:52:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] .mailmap: Update incorrect entry and my email in
 MAINTAINERS
In-Reply-To: <5fd7b4d4-6c47-42e7-a256-764d488e0c44@gmail.com>
References: <20250125154721.1035737-1-carlos.bilbao@kernel.org>
 <87tt9i7fx8.fsf@trenco.lwn.net>
 <5fd7b4d4-6c47-42e7-a256-764d488e0c44@gmail.com>
Date: Wed, 29 Jan 2025 07:52:02 -0700
Message-ID: <87zfj965bh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:

> Hello,
>
> On 1/28/25 16:05, Jonathan Corbet wrote:
>> carlos.bilbao@kernel.org writes:
>>
>>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>
>>> Update .mailmap to fix a mapping and my email address in MAINTAINERS.
>>>
>>> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
>>> ---
>>>  .mailmap    |  1 -
>>>  MAINTAINERS | 10 +++++-----
>>>  2 files changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/.mailmap b/.mailmap
>>> index 83837191affb..0768824e9d19 100644
>>> --- a/.mailmap
>>> +++ b/.mailmap
>>> @@ -139,7 +139,6 @@ Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
>>>  Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>>>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>>>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
>>> -Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
>>>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
>>>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
>>>  Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
>> So I am getting confused ... why not just send me a correct patch for
>> this file rather than expecting me to apply the incorrect one followed
>> by the fix?
>
>
> Because the incorrect one already made it upstream AFAIU:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250128&id=ed7c0f5395e05057ae6459fdcfe229fb9aaab5b6

Hmm... it looks like Andrew took it?  It's still in linux-next, though,
and could be pulled out.  It really seems better to just do it right
from the outset?

jon
