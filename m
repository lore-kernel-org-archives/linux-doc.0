Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886761865E5
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 02:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742263836; cv=none; b=DEhsKJL3ihJVHp4Km8MAB0xVVwMQwvZ8LM8nFzFmqZX9+2oDcEjJWGIbxUpHLnnR26oQBYGBmZEeBft1J4ma37PwCS++sJuiguURLL9WH2xIxsk4ISo21HtoTyECOSbqTQeTUx3Ro6gUNRyFq5pQuJ5AHmNzRePPAzOPAJo7p20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742263836; c=relaxed/simple;
	bh=QR2+CQhFtF3wiXNVfMMn04N/Zgc7E9vWUP/WZyEzsE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxoYm46nTjGN8uwA6/ofz22lJCIYyDJTDltRo59FVICfQb6DU2WIJlowrb/TtJcatrBhC6bsmFBH3gysRip2lR8FbnZwaOPtSqzsEBHgb9NZx1la4dPlsfVn74alkNIqLvTGHzESJ4N+SerZdDxXh27N5U2cFVAlt0ExuWdi2zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OA7XBh+E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OA7XBh+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742263831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bocJ4xY+cvLvF8Z2x24tl3LRmmXAsvkZEGxfx5yQFuM=;
	b=OA7XBh+EGBpYEVJpS5Cs6jMyEuq5xXd6e/u0I6B3baoOMmb5cs9KEnLdSyYhn7WCgZlqg4
	HfvfqEorcwhQT42Vyo60TTHiVu2WxvSFAt8Gcl2DHJnKE9GZJijnuZEcPrfjTftAOXy02K
	GxLZbbGC+Hd/rqBADyRFeLyUL776yMQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-v5HsRbWYMRC2iOWC9AU7ig-1; Mon, 17 Mar 2025 22:10:28 -0400
X-MC-Unique: v5HsRbWYMRC2iOWC9AU7ig-1
X-Mimecast-MFC-AGG-ID: v5HsRbWYMRC2iOWC9AU7ig_1742263827
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e68e9d9270so4124147a12.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 19:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742263827; x=1742868627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bocJ4xY+cvLvF8Z2x24tl3LRmmXAsvkZEGxfx5yQFuM=;
        b=fpeSj837yiC2L1CZtO38Sy+t/+P7GZltkizRMb0RbE4bsr7LerIHZQszAJ2Gva0pz2
         5+UlS8ZN2+czd/dOfFLJZL/xP9pDF9ovGo+G810PooLd9dVp6HS8OxXn3VrrcpgeddFl
         K2wjyL+OsAmkOQE8PSFYqZf8xzO1YTNjabrSuHN+KUJwVLDZaNA4qvrFWO4Uhy6Fu4fe
         8xBRLESS2PkAnYp1ht4KleXDyy4sves5imUS6fo/hdKloRNhsEhxiM7Or4vd4fdmSN07
         Mow/YZ96kbGUAZ2k6Qf3Fkl8c1B0xTqekG/01Jc09LFANhKt2fGw162IjTfx/0x7VjJL
         mgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn32th5uUf+uwDC0oqMiYHgEACOuQvgcDEuMPn3FmFZlMJBxCEyztdVdtZQpDzdOQNxoXo2n3qHR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUf0maJ75oVeOT6Nu7ocfZJ3h6ZPYucv01Mt6ddMCrwnSdcsy
	M8o+4TRTEKxaMCP+ehPr3wSBRzsizutBpC0wGVNBR4uYc/Wyc7SITIes5+OrwGBUZ27tKqdSN4a
	hqc8mEeCT3PqqGCbnZD9+rWdSp8lrOwV/f40f4sZ1OmnDUIp3yBskNU8HxGvnEPJhlZbh4R9/7c
	iwAVsrYqr+13tfOn6t1nc4CjyTf2hfTjjG
X-Gm-Gg: ASbGncuPC+Tr5qVQtzFz2/yURDLxzlOlBN8n+6Bn7KOto0gEhHwgrfT1dbVJX6DbPuk
	vQLMOGezkWEqIIT9juP+LrwAVX3G+/uLp1zEJCQYQomVxC6wQN8Q4LC7Opld+OEANJfUu6Xlfiw
	==
X-Received: by 2002:a05:6402:348d:b0:5de:cbed:c955 with SMTP id 4fb4d7f45d1cf-5e89fa5252bmr15904558a12.17.1742263827521;
        Mon, 17 Mar 2025 19:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCvFJRxiUrK3Hl8RQJ4gACrb1PAEIxR0Zqht6rIjp/tdZBCVDepPjzyLxDhCMISfCanvYlkZjNzb4UQTjWFWQ=
X-Received: by 2002:a05:6402:348d:b0:5de:cbed:c955 with SMTP id
 4fb4d7f45d1cf-5e89fa5252bmr15904525a12.17.1742263827103; Mon, 17 Mar 2025
 19:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317-rss-v11-0-4cacca92f31f@daynix.com> <CACGkMEu=pPTd-QHKRDw7noRCTu-18c7JLJNKZCEu5=BHAE0aJQ@mail.gmail.com>
In-Reply-To: <CACGkMEu=pPTd-QHKRDw7noRCTu-18c7JLJNKZCEu5=BHAE0aJQ@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 18 Mar 2025 10:09:50 +0800
X-Gm-Features: AQ5f1Jpjunc8xib_cyTewZlm6iAFgRKVvfy1UVZQ0lyOQH2XWEffoxUQGNr9u5c
Message-ID: <CAPpAL=yfgiuFA-SyrCe0Ud8Wm9tJMcMm9L4Q-AnnuRzN+Q9M=A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 00/10] tun: Introduce virtio-net hashing feature
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Simon Horman <horms@kernel.org>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

QE tested this series of patches v11 under linux-next repo with
virtio-net regression tests, everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Tue, Mar 18, 2025 at 8:29=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Mon, Mar 17, 2025 at 6:58=E2=80=AFPM Akihiko Odaki <akihiko.odaki@dayn=
ix.com> wrote:
> >
> > virtio-net have two usage of hashes: one is RSS and another is hash
> > reporting. Conventionally the hash calculation was done by the VMM.
> > However, computing the hash after the queue was chosen defeats the
> > purpose of RSS.
> >
> > Another approach is to use eBPF steering program. This approach has
> > another downside: it cannot report the calculated hash due to the
> > restrictive nature of eBPF.
> >
> > Introduce the code to compute hashes to the kernel in order to overcome
> > thse challenges.
> >
> > An alternative solution is to extend the eBPF steering program so that =
it
> > will be able to report to the userspace, but it is based on context
> > rewrites, which is in feature freeze. We can adopt kfuncs, but they wil=
l
> > not be UAPIs. We opt to ioctl to align with other relevant UAPIs (KVM
> > and vhost_net).
> >
> > The patches for QEMU to use this new feature was submitted as RFC and
> > is available at:
> > https://patchew.org/QEMU/20250313-hash-v4-0-c75c494b495e@daynix.com/
> >
> > This work was presented at LPC 2024:
> > https://lpc.events/event/18/contributions/1963/
> >
> > V1 -> V2:
> >   Changed to introduce a new BPF program type.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> > Changes in v11:
> > - Added the missing code to free vnet_hash in patch
> >   "tap: Introduce virtio-net hash feature".
> > - Link to v10: https://lore.kernel.org/r/20250313-rss-v10-0-3185d73a9af=
0@daynix.com
> >
>
> We only have 2 or 3 points that need to be sorted out. Let's hold on
> to the iteration until we had an agreement.
>
> Thanks
>

