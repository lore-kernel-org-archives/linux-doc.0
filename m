Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E441DE895
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336461; cv=none; b=nteOqTEJgEalwoN+gALjSU1i47Unby/13gd//WxrdlMyg9G14/6JwJAiNPR2OVhtc7I2jAnsU71FSai7ieH9aa7oRWHcf0jz1tAlvhQkUr6DkdmLcYXJ241uD326EvxB2sh5bGUtWAk1dK72LgUG0hLnCHI16OvHF7qKkUq6y3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336461; c=relaxed/simple;
	bh=lWV/O/UttiTJkLULUBKYE0bPmgRlaCXXqj66Zi3wY7Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=ENvpXy9ano4SuVYRDnmj3gVcPhd6SNtQY+QdiHttJHpHvrXeZBxASvGrHy6Q4K4KleHTC1RoP6lMsbI4x4Ly8lcBS+k32p0gtqY4baGQRd6gh12O004G1cHNhzoTQAzbOD+tWqjg+VCW+gC7AK41GFr0gA/WCGeBY2Bre1TVPiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=0O8o2Rg3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="0O8o2Rg3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161eb95317so252653415ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 03:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736336458; x=1736941258; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjDlOhfFjHDP1GFg1z841jK8M5cnJcOZe4IzLR2+JLQ=;
        b=0O8o2Rg3kvaLwTV7ygIfM0gm+EEqBR9VCbQbVmRBWTBvDkUbau3obtsHEq1PZ3l1hp
         kvTaA2nWRnRzyhPXWxj3Awjwv8AWEe4o7WUWbyxFQOmgDgnQJAjVo8MGxYEJfVlX53EO
         spVp8qV768U6zs1ljdYdfNwcDGIVdFXlnm27ZvU4if347G3mFP5Z5vnoc8OAI7xYDEjH
         GbXq6SEzpFnT6XOy7UIHyrLm+CT2StEp+MIZQIIaLESlHA/ZoRIIJ0QuEL88EIEZDTIF
         pY9eMQBFbAh41Heay52j4jueCBlTsvk5XMF0Kwpjccu+xU1uMM4ITsIAi1CYSQOk65Io
         HDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336458; x=1736941258;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjDlOhfFjHDP1GFg1z841jK8M5cnJcOZe4IzLR2+JLQ=;
        b=D555ePo0S2MOpRsFwe5LR8P+rvKalSLcqP879w4k2jR6uM3kMPi57duRh0VCoWH1NY
         IV7mShyTsIc2XKlNwi4vb7uf148ydbikeH4Xm08p8oQTZM+vQm6118NVIa4Hhq+2hUGt
         NLVelrhsKt2NDCPvP/gMgC4JlQKS7O1PFIbqP9ftFnbvsFMY60erCcic9AQLsGDMg7+D
         bBCcFrotiU9CLuXczwDNgaZApF3cIDn+BiGGaSbtPupZB2BrtjJ2JIoAJkQpKykv4UAr
         AXJIAroF2IOqnmBO7zyW4pRCqt2DDLK1+qEEEFEtZaUm8ILJk26rsH3v9iYxQj1//f9y
         refw==
X-Forwarded-Encrypted: i=1; AJvYcCVgRzmhPc1MG1rk+U7gPGM1JmrAww/ICbG/lY1siI6QrCQAG80hmYNC+nKODP0jZC16QdjwaEP9uzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt3qL5po+VpgGzPgmju9RRu46Q8HMFd5F/oH8AlU7PqAnVB796
	3nkcPUUBI3+6Igf7G8YmOg0nVPVgiKi1g7wTkaEAPSTfVkbo6gYsfDD8RhUusF4=
X-Gm-Gg: ASbGnctWpHBvXG2+YpNnik+16j47ThMSNCpThxmP99ce0m/B5D579W3wI7B5sKS6Fm7
	hBhNdUXw1SmHOs5obD/PsF6EOBW30ybrhJQv3gcfmeFvjGWu7FQRvJC6LAn6TCYr9zPHju+KH5j
	Rh2mkR27vxXCCK41w7gN8jqgjV76BhO9JQA45beV8i+2xK2bRgBI2Ug85QmwnWSVbUXQcXePBJh
	PA5T4NCtp+qiRiISLLm5jv05pqe22zDgJiv9MElUx3VrXBxOoq92CivT/Q=
X-Google-Smtp-Source: AGHT+IHFRNXARPASashVpP22bZbsPAi6fmuWW4IEFR4NWYNiuFbqTXoYAUP1T7En6RP96xLPSNA5Pg==
X-Received: by 2002:a17:902:e750:b0:216:5268:9aab with SMTP id d9443c01a7336-21a83fe4ba3mr38646875ad.46.1736336458432;
        Wed, 08 Jan 2025 03:40:58 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc964b84sm325595705ad.50.2025.01.08.03.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:40:57 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 0/3] tun: Unify vnet implementation and fill full vnet
 header
Date: Wed, 08 Jan 2025 20:40:10 +0900
Message-Id: <20250108-tun-v1-0-67d784b34374@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpkfmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI2MD3ZLSPF0zs1RDg0QTyySDZHMloMqCotS0zAqwKdGxtbUAGJ7vjVU
 AAAA=
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
Akihiko Odaki (3):
      tun: Unify vnet implementation
      tun: Pad virtio header with zero
      tun: Set num_buffers for virtio 1.0

 MAINTAINERS            |   1 +
 drivers/net/Kconfig    |   5 ++
 drivers/net/Makefile   |   1 +
 drivers/net/tap.c      | 174 ++++++----------------------------------
 drivers/net/tun.c      | 212 ++++++++-----------------------------------------
 drivers/net/tun_vnet.c | 191 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/tun_vnet.h |  24 ++++++
 7 files changed, 281 insertions(+), 327 deletions(-)
---
base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
change-id: 20241230-tun-66e10a49b0c7

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

