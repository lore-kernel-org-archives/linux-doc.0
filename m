Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E012147FE
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736405941; cv=none; b=W02XVRJZwFuzv+Dyu7J/jIP2Cz/iA/qHBBMxft+zkGlh6X39MQHRuxOBrEMK9A0p4MH44s5Y3cD3O2sIljJT0/omGZMyurZNVJr/6WkuuIVyx+6TvQ9eWCPTbugNYyRCbhEkY5fG5Cfkju+ET2KnGOOOTZdgLE//hFC6HKtB2i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736405941; c=relaxed/simple;
	bh=b4nGT7bzNP9cYs0RRg/GoDk6GVo5jtMW+D3RbTMnfIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=JaaSONXA6WVTX3XnT88Cc1zoA1jpRa0TG0oL0oBuqhlV/tjhKND09U6vfvD2haeLeNWy8R3uteqXwb1hlbZ8sO8fE6VI2UbQ0FvlrL0U1IduTZIomp4/K8aE4DNW7z60/kp2BaRT4anHQ8qxZHyBg4j/Le3zbzA1blGS7t/nnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=JKRvsN14; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="JKRvsN14"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2161eb95317so7736895ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 22:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736405939; x=1737010739; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6t1qxwBoLWfejlGfA7U17j5uTd/JzY8q21mk1j72ew=;
        b=JKRvsN14t1CeuzF/R4TvpFmIOqmoYh19+Y81mLRsBMwVc43qr6/CRnWCOWtMbhW2Nr
         rwWoZRYvWkfqDaZC4fHFIfSkjVWs03eVf/l0ej6Zi2Sja/nhgT5RdweaUlLMA/V2rafC
         dq81UurJScMIzEA9tZT0Ov886BguUp5zLhU2g794i9Oozh9Rrg7mRsd53UJljL36ZZvR
         n/z6MkMGty0fNc8Pc4oi3MtsSd59OrEsVyax691l5+AQrkpUKGup6qj4Pp29ASm38dYf
         KEQRoGZ9W/bx+/oYd2fmvmhBw18HrvFRaaI5RfKlcJuvyLoNQkP6VlIHlrQyTE1j3X4B
         z3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736405939; x=1737010739;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6t1qxwBoLWfejlGfA7U17j5uTd/JzY8q21mk1j72ew=;
        b=qMDzWvfF3Sz6CIMJtJW6USo9qAOD8kUc48QbZWvrkRNSvKD7/nQzgQKwFNd+I/H1L1
         ad4ffTj1AAdilaHmHoyanoQ1fgV9xL5XN9Ys0D0diCMWBMWuyeKiZ5KCheAQiMpzFXIn
         P+D4fdajJNgqNd9LcKYi+YKuH0bgMCOFYQLtjKjaDLIVHwZBIgMMRj6v6CKkJKH6T8Em
         FnNKN8bFnpxj2vUGQiHtHO9mDDaYzDZJ2aq+DkZlJZuh5Y8qVNbfyPzRgAI5VcduSCRs
         x65j8hOnvp6LQl39rbDFU7ytXGz/jCnTYlexsuRCxTS7A2ltjuqF4RXbdiQ0fuKJX4eW
         fUmw==
X-Forwarded-Encrypted: i=1; AJvYcCXu/qyBiJUX7B4vj47naEYXHpkWqIIdAJffge+7OY0B9gOj4KT+DBBIJsaoY98bYEQhDn2K79NPtZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMModcDto3uHVh4CMcMQ+6qQ01IU1JwzTNc+b7f7XomMjz2aon
	uPVUy5PBIFLABmMcrJqftZN0AfrhlhM7jUCmU+VzPv88ww6ajAOg1xS2omo+nXA=
X-Gm-Gg: ASbGncttAelJDsGwq8jlFVSRh60mtIMksv7Cu+H6Gsk8HtaChzZA6zJJyyZKiljMokH
	XRKXq/lup2Pxc4FzrFky6a5BSJDw0Bme0cNqAldmMOicRh6OwH4xuZK9m0/VUZOKtt4Ydz9Te9v
	eUe+SyMKIoU6f0ui8XlqREM+BifHuqvgSLCX5AkGwN6lBOTr4UGGzEutNO1pXXMgWbuZLLgax2x
	K1j546NJ8y6UJ4/ioCTb15rJur7eQpazenuZQhMCT1uQD4d7nBnYLdiNXc=
X-Google-Smtp-Source: AGHT+IFVrPaDE5bT1NedCIHg/BRb9M1axoVZQXe+QhCRKOheUBg8nZqyVlcuDTD0PULcei7AMQYLnw==
X-Received: by 2002:a17:902:e5c2:b0:215:6f5d:b756 with SMTP id d9443c01a7336-21a83f36e79mr79407695ad.7.1736405939214;
        Wed, 08 Jan 2025 22:58:59 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a91767f94sm5432205ad.40.2025.01.08.22.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 22:58:58 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 0/3] tun: Unify vnet implementation and fill full vnet
 header
Date: Thu, 09 Jan 2025 15:58:42 +0900
Message-Id: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJzf2cC/y2OwQ6CMBBEf4Xs2ZptqRQ9+R+GA5RV9mDBFgiE9
 N8t6PFNZl5mg0CeKcAt28DTzIF7l0CdMrBd7V4kuE0MCpWWKkcxTk4UBUms9bVBayA1B09PXg7
 Lo0rccRh7vx7SWe7pvr+gxPLYz1KgKExrSt3kOjf63tar4+Vs+zdU8Wf09JnSnfGvjfELvQd+h
 qwAAAA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

When I implemented virtio's hash-related features to tun/tap [1],
I found tun/tap does not fill the entire region reserved for the virtio
header, leaving some uninitialized hole in the middle of the buffer
after read()/recvmesg().

This series fills the uninitialized hole. More concretely, the
num_buffers field will be initialized with 1, and the other fields will
be inialized with 0. Setting the num_buffers field to 1 is mandated by
virtio 1.0 [2].

The change to virtio header is preceded by another change that refactors
tun and tap to unify their virtio-related code.

[1]: https://lore.kernel.org/r/20241008-rss-v5-0-f3cf68df005d@daynix.com
[2]: https://lore.kernel.org/r/20241227084256-mutt-send-email-mst@kernel.org/

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v2:
- Fixed num_buffers endian.
- Link to v1: https://lore.kernel.org/r/20250108-tun-v1-0-67d784b34374@daynix.com

---
Akihiko Odaki (3):
      tun: Unify vnet implementation
      tun: Pad virtio header with zero
      tun: Set num_buffers for virtio 1.0

 MAINTAINERS            |   1 +
 drivers/net/Kconfig    |   5 ++
 drivers/net/Makefile   |   1 +
 drivers/net/tap.c      | 174 ++++++----------------------------------
 drivers/net/tun.c      | 214 +++++++++----------------------------------------
 drivers/net/tun_vnet.c | 191 +++++++++++++++++++++++++++++++++++++++++++
 drivers/net/tun_vnet.h |  24 ++++++
 7 files changed, 283 insertions(+), 327 deletions(-)
---
base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
change-id: 20241230-tun-66e10a49b0c7

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

