Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA3148310
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 03:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727235027; cv=none; b=p1s0q43O8GVLrcErTNoJnA2IwT24ED6Es5lPOn+hxp9HVw6Ki6T3o/b65jP9ZRF+Tdk1antzEPc4N148KPVdD7e7Bm9iiMtWWkmmUfHlydc5B5zWS8NwCCYna7GiPIVTW+1w3GW9QyWtw8MqzxNw1p4U6eUL5sWwBjgp5uW4pxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727235027; c=relaxed/simple;
	bh=/pj+RCuXouKWKKmVNJjkG4mjtgCiJqE6IxJ4EvXxnE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxguKGoP8K84E3dFHxzaYIk8aL4+MI8uQWik0CPU958qkAO1zszqCy28WgAeK2haUTSOogejmcjT6gryuGcztRIeqsVTrvB23IqV2oFcPrE0rzghnZkDWxlOWrmPx/9e4MpcP8UEgfp3bhd1GE0V0OUbvTcPwIZmnLl6W4RNGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cc50jO1v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cc50jO1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727235024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pj+RCuXouKWKKmVNJjkG4mjtgCiJqE6IxJ4EvXxnE4=;
	b=Cc50jO1vwKFaEKU2XlDyrbNt/ghI8Q4f7OyGi9IdYTcKsiVT1tASj2oYd0URyrZRUE7e1k
	5Xg3T3sKJYlPAyDMdt9z7r6570YQXa97L6GW7EBMhp5bQ1Y3llL19jXoLqYbkqozaQpyDb
	IvLuAhyly3Iw+ra5b+DjdRpRwy+KIH4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-6dWeQqgMM2yr14RdVFb1NQ-1; Tue, 24 Sep 2024 23:30:22 -0400
X-MC-Unique: 6dWeQqgMM2yr14RdVFb1NQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d8759255d4so8949053a91.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 20:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727235022; x=1727839822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pj+RCuXouKWKKmVNJjkG4mjtgCiJqE6IxJ4EvXxnE4=;
        b=bZqX/cGZttW9S3EjOYE3a95zb86P9K6CqxNu41sPGbhlbDiuPsN1myYx4tcuR08mZS
         7U6lRbOBjcUjwmOzOCqlPeEhvz1iAO07PQSqkaDzZZp7NMVheUMpaG8XM8HUL15T0bNp
         jf4gy0G+BEcZ9LDCns8H9V53bBHgC2xi+gJuZwr029HW6tZiEnRdmAUHlxONdwlprsbI
         fxW9c3/fLdT4k4sH3One+Q3O/clca9diSHINLTC1RSljfFpSScIY1LcJXLTIOE5ZFTgX
         QB+9fvdNLEic+tj8qF5Lf0V2p0PJZWilnPA+piSjcba58Lg9y+0+yHdDrpDKPwS+ykey
         KxNw==
X-Forwarded-Encrypted: i=1; AJvYcCWD6gdKpR/rfpBu2KLsJEpPNNmg4i4zN7MoNso3+5RnVwdiEqnlVp7dY7tvjlQyRjgdjf0O50G7GZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx422Q9ksFF5P1t9nEYZW4i8a3NaVsKknMe45o+1kyx/LImHXDd
	9O7/XybXAi6Fh/0TbnvrD4wQQooOt2gECLhN+/PtVo6xSYVXj264b99pGEqw1a5++Y3XJ6mkMFz
	zQtVEDOewiwqIqU9iN4s29JuN6liKZLei4gB0ALwByl1feQGKykPKeUzfnRftveLATgY3hC9QbN
	5pO4KOQ4Mu9pYVFNRCJsgtMaJCg24jSgLj
X-Received: by 2002:a17:90a:f2d5:b0:2da:905a:d88a with SMTP id 98e67ed59e1d1-2e06ae791a7mr1467812a91.21.1727235021752;
        Tue, 24 Sep 2024 20:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt284MvmYUlT8+AL6adgtTv8NmOQ1ld/MsvwYgsNGC040Pi/BgPI1vkZfb6OO4Jtnfla96r8UcK+AJSx61zg8=
X-Received: by 2002:a17:90a:f2d5:b0:2da:905a:d88a with SMTP id
 98e67ed59e1d1-2e06ae791a7mr1467782a91.21.1727235021240; Tue, 24 Sep 2024
 20:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924-rss-v4-0-84e932ec0e6c@daynix.com>
In-Reply-To: <20240924-rss-v4-0-84e932ec0e6c@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 25 Sep 2024 11:30:08 +0800
Message-ID: <CACGkMEvMuBe5=wQxZMns4R-oJtVOWGhKM3sXy8U6wSQX7c=iWQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/9] tun: Introduce virtio-net hashing feature
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 5:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> virtio-net have two usage of hashes: one is RSS and another is hash
> reporting. Conventionally the hash calculation was done by the VMM.
> However, computing the hash after the queue was chosen defeats the
> purpose of RSS.
>
> Another approach is to use eBPF steering program. This approach has
> another downside: it cannot report the calculated hash due to the
> restrictive nature of eBPF.
>
> Introduce the code to compute hashes to the kernel in order to overcome
> thse challenges.
>
> An alternative solution is to extend the eBPF steering program so that it
> will be able to report to the userspace, but it is based on context
> rewrites, which is in feature freeze. We can adopt kfuncs, but they will
> not be UAPIs. We opt to ioctl to align with other relevant UAPIs (KVM
> and vhost_net).
>

I wonder if we could clone the skb and reuse some to store the hash,
then the steering eBPF program can access these fields without
introducing full RSS in the kernel?

Thanks

