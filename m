Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590029;
	b=rIQCkcEpQP5RDOSggWr8LCKjNSWSy6sXfMzHeHDT9UeJrEz2xcM0fOTG/BOAOAjiriWW
	 8ptMbkT4G5GNBgitAyKGVL7lK/oKpyYvKvEozDEB9gvMEuCusqPpyC4PpS4icwY9XnuNo
	 WSqPVcBjyQueKTKDEHWZ8oCs+Rx8P/C4gsE4gEt5d/QMCv6yCnRralo/TkpV7Wd7PThwY
	 7tV7/oap6665WGjUN379/Ve+1mrYqy7pSuFp6pNvfoBstvBCZ9PsOMuDuyxkoSX64pMh1
	 j+Kz682YdgwxLCm7rb//WyG4Gjn57UCpQFFwbz7v8CrUYM8j5It3+qAzIs80QH0sBcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8AJ7AIbn7+UX8TIEt4C6umThZ4gAFF8olo/5cp650i8=;
	b=3jG7KH8z60nm5/E47+zsFuVprBZ+ECjJ5Ui+wdBKSRYqNqbI8mkG6OWsGjGI9x3SUSLe
	 QQG4ryJR21KJ4gcg+tvKntKwtVCQGnEgzZfqIHzfw7Iyw1F80rQkxIE8yB2khOYkVe1fW
	 Dv6cBDffKv+Yy0aYiA42Ke9u40oSwOXUSagJruCO7paZ9oJbN0Tuj6hiQvfGyszsvo9C9
	 cVw92SL7izHUvsaBjAwD8JBLJX/Xns5iHd3DHPf5ZGNuo1tTckeYjpa5MQD3xPJppzgXp
	 h+tAavZiJ9DvBM/xokJjnczxtl0p5FKaQIu8LDKOah9z79NuwTtxWmOYE58RsAI2kFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5fGvEqH;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115FB60A380B
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115FB60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5fGvEqH
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43bf9548df4so2203727fac.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590028; x=1795194828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8AJ7AIbn7+UX8TIEt4C6umThZ4gAFF8olo/5cp650i8=;
        b=J5fGvEqHCeM3ThISXi2E6ikdnN8jyUfBcBJWUHw/UwenTJ77RX+M0VKWA7ej+7VCcC
         Z8CXWbchjrN/YQkbG+Ka1ukM+BzGWL+dCV825iv1KcOwCsp5DkG32Mw1C7OtvzzC8raV
         M8tBn+PNAdPv/5a9tv3PS4Ee+3eM22w2nM8mr2Cuyd2B+k1Ftkp8BM685RHpcJD5msWZ
         5SnnchAoZ06tOgo94UtE/+VR0LYqSONatG0waQgUxQ0/Zn8kyvkqK6jESmaUabFAueYT
         f/IJI0MFzaO1dI/ST4neS/CsbCxAnlwjcBJ9ZTcssa1orIMsMjmI0iplbZXPWUmePsNc
         9pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590028; x=1795194828;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8AJ7AIbn7+UX8TIEt4C6umThZ4gAFF8olo/5cp650i8=;
        b=EgGVxMg0Sf+SSVVsyBIczNzwsAjzUqOx7ULSw0WksfX0aGexcMbXsQwrs0ngpeeKI4
         bmsHrh/j9+czxYCr99JaX5EQ65KzKVUjI8Roo1eC/pfE6XOjgMOWctVawU4VHXXp1uyG
         TrP/4TXhBnszTrNqTIXYxC2R0julhTywAWneUVLoywu0P4T5u4fWsirzNntK6/5TugIk
         QMQR3Q5Tod/1PH5pHVTv3Y2quA49facxI3569my3etbLFFrFITs4daW266QF6/OSNdYu
         5Y4gt9QScK+nqmQ++xt+zalgIXhP+VKP5HTa/rIutTXh4UWHWW2Pq4mQlRI+OtwicaKS
         6FGg==
X-Forwarded-Encrypted: i=1; AL+hErGLD8KShUA6ecpSUqEomBQV2DIoSj+kYFes1GkCgobKSm48uOJUmbqdeMO5mNCpoqPOUqIyoxDt29Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z94XUcKwMuOVVRQ9HiBkqcyjDjVTRf7YWe043KQnvzRdBQEUluw
	i5hZXgMkErKWQtcLx1QVbnIttEDxVboqkjvCgF+85QyIoyUlHKT8YYIw
X-Gm-Gg: AYBFou0CuyJ5Q38zXgPhaEBngWGXsGiiT+bHaoamyRiEAPshT5+CizcnGYL6mXkHqoo
	4T/3SrnLNaLhR48e7V/NRXxAyDNzMhkfLe2bV7U20jOEOTSJZwB+tPRPl6mmCbeKHQL01D9FyCt
	VMPZLv+YuUA6o8lkXQTgksucNeTyBsOSjk3GC71IMgWePSbDDNBAFU6UdKu9SbGfM19A8uGm5ES
	4L5yA2SE/pGB1cJJ4MPutPr4Jeo8ChOcIwas+QDE0+kJ1m8MBz3xWF1y4H0bKOx1kwax+31RfhF
	Ms8mgmQ9aInIgYZCGoCo+762qyr3QRVkFV/gqq12xzneLXq0gw14prqE8qh8e2s0G4MAe6sSaQv
	wKwpkCdKVVcdRMvpab9TvMJ+zgwjQhj5TZHc7bn0TSlNpblTOdbKnNrT3vayQ8bZS3pdgwnZYBb
	j87HaZUTwPoCwxbbkmLByBR+/QpB/ZUll3es1qBWChswLnyU8ST1MeqytdwuLlG/Pp2a8Ut4mDi
	tiWtGs2TnRNwouHitzLV8Rnv9vRV8DpKfkiHQerOLyIZQ5fOwatoqIlvZNyLmpmWgtYWOEOAD7V
	Mzz/5U1jq2Ehm8v3dDt8SV+2PVuc3JabGUsgH91R78ON1JQ2tjmLWRHjLSOMBemn3d+r1rTB2lg
	gWZeUwQoz9BvsLZMs0WFacCRVyCmoLaAEM92ibYWNTi5xfLri+5IqoEoiC4QEZNoqcjg1Yj8c9/
	ddk/Cr1cNsH8H/Y0P8hnJ6grUfxRcPECtSEnslu2BTSeLnDvkRVxoQ
X-Received: by 2002:a05:6808:244d:b0:564:5fe0:dd76 with SMTP id 5614622812f47-56e63793a9fmr2595149b6e.18.1794590027740;
        Fri, 13 Nov 2026 09:13:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm2565805b6e.9.2026.11.13.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v4 0/3] ethtool: expose PHY receive totals
Date: Fri, 13 Nov 2026 10:12:04 -0700
Message-Id: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OS26DMBAG4KtEXndSPyaGdNV7VFnYZgiuiolsF
 xFF3D2GtGrUBdJs5vXpv7FE0VNib7sbizT65IdQGnzZMdeZcCbwTemZ5FILLhHSt+19BuMmzuH
 SXSFlkxOMAppa1W1VISLVrPxfIrV+Wu0PFihDoCmz02NTmE9yeaGXW2sSgY0muG4Z/V6/9saHZ
 d/5lId4XWOOYhV/Eh02EpUqsVSDWhDqxvL3cwG/9m7o1xyj/JMKtSXJIilXG60ReeXEf0k9S8c
 tSQGH1jqtZOUOlvBZmuf5Dk7VdmuSAQAA
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
 James Hilliard <james.hilliard1@gmail.com>, stable+noautosel@kernel.org
X-Mailer: b4 0.15.2

Some PHYs count received frames and bytes including errored traffic. Add
explicit receive-total counters to the generic PHY statistics interface
alongside its counters for successfully received traffic.

Use the new counters to expose ACx00 receive statistics through the phydev
group. Accumulate sampled deltas in 64-bit software totals, retain those
totals across reset and power transitions, and return cached snapshots to
ethtool. Establish new baselines after reset, resume or sampling gaps that
could hide a complete counter cycle.

Convert DP83TG720's existing RX packet statistic to the receive-total
counter, matching its documented inclusion of packets with errors.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Invalidate the ACx00 baseline before accessing counters in soft_reset,
  since phylib may already have reset the hardware before the callback.
- Start a new collection interval on resume and after gaps of at least
  320 seconds, including system sleep, preserving collected totals without
  interpreting unobserved traffic modulo the hardware counter width.
- Clarify that the byte modulus and frame-byte boundaries were measured
  on both AC200 and AC300.
- Specify matching frame-byte boundaries for both PHY byte counters and
  explain that phydev corrects the documented name of the existing group.
- Mark the DP83TG720 conversion as unsuitable for automatic stable
  selection without the new receive-total API.
- Rebase onto current net-next.
- Link to v3: https://patch.msgid.link/20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com

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

To: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (3):
      ethtool: add PHY receive frame and byte totals
      net: phy: acx00: report receive statistics
      net: phy: dp83tg720: report inclusive RX packet totals

 Documentation/networking/ethtool-netlink.rst |  16 ++-
 drivers/net/phy/dp83tg720.c                  |   2 +-
 drivers/net/phy/xpowers/acx00.c              | 184 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |  10 +-
 include/uapi/linux/ethtool_netlink.h         |   2 +
 net/ethtool/stats.c                          |   8 +-
 6 files changed, 215 insertions(+), 7 deletions(-)
---
base-commit: 573af801552999954caa8347e4490b04cf4763f0
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

