Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278926;
	b=MYZ7oaMsZ9kV7aNuN9j/zpROhstn6GnBwplsyFZU20qlbndiYyUIe+3os4UemKR+tKtl
	 lCpMteZH8wCeh3HOu/th7GJ6bILKuL8GRV/Izap4/BQnD5GE1W5XbGzmWfWlI0TXCojn0
	 G5EnAayccIbkkFHldG/pdlLWj47orcBiMqJEh1kiwSZnus92QlXR7bFyLemh93sF4esj3
	 Rv9tK2ToYBHcttMrlMlO7LFWQ2iN1HqQyFngUT3nfiNE+jYJibVH40wvOCwB94CN5SaWI
	 XaMC+r4C/WUwrReGeq4EG9X37tggvbifnh/5U9Gi/2IsSff7b+2IzAYLgFeQl2mXDUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=u1mRfjRp548mQrIu3BS48h/N53IKij7/e2kmO+NoODA=;
	b=P2tw8uBP0thvvHEoy59J8IsQkhklblVOOiLEsh5hTG+8n8mObCNk3QdzFrgTqHfS2J2y
	 4TmN1a97DLvCSt3C4ps9g5vZZPOR5ViyUU/L2AqWpWsk2GYwr0VzTPzco/XtLs3T5IqSr
	 +bFyifeBF3eI847krOrawmk83lMQ3OuNDXYuCEjZ97QCW6rN6eNC8y2w0d/XZoll3VMGO
	 2L+jSBDlA/3CwqlXYS0PWuFq7PQ1Nw3D3r0rbwFSp4+Kde1mNRDN4NNnk2t74ajpuvJ2E
	 TWJIyqqPWLl866AjZKGFo7a89qoxgUqdJv/QahUKNzIH9D0AtMq/GW3ffOOd6LhOWmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KgRxhcdn;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82A606A321
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE82A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KgRxhcdn
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f55a53898cso726412b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278925; x=1794883725; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u1mRfjRp548mQrIu3BS48h/N53IKij7/e2kmO+NoODA=;
        b=KgRxhcdnXtkdCaGp5bqw8j0icuFvS05TJxM52gjAOMC875K5SlLmpxNATd7+krziLX
         CO4azcZgsAbU28WQKosvaeN6buAq2qOltVCGy7NAFdKUvKkoiViqmTfFQg+ddkoVpYw0
         BwBpqhEg6604V7zLHHvxq1YbGqmCBLHV13/ZzFgSYxsy2CF5ikOfNysUYXz/Wg9Xpgkn
         dL5uVHkhEqAbpyl8EVBzSDJWhMJu+benOkcpgEXyx0fZWNaDtJQQhNyOfswzhTR5Rw7c
         CMF1wIaF8qo7GoB2EYcIU3fCbmWCS5j6EgXpsAC6LgQTWABCTX3UJzdJmwtInMxA90XR
         7wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278925; x=1794883725;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u1mRfjRp548mQrIu3BS48h/N53IKij7/e2kmO+NoODA=;
        b=nr+dI0Scxn8D6q4igr2QFUozGjzmTmB7JoM5YJPs+ZOssZSv9mnnroz64S82TIE5YV
         jsffw94OuxyetOs0+ObfjY38cArPzGwPLBJ3WB849svMr+20QysQYxWpXbnODQgLRbM5
         hUAyC0pBoUkOFvDGjMUQckcOAsY+ZaV+ikM3lhmPC7LsBdQjwMdnIHRW4y8fJ+ri7pLh
         X9NtQlRp96CeaXwGlZJtxXe8R1YKUKp30RzesZRwLs2IITyAefIsPT060n+pexxCx/h0
         aSaM1Bc+TbJPTdOZ+oSFl0W2DKksBOXSSzosK6AOQbjLeaa9p4b4Tf0yJJ1VtbgIk2Ha
         5YIg==
X-Forwarded-Encrypted: i=1; AL+hErEBIHf3VVYuCCwAFvav30sXk2sZtg2Gubk2n0xq4s8mzaHQJ7n7hJLlObSYRxNeC9AQjmriIdV4evk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i2pzYuBWMYlGW1rCAPXfXqO+QbxFNdeIeDTKSlFmYnUirHoi6
	L7WyVdKzpSwosW9EcwGcIjF9mV3O0fBmm4owMyxwe0o+EoplCCnpn7Ki
X-Gm-Gg: AYBFou0gBo4BN85M1S9uCdPiQkNAZATmk219w5XDItbM6paMwPLjLluefQWbX1uedi0
	8+6ojSdMLljgewWGArsMcJfxg8PqtGpSnGAi+iIYfQxYOly7dMVHqVxYKJZ4m7ZbMG1IhXYyyD/
	Eb84Mgxh6jm24USBMMuxa4hRPldRDP8UeZfeOW0NA+ae2telDOQbPQcpOKJrWoz6oo+r1WaTysk
	Zhd0kKX7m2qxGyCKYeQ4IgtAUwtU3tDbJM9aZ2Jef0xNy8Jyfp5RU6q3n9vcFjvutBp/FJoaVif
	THsuhYmy4GvIqxpaWlSs6vB3abJil6pThD4TndhHiuj7Yuz1U+OWplnkrNla2W+J4a+CGxRB7Ry
	qmOIG0Qq9r1ymrHyI8asqbgHj+j9DQDeYOdoJX0igCAFgHCBlSwNfGcQAYf0T7nzEzhrXbfpwaB
	05VIZUNEbj056A8n4o2xE0PsmwYxGSdPaZKB3/v9kEJaSnpROwcj6ZCYmxr5Bm6rz5fRaANDjPw
	7p4QArBj5GZexYazjnGYsib2SCm1vllRk4JeFFN67To2OjV02zWUX18OnysDXCGIvpfAIvDKEvr
	qpzPtJkwabae7gzm7oFDRR207HXj2cFUtZwiXu0CkKMVbWCiVPnHr/tpo0DWiTmZPdDToD8wYbi
	7OxSDUjfCgmKDGDjfhh8kWJ/BLaMMYMOJjPiioFBdB9RnUl0UZZ9qqbMY5/ms6NmfUME2Jdt6//
	BERJFh5wn1X5ajPoELTiRCOPgcvYZKy/4Lx2EeKe2/jix8AWrMyryx
X-Received: by 2002:a05:6808:1991:b0:4cb:f21b:6f91 with SMTP id 5614622812f47-5683cdec02amr1137185b6e.36.1794278924676;
        Mon, 09 Nov 2026 18:48:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f39c60sm943233b6e.14.2026.11.09.18.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:48:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v3 0/3] ethtool: expose PHY receive totals
Date: Mon, 09 Nov 2026 19:48:31 -0700
Message-Id: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OSw6CMBAG4KuYrh1tSy3ElfcwLkoZpEaKaSvBE
 O7ugBpdmcxmXl/+kUUMDiPbr0YWsHfRdZ6abL1itjH+jOAq6pnkUgsuFcR72boExg6cw615QEw
 mRegFVEVW1HmulMKC0f8tYO2GxT4yjwk8DomdXhtiLmjTTM+3pYkIZTDeNvPoc71tjfPzvnExd
 eGxxOzFIr4T7f4koqJYWaW0QKWrkh/OBF43tmuXHL38SkT9kyRJmS2M1krx3IpfaZqmJ/inzTN
 IAQAA
X-Change-ID: 20261024-submit-acx00-phy-stats-v1-d838f77444e8
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Some PHYs count received frames and bytes including errored traffic. Add
explicit receive-total counters to the generic PHY statistics interface
alongside its counters for successfully received traffic.

Use the new counters to expose ACx00 receive statistics through the phydev
group. Accumulate the hardware counters in 64-bit software totals, retain
them across reset and power transitions, and return cached snapshots to
ethtool.

Convert DP83TG720's existing RX packet statistic to the receive-total
counter, matching its documented inclusion of packets with errors.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Add generic PHY receive-total packet and byte counters in a preparatory
  patch, retaining the existing successful-traffic counters and their IDs.
- Report ACx00 packet and byte totals through the new fields, leaving
  successful-only counters unset.
- Convert DP83TG720's inclusive RX packet count to the new total field.
- Bound coherent-counter sampling to three attempts and skip unstable
  snapshots without making phylib take the link down.
- Reject out-of-range byte samples before updating the hardware baseline
  or accumulated totals, retaining MDIO and page-restoration errors.
- Rebase onto current net-next.
- Link to v2: https://patch.msgid.link/20261102-submit-acx00-phy-stats-v1-v2-1-3c8a664407c1@gmail.com

Changes in v2:
- Rebase onto current net-next and repost after the merge window.
- No functional changes.
- Link to v1: https://patch.msgid.link/20261025-submit-acx00-phy-stats-v1-v1-1-d3d461e46db0@gmail.com

---
James Hilliard (3):
      ethtool: add PHY receive frame and byte totals
      net: phy: acx00: report receive statistics
      net: phy: dp83tg720: report inclusive RX packet totals

 Documentation/networking/ethtool-netlink.rst |  16 ++-
 drivers/net/phy/dp83tg720.c                  |   2 +-
 drivers/net/phy/xpowers/acx00.c              | 168 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   6 +
 include/uapi/linux/ethtool_netlink.h         |   2 +
 net/ethtool/stats.c                          |   8 +-
 6 files changed, 196 insertions(+), 6 deletions(-)
---
base-commit: e281e85235cfc2acd080093d5deced427c4c9856
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

