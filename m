Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E46201278
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763279124; cv=none; b=am++i16wpZo63E46PUA0DhUK/PzsH5vaHN7V2AXqSoJ9eU7xc3rDc3VFh9bP3GLujO6KmCcywm1xmFzsgU1PZAJW1isIOLWbAajlpguccvwxvOm7bPt8FySNkaiiprH41ymco+SDucJl81le6cZ9gu/uJg1kJ1+wFBENm/g/su0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763279124; c=relaxed/simple;
	bh=YVrAdAzCc2XLQIIceUnkGGP63U/MW+iwXEhmvrkh+/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hw8ps4trbvo+o7jqhk5PrmONeWghdMTDlliIaIySPfPK2UY+dX3PmmNbfp9loWtt8pp+nsvG5ksCekeWgzPFhX0G+EUvovRu1CLreClvNhkAzdO8OlhmJwIMaeyTJVVdnCMglojbvyb6XkQWZ5ufrO2azxRY2u2X4LgSiTDQRmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QDDklCw5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=miibqhie; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDDklCw5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="miibqhie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763279122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=6EMg3NX6c6HdI7rjPLbQWwYtnFdehdSrlUN2EHSpFLI=;
	b=QDDklCw5PiCLmBm4j7FtJ5xlRhrDjXcBPOg7UYePLfdWbmGb3ucXS7ciSkbvz6O6m3ViED
	NlXLHtX484vaM7nFJX86KHIQJM8jSrYS2AMtHg5ucJiWL2k2EfmHYWTX5+dROh7FZGgqie
	2nAMTHCQt2Xa6IO0RQLWq0pce6CNHjc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63--ZLMPAwqOCKaWcQsnLnhJA-1; Sun, 16 Nov 2025 02:45:20 -0500
X-MC-Unique: -ZLMPAwqOCKaWcQsnLnhJA-1
X-Mimecast-MFC-AGG-ID: -ZLMPAwqOCKaWcQsnLnhJA_1763279119
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47797caba11so4761665e9.3
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763279119; x=1763883919; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EMg3NX6c6HdI7rjPLbQWwYtnFdehdSrlUN2EHSpFLI=;
        b=miibqhie0W+iBONwaBhJH5UDGwURmLk0wBJQOQNjfgNlPvtDHQeoFIfCIuhzUw0puF
         BVQlz/IX2INIzg80T90fGc5vuWcvFDdo7UtLKpvtCJ1+0tQuG8+s6c/hUz4glmwFFUKk
         WCo0xm4iwJAeHKLxxgUEAvtpPTyQI4MxkTOHgH7WLX3xYPIBUIuLdA5YRuKM2CWnx+Uz
         jKIsTTuxSIWo2QQfs+ToraIsjeq0lFlzDp67t66QummEgv3WzzLHSAnqhmCx0cYbjw/Z
         cvhuECvBRIgT/kFBK9IK4GKxCKFdLWi2+N46DLEW1o+dxAozFaA8eRt50AHNVqwDqc5W
         OUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763279119; x=1763883919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EMg3NX6c6HdI7rjPLbQWwYtnFdehdSrlUN2EHSpFLI=;
        b=Sw6wmHy4KUQhS74S2uE90fO2aS7JwyLyPQEqdrmRZ7FZDdMHC4BfYqasJ3wOUb9kEf
         3Js4ADyUZsSM5K3g9wAHPTqGz+FvcF9JzYeArTrDnoJ9Ikkz944XaCyaGKbg3HByvI0p
         wFKaOt2RYlgu2/eFkVbwg8F+KGPO7U8AbvFBC8LaWPHZtrW/8IQXJDzM4E09RvL/2vNd
         XeI8AcE3vql6mAIioc483u++I27Ia7h02SPzPo4vjmkXxodGkamY594rkYdqtePOJ1LP
         cp0lI0HBzaay02p4BetzPsC0YzZqg+3xk+/8FWnNnHoZhhEAyHQHEjYgfb8rnQMSRwaI
         SA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHY/eIgAdqr8gDGdhIb8v9MZUgySDZ9o09NR3ReI0SBJW7JAgGeK22gQVLwmjs5NsbpusWVlG4m2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxI5sBaNDBQ5gC9gs9PqMrY4lxg59GcfEbR7JrRlfJViDZAPHI
	WLexdZHkc7jSC8HEd/Ej8qEVwbynWD8aQl78Y+6euoDXC/0QxIBvz/J/qoWli5rwuo5ph8wp1Un
	K6fmsefi92vYhaGrLyrGsddjQ0vnvPo1bX/Oo/zTnbWCXnaMpZ1DZLgliUjFAXw==
X-Gm-Gg: ASbGnct+Ei6iyOf8BUPotNKZK3631lzA2Ux1DaGsR8KtQgqNrBHKGwmKPod1Awnt9kf
	VQZ/HfvJt+yijjatKTtdm2WN78NQlF76N9ZW2k69NfcN+RHGKrL8fcQjwxWtZSoq3UGd5y2Kh0D
	6dvs+Wv0vROMKOlNbkfN7PxGuGXhZ9ZT97bO4skuHesZJhQDrsZ/Ub3uXC9dRCKt9be3uGKjDGM
	btOZ/qDFwK64EelkP8HgGxIEKmWA1N4jOvfLNdH2URXGXqbZcM5LEfweFCv/SPhhyUWSUfvZ7a4
	Og2PzZiqMyuTc4dNuVpbFWNvDEOk5wJFa3etecsNuES+GL5W8yVTqdi0666DicNB+/0Hmj0SWgo
	dKvXs20BfrCZnr4jRxVo=
X-Received: by 2002:a05:600c:4744:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4778fea8ab2mr86893925e9.33.1763279118950;
        Sat, 15 Nov 2025 23:45:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm2k2Zhl26gIjz/7McugHmf2Kikp5zoKyp0v+rWLB1S2WlAgfk8AyjDIjgk38rvSQc724vmQ==
X-Received: by 2002:a05:600c:4744:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4778fea8ab2mr86893775e9.33.1763279118556;
        Sat, 15 Nov 2025 23:45:18 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779a684202sm64265025e9.10.2025.11.15.23.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 23:45:18 -0800 (PST)
Date: Sun, 16 Nov 2025 02:45:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/2] virtio: feature related cleanups
Message-ID: <cover.1763278904.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Sorry about sending a bad v3, there was a chunk there
that does not belong at all.
Lightly tested.

Cleanup around handling of feature bits:
- address word/dword/qword confusion
- simplify interfaces so callers do not need to
  remember in which 64 bit chunk each bit belongs

changes from v3:
  drop an out of date unnecessary kdoc parser change

changes from v2:
- drop unnecessary casts
- rework the interface to use array of bits not


Michael S. Tsirkin (2):
  virtio: clean up features qword/dword terms
  vhost: switch to arrays of feature bits

 drivers/vhost/net.c                    | 44 ++++++++++++++------------
 drivers/vhost/scsi.c                   |  9 ++++--
 drivers/vhost/test.c                   | 10 ++++--
 drivers/vhost/vhost.h                  | 42 +++++++++++++++++++-----
 drivers/vhost/vsock.c                  | 10 +++---
 drivers/virtio/virtio.c                | 12 +++----
 drivers/virtio/virtio_debug.c          | 10 +++---
 drivers/virtio/virtio_pci_modern_dev.c |  6 ++--
 include/linux/virtio.h                 |  2 +-
 include/linux/virtio_config.h          |  2 +-
 include/linux/virtio_features.h        | 29 +++++++++--------
 include/linux/virtio_pci_modern.h      |  8 ++---
 12 files changed, 113 insertions(+), 71 deletions(-)

-- 
MST

