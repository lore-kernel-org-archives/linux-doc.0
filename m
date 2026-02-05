Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3F2D6E5A
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 03:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770263287; cv=none; b=oDjIwj7b8ZyjPd1x70fTiY9aylr0UJ8yPulcMe7u3PVxJqmCXvLhr/fZLBzbbbeBTtSIeEjhtQvJh6pwjtYzfGMn3BYKcrDa1f1JPHOD7tXZDO1I9GVsLK4y3NsbvRKqNL7fPqoBGm9Z8iutDE2xMBo4RKe4v854sRmlj2Zzaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770263287; c=relaxed/simple;
	bh=7y9Hk6JlXCrERWliXg/TQZ3X+/C2SnPJyTWz26+wDdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFyRNFlonyCoKzwRr3YVIPZ18M102e2phEedUFFh/GuXAiAJWQzFdoKyAIeH/jEI2IJQepu8PuOcapcwNyYBkzGvvf3M5jnRTH6ydXtReXc4xxaGprMIKrzCk3jmIdQGsQ8W0q55AHKnxVRjQiWGI+tNlvhMyWuATV+tMCyYA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=zvUqzBm6; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zvUqzBm6"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d1890f7ee4so343547a34.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 19:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1770263286; x=1770868086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QofIONG1uzBkxrXk9BfqK0VXCGMliXskB+p+bTvurvE=;
        b=zvUqzBm65B1vzoarWWF4Hxh+tJQomRWyeL860QlOQlGrnN/7L+9aIlgHt4+Sgo9fTx
         UWH+VUahrhmzC9uaMgmDQfwygwkwV4UniCDkBKe1Ygew4kd9vx5olhGa1ZUBLsODQlR2
         hMP1Yxan/By/ZSoDM6zpDN0U1FxG8xC+pYUHjWqWv2b/fnxnAzfFM/dnc1+G9rwwZrTN
         gS7chibU+9uS460RhWb24oo6nueO4nb1QNmjtDVM9u5Jswqf+3edpgqmpu03/QlWk2ky
         j5F/AHTIP1fRAmnqU2C+skRTeH2g8GDRkcjcdY6yfWynkly5XpowYGk3bz10aV6drc9q
         lsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770263286; x=1770868086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QofIONG1uzBkxrXk9BfqK0VXCGMliXskB+p+bTvurvE=;
        b=mR0T0qKyYdcxYdmV5lWJUiGAN1sQECZ0rKfHflGTeArmNFyNAkc5Vr+Zxa4JEgp4jH
         MG3aXecfMnDOLp/OpVUGacBDt2WVoDwGSpf0MZYl8q5UsTqGJBYoJucIKmwakj3bWsDg
         rNc/eCmpxAaj5UVTXEvDOynlso5ndu+fQH2qrEFpxc9Ptgz6lfWuv01GjjbIrBDbCM5M
         9iY5fJ+AqvgpPfLdaru9HorRJrsBVk1GepdWbwFgmQ2hPKRixo/UAvvleWX5soANKaLi
         MAQcYW0btKQM0XP4maULbcuy4Sv+SZSvv49/OITAZxP7c586cPTDlxswlX4Qze9ARr8K
         OHhA==
X-Forwarded-Encrypted: i=1; AJvYcCWoGcYeF5XW/BwkMv2/BmDGYcjqg2btRBEsKDvhzBcaB32whPLcLNqUKa9AStC5PGjOX2Qi4B9rWKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBl8cMw87mZdZnyQ9t4aOcd+GCJD0vnfMa4qu6Ubx4MvQZSxLp
	0JRc74FxjMCBco/zxW+MDNLRCcaP7afZ2KmDznDdaEIX2VueiZIvElXIkG6ulPKidWI=
X-Gm-Gg: AZuq6aJDC5FMd6OHG1MoWHipR+kpz3Od5rlFz33kjOV/jBgWHTx9ez8AL1LvGajWrdJ
	dRBTSFvtq4oV2sOOsmKOpQ72ywSgglxcNAJUNFv3RWHhj8N91W4SAR2B+L6ky4RujsKhKxw3LrH
	3GFWJwrr4+MFxOrBctEaSYPCofDxwdEBWGLhtCXtIAs7mC+HDaXNqj6Z6i0tjqBsZs8fFQNZCbU
	1n/t2qAiSO3++iQHKruvg/3zynz0tQV4ly2Iog/q7HEmMX/vNL2feCViQXU2VZmr2+r+JeiVgzh
	lr1++d1Xm3hc40mHq31sqNimmvMJ2AE2ZsU3/MpBYX1wj4VI2mYBGyq/UkfGQeyQF5aNGRdsnRH
	5mdbQD+YOG/GBB9GGGthLIyJR7pNpk+Pe8oW8bRn67VdxL2pqQT8UX7K94ZDZpXGSstxelAIJTm
	Elw2X7pa0pv6opS5QTSo6kp03kIlHWrwkp22qmLviU+3qentN6SBTaCbzRh+yC1TOMRIGNHA==
X-Received: by 2002:a05:6830:6181:b0:7c6:cd24:6392 with SMTP id 46e09a7af769-7d448c1fffemr3274000a34.34.1770263285661;
        Wed, 04 Feb 2026 19:48:05 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d44922a33csm2799317a34.25.2026.02.04.19.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 19:48:05 -0800 (PST)
Message-ID: <55108bac-9edf-439c-ba54-ee25a1901d6c@kernel.dk>
Date: Wed, 4 Feb 2026 20:48:03 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
To: Pavel Begunkov <asml.silence@gmail.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stanislav Fomichev <stfomichev@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn
 <willemb@google.com>, Neal Cardwell <ncardwell@google.com>,
 David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 matttbe@kernel.org, skhawaja@google.com,
 Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org>
 <CAHS8izMZxM6rcF+7Lfw=KFv4dmbHGSUrQBPmxO+sYj=V3TRuwQ@mail.gmail.com>
 <aXe2QhzL4DoVbesQ@devvm11784.nha0.facebook.com>
 <20260126173124.1f0bb98e@kernel.org> <aXhUfC7ZyYge1jti@mini-arch>
 <CAKB00G3p9_VUTEW_KQvS1JAd+Ju_pjrU5r-v_p+K8Y=vH__mTQ@mail.gmail.com>
 <c37ae03d-2b0e-4179-ac22-7d0c01ff601d@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <c37ae03d-2b0e-4179-ac22-7d0c01ff601d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/30/26 4:13 AM, Pavel Begunkov wrote:
> On 1/27/26 06:48, Bobby Eshleman wrote:
>> On Mon, Jan 26, 2026 at 10:00?PM Stanislav Fomichev
>> <stfomichev@gmail.com> wrote:
>>>
>>> On 01/26, Jakub Kicinski wrote:
>>>> On Mon, 26 Jan 2026 10:45:22 -0800 Bobby Eshleman wrote:
>>>>> I'm onboard with improving what we have since it helps all of us
>>>>> currently using this API, though I'm not opposed to discussing a
>>>>> redesign in another thread/RFC. I do see the attraction to locating the
>>>>> core logic in one place and possibly reducing some complexity around
>>>>> socket/binding relationships.
>>>>>
>>>>> FWIW regarding nl, I do see it supports rtnl lock-free operations via
>>>>> '62256f98f244 rtnetlink: add RTNL_FLAG_DOIT_UNLOCKED' and routing was
>>>>> recently made lockless with that. I don't see / know of any fast path
>>>>> precedent. I'm aware there are some things I'm not sure about being
>>>>> relevant performance-wise, like hitting skb alloc an additional time
>>>>> every release batch. I'd want to do some minimal latency comparisons
>>>>> between that path and sockopt before diving head-first.
>>>>
>>>> FTR I'm not really pushing Netlink specifically, it may work it
>>>> may not. Perhaps some other ioctl-y thing exists. Just in general
>>>> setsockopt() on a specific socket feels increasingly awkward for
>>>> buffer flow. Maybe y'all disagree.
>>>>
>>>> I thought I'd clarify since I may be seen as "Mr Netlink Everywhere" :)
>>>
>>>  From my side, if we do a completely new uapi, my preference would be on
>>> an af_xdp like mapped rings (presumably on a netlink socket?) to completely
>>> avoid the user-kernel copies.
>>
>> I second liking that approach. No put_cmsg() and or token alloc
>> overhead (both jump up in my profiling).
> 
> Hmm, makes me wonder why not use zcrx instead of reinventing it? It

Was thinking the same throughout most of this later discussion... We
already have an API for this.

-- 
Jens Axboe
