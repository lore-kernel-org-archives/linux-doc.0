Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8252E8E0D
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017051; cv=none; b=DjpkBGRZvC5NaTwVKMm0M6IzhQAl10RLJnkMLkzhHnszSR9ncpxvpiTSZDFaBURZpRMXg78wRGHjpopt4pV9foM7+1tyym+DQV8c2S4Ytwux7LlicjdsH72LEfloeqijpPA5SPwO9HrXSFIRMI9xDTjdXlDcekJtLATONYM5Tfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017051; c=relaxed/simple;
	bh=7NdTvvUFK/WVGSYlLXsbwdrwKPNZwb8MV31/iuYNMko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgJj0/w8jXod8OG/I+X/Go2Bn6u8hGC/s1BMdPahDQM+ACbmxGUPNdH5yxD1Zuhd/z+0PfCw1YuRJhOmHcDfAAp/TsuIlvKFoESpgL7rZM10kiFkA5+ph7awKcpluRra81uD07NTIojc2ZFR2nPqA3+l3qMwX8YLeQf6uHcyvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QXmhDU9I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QXmhDU9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760017048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QSnlK9qf9+QtrbFfXzTXGo8du1cPFojIdvhyIWDFaG4=;
	b=QXmhDU9Iet5vhAhr2qWm8ezr/UGEp076xcPaTJK3wRz9iGiO0tWUJuTZzA3rnr+Ci2TiEN
	3BECBE4Z26fGVVO8d0TtGQRwztXDCPp7dCWtsLjtlbCkDAJDXrD3BO/HnSBs08Cx2xd2Ak
	IQLUgEWGpwmOhkHUPnNXTbYdWcdkEP8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-hvd0qrtEMR6JWxOqrIEGVQ-1; Thu, 09 Oct 2025 09:37:27 -0400
X-MC-Unique: hvd0qrtEMR6JWxOqrIEGVQ-1
X-Mimecast-MFC-AGG-ID: hvd0qrtEMR6JWxOqrIEGVQ_1760017047
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ddc5a484c9so35494501cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 06:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017047; x=1760621847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSnlK9qf9+QtrbFfXzTXGo8du1cPFojIdvhyIWDFaG4=;
        b=fJBIBaXTe+WB5ElTQzDmtvWSQbRhF0CRbTyhr/vbrqVjb3geQVbrC6oee2jAETR0Ze
         mZeTiwgk/KSLsSb4y6JP3tuInF71J1SmwFPwh942LQdTjO+FR6/W/1Tsqwe8eN5YCHcT
         hAetiFqbKSHaoV0tz2A5XU2tUcfpeM+SzlFMDjZ/Fs1O09hNVGk7y1dm2sv+MzE52ST4
         wXKK9Te6WXK6nIxk9uOKHuEIDEWPn8ZdLyY3jIrrM6PPEKZfnv6rwqAH+3nyf+nkqOzC
         G+nY8wrnPr+7fQY22yUzSzV5laa5NwLK1+0+EwVtyTjEO8QjrtCBEJkrM/8d9kkWUFKl
         tErg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/yZwRrOdLndcVJxS0noL3qvIqBpHG303ckbxLGdPhHmpC6IMIvzKeLQtMydrbBYmnHFXXQe76zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOZ12cWNOB2RW+lVSPUwo1j6y/QfJ2e7z7Ea65k0aZ6jwwCu2/
	G8AZTwNbTJaq2uV+nctTUdGNqFdOXbHlJ5GYHvNEx+0eh+WqZGck5CMePeJ9EF8C7WEwng69RKo
	ypyt4TjO65kKPb06lzeyyhlXByZIIIR/Q+LML8ELfyUSfCccOsz/sHRjSf5TPrw==
X-Gm-Gg: ASbGnctgoL/Qh+B/vXdNKSeQNzK5oURvZwDnDAIMYCrml0jlcvfPekH9uPVGNNvyPIg
	hJEwL46Q3kJfOz2j73vhIEwX2+HFBF1zr+xbotDaTT3C12+K0Y8eNtVsHeME9t532WA+uz94HNQ
	KxRfRcpYU8D5rc0tQi5R9P0q0hKb5zfSKWAmsHCxnxx1L8NTJW6nynJhV4u2lDhUD7Bb4sqUMXa
	DLLMLRq5muBNC4tE3IVl5kxrn8KKIMMYxPes8Ce547NG0LS1oY8s1439MfWPutku3mr9NqFVpAA
	EEkAMcoiQYtPib33XHQ7BVJn772mYsOebJw=
X-Received: by 2002:a05:622a:552:b0:4d3:1b4f:dda1 with SMTP id d75a77b69052e-4e6ead5b74fmr99238271cf.61.1760017046431;
        Thu, 09 Oct 2025 06:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkkkln0wvJVfA+/SQdl7KyNaqeghASgRMRgQSZA/6yVrMeWhD/2djQvFf88sK4uQV3LAnLRw==
X-Received: by 2002:a05:622a:552:b0:4d3:1b4f:dda1 with SMTP id d75a77b69052e-4e6ead5b74fmr99237541cf.61.1760017045789;
        Thu, 09 Oct 2025 06:37:25 -0700 (PDT)
Received: from redhat.com ([138.199.52.81])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2369b3fsm191330185a.51.2025.10.09.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:37:25 -0700 (PDT)
Date: Thu, 9 Oct 2025 09:37:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] virtio: dwords->qwords
Message-ID: <20251009093127-mutt-send-email-mst@kernel.org>
References: <cover.1760008797.git.mst@redhat.com>
 <350d0abfaa2dcdb44678098f9119ba41166f375f.1760008798.git.mst@redhat.com>
 <26d7d26e-dd45-47bb-885b-45c6d44900bb@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d7d26e-dd45-47bb-885b-45c6d44900bb@lunn.ch>

On Thu, Oct 09, 2025 at 02:31:04PM +0200, Andrew Lunn wrote:
> On Thu, Oct 09, 2025 at 07:24:08AM -0400, Michael S. Tsirkin wrote:
> > A "word" is 16 bit. 64 bit integers like virtio uses are not dwords,
> > they are actually qwords.
> 
> I'm having trouble with this....
> 
> This bit makes sense. 4x 16bits = 64 bits.
> 
> > -static const u64 vhost_net_features[VIRTIO_FEATURES_DWORDS] = {
> > +static const u64 vhost_net_features[VIRTIO_FEATURES_QWORDS] = {
> 
> If this was u16, and VIRTIO_FEATURES_QWORDS was 4, which the Q would
> imply, than i would agree with what you are saying. But this is a u64
> type.  It is already a QWORD, and this is an array of two of them.

I don't get what you are saying here.
It's an array of qwords and VIRTIO_FEATURES_QWORDS tells you
how many QWORDS are needed to fit all of them.

This is how C arrays are declared.


> I think the real issue here is not D vs Q, but WORD. We have a default
> meaning of a u16 for a word, especially in C. But that is not the
> actual definition of a word a computer scientist would use. Wikipedia
> has:
> 
>   In computing, a word is any processor design's natural unit of
>   data. A word is a fixed-sized datum handled as a unit by the
>   instruction set or the hardware of the processor.
> 
> A word can be any size. In this context, virtio is not referring to
> the instruction set, but a protocol. Are all fields in this protocol
> u64? Hence word is u64? And this is an array of two words? That would
> make DWORD correct, it is two words.
> 
> If you want to change anything here, i would actually change WORD to
> something else, maybe FIELD?
> 
> And i could be wrong here, i've not looked at the actual protocol, so
> i've no idea if all fields in the protocol are u64. There are
> protocols like this, IPv6 uses u32, not octets, and the length field
> in the headers refer to the number of u32s in the header.
> 
> 	Andrew


Virtio uses "dword" to mean "32 bits" in several places:



device-types/i2c/description.tex:The \field{padding} is used to pad to full dword.

pads to 32 bit


transport-pci.tex:        u8 padding[2];  /* Pad to full dword. */

same




Under pci, the meaning is also generally as I use it here.
E.g.:

Documentation/PCI/pci.rst:You can use `pci_(read|write)_config_(byte|word|dword)` to access the config






-- 
MST

