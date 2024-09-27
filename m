Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B31541C63
	for <linux-doc@vger.kernel.org>; Fri, 27 Sep 2024 04:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727411501; cv=none; b=I11wINsq1FRnRTJiKzXPTKkMhy6LTAndGnkvSkEDqUuQ+Qf2kwM4uUuylEkRIsAvlUVaIfNKplD0EbjZuoP9dmNnYeH91xHkmcYR+m2V1SrcwE7/vidBpxWkhzioyeyVS5jpScFqEEDpcTtaVl5ujb3x6WaKRYEavO0wERV3tRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727411501; c=relaxed/simple;
	bh=uBFmWoNeX1W+Cqs2iNWdisHneux0lZanwha6u5m3aww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XM7ZTtJvZ+idnKWTUl087FRFDKQXL//moncS9NCXyb6IGYxV1HwEbPK6o8C9TdV9dz5Pr3LNvchYxCCJuR3Wo5ekBBih1elEtRCtCw7AVBVhfIUcrYebFVSVDYTGKtVMQWhdeXy+dzFJB/zx2MLKOAWK2vtgS+hmRmDS3u59Oyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eceOl/hf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eceOl/hf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727411498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBFmWoNeX1W+Cqs2iNWdisHneux0lZanwha6u5m3aww=;
	b=eceOl/hfxFC6N2gsnjPjFnA+kySEiWcXXuwUtWECgY6uTtyDMCuq1uwxjOky+Q+vAUEJZ4
	mzrcy7yB3wI2i/INsKMAHkpRvbCECDrVUU+ED0/9Ankc9FDub0Yoa4uGmtOiWCi4l5OiFd
	LZjFw0ciCaHkd/Xf3km30dmIpRGjhrQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-qAF4axT9Mxmu9gB3Rlq9uQ-1; Fri, 27 Sep 2024 00:31:37 -0400
X-MC-Unique: qAF4axT9Mxmu9gB3Rlq9uQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2d8b7c662ccso2319514a91.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 21:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727411495; x=1728016295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBFmWoNeX1W+Cqs2iNWdisHneux0lZanwha6u5m3aww=;
        b=P2on8SR83w3ceOky89c5xnBFR3y1kknt5TWmH1aVGlk+Oe8I8gM3HxEksSLPmgO6B/
         fo55u18kVb9fe4JgMh4BEaDN07L8Bflmvj+8ZthZgTkSzB3G+P+h6ueBZYREsscjWwan
         IoArKb5krr+amHocKrBv1v2SCOUPv0s1SGG8aytIQwm/AwwWH2g03dDiWf3UEjUm56mO
         Gmp1OTeae0YFAdGrjxeFTJGVjnflEPFXeuTeyuTGRg+8q/OBYbxN1+eBhMuhxXX55458
         m8LG1ZsOi0E6cVB4itRogMPLOc1hElgE3pJCStqBkgi5bkMu7SElngK6L7I7QOQVKM5P
         yvbw==
X-Forwarded-Encrypted: i=1; AJvYcCXTCHFl7y3ZH/eHqbxvUITmj/vsHeglC0sbMtjBMDBE44OcjBIua7CBtKoLbXGVGRX1Bt+IRwflqI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEaQtv9Ca23/IXBa1bT0sgH8Xv+/D2rCEIE4oShmb6Tw0Qhusp
	/iI3uZXEXel7ZOQpdABWcY4TKYwndVzENKX1rkpcHQ4YIPbFhWYQxFbhjEN0xxd0EAWsjOjwwSo
	Lea7MzbgnDmDThohCy2teTCaN3iC8lbanlTdoZ0fAg9LGVqgyQ/sfU5X8vRSbt4ho8D8qCcHQdK
	tXrbvd44zt7H2tsbJ1dt8Xd9vN1lPj7p/1UjDRuTnUgVw=
X-Received: by 2002:a17:90b:234a:b0:2c2:df58:bb8c with SMTP id 98e67ed59e1d1-2e0b8b149dcmr2167116a91.18.1727411495491;
        Thu, 26 Sep 2024 21:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIh5lwZF9CJKh17SEpxaaZJy38bFfod3VEXz7y4ASCqLDiCeaKdZmiGJ67AwnOYjAbQZ+yUYlkT0W4m1tjn8U=
X-Received: by 2002:a17:90b:234a:b0:2c2:df58:bb8c with SMTP id
 98e67ed59e1d1-2e0b8b149dcmr2167084a91.18.1727411494914; Thu, 26 Sep 2024
 21:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924-rss-v4-0-84e932ec0e6c@daynix.com> <CACGkMEvMuBe5=wQxZMns4R-oJtVOWGhKM3sXy8U6wSQX7c=iWQ@mail.gmail.com>
 <c3bc8d58-1f0e-4633-bb01-d646fcd03f54@daynix.com>
In-Reply-To: <c3bc8d58-1f0e-4633-bb01-d646fcd03f54@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 27 Sep 2024 12:31:23 +0800
Message-ID: <CACGkMEu3u=_=PWW-=XavJRduiHJuZwv11OrMZbnBNVn1fptRUw@mail.gmail.com>
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

On Fri, Sep 27, 2024 at 10:11=E2=80=AFAM Akihiko Odaki <akihiko.odaki@dayni=
x.com> wrote:
>
> On 2024/09/25 12:30, Jason Wang wrote:
> > On Tue, Sep 24, 2024 at 5:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> virtio-net have two usage of hashes: one is RSS and another is hash
> >> reporting. Conventionally the hash calculation was done by the VMM.
> >> However, computing the hash after the queue was chosen defeats the
> >> purpose of RSS.
> >>
> >> Another approach is to use eBPF steering program. This approach has
> >> another downside: it cannot report the calculated hash due to the
> >> restrictive nature of eBPF.
> >>
> >> Introduce the code to compute hashes to the kernel in order to overcom=
e
> >> thse challenges.
> >>
> >> An alternative solution is to extend the eBPF steering program so that=
 it
> >> will be able to report to the userspace, but it is based on context
> >> rewrites, which is in feature freeze. We can adopt kfuncs, but they wi=
ll
> >> not be UAPIs. We opt to ioctl to align with other relevant UAPIs (KVM
> >> and vhost_net).
> >>
> >
> > I wonder if we could clone the skb and reuse some to store the hash,
> > then the steering eBPF program can access these fields without
> > introducing full RSS in the kernel?
>
> I don't get how cloning the skb can solve the issue.
>
> We can certainly implement Toeplitz function in the kernel or even with
> tc-bpf to store a hash value that can be used for eBPF steering program
> and virtio hash reporting. However we don't have a means of storing a
> hash type, which is specific to virtio hash reporting and lacks a
> corresponding skb field.

I may miss something but looking at sk_filter_is_valid_access(). It
looks to me we can make use of skb->cb[0..4]?

Thanks

>
> Regards,
> Akihiko Odaki
>

