Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F09286D70
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763278597; cv=none; b=e7kJFppKYcelCUzs74M4iXKwaQW9Unysmag4BGtz4GA1vpQMLXpAiafPVZcnEsZTvGu71vuAvWdAeWFNNIjyeSAF9IZBZYQFxDM6qm98vQ1S2ikjUJWAXKs3EQK09PXNtCcSVe5d+fI5D4Z4sJUGVPzpso1kYpcvZbDTiAGMj9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763278597; c=relaxed/simple;
	bh=/wU2PjO/9k2SX10eUAJ2SEQukhtmpyHpHIXxtUzeWto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvamjN8kQMo+u0YLJ2qxtQ4X9PRHDMANCP4ArbMut/AJC+6iG8hDFbDr/USMypZxpbE83tTC7O/d3yJkPKznJu+TmNLEKZC8drCR7Ijbouq2ZkDRuwvnZHsuJxda22UM2Ya9ZF+zneMutbcT3hiMCOgbn3DOU6SnR2BDAjT9zSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hGFEFF1N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qqh623P/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGFEFF1N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qqh623P/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763278595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=b0yaVDVgrAO7aUVp8P++ObXwpVxREDZ1FEXCsETlzo0=;
	b=hGFEFF1NsxmxqU8m+EkAtNoAJKf/IXeenb8v5WZUG2MAHH93CB9GjpjaNSIfKK2Wmr1F6I
	gOCHyE8BwQd0uAsIId9oNshZVgCic9jpzJqHWkf/gUE7cYAy1F7XfPURFv6Vhg+7J02vrY
	C1PUo/82Y6tgvxA36PGiCAUOILWBzI8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-khpYFxq7Ooy-T67UZIWnFQ-1; Sun, 16 Nov 2025 02:36:32 -0500
X-MC-Unique: khpYFxq7Ooy-T67UZIWnFQ-1
X-Mimecast-MFC-AGG-ID: khpYFxq7Ooy-T67UZIWnFQ_1763278591
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42b3155274eso1267324f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763278591; x=1763883391; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0yaVDVgrAO7aUVp8P++ObXwpVxREDZ1FEXCsETlzo0=;
        b=Qqh623P/iRVGRWu89+BHV5Gz6faoTprK/wvT/Nz1c3adtOwfy445Us+QmfT5/NwgU0
         ATpEEAhUEbfALx6CXvgcsKvgMfrLqvsUN6Wit3XwBCV1qaeLwmYzTVj/9bocsMULpSvd
         Os+a9eNLZVyjkXFUnoG1Ni044Gf2rqNKM0LPHdDimvkbP93pqRXYWwtf4iVq93xiWS2Y
         DJ2m1E7gBptLha2YtuRgWAj+fyqK6w8pqO93nhq0+bRQB9zT+eoYPJtbc7kRhAoxZUKn
         iJH6i/Et+TptzS5Mrdq+IzzhhLCHbpOKbSKaPHzvujzv5YlksTT1Z47qzA5vSDB3fGbx
         Z3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763278591; x=1763883391;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0yaVDVgrAO7aUVp8P++ObXwpVxREDZ1FEXCsETlzo0=;
        b=vPvJW1aXiI4bCPIX3xg6zKPb/Fb8lVk9krYw3k8+mUOopQdPkKHMLZemGQaezEBnRr
         9LOAZEqwx/wjy5+3GrD1SdQkrISyjvh05s4+4ohBt29mGne0OlWcFa/adnSc6wtV75nP
         cjdJ688s17AyJRLNzf4FE9MBIa2fok2Mco4vyjZ4uX5AoEhkqJnS7F1X6DErhOBCWJRs
         G9E3XwIXBvB+86u/DlU5sEIR92J/4kOLBHYnOLZIVxoqJ4kszfnSRWjxPBoJoyXp7W6F
         GRl5pkqRKLXryB1q3fL3OFTnoG4VL3/OqFe7iyHYt6y6vfltDN1ahyul4pu2d4bonnGm
         4FnA==
X-Forwarded-Encrypted: i=1; AJvYcCXFxEjbR6msss8kIKcbkoMDNJlyCoeD5oDnfTbXSoxqfNX0NAhilyb6JY4ZiYr2oTrLhXDo3yHjQXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YX/Z0GSu9OWkv9ab5G5T1S/p83b2t1kpHwmZvoSrJf/eEv1Y
	Z/5s56wApYdLQH1IfuRE20czqVGG3nq7VtJ0MEqzmvBMuwLoSFD1SWp2YKCDlIZFYoimB90vQGg
	cH3L2QsVG2LoMN73U7BrRzM6M4cIT3Lnmy0Y4kHv/ZKLfvByJ7KENwOnbDD8xYQ==
X-Gm-Gg: ASbGncsnr3kIXbh5+prtR4Klqf2isrjN7hd2IzcWUOEcqZzOeJMO1ZA1Q83/8QNhzg1
	Brqm72q8LaCif1mw+ApLpFVYst/Z2hXpqTwHIz1QT3tcmtTWbuIGEadMe77RsLAz3Q/08eRRy6w
	e6MeYg/A4SoOH87J8unWJSHwiS7wzwyOG7F+dmL7e1lO9/s+bo0TiIT6fdWv5uH8IuQTxLdbwnr
	j3S+l5d0RV3yXdPbXParevPCyLlUFOuP/9pLEv/Jc8SDFFbV47fyjgIOo4vpemnHUdvucbd1FgO
	91OFoFybyD1foMvjnjCVwXHSXevaxZsjtC1kNhJVpVkgRICpe1NKAUa6L5qZEVf7/LUBa91HQXb
	sS0xV3yQC/3bOw6DAn6c=
X-Received: by 2002:a05:600c:4744:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4778fea8ab2mr86716325e9.33.1763278590826;
        Sat, 15 Nov 2025 23:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqZuOeT1wAABazsJ0HksCXcwMYVBBLygHfL8/xmHfq4axK6seTI4Hh3FvYH1PcGLCWD6fslw==
X-Received: by 2002:a05:600c:4744:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4778fea8ab2mr86716095e9.33.1763278590441;
        Sat, 15 Nov 2025 23:36:30 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm79746965e9.13.2025.11.15.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 23:36:30 -0800 (PST)
Date: Sun, 16 Nov 2025 02:36:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2] virtio: feature related cleanups
Message-ID: <cover.1763278093.git.mst@redhat.com>
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

changes from v2:
- drop unnecessary casts
- rework the interface to use array of bits not
  arrays of qwords

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
 scripts/lib/kdoc/kdoc_parser.py        |  2 +-
 13 files changed, 114 insertions(+), 72 deletions(-)

-- 
MST

