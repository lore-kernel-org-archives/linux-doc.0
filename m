Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A734EEE6
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550260; cv=none; b=B+DPG/zTu4oE/NAm9o8M5ktfs1t+cCo04K4pMw9aG6EyNf8z6RXuuGklvvTWyEF7iQJzxtg+1qaxk+g+CC+REPWnL/97NrN+emI9FP/dqpUxI7VAJKt6qOUhfwLVdLSIaGqDpzX2srW3fc8ecde6GK7E5zzriPapePjIUBI20kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550260; c=relaxed/simple;
	bh=Or/iFwMt+BMeSO1coYhZawNSolBDuL6LbxtDXCET8WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtOFhNWFrNZUyVWi9BaTN8ndpOIi5WwpjXsV5cOQElhgaYSUXXyF/HdOst1mYpNsQLYtN2O9oFZq0kDRimNK4BiNboK1e+HPmwW0jyfk3HlhX1FB+YZZR6YogXYKEHlZ4BbF/odxJJPVhtSxXNUP1FdFySWFtn4LzlB5QUK8MKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqbYJs9W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uEVn1Wcs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqbYJs9W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uEVn1Wcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763550257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKuBd2HW8nRsL/d/yhqkB0zqQvQiI6NwLHvu1csy0yA=;
	b=QqbYJs9WyPur5F6SVXW39FmkvRxqjh2CM3mEN8+7L2gOsbr0Pj3L0MvqTRw/XX3rbCwZJd
	FXYNt3OxXhnmtDmFprqfBlVisAP6yDdkxR0VB/RdpkxZzd33TtfdiFbYn9Nf2cgiDd+6X9
	S3ijME4kkGK2hBPlfg3xJXT/KzHMSo8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-8jMBBDiyOAWz93b-BPO1dw-1; Wed, 19 Nov 2025 06:04:16 -0500
X-MC-Unique: 8jMBBDiyOAWz93b-BPO1dw-1
X-Mimecast-MFC-AGG-ID: 8jMBBDiyOAWz93b-BPO1dw_1763550255
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b366a76ffso3442062f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 03:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763550255; x=1764155055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKuBd2HW8nRsL/d/yhqkB0zqQvQiI6NwLHvu1csy0yA=;
        b=uEVn1WcsaTqMiRrKNZiy6NqgGLAEyAQeKJKvxdH9sw7zKLmC7HJuLg6Ihu0MPLA/A+
         S34IHb1FSNSZo1sH6oQ7iFK60B0HkN7x0qXzxwPuNHzU3h/fkpXMss6fUSW20zTWR2ss
         XGyQUfKd7i7aJrVm7r853a3oGjbTRcj9BrLUQA0dn1OhqRTCnIB2ZwB0mkAc6/9N7hxQ
         wDaxlXSZQJ8DeDvcbrJXXP/+kFXqB2UFhx7rwii40Rf9+mZ7jJ5RpYLMxqVyvNnK4Y1M
         s5kOV9y1MaqyqZ2mSVhVq6F9miKPhLuY5Y0hJrX21ViM/fgdmmlS6X0xYf/L4XfI0+qZ
         FvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550255; x=1764155055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKuBd2HW8nRsL/d/yhqkB0zqQvQiI6NwLHvu1csy0yA=;
        b=cQTWYxzSZyozssFSM2AOhSk0agk9xyXY4hoLGl+VWPOlXdGhqmrLPHbysVoyLE0uBY
         qBDzWQKuhSnOVLEOKIO/DYWfWzMJDLxvgm6/9h64FB7HWFuY6jRjw+YAxwy4qw/uIc7L
         6ETa+DnkfFZAV5yE62zJFc8w3fOnZ8pbnqMbxGASiyuLvgtuTh0FohIj8EnzjM7oy1sq
         jv0I03gdP8slx6rPskmGMxRimClmQP5MIhGXuMC4LMLgjGWxsXpG5pOmJIE8kuR3ybwW
         zgE/MXgPqM/OJcbRGADL8x1FHGF0GOe7lzGYh2uf/lx/3JkbvoCQrYol+svLRvOnGWy6
         Xvuw==
X-Forwarded-Encrypted: i=1; AJvYcCVoU6qG2hirxfo2ZJTlY/JxFfc5HgGEyjqYQtTF0O1LLIZ7p3GRsdUafjTS72r6wL4aHDX0BNbzWWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1PbdPzKTDNYY/jkbE9VueubcTcKBrUSqp7chouLN/zfPw/dk
	KqOImtWEW+9wwBSNG3+XODRi56zvEmChqlqAyu7XpJsVw0GGFydEOES1/84+LEVkcd1X6ZNGUpB
	vAcbmYXz5Gy/aBUmfznF/dJrrdWsefKFKADhybTrWrP1f8ZwOMgZNvv9cjQRj5Q==
X-Gm-Gg: ASbGncu3VAb1nlbD30n0GEWyGmrqYKcj88416ykRSZpjTQolMz3bLcLN7dvUeEmZzK1
	DinnHFTL0yklrWFCRvoPOsq1WCbfgrpROrplvIrM8tUV28Pa0R8Z+palacarBeiaTPHpq+R3F1b
	RU7aDKjtHEj/jR6ZwiD5/1u/1VCzUSZvHuzTf3XOOIuzhsxzD2SMgiQEyZ5E1qLPXq6YYtaK6ZF
	aDm83g1kQ0fhbXPUHITD8/Kp6y/sgdbDmbaE3xFfpKcdN/PEd/Ki7dOqdHJVzo3LQayLwH7mtFB
	MzVcAj7RIOXyc5hn98CjysRrw2xcN0inQCUZ9lYNaA+/L9ey0xtK3DF/fnejJtbYpsOaZJXTD7h
	bzlaxY89ViqgQ
X-Received: by 2002:a05:6000:1ac9:b0:42b:2e65:655e with SMTP id ffacd0b85a97d-42b5935a880mr17671085f8f.27.1763550255261;
        Wed, 19 Nov 2025 03:04:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnOndlVgs3mj8Ki0CtCTtbt0/DkKKE/b2cx4wA0ZToqoDYX1G7zSXdvoOnOMWxyBTwFXC8VQ==
X-Received: by 2002:a05:6000:1ac9:b0:42b:2e65:655e with SMTP id ffacd0b85a97d-42b5935a880mr17671049f8f.27.1763550254851;
        Wed, 19 Nov 2025 03:04:14 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a4fsm37236036f8f.11.2025.11.19.03.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:04:14 -0800 (PST)
Message-ID: <4204ed4b-0da1-407f-84e0-e23e2ce65fc7@redhat.com>
Date: Wed, 19 Nov 2025 12:04:12 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] vhost: switch to arrays of feature bits
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Mike Christie <michael.christie@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1763535083.git.mst@redhat.com>
 <fbf51913a243558ddfee96d129d37d570fa23946.1763535083.git.mst@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <fbf51913a243558ddfee96d129d37d570fa23946.1763535083.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/25 7:55 AM, Michael S. Tsirkin wrote:
> @@ -1720,6 +1720,7 @@ static long vhost_net_set_owner(struct vhost_net *n)
>  static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
>  			    unsigned long arg)
>  {
> +	const DEFINE_VHOST_FEATURES_ARRAY(features_array, vhost_net_features);

I'm sorry for the late feedback, I was drowning in other stuff.

I have just a couple of non blocking suggestions, feel free to ignore.

I think that if you rename `vhost_net_features` as
`vhost_net_features_bits` and `features_array` as `vhost_net_features`
the diffstat could be smaller and possibly clearer.

>  	u64 all_features[VIRTIO_FEATURES_U64S];
>  	struct vhost_net *n = f->private_data;
>  	void __user *argp = (void __user *)arg;
> @@ -1734,14 +1735,14 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
>  			return -EFAULT;
>  		return vhost_net_set_backend(n, backend.index, backend.fd);
>  	case VHOST_GET_FEATURES:
> -		features = vhost_net_features[0];
> +		features = VHOST_FEATURES_U64(vhost_net_features, 0);

Here and below you could use directly:

		features = features_array[0];

if you apply the rename mentioned above, this chunk and the following 3
should not be needed.

[...]> diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
> index 42c955a5b211..af727fccfe40 100644
> --- a/drivers/vhost/test.c
> +++ b/drivers/vhost/test.c
> @@ -308,6 +308,12 @@ static long vhost_test_set_backend(struct vhost_test *n, unsigned index, int fd)
>  	return r;
>  }
>  
> +static const int vhost_test_features[] = {
> +	VHOST_FEATURES
> +};
> +
> +#define VHOST_TEST_FEATURES VHOST_FEATURES_U64(vhost_test_features, 0)

If you rename `VHOST_FEATURES` to `VHOST_FEATURES_BITS` and
`VHOST_TEST_FEATURES` to `VHOST_FEATURES`, the following two chunks
should not be needed.

Thanks,

Paolo

