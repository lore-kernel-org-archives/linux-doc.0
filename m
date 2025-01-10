Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5420ADFE
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504631; cv=none; b=PoGT47+yC0N7jKYB8UPskKfOPyhLR0XDrmmduptv0keXjx90ZhVRKw9eFoTaq7YU59rwE8RCsfi6V5BDazB1pyR1Bg2HHdjsXNTVwqIwZkBNxdfwHEALu7Y8K++6fW0BQWK2Pw00TbiCL7Ao71aJKfSslSpEhuA1lgun4R6wLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504631; c=relaxed/simple;
	bh=xjzJiHVG1rcoDk2fTADzQ9apBt/E2B/VHNJo4JUJl8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjse7eSiSfwIsr0mZz+YAttrOOkqOuwfT68AGv3Yx4fJS4I6baL95OBfNOvF4kh5dfF4CwGr8R775ybA7UymA6Z6npAn70KAxZS9vJEFCoYu5z6yNGe+XX6sojcHVYp0N+x6QwKctol+DxMVsxB/wPE6p4Jp3tCAGXhYQ6Qp8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIgWTgOn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIgWTgOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736504628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jp3bnJiwix2Gu1b46TgPaNYsSc3q3ZVFUH5fpD6tH7A=;
	b=OIgWTgOncQYJ76cz7i+EwYWMSXfiGGie255eEfaLbw44SQqmfuL0fRdOeBlYTtNxlt9B2l
	Y/msrtl1oW+l/h6dCiznGspbUNRERmJEYo4pbQuC2avJbe4bkjxWvL2K8mj492Mh84aSTx
	prR/e7BABVnk2xfoY5viNt/HxNDxNfs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-0Cy_YG9mOc2B1Ff3MNJ2zg-1; Fri, 10 Jan 2025 05:23:46 -0500
X-MC-Unique: 0Cy_YG9mOc2B1Ff3MNJ2zg-1
X-Mimecast-MFC-AGG-ID: 0Cy_YG9mOc2B1Ff3MNJ2zg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-436328fcfeeso16757915e9.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 02:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504625; x=1737109425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jp3bnJiwix2Gu1b46TgPaNYsSc3q3ZVFUH5fpD6tH7A=;
        b=nET9Xip+VUq9ExG/Bc8JVDfEEr4i4UDHkZaFc3IC9D6ZkrVEgDVOhBlTxrnSi3Nr9N
         4i3OvauEPFJfg1hb/YvqM9tCmUNoSPAY5m3UXToSyQaFhlhu25BR+Tfh0VdBTUyGDz6Z
         gopj977Legsu0645NGT/s9LRUwbiI2fs6JE7u/YqHanXjaZ1bivHXMsbfympR+ln+jPH
         LFOsBkCaNwxtOXTQ9Frxm0pX49HS2r6bidKuLN/6j0jbBzcvnNS+QIInAtcFY45dLLly
         9lEP5/mAV1StFUZWjdLZCPZp2Yyztflx6i2X6EKcUtxWIuQYkrLAiaz2zMyUl6/aAOlQ
         aBiA==
X-Forwarded-Encrypted: i=1; AJvYcCW+gAZkLcKYaRbWKG9vnJKl4grMDUdVOp4kGYeF87+47D1BREmdMQHtO79TTgPj9pSeNUP7a59eMz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+umK/Tsr3liPp3RW5Mds6BvAQNdGY2FjIyoVzl3hYTKspQjw
	d7H5Cyx9XRPpBZt6rgzVP/e7AOlX+G8fvZmLo90y3FDtrs1Jqjlqrq1VpJdgsAWG11SBLqr9CVn
	NsWldQUolpmYzh3WaX0tfiqinakNrB0KFovbK2gOAj4My6G1OWKyCTD1R+w==
X-Gm-Gg: ASbGncsaKFeQr1otP+J1vWluTZZrFcgiFtMZ0NxgPHooLbW+bB6V7R8IQp3xUk0tj6L
	TaHN3bPpr4tL+GIEEV2WqyyRnRgXWaOgkqqccmAZQUO1vV3eT/95Uu+zS5RMamQXgWUQhy5Tm8V
	+mO3+zNlvlK4iSie3bcs5dVdiec2M9WoNIpJ+ghzfiIErUKnfXGlfS9mdlxksEG6bVY3DXN4cdd
	BPGlEUyn3eaU2REiYmvCH4YUkwnuIStPU0TEnOMaz0tEvDuSJDC
X-Received: by 2002:a05:600c:1e09:b0:436:e751:e445 with SMTP id 5b1f17b1804b1-436e751e61fmr82747495e9.5.1736504625690;
        Fri, 10 Jan 2025 02:23:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCfvXG8JypksNxAK+IHkKlFtMebcL1LMAzRXVW08Nh57eky+TRviObBgV58/zlzJhK4cMqJA==
X-Received: by 2002:a05:600c:1e09:b0:436:e751:e445 with SMTP id 5b1f17b1804b1-436e751e61fmr82747375e9.5.1736504625358;
        Fri, 10 Jan 2025 02:23:45 -0800 (PST)
Received: from redhat.com ([2a06:c701:740d:3500:7f3a:4e66:9c0d:1416])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03e5fsm47436835e9.18.2025.01.10.02.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:23:44 -0800 (PST)
Date: Fri, 10 Jan 2025 05:23:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-kselftest@vger.kernel.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	gur.stavi@huawei.com, devel@daynix.com
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
Message-ID: <20250110052246-mutt-send-email-mst@kernel.org>
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>

On Fri, Jan 10, 2025 at 11:27:13AM +0800, Jason Wang wrote:
> On Thu, Jan 9, 2025 at 2:59 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >
> > The specification says the device MUST set num_buffers to 1 if
> > VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
> 
> Have we agreed on how to fix the spec or not?
> 
> As I replied in the spec patch, if we just remove this "MUST", it
> looks like we are all fine?
> 
> Thanks

We should replace MUST with SHOULD but it is not all fine,
ignoring SHOULD is a quality of implementation issue.

