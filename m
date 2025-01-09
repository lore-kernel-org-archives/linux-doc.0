Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBB2147EE
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408540; cv=none; b=GcB5lgWjNkorprE8ysjX1sp2Wyejra6MZ/xuES88u8UBoOg9p3kdQ1eUMZvWztXqKkSGix7tYmv+Eu2PXZCFg17Nwi17CRLcCegiON5nVHURRqEEhFVv/FIViN16WO69o3TzSMZZWJEL2fg8+ODc8J67zyjmLeStgn2Uvn63br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408540; c=relaxed/simple;
	bh=KH8ZKM1it3Yxv/77thTE6axCBv3gF2iIm/JJRIvqYLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC9exnfuEb3WNyl8BdNcIJ2ZuxtLPRN2tgCfs52DuC2Stqrgge+yUkh47T7qyhAzNu6bb8FU6Dm+iqfVpWfZThaX1SmVHNftumGUl50Fpc5BLLdR62u9xf2o1KivDWwgEjSvBG/6RSIQEr/jrKSwflGkpjdNwwYvwTulwpsk85I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AX8a3cju; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AX8a3cju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736408537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BJ0jS+8S8ofkxwCu6uaTJBXu7c3fil4zQKkE3+oBAKQ=;
	b=AX8a3cjui0Qu0PBYhhBqWNC7DhUWrGiVYahwuLzUui6MAAJ6mTbeD+COY9+Cfme1Cn/8h1
	NOw39oaI9syK2YD8NDjmaJF84MGApsNJ3CY6nmhO4Dp4t2M5vvn1nLXczxYgOR7autxlz4
	pPU0STE9VvCwFBZJZFkaYtSSzMiblQw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-pvqcF2RDPZSAfglWElo4eA-1; Thu, 09 Jan 2025 02:42:14 -0500
X-MC-Unique: pvqcF2RDPZSAfglWElo4eA-1
X-Mimecast-MFC-AGG-ID: pvqcF2RDPZSAfglWElo4eA
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d09962822bso555689a12.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 23:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408533; x=1737013333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ0jS+8S8ofkxwCu6uaTJBXu7c3fil4zQKkE3+oBAKQ=;
        b=uiX1duIGq61wGcvfw3oDG7d1kUeqqXKlR4sbFsGDSz2VlM/8mBtWKxG1MLXOm0qtlW
         5To/i/wrlt7YxISFH9jRpzSepb5Y7U2DUpqn3SXQvhOrDlcD84E4H+0thHzCiCP3Hn/d
         f3OGismkT29/GmO9TTE2hDnpYF+2QwNn3glYe4M61h04Ay5bkviMzBvGHu0p79q/xJQF
         iPHLiYjoV/xlpEFdYSq7tcGuS4SuvK66B01AaAgNVAncmtyDY6VgYycXuWub/7LoKEDl
         pE/VXUS8Tgf5lEZi302n6cc3+1CMl6gexSv5sSQXKEnW0sstTDJlQHiPPUJZHbfxjvop
         aBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+xDfgmj9DQDep1+KEpe6YUppcnQZJ+KAinyayWtvRzmzll+jRDhK+LN86bq7lVHDZmWAz/eyWV5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdWOUGLvdcGubneWXYCJDhgDR7aH5e/kizcxVgQ6k4J/TFcqU2
	Ifi57EFeQlo2siCuz1kv3wVXjMvRMbblT+fjxMYZevkAvYoPFIzl9OJnme/snVCCik0OaKyhw1o
	OokTxub6ZgD5Kv4KkhjQQJfHyMFeqogfLAmdwX1nvNsKsd/hx6TylK1yHWg==
X-Gm-Gg: ASbGncuKKKPELJLGs72gMLt3C5+qscgnDkKaoVKj9Jcs7HV2cH9CCqMG3SfTgwplCyU
	scvO97E4OpCojAJNcVDQRTBvzgVmsbUA1q8e+qRz0WNSB4ucWByyOoJJPIo3KdFN+QhMIQDw8go
	X/PbCabtuaUArl3zrl6iwGvgKyaqdYrrKzAsBNpvOY10SHWgUcqn6KYrsjz94Fd9w/K4HkSMHIh
	qShLDGy3NZLDBjBGPdREMT0WkYJO4NwkeodfRkromwp4j6eefM=
X-Received: by 2002:a05:6402:35c3:b0:5d0:bdc1:75df with SMTP id 4fb4d7f45d1cf-5d972e645dfmr5337194a12.24.1736408533411;
        Wed, 08 Jan 2025 23:42:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN7MJKvcDkD/Px6nKcdgXtLTm3nqt5X4JuwtNE4wiW6ylzro51CFyZ0ACP+YhNMw81jHMbWQ==
X-Received: by 2002:a05:6402:35c3:b0:5d0:bdc1:75df with SMTP id 4fb4d7f45d1cf-5d972e645dfmr5337166a12.24.1736408532973;
        Wed, 08 Jan 2025 23:42:12 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c496sm326964a12.16.2025.01.08.23.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:42:11 -0800 (PST)
Date: Thu, 9 Jan 2025 02:42:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
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
Subject: Re: [PATCH v2 2/3] tun: Pad virtio header with zero
Message-ID: <20250109024107-mutt-send-email-mst@kernel.org>
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-2-388d7d5a287a@daynix.com>
 <20250109023056-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109023056-mutt-send-email-mst@kernel.org>

On Thu, Jan 09, 2025 at 02:31:37AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 09, 2025 at 03:58:44PM +0900, Akihiko Odaki wrote:
> > tun used to simply advance iov_iter when it needs to pad virtio header,
> > which leaves the garbage in the buffer as is. This is especially
> > problematic when tun starts to allow enabling the hash reporting
> > feature; even if the feature is enabled, the packet may lack a hash
> > value and may contain a hole in the virtio header because the packet
> > arrived before the feature gets enabled or does not contain the
> > header fields to be hashed. If the hole is not filled with zero, it is
> > impossible to tell if the packet lacks a hash value.
> > 
> > In theory, a user of tun can fill the buffer with zero before calling
> > read() to avoid such a problem, but leaving the garbage in the buffer is
> > awkward anyway so fill the buffer in tun.
> > 
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> But if the user did it, you have just overwritten his value,
> did you not?


To clearify, I mean if user pre-filled buffer with 1, you have now
regressed it. Patch 3 fixes it back, but - not pretty.

> > ---
> >  drivers/net/tun_vnet.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
> > index fe842df9e9ef..ffb2186facd3 100644
> > --- a/drivers/net/tun_vnet.c
> > +++ b/drivers/net/tun_vnet.c
> > @@ -138,7 +138,8 @@ int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
> >  	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
> >  		return -EFAULT;
> >  
> > -	iov_iter_advance(iter, sz - sizeof(*hdr));
> > +	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
> > +		return -EFAULT;
> >  
> >  	return 0;
> >  }
> > 
> > -- 
> > 2.47.1

