Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8572054E0
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505952; cv=none; b=B5kRui3aXIBRwchnq2LNcCjb6sWQqc8vDtDUlPToz6RDE1+4oxTflfn+wxdrFiIMqlLRFzhYeMWfyIC6j7eFqpIoVbgKMSsWHzymht17Ena6PeD9Ms7DIVdF9mezpvvAOe3luzCeL4BCZqhUBKUyYg6vULqaBpHK8U1zfGupBQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505952; c=relaxed/simple;
	bh=xwTt7EqwBQG9jsW/MlOAUi0BI8IrI3gTou3huVPPuY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S04BBJ5Tl1ISdIrAHABgqAWXqUT/X64UachgnJdt386AQ1Ja5J3rjdxL0qqtmMpFq0bkGW+McEbx/QGt9lh7QsPj6lYi0kJp9Dpvx6m+O7XT00wTwQKH8ce2tecatnSbf8mjV95xCxGpPBUZ12sDAQOpQIv+u+/XH+789cI5CRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=p+9k1nB1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="p+9k1nB1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21661be2c2dso29269625ad.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 02:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736505950; x=1737110750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsqFmJrwySuAsgeQ23Hdp8zYfHgcqjGeQVThq/MnWD0=;
        b=p+9k1nB1y1wLV4WAMd6GxCzPpVGINnfcjx4nS24pw7fZ/hn3Ly9tYIkV5IySy0AbyK
         aOXcSz4wHFF9tbEmM93KdWsCVwG5WqVjTyWSOk65sD/ojHlm9ICq09k1pWkhKAleJW2Y
         GTpwiuoMSgAUOr/YqrhWk0gdTtaC6LTn5HtGSjUDFQo8I1HMsLOeti+9umCaqx44hAZc
         QTyJXAhs//a1i3RM15mcLV/fA+lMeyVQITdrIQtXuahzFtoXTgRyQ4kghTD5jz7Z9KMq
         0wMQx+ee12Ua1YNIKaehndgJ07Kvrs3dmjzDAheUSpLTmyVK9vJRpmy333GkrjNXUT/F
         IiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505950; x=1737110750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsqFmJrwySuAsgeQ23Hdp8zYfHgcqjGeQVThq/MnWD0=;
        b=NwO6iZRLNBazbCjsiJ1pBRFGZYphOpYn1TUq+WncirY/quMEtlpToTFAkqg+tWrbtl
         jIxPPlUxCEbxtuyKzV9andVfHTOstXSgCjYVL1urOISbmPeYTA3uZr677gBTfox0bvKW
         n/YEVq0+Rb6dC88e8xAsKoNQiOeAAKChh+pZxQc1n6lK8cp+3bX6/XCgtoKUgJlfw3sa
         4/uDa+C6rAAg6nnY5xTY3qPaPRBrdqfey20Fw+OsPvWRTUqNycr5C60rkx4pDDz5H21t
         XHFLweKK0Fa7qFRVQOSZtqZ0fTqekL2GYXRC8aYobRomBWxlD169AtaMmoq7wLeRFI3x
         9fzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3FRihszohLil5w9Yf0H3cROavUtJ/OUSVOD+5Viot9S9u7Qd5ljYR8Qq1zdLKkeRjNjLlqnbfwro=@vger.kernel.org
X-Gm-Message-State: AOJu0YydNGUYoKCoONBiLkTMLYGRR71Hp9THw/60uFPcp8OMyw6aEJ9V
	0+oDa26YE6p4T4CcqOg80WC4wju8TSt6Vp9Qi4nfwKDW3JmSyqBrGfHIYfzlPfo=
X-Gm-Gg: ASbGncsdoNgxTjTtSKpHisO1roL7SOXKh2QyT2s/t6JiZfgKtQ4Rzh6Kx5dj1vie4LZ
	T8FzjT7N0GlQshJ35KCQn2/YF06siRAz2YTpdjFWWkwUIAJcIFAsA8KATbWSzEahRenHaX6wpPW
	U98bM8G/GQCRLAt5gy/2PxWHJJjDhfgAo7bLNIcazWhBRsGy1UCzWZ2MKI4O4WjiL9UaQN4X3ac
	k0OKOz+SvmZ4WwKZkdU0Q8YD2LiEoeOeMp/cZyipjUFMrbzzXha90/alynITDFU6PI=
X-Google-Smtp-Source: AGHT+IFPsdQcQ1JqLrS7hF+DlyZPpDcSA6WD6jF46cfVg9u5bIjzxZ5xlWPHe2yN4Ld9eivHDLICVA==
X-Received: by 2002:a17:902:ecc5:b0:216:7cbf:9500 with SMTP id d9443c01a7336-21a83f36df7mr150799945ad.6.1736505950548;
        Fri, 10 Jan 2025 02:45:50 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e0dfsm11714655ad.41.2025.01.10.02.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:45:50 -0800 (PST)
Message-ID: <3a5001b5-9a07-4dfd-8cec-1e5f7180b88a@daynix.com>
Date: Fri, 10 Jan 2025 19:45:44 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tun: Pad virtio header with zero
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jason Wang <jasowang@redhat.com>,
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
 <20250109-tun-v2-2-388d7d5a287a@daynix.com>
 <20250109023056-mutt-send-email-mst@kernel.org>
 <571a2d61-5fbe-4e49-b4d1-6bf0c7604a57@daynix.com>
 <677fc517b7b6e_362bc12945@willemb.c.googlers.com.notmuch>
 <5e193a94-8f5a-4a2a-b4c4-3206c21c0b63@daynix.com>
 <20250110033306-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250110033306-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/01/10 17:33, Michael S. Tsirkin wrote:
> On Fri, Jan 10, 2025 at 01:38:06PM +0900, Akihiko Odaki wrote:
>> On 2025/01/09 21:46, Willem de Bruijn wrote:
>>> Akihiko Odaki wrote:
>>>> On 2025/01/09 16:31, Michael S. Tsirkin wrote:
>>>>> On Thu, Jan 09, 2025 at 03:58:44PM +0900, Akihiko Odaki wrote:
>>>>>> tun used to simply advance iov_iter when it needs to pad virtio header,
>>>>>> which leaves the garbage in the buffer as is. This is especially
>>>>>> problematic when tun starts to allow enabling the hash reporting
>>>>>> feature; even if the feature is enabled, the packet may lack a hash
>>>>>> value and may contain a hole in the virtio header because the packet
>>>>>> arrived before the feature gets enabled or does not contain the
>>>>>> header fields to be hashed. If the hole is not filled with zero, it is
>>>>>> impossible to tell if the packet lacks a hash value.
>>>
>>> Zero is a valid hash value, so cannot be used as an indication that
>>> hashing is inactive.
>>
>> Zeroing will initialize the hash_report field to
>> VIRTIO_NET_HASH_REPORT_NONE, which tells it does not have a hash value.
>>
>>>
>>>>>> In theory, a user of tun can fill the buffer with zero before calling
>>>>>> read() to avoid such a problem, but leaving the garbage in the buffer is
>>>>>> awkward anyway so fill the buffer in tun.
>>>>>>
>>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>
>>>>> But if the user did it, you have just overwritten his value,
>>>>> did you not?
>>>>
>>>> Yes. but that means the user expects some part of buffer is not filled
>>>> after read() or recvmsg(). I'm a bit worried that not filling the buffer
>>>> may break assumptions others (especially the filesystem and socket
>>>> infrastructures in the kernel) may have.
>>>
>>> If this is user memory that is ignored by the kernel, just reflected
>>> back, then there is no need in general to zero it. There are many such
>>> instances, also in msg_control.
>>
>> More specifically, is there any instance of recvmsg() implementation which
>> returns N and does not fill the complete N bytes of msg_iter?
> 
> The one in tun. It was a silly idea but it has been here for years now.

Except tun. If there is such an example of recvmsg() implementation and 
it is not accidental and people have agreed to keep it functioning, we 
can confidently say this construct is safe without fearing pushback from 
people maintaining filesystem/networking infrastructure. Ultimately I 
want those people decide if this can be supported for the future or not.

> 
> 
>>>
>>> If not zeroing leads to ambiguity with the new feature, that would be
>>> a reason to add it -- it is always safe to do so.
>>>> If we are really confident that it will not cause problems, this
>>>> behavior can be opt-in based on a flag or we can just write some
>>>> documentation warning userspace programmers to initialize the buffer.
> 

