Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13375186E3F
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236231; cv=none; b=B0eoRDnPGlA+ggA2gysqxOmjT9HWckVRbZWoYNpD7SabHCi92MBsis6fN6PqM+bqg+5J86xod6kGGGtnTNCXbCxBhTEtnX/FGZriJaYFW/aKplV3geM0Hint1yMA4nvj/NWrP9haR6UncfYfpSFW2+HWxK179jyxTCRdRnwE0eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236231; c=relaxed/simple;
	bh=JGr2s1h4ixg0vnRs6e1sbhsUDFouyq0o8PSGQ973vZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F1EW7kvS1RAQ3LJoNkqOFRkdQjAew9ZokTH74M39OawPg197LxvoS5273gcp2mcJDy1q8DoiL0puelNsHnHEJad+M0RNenei6B+/IGZ2JASHjRg76/6kAuKgnspTOdfRn0M1p9Ca6HA/gx1/wVk1iAXaPSM6pPDOtXBoO/U3MUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y0i7rzbU; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y0i7rzbU"
Message-ID: <11522c3f-5d2a-4ea1-8477-46e66100dd73@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729236226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jYuhHsrRaUGkCjIRBTfPVG5JL1KoRJl3MHW8s6Ej7o=;
	b=Y0i7rzbUcpIB/LoHJbd01M6lexAUiGMEM1P0jXEFxeMywt8B9YxoUWxaYKJ0rw0nFS/26Y
	cMZRFnqrOnlx+8meN1ScxgI4dNUyzx/XIrpOUGRwP5apMPNWzGIR/4/TNkOeBn4Ro66mZP
	iokNUid/D/++e3l8PeEO928JV9a8COk=
Date: Fri, 18 Oct 2024 15:23:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Add Yanteng Si to .mailmap
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <87plny1zam.fsf@trenco.lwn.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <87plny1zam.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/18 00:15, Jonathan Corbet 写道:
> Yanteng Si's old address bounces, creating a lot of noise in conversations
> about patches.  Add a .mailmap entry so scripts/get_maintainer.pl will
> return a working address.
I am sorry.

At the beginning of last month, I submitted a similar patch, and it 
seems that only v1 was merged.
See:
<https://lore.kernel.org/linux-doc/20240905021012.2571820-1-si.yanteng@linux.dev/> 

>
> Cc: Yanteng Si <si.yanteng@linux.dev>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Acked-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,
Yanteng
> ---
>   .mailmap | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/.mailmap b/.mailmap
> index 0374777cc662..f2a4e48ad81a 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -717,6 +717,7 @@ Will Deacon <will@kernel.org> <will.deacon@arm.com>
>   Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
>   Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
>   Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
> +Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
>   Yusuke Goda <goda.yusuke@renesas.com>
>   Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
>   Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>

