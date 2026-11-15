Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728758;
	b=1foWBoJxyqq2sSVPL2zB8QS+RnkjwDXrTRR7manJ/8vdyF1uIC0ltBFn6nF+j14xlmFE
	 pfl2m2svvo1D7b7KAxPDOzB+RhRSBZBE5bzbDiWeECHZTM/XlZh/INDH04OrgZvoBi0fy
	 FAQ8Au3FaioUyIFaqJPBTAjONd9cI7Pkle50A7Pb1sLnCT1m2vRyWYtjzyRqjvE8QFpA6
	 /OgnOmOidB2DygpbjOYO1ajSNC8w0IuAIrXx3rLXbqmQTI2AMnrtKoiNd7bs8kjuUzjaN
	 Hy/CD/YjzGn//z5VWfs2fJgi+CB8TWOu4jaZ1wim3DZC6mOnTmUmzfBPJ/lJvEJNtxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
	b=rpUugZT2sfnE13LuHIAJhfFoz00srmgz67AkWLxXDElv8gHv82GVt2t6p+KQGhQB04XX
	 SR/jXdl5eYHrZ6pgY6XEIRdiCpZPtFpoNUTdT+6I3OvSzTUTHhSsLuIIJVE8gIefRw+/5
	 Y/H6srL5Lq+2hXF6P/lSLLV47zn1CTtN0qjnIEM5C/eryUVCdjeugdo+ZLA8c8ttlNoqh
	 /jS/MPC3grdnOAtZLPqCzI6+BvNx5dk6+7/uZqbsET3P8vR+D4Q6U1lHcWh2d0Ds5LtQf
	 P0QzB4jfmSGqxfWZvArNqyb1aRR6iUxTgj5jz8O/a8v/4PkE8btVM1AMfIWUZsCqABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJk4uMWp;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D61606A31E
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 07:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJk4uMWp
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843cf077f10so4452249a34.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 23:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728757; x=1795333557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
        b=xJk4uMWpCiZ6G2s7rWpiHLeggzGdvma3jmXAmPOpY2O78sYu1VUmxlkqnM2JokxPzy
         S1puLmfRw8juF9iirGOyPmagsn0Ot1kxHjMmyVV/tH28ykkb9PzkuWRTO7pjAiBxWEBR
         zTatD8bXeza51KycKCM5eHAqCkYEQLa/AeRrJa7DKDPVcTHmb2eYCPU3CZI7u3MGsuUU
         WypEQvRT2TE1CGq2Hu3/62nuRGc7uDrbJbn1jY3Q7dI9fKmsEpvYl47z+8oSHBuy+68z
         3RfIeWfI3khlCJYpdGDOu1pU850bTONLyfdE+qEw/lblH34Z0bgRSHAde5yCsSxnLy0t
         1QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728757; x=1795333557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
        b=HUL5WgzhqkqHz/XIEEhY+XOvR/QajNJLZImx4AclSUTbyQ39nuKTxQUSk4XAWpGcxG
         ZgoGF+SIMy1oIMwIEb5DgklmBRXNbmTFV3tIBgQCukNuRPoo5jw0z2FVb4C8WpDfQzRS
         UphTAuzO2vLHyuNu9FDfVRxlSBS9Er1QkWOYQzH6DTOiLc5kiduZhU0NX76AU0B9Kgo5
         pVKdBeb12tnDPVt+uaKIZoKurRAzscp44gdYP6zVV2vDhaK+GZzUPCJpGn5KiLoWsyQa
         lvvxkp+/O6DE+Bez7fTzja6s0X5aTCHwv1/w8BbHD/DpPVVhayIJGiaQvUdvArfZpmrM
         46FA==
X-Forwarded-Encrypted: i=1; AL+hErEQvwtS+zXhVsByWeOqyVE/H9CPfeEvd6Di7BUeDS8YJFXTDjjjzp2482izJ9p6aLGcWwolB/Oslq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b/Csx3pJDfdnuginbyh0JOzRx1JrfoYmjdfp4nnjYg+C3Wgpe
	+k+03f8DkWDRvcG8jA4Zrrg5MGm9PgAJQcFmXGwgw1x8dmF3j0l392IH
X-Gm-Gg: AYBFou3Tiuuxm3MqTxza4cWTuAop8aOAjD5nF4zOLCiX1wROq3GNO9fw+mcJ4+45i1Y
	uCmP3fYrXvlPV1fW9o5QUPZ0vSP0lwczxJnWAYJyjV1zu6Clm5yKySfAWKHyVQjiLZ15P8MulEJ
	NDwFVTOqKKHLAMvEWuNyyBvL5VrWEQRHawQARgC/12ERKk4CPFLbsRXUAqjjd03JQXOtlf+658l
	bulFSZQTLMEqh49m6ezCBhhDWZlmtL+Bznk5xgfun7dXhrB0otyzTCkPt3QUWw+ZryYf8WRnLgp
	boc/6hGdoxZljePuqOVibVhtamRQ+w/AT8UdpVJP6wOSEXS07+dS/VuSAKsuS5lo93aWJrNegT3
	OyBkkl6oLTySsjS/LWoGv+Tzf6xHjZ41nfs4+nlli7naFtiNaN474lA5/sLlzxKrXcVuHg29JE4
	T06FcdNIC4TJrhYIbWFZCjTX9hKhSkRbhBVnaxYUwREj7bimdhwm3yni7pwYM8BbXFgwZCRuApm
	FyWu4WPMsYiZ7G88ARsCWnJfwrRxSZGkjGp3vFbxg4QkmCigTq4QnziwjNdDgbqCVdew6pkr/ZL
	e/vzzmJ7DAFxgyFker2mdBfs9/OEztGx9Un4Zy64790TDF7/hEg7sYNSbkDf+KYnWc8j4OU5MpG
	U1DA/ONQq+HOCL0gZFTXsV5fGXtqgDS2Usv6kS5yq1m0Ex/ttDJObZ8FpcJySSTtN5yzYtO6pOG
	Nn3pRrn62IXf0mEfdTr4AOPwKqVOpMq8w/GvxVKhS48cwg3qXU8N4=
X-Received: by 2002:a05:6808:4f5e:b0:53b:11c7:2da0 with SMTP id 5614622812f47-56e63285bd9mr7499537b6e.21.1794728757024;
        Sat, 14 Nov 2026 23:45:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v5 0/3] net: phy: report ACx00 receive statistics
Date: Sun, 15 Nov 2026 00:45:44 -0700
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OzU7EIBDA8VfZcHaUjyllPfkexgPQ6RZj6aZg0
 82m7y6tGtc9NOECM/zyv7JEY6DEng9XNtIUUhhiuVQPB+Y7G08EoSl3JrnUgkuE9On6kMH6mXM
 4dxdI2eYEk4DGKNPWNSKSYeX/eaQ2zJv9yiJliDRn9vY9Kcw7+bzS666zicCNNvpuffrdfupti
 Ou8CykP42XLnMQm/hRVO0XllCzVoBaEunH85VTAj0c/9FvHJP+kQu1JskjKG6s1Iq+9uJfUrXT
 ckxRwaJ3XSta+coT3Et5IQu1JWKSj0c5YtMLU/5qWZfkCG3yqydwBAAA=
X-Change-ID: 20261024-submit-acx00-phy-stats-v1-d838f77444e8
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

AC200 and AC300 count bytes in received frames including those with CRC
errors. Expose that hardware total through a new optional PHY
rx_bytes_total statistic. The existing successful-byte counter cannot be
derived because the hardware does not separately count damaged-frame
lengths.

Report successful packets and CRC errors through the existing rx_packets
and rx_errors fields. Bracket the raw packet count with matching CRC
counts before subtracting; bytes and CRC errors can still advance when
sustained errors prevent a coherent packet sample.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
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
      ethtool: add a PHY receive byte total
      net: phy: acx00: report receive statistics

 Documentation/networking/ethtool-netlink.rst |  15 +-
 drivers/net/phy/xpowers/acx00.c              | 223 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   8 +-
 include/uapi/linux/ethtool_netlink.h         |   1 +
 net/ethtool/stats.c                          |   5 +-
 5 files changed, 246 insertions(+), 6 deletions(-)
---
base-commit: d1f4b7c6b997c29de67ad7178ababac2328cb1b4
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

