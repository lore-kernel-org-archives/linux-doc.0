Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D25E330B0B
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 02:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772503953; cv=none; b=ExBIdenRW1wJIRHW12jUyVz4CAw6i5drXLG+ocwuwNyWWJMviyLSYJq0BEuJWtT/xjtKBEmHkdD1orGQlAQJtqlyizshy8AfidzIGCujGbwpb0vi+MFFrexNcZ24IxMBTDTnK8BIqDcUn8UEoS/xN9OhIHcS4nUNTHrEHfg+ykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772503953; c=relaxed/simple;
	bh=FHUL99jkKiS7cQaGg74n2ztrYjf9Ch0zqo+Qxm0uyNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eU7gQN9Bs5blgSrAYZCjHDW4JC5LV19xYqNqLxvxvg6v8iFMJ6ZFbQp+dfU/0Kwsg3YaKXJM+z1/QibjgoZWZ/JkJTlv71XV7JsNFFo1QnNM+nUZ76dXb3JPdxsDbcv6X1Au8uZoojxr0/UUvd0A0gWn/FqCa/ANxoIOFV44UlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u+o66kkY; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u+o66kkY"
Message-ID: <3a623176-fc5f-4dd4-bbfc-64d211f53645@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772503940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITXnpAu02JzlvG8ACcNMa7Prj6k5bTC+ixlzn4YbRcI=;
	b=u+o66kkYvU/0WatYofey3kIxheT7EhEdcdrwhowxk7SPBm8AEWiQkPGbhM0tHR25/boTw/
	9kptLRzgw+xw3BFcJFoqyGW8vtJfhpDG5gBg+VCSYmnYCQiXAnkboVreb5BYYgQTNRRS/v
	FVTRKtvQouWDk5qN5Kg5tMzYfRbgJAQ=
Date: Tue, 3 Mar 2026 10:12:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH net-next] tcp: Add net.ipv4.tcp_purge_receive_queue
 sysctl
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Leon Hwang <leon.huangfu@shopee.com>, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, kerneljasonxing@gmail.com,
 lance.yang@linux.dev, jiayuan.chen@linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260225074633.149590-1-leon.huangfu@shopee.com>
 <20260225174354.5a698ddb@kernel.org>
 <f611be70-8280-44c8-86af-5866c0b302be@linux.dev>
 <20260302162251.733b520e@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260302162251.733b520e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 3/3/26 08:22, Jakub Kicinski wrote:
> On Mon, 2 Mar 2026 17:55:59 +0800 Leon Hwang wrote:
>> On 26/2/26 09:43, Jakub Kicinski wrote:
>>> On Wed, 25 Feb 2026 15:46:33 +0800 Leon Hwang wrote:  
>>>> Issue:
>>>> When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
>>>> current implementation does not clear the socket's receive queue. This
>>>> causes SKBs in the queue to remain allocated until the socket is
>>>> explicitly closed by the application. As a consequence:
>>>>
>>>> 1. The page pool pages held by these SKBs are not released.  
>>>
>>> On what kernel version and driver are you observing this?  
>>
>> # uname -r
>> 6.19.0-061900-generic
>>
>> # ethtool -i eth0
>> driver: mlx5_core
>> version: 6.19.0-061900-generic
>> firmware-version: 26.43.2566 (MT_0000000531)
> 
> Okay... this kernel + driver should just patiently wait for the page
> pool to go away. 
> 
> What is the actual, end user problem that you're trying to solve?
> A few kB of data waiting to be freed is not a huge problem..

Yes, it is not a huge problem.

The actual end-user issue was discussed in
"page_pool: Add page_pool_release_stalled tracepoint" [1].

I think it would be useful to provide a way for SREs to purge the
receive queue when CLOSE_WAIT TCP sockets receive RST packets. If the
NIC, e.g., Mellanox, flaps, the underlying page pool and pages can be
released at the same time.

Links:
[1]
https://lore.kernel.org/netdev/b676baa0-2044-4a74-900d-f471620f2896@linux.dev/

Thanks,
Leon

