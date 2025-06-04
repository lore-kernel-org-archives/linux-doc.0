Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99A2376E4
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749021890; cv=none; b=PbLs/0xpRAfmd2rbeS5F751FR4v5WZ+OSeGh0zzCZ2BXB51KNFlghk6nL1jeiR89Ahv5bqNLEXEjBWkoe41mtyzSTgO0KWKGsm4XRIoIClZKnco+RvB6p3c2M8IFrhadSeOrq1uU6GzlEHq6Oo0LY21MJ9xmVJyr3RxZ18v8WUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749021890; c=relaxed/simple;
	bh=eJaM9PF91eHJBG8Hc+d7PGAX8a/KIWNyoS3YQxQ6GVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3KtmHpIDQFp/HMvkm62uReRh7to96ezGdwN+ebydtfRD6LNMK6XMsnrntXSQj5z0o9KhrO/wRjPZSnIneBLuPVohZFruCcQoJMU6XwlRH6P/0c5f71G+XM9mfA/m7BrC679+AINK7xqX6fLWtiHxiFjZXgZdUmMOtgFgiML4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=ktpO+2cZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="ktpO+2cZ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so3387403a12.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1749021888; x=1749626688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtGbzLUDxU2IB9qPjKURq38VfX8ZCpDlPYi0PWx3MpY=;
        b=ktpO+2cZ3s8p7tfhy9ELVkKdk/xSniXFRRelWOEdFg0wPZ4Kwb9xZXmIRUkubTIP7l
         2TzQZk6SwGnnUesNwOPjxD5RFupY84UNFqHi+YSuHdYrbIQxDlKEMMFgiLoRCWP6wl2a
         ImxS/klFMWYaRglpqEKcKOZQa1hS5bv1S9tfWPadOi9AkAkia8N6YCNN9hbaaHHcCcFE
         rhp0OiyvloswvQXlUw4BW5MtZOFC4G1BDVLd7h32EP5YpaS7t/JGctxM7WJ+zSNF502S
         5uHgvcOQShcsX8Merrk8GvbW+hQ8Nka1batBN2LUFCiDtD1D7tX2cwp1gZ0kl0pK9byD
         YPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749021888; x=1749626688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtGbzLUDxU2IB9qPjKURq38VfX8ZCpDlPYi0PWx3MpY=;
        b=eaux6t39m6541oXrt6ptyEEvT35TAk2iDdBeKTNmZiKq0JVPuSL7nOPUR+pY5Q/XRE
         WxZOkBXqmZCd+9SX1s8idVWAPyHgfnDaOKFLXKu5ClXb7F2Y2ZlcYihSVk2QRIlDit7A
         J83PFvF1Ult2m3OAd6zZKeCb+ezJiVrlqdYM7r1Mv7b9lzwsiyVzJJSypR/DxvAENhCc
         qZtYLBg7dvfBVDp0n/mB37v27kqw0E09PRbmTSDSykt5hQgULxXXF3xY84bRvPYyppxG
         g3hO7/Mh3tszs26crRt/bnKCNbMHVIve3BlKScEWdjTSvzPeI4CYuGicnFnJsBtiVUJx
         xZhw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ymO/+NRgqs6ry9zg+vJqREPXTyN0D5z2f2/OFAOmMSGzPiTcSsQcwxx6VKQwiVUQh29p68M+JFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHKcJukvr78R9kApzBZjJEcyqFWOhD1bdOs9NRdgEiDT7OSNX
	ZXf5VhppRwsGcP5fddbZhioC6QHeEPALHUeLAKDy5p1r2X6l86y2lnImgRYYuF/YjfYZXE9GRUt
	iT1f0
X-Gm-Gg: ASbGnctR9EQ6IUOym3W59rgDGt5mvrlLfx7OXci+KNu0TohE+Q5MnN9uMAXvUkaG/5O
	ju6JNJ4ObKqby1xbMQ2xLSfvuZyPuEvO3Ch1ZMQbnxCp0eSJ+fVvmHemQB0CVWdhOZJqwacWUbc
	PL1EU4pt0y99g2v0Sk2D/J4cEVsMLtUYoRNns7cYnTAzhAMoSDRMoKeyZJGaYyoY6Yb+OeZDJ88
	S01ZCWvYGTQAZAEN1PCc8qXnLDDJXkjVZh3yTgBHZihTkWEIKVaqvyBAi8/kHQUpAEpreFz3uDk
	ExnIPsLP7fLNOsJHuRCjWQeNPTrRS1SowyPvDgcf2ZcpJEyHK6ryvkI7J4/098I1
X-Google-Smtp-Source: AGHT+IHXDTL1GYPRjqoXaAf0lXb/mQXNX5irqPQDyrCtJl+J8aEBhNquD8+cbiWqUJBWAylgDPuoqQ==
X-Received: by 2002:a05:6a20:6a03:b0:216:1c88:df46 with SMTP id adf61e73a8af0-21d22909953mr3036667637.0.1749021887895;
        Wed, 04 Jun 2025 00:24:47 -0700 (PDT)
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd478bsm10590024b3a.155.2025.06.04.00.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:24:47 -0700 (PDT)
Message-ID: <517d5838-3313-4b31-b96d-d471b062cd1a@daynix.com>
Date: Wed, 4 Jun 2025 16:24:42 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 03/10] tun: Allow steering eBPF program to
 fall back
To: Jason Wang <jasowang@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
References: <20250530-rss-v12-0-95d8b348de91@daynix.com>
 <20250530-rss-v12-3-95d8b348de91@daynix.com>
 <CACGkMEvVf0LrquZcWSv3vp-r44sTj0ZDnjwbwB20N0aU35+vxw@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEvVf0LrquZcWSv3vp-r44sTj0ZDnjwbwB20N0aU35+vxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/06/04 10:27, Jason Wang wrote:
> On Fri, May 30, 2025 at 12:50 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> This clarifies a steering eBPF program takes precedence over the other
>> steering algorithms.
> 
> Let's give an example on the use case for this.
> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   Documentation/networking/tuntap.rst |  7 +++++++
>>   drivers/net/tun.c                   | 28 +++++++++++++++++-----------
>>   include/uapi/linux/if_tun.h         |  9 +++++++++
>>   3 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/networking/tuntap.rst b/Documentation/networking/tuntap.rst
>> index 4d7087f727be..86b4ae8caa8a 100644
>> --- a/Documentation/networking/tuntap.rst
>> +++ b/Documentation/networking/tuntap.rst
>> @@ -206,6 +206,13 @@ enable is true we enable it, otherwise we disable it::
>>         return ioctl(fd, TUNSETQUEUE, (void *)&ifr);
>>     }
>>
>> +3.4 Reference
>> +-------------
>> +
>> +``linux/if_tun.h`` defines the interface described below:
>> +
>> +.. kernel-doc:: include/uapi/linux/if_tun.h
>> +
>>   Universal TUN/TAP device driver Frequently Asked Question
>>   =========================================================
>>
>> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
>> index d8f4d3e996a7..9133ab9ed3f5 100644
>> --- a/drivers/net/tun.c
>> +++ b/drivers/net/tun.c
>> @@ -476,21 +476,29 @@ static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buff *skb)
>>          return txq;
>>   }
>>
>> -static u16 tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff *skb)
>> +static bool tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff *skb,
>> +                                 u16 *ret)
>>   {
>>          struct tun_prog *prog;
>>          u32 numqueues;
>> -       u16 ret = 0;
>> +       u32 prog_ret;
>> +
>> +       prog = rcu_dereference(tun->steering_prog);
>> +       if (!prog)
>> +               return false;
>>
>>          numqueues = READ_ONCE(tun->numqueues);
>> -       if (!numqueues)
>> -               return 0;
>> +       if (!numqueues) {
>> +               *ret = 0;
>> +               return true;
>> +       }
>>
>> -       prog = rcu_dereference(tun->steering_prog);
>> -       if (prog)
>> -               ret = bpf_prog_run_clear_cb(prog->prog, skb);
>> +       prog_ret = bpf_prog_run_clear_cb(prog->prog, skb);
>> +       if (prog_ret == TUN_STEERINGEBPF_FALLBACK)
>> +               return false;
> 
> This seems to break the uAPI. So I think we need a new ioctl to enable
> the behaviour

I assumed it is fine to repurpose one of the 32-bit integer values since 
32-bit integer is too big to specify the queue number, but it may not be 
fine. I don't have a concrete use case either.

Perhaps it is safer to note that TUNSETSTEERINGEBPF takes precedence 
over TUNSETVNETRSS to allow such an extension in the future (but without 
implementing one now).

> 
>>
>> -       return ret % numqueues;
>> +       *ret = (u16)prog_ret % numqueues;
>> +       return true;
>>   }
>>
>>   static u16 tun_select_queue(struct net_device *dev, struct sk_buff *skb,
>> @@ -500,9 +508,7 @@ static u16 tun_select_queue(struct net_device *dev, struct sk_buff *skb,
>>          u16 ret;
>>
>>          rcu_read_lock();
>> -       if (rcu_dereference(tun->steering_prog))
>> -               ret = tun_ebpf_select_queue(tun, skb);
>> -       else
>> +       if (!tun_ebpf_select_queue(tun, skb, &ret))
>>                  ret = tun_automq_select_queue(tun, skb);
>>          rcu_read_unlock();
>>
>> diff --git a/include/uapi/linux/if_tun.h b/include/uapi/linux/if_tun.h
>> index 287cdc81c939..980de74724fc 100644
>> --- a/include/uapi/linux/if_tun.h
>> +++ b/include/uapi/linux/if_tun.h
>> @@ -115,4 +115,13 @@ struct tun_filter {
>>          __u8   addr[][ETH_ALEN];
>>   };
>>
>> +/**
>> + * define TUN_STEERINGEBPF_FALLBACK - A steering eBPF return value to fall back
>> + *
>> + * A steering eBPF program may return this value to fall back to the steering
>> + * algorithm that should have been used if the program was not set. This allows
>> + * selectively overriding the steering decision.
>> + */
>> +#define TUN_STEERINGEBPF_FALLBACK -1
> 
> Not a native speaker, consider it works more like XDP_PASS, would it
> be better to use "TUN_STERRING_PASS"?

That sounds indeed better to me.

Regards,
Akihiko Odaki
