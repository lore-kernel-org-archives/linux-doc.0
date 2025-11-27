Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C2296BD6
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225636; cv=none; b=fLeGSC4JzSeZw+8v7Pl99Jfb1QjYJx729vo60NwhFF3JyleQExDJcD2uRqq6nd+8Z3WdUQvFJFOA4P4NgpcB5uD3tIPuFFIhKB1pPHwy2jOFIMLURTTsQpeyK21u2PrjU2JeL8ivcOVnEIkjV03sS33w1CH2ILzQ753yqXMSbqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225636; c=relaxed/simple;
	bh=xBu9C98zr/V8IIqIfOuYV/Prmm6s8GMzcQJGTf+3eXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQsd6Ip4i9VKYziOY4josLApDcQFK6J3jtmzhYqO0eEPeebKQjuRsS/+N/7oslL8l7lus4ytQE/zA3jQnvRmnmUKTogIulvop928ItVxrz5uXmWZB1kl6XHrs51ZrfcFdTbkDQyrYLx9isaoHEU30IxAYq8TIWzQHlgqYt9EkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzIlZMvX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qaRbcBwi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzIlZMvX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qaRbcBwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764225634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=wuT94p1p5YoZPXiJ9LxCEueq/01SlG2osUN2E2cz8Ic=;
	b=PzIlZMvX8qb8l+Nw6ziw9yMj49wY7fiVf+jqGP6AC/10SoMXRNic+SuZX1V1AKJ9eWWeeK
	56BFGFglBb2d/pT2DYSsQnW8nNf6wxg+HVIysG75rxAKfTj8LxM3PNEVgydP2HRuztO96D
	AwgVGM4AbfleVjH5MB5Hl8RQi+Foj/4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-gaKC5i2EN3ym6UjYVqD_gg-1; Thu, 27 Nov 2025 01:40:32 -0500
X-MC-Unique: gaKC5i2EN3ym6UjYVqD_gg-1
X-Mimecast-MFC-AGG-ID: gaKC5i2EN3ym6UjYVqD_gg_1764225631
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477964c22e0so2903925e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 22:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764225631; x=1764830431; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuT94p1p5YoZPXiJ9LxCEueq/01SlG2osUN2E2cz8Ic=;
        b=qaRbcBwii+olRp/ACl+F6Nhfm90dGGEjdgyoZVKmuVYpuOP8b6Ur+yYcHnGvxfZYmz
         lUblTXrA0JISONiiJCfMWO8uEy20wHLoad+xr/X3B/ExWStCvqQTmGq4pw5FcFymliyJ
         PMpDHn/8JGd/GJddM2J7imd5GUCp4dLZDMiWsOPhaNG4e3rdwrdQzWHul4NlYjvwXTCD
         L+S4l5ONJmA/Qvk4AKMWFGwkIPYZiJxDqAj67vixnOjU9m9FeMbzKccrpLkZr9Qv9FvG
         UwnhZRizX6ej+BWMj913o5jsLtNJRo4NR99XvbBCfSvuFWtNM0zpVOSySG09FTMyWyZ/
         nZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764225631; x=1764830431;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuT94p1p5YoZPXiJ9LxCEueq/01SlG2osUN2E2cz8Ic=;
        b=QA8aDevSe1UJ0jChiCkPScTDzRs0tprt+t39awm/VcB+VE9LSS0OgdYA2gg8wuAmMC
         RJ9fxXPWohNlZ4irAAUwIwGNKsiG/hFDrx5T/IdMiuFIclxMnuLxNT/ymO56uWBDV0/k
         ohxeGW5eTKCnsW5yoXWZGEotQ1+bujM9PHowd22ueSkkUeIoQ66TWR36nmKhxi/TRt7b
         DEl/qvUAP56z2SZNbmlh/qchau69DRxiZCF95hf0eB5zahF1AQiwo5MZvNmIj6Llz6Ow
         TmhxE0N6DfXRvPreFUhH9oL7X8iBMPRPpGmHR/D77ERBn9ilg+GZWPhY0VxfQUHrIjIs
         5FrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA8rPqObbNAnw1r4pOn6EcUKkYPDMckz9GMJMKGAVXSsiOUPLYrldcGJKJHQTlRt9f4AtXrlyQL44=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOdd9A/KVWG4RrbDqIXITTpKeSe7lvRGgmEpus7lQUMRlN8RT4
	9zJByHLJUycDdvyp13uy17yd0126Mt6VD/3gH9fnpR3eEeqUnZw2i+WeGGj0XKd2lIvqJKqX1G/
	+oTnC5MQZGvKbKEXVpqTgw/qpZgXTEwcWfeDhCO9zJOqpUDm5jwEnMkOrPfxktQ==
X-Gm-Gg: ASbGnctiuVCEEG3DpqpA16t6+6MEu3+jGreNzTclUI6U0NDxhBO+Gu7YOBGhR+sBLLm
	6ccY0gZ1FyMI6A2flEG8q0cNfqgorMjFgdPgZHv0KqlJ1raI1kSDKL2h76CnGCEoizb9/vG++Sj
	GbvHLRxRVCXiyitER7S1Uoxubb/KP6TqvA4QrBtmwjnLIawS2keahxHkSuzwpZ6ZhsuYg7Z173P
	sPh6bXZyrXif+wN1Ir3x2m7pjetzvGQZvWkxnDilG6iK4euX6Jo8ti5tCtkfedtkENtEkPV2bNY
	5Zjk3lzS5urggg6UwZgDqio4OtQ6oHJ266EP/xM8wKsnqJOnjkt78lwJqt/kR+LEEBTejeoehob
	xDbw3lSSzOonr/6IfD19cLbjG5NbA4w==
X-Received: by 2002:a05:600c:1f85:b0:471:793:e795 with SMTP id 5b1f17b1804b1-477b9e61f7cmr222173705e9.0.1764225630963;
        Wed, 26 Nov 2025 22:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF76KdhGXjY5ZtkUCvZbpceqilnQQdcgRmkvzsAfI7e3ekqqLFi6fdFkjz6br0cokEu+iwVsw==
X-Received: by 2002:a05:600c:1f85:b0:471:793:e795 with SMTP id 5b1f17b1804b1-477b9e61f7cmr222173475e9.0.1764225630563;
        Wed, 26 Nov 2025 22:40:30 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc186sm76113625e9.13.2025.11.26.22.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 22:40:30 -0800 (PST)
Date: Thu, 27 Nov 2025 01:40:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 0/3] virtio: feature related cleanups
Message-ID: <cover.1764225384.git.mst@redhat.com>
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



Cleanup around handling of feature bits:
- address word/dword/qword confusion
- simplify interfaces so callers do not need to
  remember in which 64 bit chunk each bit belongs

changes from v5:
  rename variables in vhost to make the diff much smaller
changes from v4: address comments by Jason
  move features variable to beginning of block
  unsigned long -> u64 - they are not the same
changes from v3:
  drop an out of date unnecessary kdoc parser change

changes from v2:
- drop unnecessary casts
- rework the interface to use array of bits not


Michael S. Tsirkin (3):
  virtio: clean up features qword/dword terms
  vhost/test: add test specific macro for features
  vhost: switch to arrays of feature bits

 drivers/vhost/net.c                    | 29 +++++++++---------
 drivers/vhost/scsi.c                   |  9 ++++--
 drivers/vhost/test.c                   | 10 ++++--
 drivers/vhost/vhost.h                  | 42 +++++++++++++++++++++-----
 drivers/vhost/vsock.c                  | 10 +++---
 drivers/virtio/virtio.c                | 12 ++++----
 drivers/virtio/virtio_debug.c          | 10 +++---
 drivers/virtio/virtio_pci_modern_dev.c |  6 ++--
 include/linux/virtio.h                 |  2 +-
 include/linux/virtio_config.h          |  2 +-
 include/linux/virtio_features.h        | 29 +++++++++---------
 include/linux/virtio_pci_modern.h      |  8 ++---
 12 files changed, 104 insertions(+), 65 deletions(-)

-- 
MST

