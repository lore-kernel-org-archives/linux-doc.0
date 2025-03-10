Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A92B13A3ED
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741590291; cv=none; b=nQUZpq8XYeSoKiA8/LwV7ZzHLPUXOcqorRamjGbv4sLBfYx9Ym0hoLWhaq6eXvFvTJWIPLJpV7Io78l2mCZmxsp2sSE9IY3i53MOzSLLktyZaU5Y2vDTDFeD18S1BoSY8lIzhAwpbRnYgEVmnCZDkXi5DeRQyBv9iD6LXluzr3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741590291; c=relaxed/simple;
	bh=eSw/Sz1ql/4UPcLEbJRVUH0uYPxF2xmC0A18fnAZuI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cphCv3Bp2hr3jc5G/KH6VNrkMQ/yi9TflgBCKgCnJyxyz39Cp4yvVI92Gz2AhnIOZ3yZloD/SV9EIs0PTlLYbzyDU5trWM0mNUaFLHR0UCcWTBSZbzbnixfoXoIP2Xd016BR+fQ+3JK5VJfVTlIyufoBldj4RtqRY+drdIYBtLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=QZRBYT7/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="QZRBYT7/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2234e4b079cso65467395ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741590288; x=1742195088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4zUjmNxjokxBeO8EjZH90AMO+cgLdiVs95Lgo++StE=;
        b=QZRBYT7/pUx1N5WjjIh58q+/IinjLV3aq0UR9zGCTNxVna0gfBnE9gUO8W4GuVM9KA
         aXu0TGNLBTvShFK8ky5kFa+mBCVnbzcSPm6vG9pdeZNO3EyOZ4DBu0fksbpXqnIhuwNL
         xEsrLyqVKi+jnkBwXgx5FsdLc7LEKJkinZtQGEHh9kZd3bkFzQI+gKlwnuQEg5BQkvkX
         HxCDTgg0yUZJOLlF8ic1Bi2VoU4YMXRfO9wYbI5HdOdHcSk6mPFQ+UqIAtysplhtjrP8
         XVw77g1RD0BBt3zcQosaTS1XIvITQ01qguj0TkwT+IoPolx2Hr1pDl6gbOH9qtQMrkr2
         DbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741590288; x=1742195088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4zUjmNxjokxBeO8EjZH90AMO+cgLdiVs95Lgo++StE=;
        b=UAGpUni7194Ly82dCBr9Zen//TEJ4T0qOYqaXsMN05nb4BbEy2GABEHpo94haQJ402
         hful/4qSIjVx/rxrlMbEXKxmJxJux2noiUutZL712VDQqfES8o52UvBIOQ764AA/8GpJ
         PKy/aqe4WXPnH72TS9cBdBe0F1teMrqud2oofw+Hq2tNsfXtOb0FISjQQAvMJ4ozNMEY
         sa+h/iejib/jNYntgRF3yEzDbZjovPF8HbA48u6LAWxHfUZrd19BCZ3AIpPoZ91rWfWW
         OBv0PPCeAKNDyL/IeTSwaHHqrBxhVz1/R3qZwuLL4zyEoi8grC776BTP0/sBHyqd5EfO
         R8tw==
X-Forwarded-Encrypted: i=1; AJvYcCUpj/PRQCHttQTbAyljpuBpB5SU7F5eHxOC2URv/wL9QSVV+xGhd8MrGsXJkzceAg8fXBpCjByeFu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdn0aPS261Pz0ucrzK2Gj49l0/OXRZV+7fRF9rGPbgSJmy3pbT
	ZH/ICRlVgL+fywQ4gKzQbXWYs0rgqBnycCaUlwziEfnoqX7jDyhrEAF7H/iYEfk=
X-Gm-Gg: ASbGncsLU/ePW8+Ll25kdUg0619sTqr3chYuZLO8zdgef0/yVf8/66lVrz0fHTUyav9
	S8Kb+KYt0tiOdD+Ylb3xyEyU6sxskpYBkjRH/VnJd4n8H8B12fn7FMb1oR8tWGIG5CVxU2crxtA
	CLx5Mu32Ey1DVjnr9reS1jYRv2zHpELKctFdACKqsUr6CqVoZK7DIIN5EsuzjABAkOd68um2gRt
	3AUmx7y2EKkT9Rm1ojBoEU+Xd7dkp99Pn0Hvs2QBuSDDMqFo5sNGMh8bByBk34F99365jPSEcQo
	BJXRKF6HK9PNuIbFaWch+qqXce6jd1ZL6mmfKXrY5D6GVRBRvxpxsHYfdA==
X-Google-Smtp-Source: AGHT+IFkDjhIOqYcqagzT94jgytjjwhSIQTT2o6zqPzPIQtmCm+lioqyAyJhjHPUINzm2ba//BDswA==
X-Received: by 2002:a17:902:ea07:b0:224:a79:5fe4 with SMTP id d9443c01a7336-2242888681cmr196310675ad.2.1741590288383;
        Mon, 10 Mar 2025 00:04:48 -0700 (PDT)
Received: from [157.82.205.237] ([157.82.205.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f93esm70081685ad.142.2025.03.10.00.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 00:04:48 -0700 (PDT)
Message-ID: <2e550452-a716-4c3f-9d5a-3882d2c9912a@daynix.com>
Date: Mon, 10 Mar 2025 16:04:43 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] vhost/net: Support
 VIRTIO_NET_F_HASH_REPORT
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
References: <20250307-rss-v9-0-df76624025eb@daynix.com>
 <20250307-rss-v9-6-df76624025eb@daynix.com>
 <CACGkMEuccQ6ah-aZ3tcW1VRuetEoPA_NaLxLT+9fb0uAab8Agg@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEuccQ6ah-aZ3tcW1VRuetEoPA_NaLxLT+9fb0uAab8Agg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/03/10 13:43, Jason Wang wrote:
> On Fri, Mar 7, 2025 at 7:02 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated on the
>> host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report no
>> hash values (i.e., the hash_report member is always set to
>> VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by the
>> underlying socket will be reported.
>>
>> VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Tested-by: Lei Yang <leiyang@redhat.com>
>> ---
>>   drivers/vhost/net.c | 49 +++++++++++++++++++++++++++++--------------------
>>   1 file changed, 29 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
>> index b9b9e9d40951856d881d77ac74331d914473cd56..16b241b44f89820a42c302f3586ea6bb5e0d4289 100644
>> --- a/drivers/vhost/net.c
>> +++ b/drivers/vhost/net.c
>> @@ -73,6 +73,7 @@ enum {
>>          VHOST_NET_FEATURES = VHOST_FEATURES |
>>                           (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
>>                           (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
>> +                        (1ULL << VIRTIO_NET_F_HASH_REPORT) |
>>                           (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
>>                           (1ULL << VIRTIO_F_RING_RESET)
>>   };
>> @@ -1097,9 +1098,11 @@ static void handle_rx(struct vhost_net *net)
>>                  .msg_controllen = 0,
>>                  .msg_flags = MSG_DONTWAIT,
>>          };
>> -       struct virtio_net_hdr hdr = {
>> -               .flags = 0,
>> -               .gso_type = VIRTIO_NET_HDR_GSO_NONE
>> +       struct virtio_net_hdr_v1_hash hdr = {
>> +               .hdr = {
>> +                       .flags = 0,
>> +                       .gso_type = VIRTIO_NET_HDR_GSO_NONE
>> +               }
>>          };
>>          size_t total_len = 0;
>>          int err, mergeable;
>> @@ -1110,7 +1113,6 @@ static void handle_rx(struct vhost_net *net)
>>          bool set_num_buffers;
>>          struct socket *sock;
>>          struct iov_iter fixup;
>> -       __virtio16 num_buffers;
>>          int recv_pkts = 0;
>>
>>          mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_RX);
>> @@ -1191,30 +1193,30 @@ static void handle_rx(struct vhost_net *net)
>>                          vhost_discard_vq_desc(vq, headcount);
>>                          continue;
>>                  }
>> +               hdr.hdr.num_buffers = cpu_to_vhost16(vq, headcount);
>>                  /* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
>>                  if (unlikely(vhost_hlen)) {
>> -                       if (copy_to_iter(&hdr, sizeof(hdr),
>> -                                        &fixup) != sizeof(hdr)) {
>> +                       if (copy_to_iter(&hdr, vhost_hlen,
>> +                                        &fixup) != vhost_hlen) {
>>                                  vq_err(vq, "Unable to write vnet_hdr "
>>                                         "at addr %p\n", vq->iov->iov_base);
>>                                  goto out;
> 
> Is this an "issue" specific to RSS/HASH? If it's not, we need a separate patch.
> 
> Honestly, I'm not sure if it's too late to fix this.

There is nothing wrong with the current implementation. The current 
implementation fills the header with zero except num_buffers, which it 
fills some real value. This functionality is working fine with 
VIRTIO_NET_F_MRG_RXBUF and VIRTIO_F_VERSION_1, which change the header size.

Now I'm adding VIRTIO_NET_F_HASH_REPORT and it adds the hash_report 
field, which also needs to be initialized with zero, so I'm making sure 
vhost_net will also initialize it.

Regards,
Akihiko Odaki

> 
> Others look fine.
> 
> Thanks
> 

