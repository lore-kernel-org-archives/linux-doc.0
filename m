Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728759;
	b=Gitr8zYx3+VHHCxoqcmm/GbsWTfn6JIsomalYPNOIWT0YSVftUhUCizJmfpKASq1q38R
	 mJ8u0Q4LCoIGsi99ZGG7mzUsMHq2o+X3FEIIdqVaVDtqFx7ad36dhz4wb9cue45fapuOk
	 /mi29SRjpMg5TMwIFV/MymiGbh70E7dfA6oKmsWkcTHhKk9PhRWJIrLtckAKWPlRVimf0
	 o99osBzDZpIbyG/AqILqWe66beg4PCcXQOAQA7ODlnkPnEt7ZIsVZRl9RPncBNfeLQsr1
	 K5kXTa3HUxYcjsBhc5dJCGLafTG50Zlzu4BpimLjXEw99gf2bs9U2MlWcOUAqb3/5LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
	b=Bd+c5Fyi7X4/HQP1+aTmN0uUu2ik9xBSuF6yiDyNce41IR0bzLdhiMf8HAiDuZGACG7q
	 KhUFqZ5LfHQPwi4tfuRxrPWgdL6mLFd3SgJ9YoADgSz+2/JK4OQlv2AuKhbQd76fDrPld
	 GXRYZuyq9udi24rJWJV9jWZSJ5+EkST77iVkSTbmU8aD8FC+pn3uDu1Og4n9vlRH4lttC
	 y9hIcO8fu7oyRe8dKAOWGImXPhK5dHOY71I7NF+1e4Fp94tUEz5poNQh6wuYppzh//lkk
	 y7Cw/00iXTZpyxHwv4726z3jPcVUeTm9uUxoK0lM1Uz/T4kBSiaBrANI62huGoOn6bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1AQTdnp;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62477606A333
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 07:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62477606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1AQTdnp
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-499f20c7054so1756502fac.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728758; x=1795333558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
        b=D1AQTdnp4gx0VEp+HTMg/wHHUTiAlE4Ye0eF3VbKl6CljIPmbvtU+mebSHz2m37V1t
         bWiZARGqGRLxOPA1akRetRKH04YSCRMOBbYXjKEa1A5rPjSphL5MZzw5RABQ60WAjiID
         qFfKGxbPeeAMWLvHE+vmw1+dx/lK3FI/3u3GHEYJQ/P+UUoIUn/ssR/lwtDL5ngvxlcU
         8T56pCxrweujiwTwBAcAWRePgO3eEZ5kEnkZLtL/yBdNixYmOvdA6kOjA+JaIBNnRDhC
         e65BrgUSw6VdqDCn0sKHPfoOsOrIuwLvKKQL/iLses8XFZdbHG+aBG8yLJF0brkaWEw8
         HG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728758; x=1795333558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYupZFd/F9+mlQ1Qe2cKOU85Z2FtPg/44Q8malAX03k=;
        b=2rCVdn9+m7gQ6Tpvhz4GcrOpZHUN2Iz7OUUtzXSdfNi10g4YoLR/BTGMVZuVM0gOsv
         GiMkRhnt9ql6lIOv7LeLiwyZD6QmijbU89DoX7PjO7j7R6JB0+7zMzSDP35RQuWyRzWz
         UeUVDJcfGbRrWfZGyAqgNZXJWH3TmbXywrSkdJdpXpQNjfXKhfh327Z3TJr8XjSZa8ik
         axw60lYzleWAYU4SiZ1PuUqbgpCjFroFAOoFC13gcakeoFGd7Qi8LF8KM9Vqe9mCCgg3
         GN23iExzMMxCOJfS0otMKrDDUX6PqK5Dlv787Tefp4bpYhV8rLOCq09oSn4prsHvjxdn
         z1Cw==
X-Forwarded-Encrypted: i=1; AL+hErFYP/+qw1flFAmZTaj9kcdxfrcpxbGiUhcx3TgLH3siwyH/8VS/34J6DWj5jrkvuPbcVmF5/Fl7xk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z80WDorO/DRbjE7pCKp5fvlSH1RV+JRC/BvGNwDb+2bn3FEuFEl
	AlgI/js/gNQJ4GGDd3AkdAjYQJ4yju74kfLUZCQQQT77/5kJKUeqh6yN
X-Gm-Gg: AYBFou3lxOy6j9ZxU7SAwGqfpmAcduUfrEdt5OCZTESqIT9Kbj8UEUBP1QZVK+RXvHQ
	cZvj0zKjMjKXi5DN3rBX3kd9VZmZpaSIDfeJzQf3H3oVBvMZVNndieL+ekAxAbVQQA9OS43FJut
	uY91G7neFOIQ/HEIdeHiFw59mwpNGyNAzCJF1uEV94NnI2WwFLRMPKZF/90nl4fAJIyOulQ3JMu
	1C7xfIqeFkP8G8MO+egCmO9EY48EpvxypYKSs+qejnrRyOb8YQ3WKuD+MKDxoJgz+QHXYXU9PTh
	NMJ8z2vdhQjxXZBkZ+sbUsjHFkqEE0IWm2av5M3tVAd+zThz9+w7lBOg/uHBHyk+iuP0SY+NbHp
	82IOIwtB5tROcHE8EhiUnwI58HTnDAXIRVX2xSbWpOsGao6F99KLdANr8iPp1jm+OIfGv5DZf3d
	f+sMmhvALWG6LKu78CLG4PyY7ZrWGXicCYbBQo+Wrge1LwV6/7N0FBP476iOltel/8G5A1sKW76
	PInm3pSaYla4Dphyh8pFO8k161cH0T52gFAbpSm92gqqqLkGdLkNlsJoVfWemWE6evKEwq7LQC9
	2tcyI5zDUIF+WIl9ySt9t5DaM+nDTUvYXALwF2XdxGIp9kGISSRkdMkFOa3KtNmvNeZl5hlhMeG
	ASCv2pNfQUHVHdMTzTJwdcPyoIS6srTT9ekHGTn5FpnQmte7Nr8mK1qE6rkDDkcmRBEo1wY7OWW
	vsyycVRujzQeMAWM/8ItKLEVu+AcmtQftzo7E8t4X58sN2zpjNy8Q=
X-Received: by 2002:a05:6871:88c:b0:494:116a:b0f1 with SMTP id 586e51a60fabf-4afdf28de45mr6492889fac.21.1794728758319;
        Sat, 14 Nov 2026 23:45:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:45:45 -0700
Subject: [PATCH net-next v5 1/3] docs: networking: correct the PHY
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
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-1-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
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

The ETHTOOL_STATS_PHY group is exported as phydev by stats_std_names[],
but the ethtool netlink documentation lists it as phy. Use the exported
name so the documented group matches the statistics string set returned
to userspace.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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

