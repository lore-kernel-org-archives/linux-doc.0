Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1020550A
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507554; cv=none; b=plV+33CwNTFSdAPt1lEdNwHhstUpMt9aZ3VDPddNkWStFlQWSY48XH1h7B8j4xgrCGQIcTG5WeiYoGIkWklNzqbwGSdEsMmnHn/RqovGXaWixtOh24glnSnNaVxzH7u/ykMmhPOq91dhs1A21c3KQiqQAkSz8f0TFNX7rBlk2ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507554; c=relaxed/simple;
	bh=qXSynCY96TYG7wZ7OASI5Muii12uM+aBd0x+fKz2Q64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fE82IGeDN61HGtSTUi5Nj9IpYJQU/KdKaxt6NAl0Ewh4n36N+UbtF4GXnQa7ywUrNtqOFtGOqQOm2yyhzr6UFlp81VpriavJ/rfd1XlrIKa8Bjiq8UniVTxFd5iGa4hqWQk02S1fzRBJzE/7RBDAM9JuiXCinc5boAxb6RF72K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=MwO3UGQ8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="MwO3UGQ8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2164b1f05caso32712275ad.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736507552; x=1737112352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUI/Gf/iNdZ2kON6E6PSrhEkMNvEUQIh/sL8yMhLamQ=;
        b=MwO3UGQ8TvdlcnS1Er/wPY9ota4qi9gGOgTNt7g7S6YG1L9H3gqX0ExQeXxKJnXL7X
         XeAWFpsMp3pjyvWra0SCvqOuqk/80Ss1ztp4HN27fDmWYrpuva407XWMh4/xOAEXA3KJ
         WuOh5DzuQ4gbLE0fUUS7YS/+tghLtkvK+s5eGulTypBG7qqUOlAMyYF9c7Z+TLIAXXwW
         UE9+ude3fE3mDWHLqpT9hK6iDDqMJCmdSPQ2vfvJ015wBRsVUBZDs2Tw0Jz3m2fwhswE
         9BT0HSyyEVIF8eiJ9+cOWEtoHXvBzBFnnCNhJrTMzYH6h9prUzxWAnD2O7WOPlgDTkiH
         UdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507552; x=1737112352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUI/Gf/iNdZ2kON6E6PSrhEkMNvEUQIh/sL8yMhLamQ=;
        b=Nl4jaRO/bYJDvm1QjlcTLu1TXuGCQKKg7CjbeQSd4ICvfpGNU02Z3pWsehMH0nVTqy
         cIhtZHA7giqjvZ9i1+Hg1H1tkt2fWXSKJYum7eghQjtOWn6JOMTeBvlr4q/P2p1938+h
         VNxnh7d3XbjQLp7xVmjjAqyyse3qtu6y3VwFjVFPtt9IOFYpseB1gROqwdT51Y2UZs5h
         yTMueSHqIjyxRoS8Fq539snR0jVPq3Zj6XMix1MbauPD1r5kknUZoGfLYXUf16l40Si8
         4kL1BXxuP4jlKeK4ZlSFGJorX7CSL6kfO86eFnMjQCu7mVRlVEck0IZx3ZbuftQEKmgE
         KCsA==
X-Forwarded-Encrypted: i=1; AJvYcCVhgVRAfhii56toA0H5HN68CEn5Nt9BJjCPPWZ8dNiqUTn/+AG4WMX13JoKL7oeD2kAzZ36FVt8mzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YycSyApuutA/IAPYNQcGGh3oOpw42v+hzIkEIpj7QlFD34PwTh5
	CQdrAHsxp8516O1aMN6PdC3Yp9kxpDQOvpayOCKEL5qCj/G4IZG+paLJKUkSUrI=
X-Gm-Gg: ASbGncviIyDbRqNQ12gVS/pheUk7lt3j2MT1JyCmNymeXSjWStJqiKJUkT2DJ26w+CF
	+Mk+m6YMVaq5slPCdqYCyR0pt3cMAmiUfI+YiA1ACAG3MH9SAQqJRKuZtiTEEimy/isdUau7/WZ
	NZzwRLWFLdPQ5XYsbfHyHbbRS36oT/QfU+Mhg9xiiXD8zT2m9HZ8ReooUhRwru8ED+Zzlh30q9z
	W1kCD4PcMxXa8p1zb7q7ZQUL6V4XB5sBdQ181zktPu2tWmaCfixgmBz2gFpyBeo5KA=
X-Google-Smtp-Source: AGHT+IFsisJKA6JOrR0eUj5WfV8wXSlwG+ErpDxaHPAWov6uHn2OYu5jltHENp4vvgdoL273AAhZWg==
X-Received: by 2002:a05:6a20:244d:b0:1d9:fbc:457c with SMTP id adf61e73a8af0-1e88d0a4770mr18461822637.36.1736507552500;
        Fri, 10 Jan 2025 03:12:32 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a2cfsm1373935b3a.51.2025.01.10.03.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 03:12:32 -0800 (PST)
Message-ID: <2e015ee6-8a3b-43fb-b119-e1921139c74b@daynix.com>
Date: Fri, 10 Jan 2025 20:12:25 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
 <20250110052246-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250110052246-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/01/10 19:23, Michael S. Tsirkin wrote:
> On Fri, Jan 10, 2025 at 11:27:13AM +0800, Jason Wang wrote:
>> On Thu, Jan 9, 2025 at 2:59 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>
>>> The specification says the device MUST set num_buffers to 1 if
>>> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
>>
>> Have we agreed on how to fix the spec or not?
>>
>> As I replied in the spec patch, if we just remove this "MUST", it
>> looks like we are all fine?
>>
>> Thanks
> 
> We should replace MUST with SHOULD but it is not all fine,
> ignoring SHOULD is a quality of implementation issue.
> 

Should we really replace it? It would mean that a driver conformant with 
the current specification may not be compatible with a device conformant 
with the future specification.

We are going to fix all implementations known to buggy (QEMU and Linux) 
anyway so I think it's just fine to leave that part of specification as is.
