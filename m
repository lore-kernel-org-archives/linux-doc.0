Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5318FC80
	for <linux-doc@vger.kernel.org>; Tue, 10 Sep 2024 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725973425; cv=none; b=uCM5gXqAUXo3SlyvA1tNmlYU8QyqrcUtR/1AAcMItf9ITVKrWFpB4WZMCpqXQIZRPFb0ucUbdic/eM9uSrJraN8O+Xkw6NAvNF/dc1w/+9XaQ17oNaQimFXlM6Lcys1V7cxjCqXAMcG7DmTPA5YD+EvYDbeJjIFWI7rHyVX58dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725973425; c=relaxed/simple;
	bh=+7grqSkriePg/LjEHXVfrqlm1ZflzOJdQryqxAmonlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ougvC8g0bp2s6GGIcKaWj48sg5edgTNLr/XzG9amCyiA8IALNbtC1t499fqnGD6ndUXiX/kM17c/9aeGSRiOjhH5CTDQ4S5YA31nLrgbnKjeY2QJZEfe8qlHUi684wfnIxJGkqjXtEzhOOTdlCUwYQCxPK7+flFIaJ30iRo6H+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=YiMHe17p; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="YiMHe17p"
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024091013033564706c6d1f4887c60b
        for <linux-doc@vger.kernel.org>;
        Tue, 10 Sep 2024 15:03:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/RQZWTb0amL4ldY4wF3tI5y4Df0ypyhlaY78wvfdEGE=;
 b=YiMHe17pm9fqzsq6P5hEGjccDrYj5fX8utu81OdMtBEEbVrmih1wHqiMqBPjBWbiwKTe90
 FXPu8ARUbHALOphGmrx3Fwhbk4xlfzP/jwA9o/hcy8W+hstF3nVObKqBaRy4SxzwQj1Smrps
 UrkdVkR3k//lny7cLMHWpXhx5Q8o6dZlXUrYicI73i6BAsPFHFuQj8e94YiFnCorpJVMIU9b
 OF7uAjB40t+ARQKnZlDldCfTF1bg35eZGAk0Xum3VxcvexKAExcXG83lskh+wVJaYTK5VtJn
 cOW0RkewUpu8q3+OMvGNbpFsjLU+o6txpedwrG9dz45ztObKx06sjGWA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: netdev@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs: net: dsa: RCU protection of dsa_ptr in struct net_device
Date: Tue, 10 Sep 2024 15:03:16 +0200
Message-ID: <20240910130321.337154-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
References: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Mention new netdev_uses_dsa_currently() and use rtnl_dereference() for
dsa_ptr access.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 Documentation/networking/dsa/dsa.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/networking/dsa/dsa.rst b/Documentation/networking/dsa/dsa.rst
index 7b2e69cd7ef0..858c6d2842c4 100644
--- a/Documentation/networking/dsa/dsa.rst
+++ b/Documentation/networking/dsa/dsa.rst
@@ -255,7 +255,7 @@ Conduit network device (e.g.: e1000e):
 2. net/ethernet/eth.c::
 
           eth_type_trans(skb, dev)
-                  if (dev->dsa_ptr != NULL)
+                  if (netdev_uses_dsa_currently(dev))
                           -> skb->protocol = ETH_P_XDSA
 
 3. drivers/net/ethernet/\*::
@@ -656,14 +656,14 @@ Switch configuration
   represents the index of the user port, and the ``conduit`` argument represents
   the new DSA conduit ``net_device``. The CPU port associated with the new
   conduit can be retrieved by looking at ``struct dsa_port *cpu_dp =
-  conduit->dsa_ptr``. Additionally, the conduit can also be a LAG device where
-  all the slave devices are physical DSA conduits. LAG DSA  also have a
-  valid ``conduit->dsa_ptr`` pointer, however this is not unique, but rather a
-  duplicate of the first physical DSA conduit's (LAG slave) ``dsa_ptr``. In case
-  of a LAG DSA conduit, a further call to ``port_lag_join`` will be emitted
-  separately for the physical CPU ports associated with the physical DSA
-  conduits, requesting them to create a hardware LAG associated with the LAG
-  interface.
+  rtnl_dereference(conduit->dsa_ptr)``. Additionally, the conduit can also be a
+  LAG device where all the slave devices are physical DSA conduits. LAG DSA
+  also have a valid ``conduit->dsa_ptr`` pointer, however this is not unique,
+  but rather a duplicate of the first physical DSA conduit's (LAG slave)
+  ``dsa_ptr``. In case of a LAG DSA conduit, a further call to ``port_lag_join``
+  will be emitted separately for the physical CPU ports associated with the
+  physical DSA conduits, requesting them to create a hardware LAG associated
+  with the LAG interface.
 
 PHY devices and link management
 -------------------------------
-- 
2.46.0

