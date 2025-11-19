Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09631B82B
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763535318; cv=none; b=LoJ7ii6pWWWOnTUerI1tYI8gh6+JP/Uhahoq8N6wKSTO9wl81CwXRAxMkxoH1VJhpPL9pUK6ste2cyisgMdxYX15k2meEVwTQ1IaTOiNhbOeT0LFzZIM7BxogGZpNBdwX3gzASnxWqSSqZBgDg2fPm+Xhx/DPhmnecf+tkpVYe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763535318; c=relaxed/simple;
	bh=k1goUGFLRnYWiOHlY1f8YG693FK+4R3wtZttzUxNEyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OaQ79Hgbfdq9Ns/btSRM5uxkMnRwV6ylkn4NxxXNk6Jn/NpMGJOwT/PUXuAt6h+9CnqM6+xuP46g/o9DEXOMdrl+7eRwwvMXUOVqiQCevnnatvXWUXC5xlEt/9/ABJuu6S5zaDYb47MInjAP9N2OVCXelWBlo+gcrKZxGDGXWzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zao0mkQQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRDiWheJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zao0mkQQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FRDiWheJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763535314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=AmF8UtmERypN0SmhorEC/T0EDvndPupXo98es8iiJ+s=;
	b=Zao0mkQQfAWTOJ538x3nsI5eMsaKHENJBWWuDaPxhVcoDyTFmSuERVMCFanAIv2Zp2Ex3H
	/FyVLvsKT3WlevvrO1V4r8naz1fhC8hhvkHpifNxRDrALyyWAzLwt1f5H10NS7Qc7j1zHI
	HH+Bx8ZnDI4TGNGgOEtr6uZTWF9iKaI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-NBZ4UR3CMk--ATjwrm4jZQ-1; Wed, 19 Nov 2025 01:55:13 -0500
X-MC-Unique: NBZ4UR3CMk--ATjwrm4jZQ-1
X-Mimecast-MFC-AGG-ID: NBZ4UR3CMk--ATjwrm4jZQ_1763535312
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b3086a055so4169189f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763535312; x=1764140112; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmF8UtmERypN0SmhorEC/T0EDvndPupXo98es8iiJ+s=;
        b=FRDiWheJQCUef38VkhETmXbjfVs6kaMTDzj+LtnNZV86QlgmgjfrGYzJK4702zjp+C
         RlQBoRW6OWZzwYvkNBqRbv/0I2lRrLwp0btvacufxc17+5hr1tjtQ/S9RY5U4qjC01xI
         GKTxVb+0FgDVkts/rOXEy8wnWV1u7eFiu2jhWTgilYVBLzhH9InlTwJmFznjliRAJUPY
         dRqySYWjUbVqhVVfQnOTDhdwBklaJtHcmnef3u93ZX4TRTOqY72vRKb8YurEqSqPwVYw
         d/HSyYE3m7VobfTd4Leun19NsWCK5ggi22SSrJwN5Rq5aFUFRkR/8TeDbboZwj8wDjrc
         zajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535312; x=1764140112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmF8UtmERypN0SmhorEC/T0EDvndPupXo98es8iiJ+s=;
        b=cz2xNcPOy+C+A47B59I+j5keMjGWpABkbaoSKgJHdwz7rQshvgmZVpJeRwTP8MnoO/
         pTYxkNwpkwEtwDosVF15ieMDVRc/wCiJSTNwgMJTeqK5c7gzichxZ9DJRpkJp4JXH8GB
         qLTBap4Nb0Hs0GiyX/ZSKW+5s8HIjxRpArfiWU92QQj+yPYDenX8oRLnEqS4GCnE17TK
         E/C8b8BhmgWOyRzbxF7dO2q1IM4MJZv4m0/5V6cKbyJTg+9cfrREW56wslOpZCfmQV+/
         8+wAm7odTiUYFnfvfLGkncSegSPg3cu4aWUZEgt0j79O8rKmCuoL3udFaGfQv8DozTZE
         6Qgg==
X-Forwarded-Encrypted: i=1; AJvYcCU16UU7K0i6aVo1se40+0lL+oX3OmQiIswzZHEyQsrbaKpBdXMA6/FvYtGwnb5D8jXzpLexczdJ2uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfy1CyKC5SLlkPco8oonFTZaBndnGF6DOKt+KmwR3/dRjchfXZ
	2F+dH+TcsEbRIpJH6kZoWdxPnSouKn/Arx//lqilVWO2Po2qw7MRxg7RimwEgwH7D8S07Cw2KF6
	lv49S+M4fk3UZQiy0lV+IqFXOWzgeO9zm9VceWTDw5OjygsRTgVdSKfdNW3yK4Q==
X-Gm-Gg: ASbGncuZbjPWzyVKaznzZQVhM/AGx2v7kuYKGXemqDmXqugpK/7G1lavKJR7N0/xNFr
	+HU0MXVjaztk05pyA0iUTlRzHVItILr09RycvS4TxSPZidpuwYcB1aj+Hc6+LDiF5vIyWPicB4H
	N91DmsmCfbqHYa1en+jRiJRjQtbsO51yiujYT+pq8g/FSrQy3tSaW1o4xYQFezFLU286ki9faii
	QxqODR9h/HCzolSye4Fh0goFaAQgD7KYOafBxmsXrw2Y5ug6hBIySadPq9typFiALQqSZdioFDm
	o5s45s4i1bgX3NDIPaChFHKCY4B9O76rYJ5Klafis8u93j4K73I2NM0/jcTL2tfgFwmCxT2YUle
	fzpsKEYcyEf3nbHsysPk/j9R8E7gSeQ==
X-Received: by 2002:a5d:64e3:0:b0:429:ccd7:9d94 with SMTP id ffacd0b85a97d-42b593954a1mr18869471f8f.51.1763535311772;
        Tue, 18 Nov 2025 22:55:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfj+W4rZkCy+pTT7CJvO3zJ+eyBS0O5AvHoo22fcnNNP1yE8aTkZfwKuiofxYmEYEMCNpYUQ==
X-Received: by 2002:a5d:64e3:0:b0:429:ccd7:9d94 with SMTP id ffacd0b85a97d-42b593954a1mr18869443f8f.51.1763535311322;
        Tue, 18 Nov 2025 22:55:11 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b617sm35673024f8f.31.2025.11.18.22.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:55:10 -0800 (PST)
Date: Wed, 19 Nov 2025 01:55:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 0/2] virtio: feature related cleanups
Message-ID: <cover.1763535083.git.mst@redhat.com>
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

changes from v4: address comments by Jason
  move features variable to beginning of block
  unsigned long -> u64 - they are not the same
changes from v3:
  drop an out of date unnecessary kdoc parser change

changes from v2:
- drop unnecessary casts
- rework the interface to use array of bits not


Michael S. Tsirkin (2):
  virtio: clean up features qword/dword terms
  vhost: switch to arrays of feature bits

 drivers/vhost/net.c                    | 39 ++++++++++++------------
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
 12 files changed, 109 insertions(+), 70 deletions(-)

-- 
MST

