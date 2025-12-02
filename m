Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B13266568
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764689809; cv=none; b=kDyJS9VUxnh+VpMmjqGefF8E5LDtZxTjqGMdjEg1D29bO84klT0jOuXRj9O1cW8+YqelgAjYsyPzBuUN9AzGUFnaE4wkt7MRmCEOrmelNYNyRP/fpsWEnaOpF4d4c+DIla+08HxYe8UFMxBzuSsOkmMWXYqvKCQixjtdKWe9knI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764689809; c=relaxed/simple;
	bh=Db+OBahDEdS2FWtuRKdcfD0E3xT8MskdpMGxiZaWAN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aij59Q2rnr12rwL623z5WHCd+3SMfQidNk6QXU82dzEW4VvOa8RdjO8xPSGDDWMWgEPv7rJB1CjCTHWi1FaO3PnOL6y66bWGRgMOWRrPC5Xr19yp8IMu1blWN5T6RCrqqRnSMqtZ/O/q5OGR5Bsiw9kU27uJv5AKIZwGpGoxCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUjJGrVq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUjJGrVq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7ade456b6abso4502991b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 07:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764689805; x=1765294605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5I8W9mCKKh4ntYi6nw19VUMXjIpYmpQtM91U31imtE=;
        b=EUjJGrVqqUAA8XrB78BW77prLUhGARskIj14+xP8ONvYeAu5udfSqREZlvsOhzxJXr
         hE1zkIC1UjsHIKDyrckOvczoZH0OZD7MiGkmZtXbjZ5b+1fxfAZKdey1+pXJPkTTuC8z
         JxTEEoD90zZ7c/HPUpWZ8E86bgib3NMnLmce+4WsK+Fbn2UgTFi8Kg2CSNK0T7acShlJ
         V8KF9jBUPp8V1IO4GcUL6BGD5tAPghCHn8OBUTyeUvHiOxzY90pT+xv3ocTRf4pVlpU0
         RPqFQlYo2sv+om0+OMQYussUdBlqcCor0mQYS6ZA+v/GRumVWJUwr5NpTeKf2DE3cUGx
         qLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764689805; x=1765294605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5I8W9mCKKh4ntYi6nw19VUMXjIpYmpQtM91U31imtE=;
        b=w5v07Mwa69DAQCKyJRfOIPNDtOgamQcdx+VkXg3E0u693n9UDnCUv+LgBo0f7YlvWT
         WCVBN3HfVr9K5aSmymOWsTO9yfBUuiDoLe9leJ2Qxad1q5qjQ5iZKBN68FxcApqERApA
         2NRZOuP8DTWuhLaWteu78kkoUmAaUPT/2Pp3CmtswnmboNjQwBnSsVYr91DmrwQEt2qv
         mkdoIZ+aci5cGVcnSU8JTJof4LHVoIGdm799TYcDaDGJm8kn9LEpZ8puzIMrSD7zS01G
         LbY1fH5X1MOGLDVDoP4mEoQOT+wrdvtJZ0qQph4pYhnyLY9uPZrmTQnarO4eV09iWjfR
         vYsA==
X-Forwarded-Encrypted: i=1; AJvYcCXdPHOppFlvUhTkTMSTmKWCEmLOOnOxYEgxelQRvSHLXg7ssCN4JlZKwlZRAoGwdfuEaCvBjjHkaMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfkI7yu+2fx3ZIcCnL8py+EUqhgg8P2CWwHeFl2jCXNp9AqqhW
	5KuNVpFQWkPB5OaNUkqUbGfgecA0Rr2JVReTuwe5AFCdononxYgfS9i5
X-Gm-Gg: ASbGncsYoO0tQssFX2/ZykbvIKrBlD8VFh+6J1RIKEqiLCtrbOipUCYLbbXWoFa16KE
	fpuWOIECMM2Iu46gKCSpLFQsqG/qVF6CTCg8GZEkPJqb6Pey8OQsqncctyc7OMk1oal/iXZB0ge
	BAvP6/7VeX51gF4HtxzOYq1R7g30coy74D6sU1lIWfTzCc2BdSQRgtRdCiIp4aC2AFaesVVi3Sg
	Bo9U8QzmrBZHQ64KJUS7pkKIC2zdnp+klxLTiwE+0RNhI3BgWyDWwCNOIh47uOLrJKShHxiQR6u
	sAW+u4523IxSF/7hoWmqDLXeCrER3FdBHabLJ/N7frL40MB392IvR678EA008QySwtSUaeTBtQ2
	7b7xJP+wRlWg1vgyfk8KchrAOGfvKuZ7tkfjLpY9sB/tVHssj6K4HeUGKURu1ThVr/P8OMtpusN
	DIb6Ob0b7CTp3CcUBRyV/V/g9m4NxtL/Wnc59+1o0s7Y5bSEoW0aChJsR4hrGe9ptlCgm5n/7Pu
	Ut3yR8IWwg8BOr9+GoriIMcdj07D4D8nBh5YpetfZiXT7SoSLQiHzDnkQ==
X-Google-Smtp-Source: AGHT+IGO0QrCd54Wl9B5liFX1HiSQC6tv9OYtUHS1BvuOAQRQdtSamONXdsxZaJpelkWSRGSbiFnog==
X-Received: by 2002:a05:6a20:939d:b0:342:9cb7:64a3 with SMTP id adf61e73a8af0-36150ef868fmr43973180637.34.1764689805255;
        Tue, 02 Dec 2025 07:36:45 -0800 (PST)
Received: from [192.168.1.133] (50.2.111.219.st.bbexcite.jp. [219.111.2.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb1486asm17290721b3a.61.2025.12.02.07.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 07:36:44 -0800 (PST)
Message-ID: <939d12e3-550d-44b7-8968-b09755b61bab@gmail.com>
Date: Tue, 2 Dec 2025 15:36:39 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 0/9] Add support for providers with large rx
 buffer
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Shuah Khan
 <shuah@kernel.org>, Mina Almasry <almasrymina@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Yue Haibing <yuehaibing@huawei.com>,
 David Wei <dw@davidwei.uk>, Haiyue Wang <haiyuewa@163.com>,
 Jens Axboe <axboe@kernel.dk>, Joe Damato <jdamato@fastly.com>,
 Simon Horman <horms@kernel.org>, Vishwanath Seshagiri <vishs@fb.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 io-uring@vger.kernel.org, dtatulea@nvidia.com
References: <cover.1764542851.git.asml.silence@gmail.com>
 <743e8c49-8683-46b7-8a8f-38b5ec36906a@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <743e8c49-8683-46b7-8a8f-38b5ec36906a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/25 14:44, Paolo Abeni wrote:
> On 12/1/25 12:35 AM, Pavel Begunkov wrote:
>> Note: it's net/ only bits and doesn't include changes, which shoulf be
>> merged separately and are posted separately. The full branch for
>> convenience is at [1], and the patch is here:
>>
>> https://lore.kernel.org/io-uring/7486ab32e99be1f614b3ef8d0e9bc77015b173f7.1764265323.git.asml.silence@gmail.com
>>
>> Many modern NICs support configurable receive buffer lengths, and zcrx and
>> memory providers can use buffers larger than 4K/PAGE_SIZE on x86 to improve
>> performance. When paired with hw-gro larger rx buffer sizes can drastically
>> reduce the number of buffers traversing the stack and save a lot of processing
>> time. It also allows to give to users larger contiguous chunks of data. The
>> idea was first floated around by Saeed during netdev conf 2024 and was
>> asked about by a few folks.
>>
>> Single stream benchmarks showed up to ~30% CPU util improvement.
>> E.g. comparison for 4K vs 32K buffers using a 200Gbit NIC:
>>
>> packets=23987040 (MB=2745098), rps=199559 (MB/s=22837)
>> CPU    %usr   %nice    %sys %iowait    %irq   %soft   %idle
>>    0    1.53    0.00   27.78    2.72    1.31   66.45    0.22
>> packets=24078368 (MB=2755550), rps=200319 (MB/s=22924)
>> CPU    %usr   %nice    %sys %iowait    %irq   %soft   %idle
>>    0    0.69    0.00    8.26   31.65    1.83   57.00    0.57
>>
>> This series adds net infrastructure for memory providers configuring
>> the size and implements it for bnxt. It's an opt-in feature for drivers,
>> they should advertise support for the parameter in the qops and must check
>> if the hardware supports the given size. It's limited to memory providers
>> as it drastically simplifies implementation. It doesn't affect the fast
>> path zcrx uAPI, and the sizes is defined in zcrx terms, which allows it
>> to be flexible and adjusted in the future, see Patch 8 for details.
>>
>> A liburing example can be found at [2]
>>
>> full branch:
>> [1] https://github.com/isilence/linux.git zcrx/large-buffers-v7
>> Liburing example:
>> [2] https://github.com/isilence/liburing.git zcrx/rx-buf-len
> 
> Dump question, hoping someone could answer in a very short time...
> 
> Differently from previous revisions, this is not a PR, just a plain
> patch series - that in turn may cause duplicate commits when applied on
> different trees.
> 
> Is the above intentional? why?

It was based on linus-rc* before and getting merged nice and clean,
now there is a small conflict. In my view, it should either be a
separate pull to Linus that depends on the net+io_uring trees if
Jens would be willing to orchestrate that, or I'll just merge the
leftover io_uring patch for-6.20. In either case, this set shouldn't
get applied to any other tree directly.

-- 
Pavel Begunkov

