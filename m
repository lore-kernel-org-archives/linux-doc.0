Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D6A442C
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 07:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740038327; cv=none; b=l/7U9M5ldcJxN1CdINjFwUhGEOY0aQEFBE3+vYSmBeDX4zDuWhNPiY6FPQeb62faZAPLM+L7AwqMWzVMOENkPBT3Zw8PNtbup46U/Y7Rrt0ZubKRdLnpNq9A6ZSEeNAlXMKSZilSsDweQvIYjtYzxbWxQFj0uZ9529IdIgW2Jok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740038327; c=relaxed/simple;
	bh=PpJNYD2lhmYApKCUTFbnIB2Oz9xNpyPKhkXzhRQ1kRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UdvfF/Ot1WSzI8LgaKHFviR6uMTOgpFGoTX75uUC0BZFrlxireHsMpkngAGQV4Fb7Mx3C3d5uromKalwauGUcgRVQaKZB1oK7M0AbRGJ7nYMKeb2pDA510Pv3/UsE8/DeuqrVn4BomJrE6MNw5i8jygl12yXqG8OXkvWrgJV5cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VFSBuC1F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VFSBuC1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740038324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDyq9aCOU4k6/OxS5NyOrQ8zBZnEHt3wS9LzAF8nhU4=;
	b=VFSBuC1FNe5dS54iLQuHnrjtzZGfOoPGtb1Ckd0DUbg3UorlxUrDE+Pdlbm592SErCvAAD
	ohJmmfh6YhfHfpOBBJrVXcoI5KlYSR5aHtSto3IX9hWopHrPJBPh5xqcukLCE5R2ZjXtox
	vYJZjPy/6UizDiVJTj/DdyYI5IbU5Co=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-f1KFjXvIMveQIrqskIaJIQ-1; Thu, 20 Feb 2025 02:58:43 -0500
X-MC-Unique: f1KFjXvIMveQIrqskIaJIQ-1
X-Mimecast-MFC-AGG-ID: f1KFjXvIMveQIrqskIaJIQ_1740038322
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394c747c72so2582695e9.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 23:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740038322; x=1740643122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDyq9aCOU4k6/OxS5NyOrQ8zBZnEHt3wS9LzAF8nhU4=;
        b=LNxHDJUq680BWESxvn43nv69FFDFLmheVAjHnKSHRQu6GOY2UN4Am3bzDLeobaDX3P
         K9RBbvsHxOrj1bm8gPjuCRgBKTojMfMsVCzmMpJAB0koAA90zQh02dEijwEoM9ChQlhQ
         H26dLcliBxApTdFklTccIodOHPwwO6GsOzIncUzvjq3zwe5P0NCnMc/YGKxgMlCoOWOR
         Ye1j+mQx5JrN3RD02rZ1aNX44+6/7VN23tNpbUomvI/7bNlEHtpacCjcDgP534CzZX++
         fyqqddQP7B7/1tY5/UEc+EJQDmkvEIalEw+TFHqN0S9J4+5JlTeGsk8/fj9CiA6mj3VR
         pXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7tnyLILHTnVH/Ef5a2hE3GLo3TJZBohTIeGI0GSmoGNfcZFRc388WabkWl5Qj7T7mduj6Ldq5Bho=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvidaCA3KiDMgDWo9iIQRkTYBEAMWmqWv0zFBAC1SUZMBlQD9E
	wdEhd7sFfsZoyVf0j78eJOpEXF8OjIiuZ+Ji3uASbuIIu3+XSXwxWq/q43E8WM80QeokAVOdZWu
	24Nna9+D1MzIFDAZ2XzVD4IndEC3yfMpHLTjao3i3SZWnNOANg0VPr27Z8A==
X-Gm-Gg: ASbGnctBw1/g5VJRIokgCNrH8XEJn8INmit2AEb3YWvMSAEj5QNFNriK9jlAmaceeMR
	y07fEtNBr+GWbuIF+fD92YwQv2biPFzUEwdoMBJ+PuC5JZ3IL39fmtbVSYW9fvaULR7pOZWmj/x
	0/TcBjkz/AlGZr8gp5hDlmrinxqoTlyR6H2wc6OhuQLGNj0VSWmRFc7T2k21pNx+5qvG9JGQGf0
	WYGJXhj+ZSC132Mns1SDPzclItxHye6w93RQpqZOc873IQAItAtccLO8M2P20sTooMLPIG3N9Y9
	jl3G8kpEIGpvTUluZkSDFTwItYEH0a/2SPo=
X-Received: by 2002:a05:600c:1e89:b0:439:9828:c447 with SMTP id 5b1f17b1804b1-439a7b81c85mr5230855e9.17.1740038321787;
        Wed, 19 Feb 2025 23:58:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMZ/J4mT4eh+w4zVIHYL3J2TeyMMFBaqTsZEuN7XJULLXJfI3m9ZBVAO4oeESyI4i7d0LvUQ==
X-Received: by 2002:a05:600c:1e89:b0:439:9828:c447 with SMTP id 5b1f17b1804b1-439a7b81c85mr5230655e9.17.1740038321375;
        Wed, 19 Feb 2025 23:58:41 -0800 (PST)
Received: from [192.168.88.253] (146-241-89-107.dyn.eolo.it. [146.241.89.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7bcsm232584425e9.28.2025.02.19.23.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 23:58:40 -0800 (PST)
Message-ID: <d4b7f8a0-db50-4b48-b5a3-f60eab76e96b@redhat.com>
Date: Thu, 20 Feb 2025 08:58:38 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] tun: Pad virtio headers
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Jonathan Corbet
 <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
References: <20250215-buffers-v2-1-1fbc6aaf8ad6@daynix.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250215-buffers-v2-1-1fbc6aaf8ad6@daynix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/15/25 7:04 AM, Akihiko Odaki wrote:
> tun simply advances iov_iter when it needs to pad virtio header,
> which leaves the garbage in the buffer as is. This will become
> especially problematic when tun starts to allow enabling the hash
> reporting feature; even if the feature is enabled, the packet may lack a
> hash value and may contain a hole in the virtio header because the
> packet arrived before the feature gets enabled or does not contain the
> header fields to be hashed. If the hole is not filled with zero, it is
> impossible to tell if the packet lacks a hash value.

Should virtio starting sending packets only after feature negotiation?
In other words, can the above happen without another bug somewhere else?

I guess the following question is mostly for Jason and Michael: could be
possible (/would it make any sense) to use a virtio_net_hdr `flags` bit
to explicitly signal the hash fields presence? i.e. making the actual
virtio_net_hdr size 'dynamic'.

> In theory, a user of tun can fill the buffer with zero before calling
> read() to avoid such a problem, but leaving the garbage in the buffer is
> awkward anyway so replace advancing the iterator with writing zeros.
> 
> A user might have initialized the buffer to some non-zero value,
> expecting tun to skip writing it. As this was never a documented
> feature, this seems unlikely.
> 
> The overhead of filling the hole in the header is negligible when the
> header size is specified according to the specification as doing so will
> not make another cache line dirty under a reasonable assumption. Below
> is a proof of this statement:
> 
> The first 10 bytes of the header is always written and tun also writes
> the packet itself immediately after the 
> packet unless the packet is

 ^^^^^ this possibly should be 'virtio header'. Otherwise the sentence
is hard to follow for me.

> empty. This makes a hole between these writes whose size is: sz - 10
> where sz is the specified header size.
> 
> Therefore, we will never make another cache line dirty when:
> sz < L1_CACHE_BYTES + 10
> where L1_CACHE_BYTES is the cache line size. Assuming
> L1_CACHE_BYTES >= 16, this inequation holds when: sz < 26.
> 
> sz <= 20 according to the current specification so we even have a
> margin of 5 bytes in case that the header size grows in a future version
> of the specification.

FTR, the upcoming GSO over UDP tunnel support will add other 4 bytes to
the header. but that will still fit the given boundary.

/P

