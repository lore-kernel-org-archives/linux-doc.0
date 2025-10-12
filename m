Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125C3B186
	for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760296679; cv=none; b=nHhTExudD9d7SzF4NtezXcXcHyLMqC9Fzr0RoY5cG5rmj+RI3pG4U8tjOo7OMXhr/pnIQ6urRqnvGbHZWiT6S2DABPFSKL1zWCFDlZtcl8Fyvc9oKSEPsKLbmqqNQA5J/XE9aoFPaCr8j2CEYe65aeXlFoMkMozf+AeypymiGUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760296679; c=relaxed/simple;
	bh=A3Z0XV+aqR3Bg2mpMrZomWGUcAUm8fgeCMh6RsgVMqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiG4w8Wr07+Bk9BVmJG8OzSQo0D1eafA7kcGXMa00RRlBszZLwA3TObTqDDuXhP8DVK+og5u+5IbQ4erBVHTVWJpUBd53eiIERlzV3mlegGaplIQ4uPStKsveZ72IqPXTneiw70v4L5L8jCYQbc1/dmGWht/bstBUS8jAdLnOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OAiHh6fc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OAiHh6fc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760296677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v/dR7852yMs8pT9RLFFYNYHUOca2oMO/u0IxKaXqyfA=;
	b=OAiHh6fcICNTU83DEfRW71BkCL5fTXyvs5pehOnb48KovUvXg91kRh90fGey7eG48/JEM5
	ORSBEbHsSkEawmK3H47/UgduSFTJBnazXGEGK2qkK1Ccn/vuysJT8Fy3Cjy9kGaBkAjq0t
	48hSsjK+ApSIwMrYK9qXnIMfxa4vA7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-KVrvOTHeN8mp7gPHBriuGA-1; Sun, 12 Oct 2025 15:17:55 -0400
X-MC-Unique: KVrvOTHeN8mp7gPHBriuGA-1
X-Mimecast-MFC-AGG-ID: KVrvOTHeN8mp7gPHBriuGA_1760296674
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e35baddc1so39722045e9.2
        for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 12:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760296674; x=1760901474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/dR7852yMs8pT9RLFFYNYHUOca2oMO/u0IxKaXqyfA=;
        b=JMb6V7zgtyaOpBUlZf1RaBGRvtzxIV5ScEbvnMcillshDDr4CA7MqnS0DYLDZn6DT8
         w/YRe7Ikw1l45moo0aR/Ba1mp3DEPmmeCkKLO+0g4t6HpQpV8+TzaA4wOsUu5w8LSf11
         AdH9PANtuhIBc/RZ6Nh8BlwGLsq9OnH0094dgo3ISZcQ8KpSTso5258TfxycxKl2nogp
         JqRd6/YeoGsjxeJjx1jqorieLoMYIRzxgZJMb/Ph/gRo56AQpkQYq4CZDu1BEi8SQcg0
         WdL+KBO70iW/mk4PR62zXBOozv4vu1dVWP/lR86crkfx+yPRPRuWYn44Rq/qR6mmTg3O
         7gTA==
X-Forwarded-Encrypted: i=1; AJvYcCUyP2yF66jXnx/N8OvN+NcXueoLT7I7c1bTQ1Wx1owuKzs7kf4R/UfvJZVYx7z/YiZS4ES2m/npwSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDsYiht3meTHfox1HgFqFssS6f7Vati7eFhAoESnfSIOqLqygp
	wmy23dxa1ZylHtXpSQIjR/uRpeUGbear/qL1l/pJ/bCeLWTvEvd9RqSvsNKm/kp4/YceMeIB97L
	+9dCs3OYiGHrJxlw1rf/qJy203Q8FuCiF4xbRSTXdBk35CgAjgoUI78OIs9Kuaw==
X-Gm-Gg: ASbGncua0Au1TElRl+ZF2bS4zWYW+yhZ2oYShDucL/1fKhbJcHqG2g29Tpa0ISuKb0B
	A8LWX9krEqXKeeQhQ/E5FDfp6DiAwJMFQeUksTTEYUZxr0XPo/QkUoShRLTi0Ejwg9ZPoYDehuW
	VpP3Z0f+qSTpZNzDk7q+iteJbWMemryOvf9PCGesnxdM3elrKHIhq+xXaMllDjrDi36tlZTlykJ
	VzqfgoI8Y+2wHt+k/1e7lq/LTRD2yxTgMyqG7ufleEE9AFZtQ8olfZwX6BkXB12AdK0l5yGJNqv
	QxN1Wlb/k+di8cLSmc/AcG56nG7BKg==
X-Received: by 2002:a05:600c:4ed0:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-46fa9a8be52mr117921655e9.5.1760296674288;
        Sun, 12 Oct 2025 12:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmLezo5h9IdZASkzNABJRNf+q1estWeI7SsZRQXuBRZVVly4xzTsB0yzUTdppy7wFbEkBWcw==
X-Received: by 2002:a05:600c:4ed0:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-46fa9a8be52mr117921495e9.5.1760296673709;
        Sun, 12 Oct 2025 12:17:53 -0700 (PDT)
Received: from redhat.com ([31.187.78.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4983053sm148394535e9.8.2025.10.12.12.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:17:53 -0700 (PDT)
Date: Sun, 12 Oct 2025 15:17:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] virtio: dwords->qwords
Message-ID: <20251012151345-mutt-send-email-mst@kernel.org>
References: <cover.1760008797.git.mst@redhat.com>
 <350d0abfaa2dcdb44678098f9119ba41166f375f.1760008798.git.mst@redhat.com>
 <26d7d26e-dd45-47bb-885b-45c6d44900bb@lunn.ch>
 <20251009093127-mutt-send-email-mst@kernel.org>
 <6ca20538-d2ab-4b73-8b1a-028f83828f3e@lunn.ch>
 <20251011134052-mutt-send-email-mst@kernel.org>
 <c4aa4304-b675-4a60-bb7e-adcf26a8694d@lunn.ch>
 <20251012031758-mutt-send-email-mst@kernel.org>
 <36501d9c-9db9-45e6-9a77-1efd530545ee@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36501d9c-9db9-45e6-9a77-1efd530545ee@lunn.ch>

On Sun, Oct 12, 2025 at 04:39:06PM +0200, Andrew Lunn wrote:
> > > DeviceFeaturesSel 0x014
> > > 
> > > Device (host) features word selection.
> > > Writing to this register selects a set of 32 device feature bits accessible by reading from DeviceFeatures.
> > > 
> > > and
> > > 
> > > DriverFeaturesSel 0x024
> > > 
> > > Activated (guest) features word selection
> > > Writing to this register selects a set of 32 activated feature bits accessible by writing to DriverFeatures.
> > > 
> > > I would interpret this as meaning a feature word is a u32. Hence a
> > > DWORD is a u64, as the current code uses.
> > > 
> > > 	Andrew
> > 
> > 
> > Hmm indeed.
> > At the same time, pci transport has:
> > 
> >          u8 padding[2];  /* Pad to full dword. */
> > 
> > and i2c has:
> > 
> > The \field{padding} is used to pad to full dword.
> > 
> > both of which use dword to mean 32 bit.
> > 
> > This comes from PCI which also does not define word but uses it
> > to mean 16 bit.
> 
> Yes, reading the spec, you need to consider the context 'word' is used
> in. Maybe this is something which can be cleaned up, made uniform
> across the whole document?

Yes and thanks for bringing this to my attention.
So MMIO can be "features set selection"

And pci can be "pad to 32 bit".


Less work than defining "word".

> > I don't have the problem changing everything to some other
> > wording completely but "chunk" is uninformative, and
> > more importantly does not give a clean way to refer to
> > 2 chunks and 4 chunks.
> > Similarly, if we use "word" to mean 32 bit there is n clean
> > way to refer to 16 bits which we use a lot.
> > 
> > 
> > using word as 16 bit has the advantage that you
> > can say byte/word/dword/qword and these do not
> > cause too much confusion.
> 
> > So I am still inclined to align everything on pci terminology
> > but interested to hear what alternative you suggest.
> 
> How about something simple:
> 
> #define VIRTIO_FEATURES_DU32WORDS	2
> #define VIRTIO_FEATURES_U32WORDS	(VIRTIO_FEATURES_D32WORDS * 2)
> 
> or, if the spec moves away from using 'word':
> 
> #define VIRTIO_FEATURES_U64S	2
> #define VIRTIO_FEATURES_U32S	(VIRTIO_FEATURES_U32S * 2)
> 
> The coding style says not to use Hungarian notation, but here it
> actually make sense, and avoids the ambiguity in the spec.
> 
> 	Andrew

I mean we can just define number of bits. Open-code / 32 or / 64
as needed. Hmm?


-- 
MST

