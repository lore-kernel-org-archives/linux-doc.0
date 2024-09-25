Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F1F14A4D1
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727235074; cv=none; b=F6JTaeI3VK24SNGXREx7IRvnwbWuzC99C/rhMz8b+7vYvDfi2T/9WF5nJti8CBOBzgsn7/qpN9pE3nRDa/E2KdHNVzTDS8HXvH4oVpughfklHtD+fRpP00BdJIo0lfwig7yc136DrpRbOycfnRH3qH5kq6a3s5OM1XXCCRmTEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727235074; c=relaxed/simple;
	bh=M0Ynl+OetR8GBYZEwi4ht5kW6Ch+UvBVR3yT5ZWcE34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cao7BgNVDc3epP1f+wNspUytvRLbH3STbTqT05vgXdZjHl3/SKdugyziwukv84GJ3Y2TJZbTHO0cwo/qeI3EVe9ntyPkJUP5GIC1BNe/cuzSR7QWSDbGCeokG7wlECBEt6xYKeO1zpxv2+t/0oHt2NqwmIHCbHGONfK0NeXTjlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFIvvS/C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFIvvS/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727235072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0Ynl+OetR8GBYZEwi4ht5kW6Ch+UvBVR3yT5ZWcE34=;
	b=FFIvvS/CQYMTvZOM7EAcZo7XJyKmfnUVnhfuMDoSqEDqFCdptSG+8JPI1bLbrvny+78Rl0
	XLjHeW8dnQS0MkZhHtgxrgONGe6dYfWu2ozWl2byXxHOTtTTES5Iugvmo75F0urSy34J+v
	JlbVfbSgjROk44g9e/K9kXEyGdIB2WI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-Fsaz8LdEN8OQ_LzbjktsAQ-1; Tue, 24 Sep 2024 23:31:09 -0400
X-MC-Unique: Fsaz8LdEN8OQ_LzbjktsAQ-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-7d50dadb7f8so290416a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 20:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727235068; x=1727839868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0Ynl+OetR8GBYZEwi4ht5kW6Ch+UvBVR3yT5ZWcE34=;
        b=HgqsmT44W8x3sNDi/uHrRBhBHkDEab1p+pF+sJLt3Pww2mnQ5J6ry4q+f/Gi3Op0Wi
         jdChdxHA8cEBq3SBOHJNBK0kQYxIUUDBAjZPI3YG6mE17CRLxPYYYgnxFx3bWnYJe9jE
         3WmFVR1KTbolVagKX810hB4aSO8Yc17ZFYtA1PeHdEvSz2Q6Kyge5r16KzCESdGn0N5e
         GjL8L5NLUMrYGTz7dZfSHApwC4n0JVj8SrNOeoWrbqnNlkIphEONEtVlCFgASg7r1Ta5
         X7LXJLwV8Tu3HZ/cM83I92balRqMIarSOcLDZbm/qKNFKMNbAccibwUce4nCVD6tEHUz
         dnnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSWXUhqjqB+aJACdiCajWjq7N3/ftFkHK1Fyk/NQzM492DKEysG5ydhSQKzhADcITjFz0QyFilWKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxg8sNRnyEsL8ftcYr61/FCgf+xdY3Ifu607V8rVfwEud4xbJ5
	t1KEwhP1dXJ+wrfknnEff7Y/Rzzlb8D+bZTFStUIQ8cZ4xCkEeiDtZUBtlhet5QWlV16WzoYV5J
	2rwm1TmpVn032Oe2eRcpcOQ/7ObjUIAHvYkjjxfuJ5X6aYMJXTUVZ7sKCx3/2P9gaNzKZm45hIV
	j1Szpb/Mh0v5sLl6WN8izghBGZkra6ubaN
X-Received: by 2002:a17:90a:d18b:b0:2c9:7343:71f1 with SMTP id 98e67ed59e1d1-2e06ac390c5mr2020792a91.14.1727235068212;
        Tue, 24 Sep 2024 20:31:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHSXnVXH4KJFogFRlAqrxz0oHdsU+wQjcpSOWPpZkunKpdZpa8uVOFkj6NCDsQxAw+PRNHCHqUsGcOkqjm3ok=
X-Received: by 2002:a17:90a:d18b:b0:2c9:7343:71f1 with SMTP id
 98e67ed59e1d1-2e06ac390c5mr2020746a91.14.1727235067738; Tue, 24 Sep 2024
 20:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924-rss-v4-0-84e932ec0e6c@daynix.com> <20240924-rss-v4-7-84e932ec0e6c@daynix.com>
In-Reply-To: <20240924-rss-v4-7-84e932ec0e6c@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 25 Sep 2024 11:30:56 +0800
Message-ID: <CACGkMEvKPXCPi6=1938J-k8JNA+hHqzRSt1gPQtqBvSfcgGZeQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 7/9] tun: Introduce virtio-net RSS
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
> RSS is a receive steering algorithm that can be negotiated to use with
> virtio_net. Conventionally the hash calculation was done by the VMM.
> However, computing the hash after the queue was chosen defeats the
> purpose of RSS.
>
> Another approach is to use eBPF steering program. This approach has
> another downside: it cannot report the calculated hash due to the
> restrictive nature of eBPF steering program.
>
> Introduce the code to perform RSS to the kernel in order to overcome
> thse challenges. An alternative solution is to extend the eBPF steering
> program so that it will be able to report to the userspace, but I didn't
> opt for it because extending the current mechanism of eBPF steering
> program as is because it relies on legacy context rewriting, and
> introducing kfunc-based eBPF will result in non-UAPI dependency while
> the other relevant virtualization APIs such as KVM and vhost_net are
> UAPIs.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

If we decide to go this way, we need to make it reusable for macvtap as wel=
l.

Thanks

