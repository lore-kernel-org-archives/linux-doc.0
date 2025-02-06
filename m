Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com [209.85.218.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEB222588
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738819298; cv=none; b=gvx5WoqAJ+6G8apFqd/kkYUoOKivIjMNejTES1PXiaLyeMcJJx2NOkSdbGNWF+Tmk3cyxftnrl0hQYtJK3XoZq0sBajEScUNEQpSpDiAdSzP90TSf2Ffue04L5PVvn6G/5XyLhBv8UMH4rKYM7DyYXoRabXWcrkcdEhRVQcV2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738819298; c=relaxed/simple;
	bh=tD0jPSjeireGMUVJpEk191Ij0UrSQYkMyCej9+UGqCM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rrCmZ1YgbIZBPD15j7g5ZOCw3oWDeXlRV6y4dgPRktG2gPvbQPi3NSGcUmaOXn2boNmzcylau9xqsVjzhd8P+sXFj8KXT+ArOCakIWdg8PZ9g/4MsmiHlwhRETB6Kq408TOsQMhqh0m1G/KoCwnz35w4Vsmui5H6A2yS0ZwQob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=L1RYws3h; arc=none smtp.client-ip=209.85.218.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="L1RYws3h"
Received: by mail-ej1-f97.google.com with SMTP id a640c23a62f3a-aaedd529ba1so79167366b.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2025 21:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738819293; x=1739424093; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4i5yioVGSNjOB6nllSMZrYXzyChtuKnMnYZxXLntPc8=;
        b=L1RYws3hRPx51SRfPn2cH8Tzfprkeuk7fBBr5oCfKg30XRgSQJBHT94hSUZ9wYyPhj
         5c+flXqZJQaIbcmdyMlMEHt/UOueb4czqOW2WOkfcbQuDiQj02yGuBDyj4T4l44E/E4m
         iumIU1H00YboPDELRolwlGfd3NucctDhdjqer+ugbQx6wQHKonJCejenG5JWuYwwv3/p
         P60QU4V9WT90TzWMFwfgyGIm3aw97fHFuv+eQgns8p0dbSE7Nk8CsjhHs6PzwyQAS26U
         L3Zzrh1i73zTCgsV3N4Nu+ZBNA8Zs2PmZX8bUh382n8YI2RSrw5Tfa7sCFKvr4eSboDm
         IsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738819293; x=1739424093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4i5yioVGSNjOB6nllSMZrYXzyChtuKnMnYZxXLntPc8=;
        b=MzX26xlNio1WavEPx7mhm4bnwnEYvg72zN/1a5x0QGMSyKe7ySxx7kG0xQm49lJoSM
         nky4zW+mV3rtkxuI82kdpYWqCE9ArT2yUiWhJk1Nks2/cacRIa67LU0wPBH+FTn2u3Pu
         rjjn38xh8Fzx45UkWoE4x23jmFwGKtukhEgZmlxpJn3vwdUmMgFVopM7w4md6XEisjPO
         IeUrKmNJdG/veUD+F7r63+5nVVJ6RBvakLcwwVdUajASY2tzJCfZGG4XAvWaz274tsHR
         QAoPN4aaIUN8L1vQlAoqdxRAhjEt5gN/U3frxwERn1PERj5B+7ji5N7YDMsebWdXE0rx
         og4w==
X-Forwarded-Encrypted: i=1; AJvYcCWSYhx6GyX+IpzX+ZDQq4REJmH3oZmjy0j1REM+hPlEJ2nuo7AOxF7SmvUocFq4nuB+M2C/X/RlpNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzDC7QkdcK9zRKKOwzrzlM08cej3zmxh7MCeRsY1nIziwg2ne
	V9Xr/czFUKX3kSSq6v2LOEskT/5bh9/cOYpd35617wtny4Zn5box+FK+vdm7Rca/z0c4r43sNED
	H98dXyQGy5iJ1YxnNiN9iKH61LeEsnT0UGTRLawFt4Sn+9n47
X-Gm-Gg: ASbGncvJWEl2udMbazvYLu6dtodUzkFIejMYKEKbbX06d4P4fvZt4cJ3NGqHNqBpmsB
	BFpWUH8642n9Cc9mgX1qIexgzTGVxezlzMyluyY6ay6/ltiQ9iG+fUp/ybaypw01mxDElfc9iFY
	zcQ/oQ1bDxwosL+b7attC5phe947RBx0WneRB/XjKBB/fv7nh9IPsBlqv4N1a/vweR8hh0dF2ZW
	kv02uBtTQv9tw8Q4ZNFrRFxCvHrVWLzo6HDp6YzF4C1STFPhQ6p+8pGzepg0wVLs7ViW5NKcfch
	VTTPZANyM9l94msqv1uL5GmV
X-Google-Smtp-Source: AGHT+IFOIG/YV363yDXzTKiSu5f4bXzuXXAiuDbR1hZzAdQ19I1MKpWy4urmJ0wIV6IAB/oXbPlTS9cEifIH
X-Received: by 2002:a05:6402:234e:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5dcdb6f9f81mr13341977a12.7.1738819292518;
        Wed, 05 Feb 2025 21:21:32 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-ab7732e281dsm1194966b.130.2025.02.05.21.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:21:32 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3D3793401E5;
	Wed,  5 Feb 2025 22:21:31 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 30E27E55F4E; Wed,  5 Feb 2025 22:21:31 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v3 0/2] netconsole: allow selection of egress interface via
 MAC address
Date: Wed, 05 Feb 2025 22:21:29 -0700
Message-Id: <20250205-netconsole-v3-0-132a31f17199@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANlGpGcC/22MQQ6CMBAAv0L2bM2y0mo88Q/DAesWNtGWtNhoC
 H+3cPY4k8wskDgKJ7hWC0TOkiT4AqdDBXbs/cBKHoWBkDQSNsrzbINP4cmqsaZGJnc51xZKMEV
 28tlnt67wKGkO8bu/M2327yaTQqXZab5rZ1CbdnpH3tJ+4KMNL+jWdf0B5YeS/aoAAAA=
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
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

This series adds support for selecting a netconsole egress interface by
specifying the MAC address (in place of the interface name) in the
boot/module parameter.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
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
 net/mac80211/debugfs_sta.c              |  5 ++--
 9 files changed, 60 insertions(+), 21 deletions(-)
---
base-commit: 3924fa995cdf3752f2f89f8de72834c4638c5ebf
change-id: 20250204-netconsole-4c610e2f871c

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

