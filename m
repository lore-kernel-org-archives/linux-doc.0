Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819606;
	b=A+OuGO3JvtegTUXd3VSpTa63srcdOvet3f8x0rx82e+L/wtOYq8PR+wQAasiQQZ58c2e
	 wfo/SAQ/RHR1+qzGJL8+FtckW6Huam6plmkvrQLcXNVcsE0NV9lcOBe4+5i4IbyNXgDfM
	 NcxG9iz1WB+xBlX6Igh/8eDyTaqQe8F2tfiL+RLYWgmjtsqzCVJOB15YEoSEdL/oR5zbM
	 J0A5tCoXPSuOki6Q3Ful4FmaKTuURnKUQFJFrqcjJR9dCSTgJvxj28auXQbOvrsbkuboL
	 wo1oDi8AUbXRs1+oRC2CA5QSH3FLmQlrbmRJr1SKivw6uHiXIE53VD/tSHy1JRGHvQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
	b=dY3yHIU+PVm4r4ZNf9LnUx7aM8fFQnqutpE7PsH/PmBCIrgCwZODRXOGq60y1lIsnndm
	 tqezYp6r+sHrI+SIypJPOvG3BLQTPlUFimGm/k1Wl4RpmohiA6f02rXaVRQhWvVdhTi5p
	 Kt/EeHtxwG10VvPo1ENSt3gbngSYloJ0pLesa/3FOP0cDZs4os2tdYUb37Xq0b3zBXSgo
	 n47tcN3/3GGXUnk2+lPmzToLFTe05lyLM4pOVvC7emdUVOad7VsVlrmXgczVOBIwmJdU1
	 ZMIL5VhY+NJOTclSDIFmyzO9WblLlK88qdqtqADve+EnZa/jlK0ZJ71kF3hrp6nz7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNfvVtRt;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6067606A32C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6067606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNfvVtRt
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4877837890fso2133593fac.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819605; x=1795424405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
        b=tNfvVtRtVFeRRn6F4Yx1d12ky5HuQRQs2iLfreCcdSy23EJ0j8AB+6MDzN7qAtW3TG
         Xkg9tkpLQ9Ycslf07hEjqdo5C6YG9Ze/3eLBP8KZJycBbohlgm2+zOdATtDnCyugMaz3
         eY9dWP3Q9pWhM5PFi1w7+b11LbCoeW2fVYvq5KM92aSPTm+TGN/d7NYkX7hnWdj+eNV3
         0p8sCnp1eb/TccoVzAvnXjHD1dRS+shv4nQlHZ89ZOl4EJ1rZuqqfgco4b6XBW2mfNDB
         R/5X8q5ShHuD2k5iHoNuqywYlRPASkWjGakYGodZ6eVAJWosO/EcCPpM8w33jGvlQNyy
         O1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819605; x=1795424405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1T9rHVfS5D3FC+BJOtynV5uEujPCuJ4oTq6T5KpuEM=;
        b=0sOCpqHXIiiFAPW4fMPV6FIujDyfxiV7kTJ7BoJf0f1DEQWzt4QeQc24DR01vo6pyK
         C87WApIR9JTrymjk3xd+dRAvWLjkoQvzN5rUt0uEqjE8gvdb0QnX/Wlee8tB2nE/YgyE
         hpuo3SiMk7JmddsX1j/8TjfW2rAPTphzEo6fIHvFxbR8iKszrIz9vRkwXRvnJdOXUU6z
         +JNtNATZ5xwPRqD6i/pAUtXXg0N6W8TkhtJTuro2tgyeZvJ5ZAGbQ9mAATcFq44bI2BY
         61qQy3yFH9bveUAsJpbe1xc+5akHKNfaCRZIXnwG8f92ahpIZkOnk6wgzcB+Goff+hSq
         UGEQ==
X-Forwarded-Encrypted: i=1; AL+hErEpRazCjnx3dpvaDP3dT++EDMTYeQaGlCD2IS90XdI5gxITudKG+WIk9vCJA1npbQyL5sEl15yq3nc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JqQ8/sjWHByVhyt+gWk6S36j48SrHV50yt0L0lZGqszLf+6xv
	uCLgZhe/WLhRgkkdXpaiH3xY2M+qghvdxp9vb5sJ/NCVTEf6/fX+HbC8
X-Gm-Gg: AYBFou3jC1Gd/pu3VJOqpHYN3WFmE1Fmjqul9xylONJwO06UpbuXdfgHR04lXTSa+d4
	lbUEZXlCdz2PTqdAIDuRMsz0TZLldpsnqWgkWlKg3gX09DhiKxE6XAbvrjHmYar9TCp1WHb0yeV
	7k9eyAQ43nGrWhiUvSGI202hwYKzyRKJvHtRXz7AAX4MqJuseZtiK4CoTq8ueCxmcVCeeqx6g2o
	0Kt0scgP2v7EVZ718PYlH4VsLqzFPQWkrbJfg1HGhwpWZoCiDcIyAzdcnQmLVQPZLbaFo37Swyo
	S1m3C3MwjSFI0WIN3UMBIBDtIzC4CoGv5Qy8ogtyLIkQXKRp+pl9Nn6lRyqBFS5BJvwF2NIVBIt
	8vAZwLoCSgu2Q4Htm8fOuqcsFSQaqjypEDGejw/efi1bIZ4tp969kF/dAzE5PgiAHsXlhj5T6gq
	wtvjGfwmuyzrO91XMZjy6V9539wT3aTKTkUloNlvHSn2Om19FKfu2yjoWepv8aRit287lT/s5X/
	MSSgUWKRbzgsG0DSMwC4Ub/+nX/tbk4j4yOTtrnvGtgnhIeWGNZu8p0FkGnk3T82ikULkq0g2S3
	gwkOSYpdiH8Eqbev7iKSKJzrtw4bD2kyV7BN4OWZzJBW3B8uMKwfwgcWoCtynuj7otvyrfbs62X
	Gz8uqhAwFQOAPvSAahs4rmWmwKWOgUPppO5RdMMo6YuqiIvL6bbU5AJBeSuRQulU7LnoR0xeIMM
	ehhOUIxWAbmhhYJDRweNOzTYbDjUa2gS86Mf3c12nEWuojOK3jLRU=
X-Received: by 2002:a05:6808:4d06:b0:572:86c8:6b4c with SMTP id 5614622812f47-57286c86d22mr4614870b6e.6.1794819604482;
        Mon, 16 Nov 2026 01:00:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 01:59:57 -0700
Subject: [PATCH net-next v6 1/3] docs: networking: correct the PHY
 statistics group name
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
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-1-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
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

The ETHTOOL_STATS_PHY group is exported as phydev by stats_std_names[],
but the ethtool netlink documentation lists it as phy. Use the exported
name so the documented group matches the statistics string set returned
to userspace.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 Documentation/networking/ethtool-netlink.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..8659761ebc69 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currently defined values are:
  ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30.3.2.1.*)
  ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*)
  ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
- ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defined by IEEE
+ ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defined by IEEE
  ====================== ======== ===============================================
 
 Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in the reply.

-- 
2.53.0

