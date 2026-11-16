Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819605;
	b=aVuTyKF3HnEkHdX2UdCPdDkXHI3s3uqAtg3kBnQ9JjPNTae57ap7Jqyc8sA4d3nlAd9+
	 OrqwE11Ft9QsWQ/MZ1I/9KPVKjqxKo74wu2w4uG/rhJdQdyzdXK13hr/nzhcLcuFq8yfe
	 Wo4/w89L0xSoiRbJpxF4k7rtWU/YU1Yjz3heshHHUQoyyqQvpMowlpKdqsr/ukcYFTyLN
	 hdZH3aVPjGFhwSaw0OUUTmn6NPthlg6HZTQX8wxmhQKnZ+riH8GG1QPf5KaVrHJP/CD7J
	 ece/+J4Y9tkdLS4wjSOYonIK9AJ5ypWjFyY8avD8qR0EPH1n9fT8SY/Lzg2NmpYM8Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
	b=lcInyMmcJbcM57N7u8fBz3q0wxgHKYpEwh+do6LfOdwV0ZQPN01vuPNVBh1Urr6keeDl
	 5h9r0i1QBN+lhIVEJO3+KEAhhrKMQARhzCgp8hMS3/1jC+mz8fpTBjXyy2gJvlYhQyQ9W
	 +3kdYMefnMJH9Mzrmm/v+7DkS40Ijqygb1L+Ss7ZZPKS23jrFnBF3Q5GA6UNyWdH2AE1l
	 NSEhlLEtq2l0v8VBgSorG32WN+jNwY7O11jPmNDe5NsEJNu+LncIkhba+TRkNgKYNBb9F
	 Lc3Ad/bNW0wN0fhJcAKfD2Vz/0VjfOfGq0cxVwDD1B4+OsSTZqwWb1G+l7JYqVe24qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+4V74VY;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F61606A33D
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F61606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+4V74VY
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4e4a4d77e5bso3259996b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819604; x=1795424404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
        b=o+4V74VYHHGEwhhJlNUfTApJrT15j5GcawAo+tYJ5Cwh4eCSxw2DFkjvh3s1Rpjaqc
         CYutTqg5MNgSF+d/0tsK4el7Oyq/M+4zKiyqTREVC8wa6sd2i+t00qsqz96u2a7Do/T0
         S61bloURCFvfTqbXq0Ivde3n8DJRjFyxYeWwkz66nnloFZwncVFMCBsyiBbwObOuJkz5
         IskLk/0fnKHf8yEKHIselPnjHkt7keVKHGti9IJMT8vSs/NaEStLdb6Peu9/noldepLy
         UEO2OvL264NrgOsxdAkcu/rXYYC9kHJI2VxxE/B0xq3H4jvCfG5U2eQZmRLR3I14tg3/
         agVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819604; x=1795424404;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
        b=Pt2ciJcvuwgd6jG1IPH9aZkG2pTiK8GzfggR0vbdi6ME2ZYRsHhjwdcFQNz3Iv6tBY
         P43AC8hnzNHuub6oMb4objNOCcDiD3WxOrTrVGHzkAXGOUzqXhKDcwN6/82tEvIdKO7G
         VVnv/27szrZjZKkvM1KrOsNlKj+a3rVGtUr8ysoWRNJVbI1V4DWrc5ir9EFfV59HKfMv
         HYSiB5qji+wCi0sq3QKag8fPueFIzBdYgp0h0Ru4Jw3uCMFJjiPK24eevq/F8IfBPdUV
         2KN0b2izQPL64qrA9/9F7877/Ke01Qr+WC0c8DgqL+MMgsHNk62PwpdApADlloiNKprI
         rtnQ==
X-Forwarded-Encrypted: i=1; AL+hErGBYcF0neQNj8dX1bpdVzldLzYmolX38K5S3vyRCAWgtG/DVBkU8uUUReGyw9T0dO+9Jz3je+BeuGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s2LI8OZzlF1erlgD6Gn7SWVORNptZ4U+du9qxaQcKiqjTs4Yg
	WSp79ESM2U2G4AeBcRg54vLZK1aM61LQTkOt+Gm6BauQj+gBejOzBPe/
X-Gm-Gg: AYBFou18mj3UZgZzqzRvCWmzl7hdfpF45SiCV+U7OqNZ4Iru/8FZVwMc28WA9vaxu6m
	y4hwxrv4H71f7ebgGNtjNE2xajoXIuDz/Q+H0ez3xMuy8m9iknDQY00329pDdyAhloIps48afHy
	L0mTClCgrNyhdj0bcxKZiTxzNt0HoqYNYeWfBi2agXV0Tt7vDsquf6ieUvYS3WnSOU0QUrV5Rfo
	jOzCfR1CeDwmTsS4AUS/60fFVQLyL9QH0wRrfXXDFwgU/mzbhdtbNGuO2gpfZn/BPfoHJKndlJM
	+JZiOwY5NyTsqqEs/+WaK5DwphzJ0BcJeaIE9s+6bC/S/1H+rLR/X0xuh41F/OR+EqHuhlmLOkb
	QfsEwqAT53Ar8yOkwkUQThN3mw/YESBCJCIHO1gg44TabA8ZNriPsZxj50zALL/X7AZ+shoTrUu
	XAj8FxHui3isC/wsXr5ZWffw/2dHRXLNqinAI5oN9Ev40McHJvY9U2j0UKe47s9l0InzC9v0iwY
	1UBjsZE6b8groS+CWWjOHu5I8D9MgNtr7jfPRi2jOHe0ltdhQVDZjJP8jlfS5w6H1GpsEtsEuYz
	SuE4107Ge/uYZQAdgnVcEyp0BojO0BJw1L39YLrpTntrPMSs41mgJrXfhaiq8uxT/GclWpD6zZL
	QY3CvGzPiYGZIwb/ahgrYWQzByPd3wauj5D4hvkrPGoi1hpbD8cYV7kYl7w+PpGer1cGj35TNGw
	9H8mgHHTGNKqP34Vh0pngrf4P11xTPz3lmjTFDmW+P/AHihD54Xg==
X-Received: by 2002:a05:6808:3383:b0:564:3e9e:b498 with SMTP id 5614622812f47-56e65624042mr5371665b6e.22.1794819603048;
        Mon, 16 Nov 2026 01:00:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v6 0/3] net: phy: report ACx00 receive statistics
Date: Mon, 16 Nov 2026 01:59:56 -0700
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QzW7DIAwH8FepOI+NDwfoTnuPagcgTsO0kCrQK
 FWVdx/JNi3qpEhcjO2f/vKdJBwCJvJ6uJMBx5BCH0uhng7EtzaekYa61EQwoTgTQNPVdSFT6yf
 G6KW90ZRtTnTktDbSNFoDABpS9i8DNmFa7ROJmGnEKZP3705hPtDnhV5mnU1I3WCjb5ev3+mXz
 oa49NuQcj/c1pgjX8WfRNVOovJKLFmD4giqduztXMDPZ993a45R/EmF2pNEkaQ3VikApj1/lOR
 WOu5JkjLaOK+k0L5yCI8SbCQu9yQo0tEoZyxYbvS/TNVW2r1TVSSsDbe6qUBquZXmef4CKiQME
 SYCAAA=
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
X-Mailer: b4 0.17-dev

AC200 and AC300 count bytes in received frames including those with CRC
errors. Define the existing PHY rx_bytes statistic to include bytes in
frames with errors and use it to report this hardware total. The hardware
does not separately count damaged-frame lengths, so a successful-byte
count cannot be derived.

Report successful packets and CRC errors through the existing rx_packets
and rx_errors fields. Bracket the raw packet count with matching CRC
counts before subtracting; bytes and CRC errors can still advance when
sustained errors prevent a coherent packet sample.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v6:
- Define the existing rx_bytes field to include bytes in frames with
  errors, and use it instead of adding rx_bytes_total.
- Collect Andrew's Reviewed-by for the PHY group-name correction.
- Rebase onto current net-next.
- Link to v5: https://patch.msgid.link/20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com

Changes in v5:
- Split the existing PHY statistics group-name documentation correction
  into a separate patch, following Andrew's review.
- Narrow the generic statistics addition to the inclusive receive-byte
  counter.
- Derive successful packets from a coherent packet/CRC pair and report
  them through the existing rx_packets field.
- Keep collecting CRC errors and inclusive bytes when sustained errors
  prevent a coherent pair, with separate baselines and sampling times.
- Skip invalid or unstable byte samples without discarding usable frame
  samples, retaining the measured byte modulus and sampling-gap limit.
- Rebase onto current net-next.
- Link to v4: https://patch.msgid.link/20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com

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
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
James Hilliard (3):
      docs: networking: correct the PHY statistics group name
      ethtool: include errored frames in PHY receive byte counts
      net: phy: acx00: report receive statistics

 Documentation/networking/ethtool-netlink.rst |   2 +-
 drivers/net/phy/xpowers/acx00.c              | 223 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   2 +-
 3 files changed, 222 insertions(+), 5 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

