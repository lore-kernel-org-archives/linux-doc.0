Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79FF1EFFB3
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 19:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809123; cv=none; b=ccgcGY40Hfo2fNIirPSPETYvSELZ7qfdykXAkb7Sb+lFTz7wgn2CVMszHc2oDcZzW4bZjfqsu4tPIvOV1AfJ4KyLymHabWLEhjin8oP13QAlyAhIf4UbPZhPkabECyWeXFu8qn7bAP9Mf3ciErX/VoUUJnHuBS/Ohl6BW+ro7bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809123; c=relaxed/simple;
	bh=Q2k9GPayWeUHQsXcs/86RclA5d1uasfKBhsFAaw3N6I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O1y37OGKW9yTfO7R4Ligyecir/WhjtHhL8WmLUrgLQXLDDyR2pyVCQclfENCOj5foVoM8hlhpr8nrvIzKSCF60aII6zL/6badgR0dcnyV1VxBbSb1D+JegXork41gUpxZlCsdW05VqzTOv5RqErToarRnUVRvpUiukG3AHVQxuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=XKBh4GFt; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="XKBh4GFt"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-22409077c06so6108635ad.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1741809118; x=1742413918; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUXQmTabTFlJQTznKZdaGRe9l01Y+yauh4zh2Ba8guo=;
        b=XKBh4GFtQCYph1TcPaoHMx/aS0kPOPGy2bz3gEQfe7/Am5jsZSqu2HIx3lm3sN8Qbt
         BYRTRqeMBEPJhg7bbdHL2mmOfojYsV05s56KcpqY3N/MvjMKvVs4DxzALnDYb3wPOZiF
         /hO3Bpn0YmPt0Svnob5N9iwjmB23DFfA8Sqf0AkOhvS6weuCK8DyRDm4PG/5cPs0loMu
         CExrPDjVbwwbtJ+jAF1FDm5aMzQQRpGvIKNv1jMji6zdVC7eqXQbDdCjBlKT9fgVWrng
         tIiNshqy5NTKtRLmcb9WpqyryGmzqhFBMmu1CYgdyUkiZmSP6K6YaPVUSPy49ewEfoln
         NYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809118; x=1742413918;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUXQmTabTFlJQTznKZdaGRe9l01Y+yauh4zh2Ba8guo=;
        b=bPuH+HdYavlzr85QhOud+4u2uUK6BUH1DKIRo26+iJ01E/viwRS12CyG89KCKMwWjb
         sKfm5VsoRCQw/g6S3YVE+p5sqnz10G2YkROmuebRGfXcwWGLgC9tusD1oRQUm2vnFlVw
         ee9cbpQlSbxnbf/d+JfM16J9qIyP8ZmbzFolDmqers2QY4T7nFCAylCk07q4xQaVDXFV
         N0e2a9PowwTvnnIXgMdb56d9zWKo1YrDqM54KKX7839s4OG7VP8RgPDJJawIAFBEoUJy
         NruZdqdSGoTRkFZrt5+EG56y25vfF4ykngD0rsU8oUop94wNQOOveFT52SGg+xId5lhj
         a7cw==
X-Forwarded-Encrypted: i=1; AJvYcCUgKEfBboW0+J1JkvA5/oRKCPq+xIoZgy6BNTxymuJIqvd1dskc2Rdze9+yup5rmPUpMNKyM0Nf9to=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQmQtmtBV7PZVW3FFKHF6Vb1+XumWh6hHTC21FgCN+UXVpOGY
	H4DfROHEVO8c6sVkTB8agxgKe8TP4OsZgGoBUrANPmBLbramhewoyeDgee+61Hi24sditAikINW
	OLrqbL+lBmHefoTj4OhHN5MMjnOQc4iBTjuu4e71FRpMEDLRE
X-Gm-Gg: ASbGncu5NicjTuVOmD4QyIq8VAQIeVFsyHXvWGx2BJiSnQwxkTJW1qOszW8r/v8QLLY
	i8qRFqqHWchb19ycyayPtaTX/muMOlogqx9ABQ8PWkK3zciHBubGb65axKl5/HYTtSF9VLEcyKp
	alyjdbj08gAmltfi5B5GlOUZWWWNdp+qzgGI57o98RoatHfIGc1bi86oGN4k3nZkm+5ZwuRu7vt
	WaSQtXuLZZEmc1KaMAjoxDyMOtgVaYjfg+5Lcj0igYIjVeulGop1RZKceqtbU7OjzLLBQqiO2h4
	Rvqm2Df7krtJTKhzrWghe9pm7cMtGPulEh0=
X-Google-Smtp-Source: AGHT+IFzTFpDmJydmC2PtlCdpNTNUDU0mgSO+UfsIg00y4eEivOM8oFExNu431q+A3hE23lAesqPTs6l6uBP
X-Received: by 2002:a17:903:283:b0:224:194c:6942 with SMTP id d9443c01a7336-22428bded4amr373642295ad.34.1741809118152;
        Wed, 12 Mar 2025 12:51:58 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-736c8d701absm632789b3a.12.2025.03.12.12.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:51:58 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3CF97340328;
	Wed, 12 Mar 2025 13:51:57 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 2C718E4044C; Wed, 12 Mar 2025 13:51:57 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH net-next v6 0/2] netconsole: allow selection of egress
 interface via MAC address
Date: Wed, 12 Mar 2025 13:51:45 -0600
Message-Id: <20250312-netconsole-v6-0-3437933e79b8@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANHl0WcC/23NTQ6CMBAF4KuYrq3plP6oK+9hXJQy1SZKSYtEY
 7i7IyuILF/evG8+rGCOWNhx82EZh1hiaimY7Yb5m2uvyGNDmUkhtZBC8RZ7n9qS7siVNyBQhr0
 Fz2jQZQzxNWFnRnd0++rZhZpbLH3K7+nLIKd+DRwkF1xj0FjrYIQ2p+6Z8Td1V9z59JiwoZoDe
 gFUBEAlXQUBLBwO64CaAWAXgCJAeLMHj8ESsg7oGSDFAtAEKIcuOAsN1uEfGMfxCzHJLj93AQA
 A
X-Change-ID: 20250204-netconsole-4c610e2f871c
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>, 
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, 
 Simon Horman <horms@verge.net.au>
X-Mailer: b4 0.14.2

This series adds support for selecting a netconsole egress interface by
specifying the MAC address (in place of the interface name) in the
boot/module parameter.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v6:
- No changes, just rebase on net-next/main and repost for patchwork
  automation
- Link to v5: https://lore.kernel.org/r/20250220-netconsole-v5-0-4aeafa71debf@purestorage.com

Changes in v5:
- Drop Breno Leitao's patch to add (non-RCU) dev_getbyhwaddr from this
  set since it has landed on net-next (Jakub Kicinski)
- Link to v4: https://lore.kernel.org/r/20250217-netconsole-v4-0-0c681cef71f1@purestorage.com

Changes in v4:
- Incorporate Breno Leitao's patch to add (non-RCU) dev_getbyhwaddr and
  use it (Jakub Kicinski)
- Use MAC_ADDR_STR_LEN in ieee80211_sta_debugfs_add as well (Michal
  Swiatkowski)
- Link to v3: https://lore.kernel.org/r/20250205-netconsole-v3-0-132a31f17199@purestorage.com

Changes in v3:
- Rename MAC_ADDR_LEN to MAC_ADDR_STR_LEN (Johannes Berg)
- Link to v2: https://lore.kernel.org/r/20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com

---
Uday Shankar (2):
      net, treewide: define and use MAC_ADDR_STR_LEN
      netconsole: allow selection of egress interface via MAC address

 Documentation/networking/netconsole.rst |  6 +++-
 drivers/net/netconsole.c                |  2 +-
 drivers/nvmem/brcm_nvram.c              |  2 +-
 drivers/nvmem/layouts/u-boot-env.c      |  2 +-
 include/linux/if_ether.h                |  3 ++
 include/linux/netpoll.h                 |  6 ++++
 lib/net_utils.c                         |  4 +--
 net/core/netpoll.c                      | 51 +++++++++++++++++++++++++--------
 net/mac80211/debugfs_sta.c              |  7 +++--
 9 files changed, 61 insertions(+), 22 deletions(-)
---
base-commit: 0ea09cbf8350b70ad44d67a1dcb379008a356034
change-id: 20250204-netconsole-4c610e2f871c

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

