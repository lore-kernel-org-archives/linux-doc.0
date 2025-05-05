Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4181AAA1F
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430887; cv=none; b=NnAc4rc/sbsQPEMkLmn35gow4TtA7/eAAnTz8AUJ6sPPGbuiHso0P6a0emLZMGRGBcMKi8oj+QW1UusyxOM8Xc4d+kNHhg5/hZP+Jx1KsLsrmOZkOvFmHQEjtZ28OwgcT3sBOtXStK0sxTYWjSzO3/xgdDdigcaW7mbb1M3JR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430887; c=relaxed/simple;
	bh=/1L4VXQZnM4TVg9Q0XEcQOC1Z7dwzdgPChSwdWfL7fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnFii2df7J0Kqi0rxDSCVMoh8C730QB/q7IUpnZPakXXLy1oJxTQakMKVjXwcctlh7hNxDgtj6C05XHwsq7Yhc1U5UJr1DZwoXtFueUKlKzOX9OfrZ2910zjwF4TpZHGke6+OVlr5LAt7JYTsUHplrzgEvM3nhIKNYoetbgHX8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZrT7buTl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZrT7buTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746430884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYutuEk9tS5pMcj+KQxarlK855jenHaF07JshpvJP/c=;
	b=ZrT7buTl+wFDrp8kfzGx/yTgNQdcV1w/cSrTIEWbLhjtkdODB7V+rGuD4javMUnCQTSZFe
	GGbMCpARvnx67XouLRXnh7+98CNudADgY/k8NiTE3T5XPDMImKJUgeWiN8TPBvMtr/NfqZ
	ZZCPRl7ZaJe90u9lN1W20/7OPfTLwbc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-ES3Wb93AM_OqEQMB4YNLog-1; Mon, 05 May 2025 03:41:23 -0400
X-MC-Unique: ES3Wb93AM_OqEQMB4YNLog-1
X-Mimecast-MFC-AGG-ID: ES3Wb93AM_OqEQMB4YNLog_1746430882
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-54af314eaecso2245740e87.2
        for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 00:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746430882; x=1747035682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYutuEk9tS5pMcj+KQxarlK855jenHaF07JshpvJP/c=;
        b=lN2mwImgF8jUEEaVlc6+ZeCJzDIh4bzaxMcclmkpfey233VKeCsUajOdDKTlh9P5fi
         lSjd/JsALwg0SJN3Zq9vvygsUVSIn5VsL3Hk4ExXEmLZyFnxeU9PIhl4wqN/ZvSvirxK
         p/NcVSXTYxGbbWgt6XAtaS6wPbc6Q3LatEHfyboxwrKVsu8dBHJrz0Tn9PEeF2vSjDtm
         ZWZ1MsJHWBC/Yl2gFt1WJZsvZBqPkQdyiksLCdXTeokmwLmE4RB6U6Hylalm6MZSHwYG
         T3DMndmrUcnMcqJ9+kKOT2ZT7xBzv+rxfxenGvewSiOKU4UA5JpLra9thhoDVJ3pbo3G
         B/nA==
X-Forwarded-Encrypted: i=1; AJvYcCVtMkEjMQzwGpGgxdYcjRx9XYx/muQJysQOX5QCRDba8XnvFvoYHjv2+bLb0h4CWA9qG8XjP2giDaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznd7CLnSEYVFGJccDnNAFFuc3KUacZFlTgtfC1Z/cBV/eqJySw
	qx/xrMRRmNmArvXntEVkxqzVc7cSvgp15aSUNti+1lktSCYFeXhko3+L/NNtRE/0MKcm8vKRHrC
	FN7HDFliN/mpFMjQcEEJnA4jVa8BETwWfK1oViwBwNBo2Hngs2G6KAb8zPwcFExW2xTJpGLg=
X-Gm-Gg: ASbGncuGWh+FjsV8XZBSeteaaNIJ2wIyp1cBBwuTmOAojaF9QmBzSHZIRIAuWZn/pHw
	oBGmCYkuO9wgk/2IdgXzwKklt5y9ZMG/j4mCtL7WPM9jOCeyjepFGX5oEUXLBHRCv8NlRV2OFNL
	dOzr6VcOcOyputxbLUZoa5oaJMJXo5BET0VQS7Toy0ga6T5VcjbUQRxO4v3K2eRYWtF9ynJH5pd
	MlRxeeBvzz03dMAGIxKHQnIRgjoSM0h+ioCQGqC5p3ZzeDOTdkUOiWMXCjYVpN3HtadIEUq2Xcq
	bdCqVAiUz7/IrywSHiYsKv1TCgA+PwBcnquSu8qDjNN9m1+Is+L7vFzyO58=
X-Received: by 2002:a05:6512:3b2a:b0:545:1e2d:6b73 with SMTP id 2adb3069b0e04-54f9efd1a97mr1376944e87.13.1746430881664;
        Mon, 05 May 2025 00:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsEsHgZOcmzKyEYKe53zgGMeSaMF3WinuQkv4wSGTWsyP+GpxlPUt85uINmh0HuIcOZYrSLQ==
X-Received: by 2002:a05:600c:1e09:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-441cb49494cmr15680615e9.17.1746430567130;
        Mon, 05 May 2025 00:36:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b391c42bsm162401715e9.39.2025.05.05.00.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:36:06 -0700 (PDT)
Message-ID: <8cdf120d-a0f0-4dcc-a8f9-cea967ce6e7b@redhat.com>
Date: Mon, 5 May 2025 09:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 4/9] net: devmem: Implement TX path
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, io-uring@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn
 <willemb@google.com>, Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>,
 sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>,
 Victor Nogueira <victor@mojatatu.com>, Pedro Tammela
 <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
References: <20250429032645.363766-1-almasrymina@google.com>
 <20250429032645.363766-5-almasrymina@google.com>
 <53433089-7beb-46cf-ae8a-6c58cd909e31@redhat.com>
 <CAHS8izMefrkHf9WXerrOY4Wo8U2KmxSVkgY+4JB+6iDuoCZ3WQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHS8izMefrkHf9WXerrOY4Wo8U2KmxSVkgY+4JB+6iDuoCZ3WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/2/25 9:20 PM, Mina Almasry wrote:
> On Fri, May 2, 2025 at 4:47 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>> @@ -1078,7 +1092,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>>>                               zc = MSG_ZEROCOPY;
>>>               } else if (sock_flag(sk, SOCK_ZEROCOPY)) {
>>>                       skb = tcp_write_queue_tail(sk);
>>> -                     uarg = msg_zerocopy_realloc(sk, size, skb_zcopy(skb));
>>> +                     uarg = msg_zerocopy_realloc(sk, size, skb_zcopy(skb),
>>> +                                                 sockc_valid && !!sockc.dmabuf_id);
>>
>> If sock_cmsg_send() failed and the user did not provide a dmabuf_id,
>> memory accounting will be incorrect.
> 
> Forgive me but I don't see it. sockc_valid will be false, so
> msg_zerocopy_realloc will do the normal MSG_ZEROCOPY accounting. Then
> below whech check sockc_valid in place of where we did the
> sock_cmsg_send before, and goto err. I assume the goto err should undo
> the memory accounting in the new code as in the old code. Can you
> elaborate on the bug you see?

Uhm, I think I misread the condition used for msg_zerocopy_realloc()
last argument.

Re-reading it now it the problem I see is that if sock_cmsg_send() fails
after correctly setting 'dmabuf_id', msg_zerocopy_realloc() will account
the dmabuf memory, which looks unexpected.

Somewhat related, I don't see any change to the msg_zerocopy/ubuf
complete/cleanup path(s): what will happen to the devmem ubuf memory at
uarg->complete() time? It looks like it will go unexpectedly through
mm_unaccount_pinned_pages()???

Thanks,

Paolo

