Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686704;
	b=yUxQ1tuYvqSZfuevp6oyx8SN/Z74Wxd3hqx5OELsAuSTsEKPkxjeWUsUmizKTq0Mz4gm
	 TL0RoSMPzqbNDc9J9vL98w1aVMMpOFQkxy1JYmvnZLUaWhRRubYTNhKXvc1qjUmWS6DFt
	 GNBv9Mc1XaYDLnNuKGS69i5/w16k8EGpDtTCkvY7P44UWLf9MWTGIRdv+hfTCPEOewhe3
	 jr/1N/IP0sXepxjvG8kNg0bwnIkl9XAmIV5y9DDGT3KxNGLcpaROtsrEWgpZoAzWTwi3l
	 oLROsZNQj3YstltRlxktgl66B+j8IrZkG/HQtv7pgXcP/akYoyko2r8v/mRrS0DURkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686704;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=v+PFkA3HR1X5+uDcKyLLMMbfxbt5fXnAkM8a6Ld2TS33Zal2vhLqWYt7sB4xcflU+rSt
	 pKJQ8jpchRRiIHI9QQrsZ2nf+3p0+lrYODlI5D/CLCK6+xdPqpa/KGfxl0XRq8qy1+YI9
	 o7sdFDnhlR2ZQmELzvYZpqFLp+FxPHpZugk+clrcqWDJTnN4a0+F1kMlMYIViRBkNZHhJ
	 BobLWfGoy7Vn9dhbIFnvDdamwMXmBZZ4qfcDrdAqF2We9Y+cOl4Pte+BvNB+GRv0xct6S
	 NFTKoYKOJwMZcHHk5f+o+nP2a9Wx01spahx+m7af5Pp6numQQ55sR4I/Pe2w3cSIRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F0XPcewx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C20606A32E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 09:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C20606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F0XPcewx;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=F0XPcewx6TxLhbQUKNoEvbJlQZfPxbOFrH5L57zCNLI3UBqlcmM8ms0g9gd6Zje+9uc5Um
	QHhaoEZDO7Ju5wuZUQak1ximj2q6G59AfttZVBOM14Ji/Z6y91rxCjIv+ROamf/XnTpZTt
	rnmwiZhoeLuTKevlXoCp9BJy3crFoZ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689--VQ0oovCNiOT4WuOeA7paw-1; Thu, 26 Nov 2026 09:51:38 +0000
X-MC-Unique: -VQ0oovCNiOT4WuOeA7paw-1
X-Mimecast-MFC-AGG-ID: -VQ0oovCNiOT4WuOeA7paw_1795686697
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so5617925f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686697; x=1796291497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=eSf5YhDs7s4d/I+PuOqPG7GnNpSXVv5YHZf2MTaDiGSvROudWXnjtlOkgjVsqw+WpP
         lTDSssv14eAoLBy0bl1Ci2jfbWBegKn7XEOaliLTA5vt1Z6j1pZiFCA0AAj3hDDltBos
         6C3+AdPdLxVsXx8Xv/cyIHWJ4ltIx7vVQKZE/K8Nue9lFYlJMLTfgqalzC2E/rzpZQPA
         O1mCoK87jRv6TIUQaOmHgKqRFIOu4HKDLbFnkUfgPdOLYDcP41qbWWBllhlVS+lVs3lb
         QH0d9NXFvc+ZBTENAKxP/WwA5UuA0jDFKl8yuoT0dYbrNJ8LouJ070V2AyeDNGcZVAq1
         XW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686697; x=1796291497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=oIgHEWnEHasN2BIjorHAXZKVyPbcTzR3T4lOszDbajpgqP8e2SwqCNvWsgP1giOZo9
         zXf+7ptfFRWRihKoY8EBSOSLz1GslKGqseVl+ZBDkZGbwWu3ovn3hYawgFYGrlNxxbmr
         1u4dBifjQwDnu3UO7fHPg9Zx2VQokgR/wftMjMjLZnTPY7W4MmSiEbvbrtd9XaBmr6SC
         JardsNExEUDXklNcJe11zbJG1ZJoYhO7zlvc3AX/pN+VJm9V3er1G9pBJfC6tZtKH/Um
         zlzMOrJ4AHin74rOqg1CgF6RzRo4zeN7qffhtsVfUeTAHl3a8yjKI6OlZ1/4dFRfzj1t
         UYwg==
X-Forwarded-Encrypted: i=1; AL+hErE3R51Mre9d93nJ4bX8kwrFTjbtr8sze4+Dt/7263XDKU6YGx+ZJR5TDEmOzyZSu0XmvjhjwMZ+t9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pKwfLs10ePZ3tVhCQ3ze3/zlvM9tOmcYgj8UNlAWKjD8m5S2i
	pEUjs/hBA9t7mrBhNbmYh+X67KwojIaxZJdrGLXoK1J431AW3byQfkrGnYpDVEB7ZdDWrXIyFLN
	NjfaXOVOP6119+qbA2NDjB1rRkGSIMK7nVeptU9q/Nv6cCs9XMLMfcx5lri1yRA==
X-Gm-Gg: AZFdTZcOUDXH9oboaxq0Q+1CZ4YC5w/rWvfxvDYBTuqUTfpI092eHtkH6K4jFsVlkf6
	LjKndkgOthPSk4u7ZjjkhLkY9SdZ1vA54zqiVrdDhJXYmgiaiJzVALN+4xvXR84D4ZK/bXnxCot
	kFc4iIiMC9VRD0IWOouPrjbtXceYUERlR2foZy4Cf2Pvit8sYBcKnCxmS7Ef34e/SgyBYRzJzNz
	3bxccRe831qFHzxYjrP3wu9FJJgcsk4IGk/b4/l18v+LVNJNr1jZs3X1F8ZNIyf5yMkzO7lhAng
	cCm1WkT/N9d5VHoFWxarnfQBrK5T2XE/p1wErZ4YLksQWxmX8OgP+jvG0jwd9MxE54pLU5rsZ/j
	9/26ig7irynLVfVKSfVNlnzxow//I59jy2TtDPpCAy2TDeV0oGkNo97B6PCW2bIX/1+kzIqS7Oc
	eDVTTkDrZDfAZ52uqwiDZRWcjCQiCRm+2xBn/7xV3Ojdd2
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614716f8f.1.1795686697238;
        Thu, 26 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614627f8f.1.1795686696684;
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm39627871f8f.52.2026.11.26.01.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Message-ID: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
Date: Thu, 26 Nov 2026 10:51:34 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across
 tunnels after GRO and GSO
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch,
 dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, richardbgobert@gmail.com,
 ecree.xilinx@gmail.com, andy.moreton@amd.com, alex.austin@amd.com,
 linux-net-drivers@amd.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, linux-rdma@vger.kernel.org,
 alexei.starovoitov@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1795284858.git.julius@bairaktaris.de>
 <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:27, Julius Bairaktaris wrote:
> Send TCP segments with fixed or incrementing IPv4 IDs from a packet
> socket, let GRO on a veth merge them, forward the merged packets into
> IPIP, GRE and VXLAN tunnels over IPv4 and IPv6 and into ESP tunnel and
> transport mode SAs offloaded to netdevsim, with segmentation done in
> software, and check that the IDs of the IPv4 header in front of TCP come
> out as they went in and the IDs of a new outer IPv4 header are unique,
> or for ESP tunnel mode increment within each packet. Also forward a
> VXLAN stream with one header's IDs fixed after decapsulation into IPIP,
> and send the merged packets through a tunnel that the far end
> decapsulates without segmenting them before it forwards them.
> 
> A test where GRO merged nothing is skipped.
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This test is very unstable:

https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

/P

