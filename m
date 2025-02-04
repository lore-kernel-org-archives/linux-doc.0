Received: from mail-wm1-f102.google.com (mail-wm1-f102.google.com [209.85.128.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340721B185
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738705313; cv=none; b=eyxKp2zHufEOEZgKP9Xb0j0gekWFhaX+4QdhVSH4sbm9K0wpGkfqBuK62uBae3p941JW3K9W6JSOjw1goqBz5VVsYsWILqesmc9QiBBYk/Wxu5aIrQh4SRUeWuXXgbqrXOR9D6El356f67FwV1BL2GuKrjOrJepYgJMsljp5Kdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738705313; c=relaxed/simple;
	bh=FS08keFY1ozdicBUiUIN8Bu2H6mZ2iIkvJVfmRGOhvQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Po80BQDMtDyyaymBKrWO1OrFXTo1DMTd2359nss5UHjLxTQaKctsEN5CowbaNjSWVzf6/YDt6XGl9V6otqR+vTSncb4aCHh03IKKayfHVhf5TQOcs46fZhk4nmZ3WdUg/RtGkd0SVL7F53c+xDZQU9bA0WakxZ8NnkqxU6EtSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Dsh7OWyh; arc=none smtp.client-ip=209.85.128.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Dsh7OWyh"
Received: by mail-wm1-f102.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso43473475e9.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 13:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738705308; x=1739310108; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kSjAEc3JpgYH0pfJk9yrLxuH6CjSL5l4ipCiBf9QiU=;
        b=Dsh7OWyhJkjgy3jaI4YUiT+Vt4TXogtOSZuWqg2OUPefc8+8CwDgDgBk4khSn5l2vm
         ybZfCN7Uu2pJFcUm+RnJGcnDzHVnS/NRnoCN5r9w/NeGQBEvu5EKMkJ4EPXLToMoJvJR
         s/5Xn+WWRUQxRNazuzyZMWyoCF5YK36njkh+BEfGVeU8DRg1BUKMLELMWZPVXG3MSMcj
         TFRggSg9VS/jldoCUxZuf6ueYVgXzJwRfc+e9XweBZljC02RT9EPbP6V9lbjjRi7xjh2
         GJNqLbeb5JurmJ1raHNV9fGnTpVrhgBPbmRNccYGmNArT5FBnlT/J2hWk00d98bYskpA
         VlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738705308; x=1739310108;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kSjAEc3JpgYH0pfJk9yrLxuH6CjSL5l4ipCiBf9QiU=;
        b=gM9YW4iiM3hsPy+ELlB9JC/Ev/B6hN3M1cA66D031U4ka6XgCQUKDJ4GIr/BM09m1W
         +4lQ0hapCtkwH+GUmLbr37zCbgnJ1zTDb3NaiwR2GugelwxaQHGthMjDjXxOOduzCojd
         uFEyhTMW0628rIObtD7THvRaJUsXnsvcjpJF6n1QmzIEZhxxDTZDQFpE3Nofoc64WcaQ
         mt4UDRU91KZx41xdB9QBzfuNSCOoUw23pOmbExu7/D7979CaaX2BFYcHkxzvl4ogIhgh
         HaZ16sYKwN3WhhFAi1iVxFI7PsUEKXy6awvZm7+u8ZufBE3k3yJ38idBa1qNSSnsZ2Gv
         XFNw==
X-Forwarded-Encrypted: i=1; AJvYcCWwC0Kovg0ak6i3rmeAvrM3lHf4dGKNh/b0FnwIG08x8o7v4ybyHDTbVPtRvHipBUP/2YO+6YEhlZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWxPaYQ0Q79grTgOWsX5EjH+yKOpcnJjPUQVR6W9peWHHzJrG
	bAtDoGMOGGUVfokP1eJB3U8qHTNmXmD+oHoghQs5i5WkKRsTFeAt9++7Cj8iWRP6QJ4gFTGn8/j
	ge0fsk/R5Q/j3RziI1QbJeqB0UQ71+o9X
X-Gm-Gg: ASbGnct6Go2plGe1/fLvlX7Og36AkgGyowyTNNZvz4aGuuk5q0kMXGhQ4SN8IgVl9hl
	Hq928L05rzOrGa3vf0j0aW3X+V4wsWpluMnmEiBZDWccSclcirtyq2k9IIgUZs6OS9CfrF7ZzHf
	faZqaWM4cjV3M5N6siVzRVSHyIME53lj7enxsZdD8FXu1/HiXQcw+UxkS3Wk28MNhNX0sd5TvSM
	YY9ZlVV63FapuyfzxlxeuPeL4z4P9HeO/XsU3b3AGL7LIfQR0ndxXYS4ZgpGORtXbxqIPR7zhkZ
	Flf9/3deRrGogd6aCGjkKOxusiXzlSpDO8ULb1s=
X-Google-Smtp-Source: AGHT+IHnFwgWjv8YV945kq/kC9C35yctrGUfuiPjRcl9fbEU9yyG5D3XeVSkJedIdI9xuStQxGPZrW7XyNqF
X-Received: by 2002:a5d:5849:0:b0:38d:b0fe:8c99 with SMTP id ffacd0b85a97d-38db49101c1mr230256f8f.48.1738705307565;
        Tue, 04 Feb 2025 13:41:47 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-38c5c0d3560sm367622f8f.8.2025.02.04.13.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 13:41:47 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 0FE6A3401AB;
	Tue,  4 Feb 2025 14:41:46 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id F2E4CE435A1; Tue,  4 Feb 2025 14:41:45 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v2 0/2] netconsole: allow selection of egress interface via
 MAC address
Date: Tue, 04 Feb 2025 14:41:43 -0700
Message-Id: <20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJeJomcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMT3bzUkuT8vOL8nFRdk2QzQ4NUozQLc8NkJaCGgqLUtMwKsGHRsbW
 1AIZgPeRcAAAA
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

Changes since v1 (https://lore.kernel.org/netdev/20241211021851.1442842-1-ushankar@purestorage.com/):
- Add a patch to define and use MAC_ADDR_LEN (Simon Horman)
- Remove ability to use MAC address to select egress interface via
  configfs (Breno Leitao)
- Misc style fixes (Simon Horman, Breno Leitao)

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Uday Shankar (2):
      net, treewide: define and use MAC_ADDR_LEN
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
base-commit: c2933b2befe25309f4c5cfbea0ca80909735fd76
change-id: 20250204-netconsole-4c610e2f871c

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

