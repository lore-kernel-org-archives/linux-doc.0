Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C5377EDF
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036354; cv=none; b=XTAOJ6YfzJNejbHM1ad4J4/8Dx7mU4dg4uamFxHYCPc8qiGMFVuQ089OBNz88Xcz7Y3VtF+AW0SXjf0T6oLw7cN7kmzwtiUGSFC3mK5HGGTiTSwHSd8MJn6NGr/WA5/r9QOmtJTUktf9+SyrgIxiVgGNo0DzxSy+rRxl8D2GYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036354; c=relaxed/simple;
	bh=SLr+JPD8H966PGr8RyYk2O8cefQBW1MdDmP/zvdAFJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZUhiT/rqGBhVVMRd2Vg4OvfTVnn6lfmZIXnKrcbJ03IudcpdXF/3gHAAa8J5oEcG/hJvQSdvhbi7YcA4cFqeqKm0f1raagA3d72owCS0bsShehTI4+GLzrioR6M+OVPKyarxK8TI6w7UI0hF0Kn1FjHqGpVC7EMuVtvUSrQdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkSUF887; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkSUF887"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso2733490a34.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 23:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787036344; x=1787641144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6S7/HfEeviYM8kMOUgFBBnP6TBKiphaRKUEmhxWElI=;
        b=kkSUF887ByQz4NXUX4s2grAHVfN7ju+RAeK0yzOPE72JR46kGGHjeHPUvGPNpKHEdo
         CuUnxht4qJQNKqtyzjZCFBWoIWXdBwP1D2D3zWoLcT/SRRZdpRp/SNszzwphLIQNawES
         Jsejq/oH6rIfLg9MvsTDHQQ2WRjtgD+CCZRWIcXbIJGgujz8TvSQh4CFoweSiVw8bQaH
         q6xtFLM7QCPSf+h46B5GGl9/MUaPEDNPzN/Sl7vPWWQQV/PXCFj3rWwynQBJRxAdnpO7
         05Rgmeg0M2t78jnzDPHSnxuE3TkrgQUoTgIzYC3YdmW7uDhMUHUTrf2GkrGrCmThvrNn
         eMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036344; x=1787641144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6S7/HfEeviYM8kMOUgFBBnP6TBKiphaRKUEmhxWElI=;
        b=GKd+Y19rP2VCWuABVMiCUFEjy8bZw8EcNk7Vrw4eXvWE+/1u3QSBAQ07YrhQGHlgDG
         /+2hi5AepxoOSRNZQFcSHpvzXyZ4JElLqcpuEB9/GXJkAulCjL018xXf3EF3Urt4K3xm
         bSfQFzXjpE/1Hz5j3P6jwfIt+BEFy57bpVzu99k8u1N763lZNuln/uVZhR5mPTh+R7A6
         1GcVhZl20YcfTUYtuGd5nZUdCThsnon/0aOCfDvM891I+5ZFchTwzcFqyyuDAhXP+uYD
         sb6/n/Un12Ye1nZ5tYl98Dt2r16t9tqK/RrmULVjCMMSdRpKS7Syf2qvYo+sXisi637q
         wNyg==
X-Forwarded-Encrypted: i=1; AHgh+RqygS27Tgkh/DSWjylgZg56rKmvv5BTzZ/btODhDJEfuB9iDGXxiecccfWcy9dEQvRptlE3xS7jboU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSAM77BMBkOebCLHYdG2UcV0A8kJKXoPO6aDYu2PsQmQi3VJqE
	u++7OY/ZyFEWi9ScoMmFae2vev7DDh+W2biu3+ofMIFCbE7m/BsjnLng
X-Gm-Gg: AR+sD12SGvswHEz07vDjhUSiohG43lg0zq118pLMb7vstbed812hfM0JeX48TqBFyrV
	C6zyLtixZH+UyzG0U0odWAXm95PS+Lc7tR5z4VkazCsYfkPo2Dr2lWq1rDKvPtOSFYgIvjfpLBw
	nhE0k5fu87uW7zwkoxIfh5u6zZLMBFIApFon/G7A7k9ucdJm1Q+0QAWiPhnCs0isKFaJHyA23AM
	fq2OB5cfslc6Kt7HjP/D08bPtVHc47XlqKap1z9EMsKSOYDxK456uzGU8aMpp75K+ZrY1DY7yiy
	DvWpddr7/Nohea91ngz4dKfyJ3BEcYjuaqdHlMcYJ8w/XY0B7tPeIk2AhaZy/Qs9CcCWi4FOLlz
	QkyXjbOCmzKzH2DUt7vc+K6Y6kJikiWEwhM188JK6ugBiPkmnx1Iw07q7CNumyVRpW1FAFv/jC8
	s4YphgdG98acwczZeXy4ahLmBzx3QK7oCwrNHfaT9rUDBVvYOkcdY1juzkjrwmtEzne3fE+J92o
	8Acz1R78c0o1/FV1S0Y6lDwxHqgH065T5IlFG194nrOfXVtuk7/0NG/jB65hm7fl4lAvoogHHlM
	p+n6rhspHDYGAjLxJqYlUZFd0O7b5S5nC7qZyFovhGmDHwjF4N/1NMrRSmCkFE7QVW8a6m3KqIP
	eHMbdwrGu8Relym1r
X-Received: by 2002:a05:6830:358e:b0:7d9:f50f:9691 with SMTP id 46e09a7af769-7f3de007b61mr31144874a34.0.1787036344096;
        Mon, 17 Aug 2026 23:59:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41beef430sm3599463a34.5.2026.08.17.23.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:59:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 00:58:58 -0600
Subject: [PATCH net-next v3 2/4] net: mdio: link PHY package suppliers to
 member PHYs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-submit-phy-package-fwdevlink-v1-v3-2-40a905ea16b6@gmail.com>
References: <20260818-submit-phy-package-fwdevlink-v1-v3-0-40a905ea16b6@gmail.com>
In-Reply-To: <20260818-submit-phy-package-fwdevlink-v1-v3-0-40a905ea16b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-acpi@vger.kernel.org, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Ethernet PHY package nodes describe resources shared by their member
PHYs, but a package node is not instantiated as a device. Its
firmware-node supplier links therefore cannot become normal device links
for the PHY members without help from the MDIO layer.

When registering an OF-backed PHY whose parent is an
ethernet-phy-package node, copy the package supplier links onto the
member's firmware node before the PHY device is added. The ordinary
fw_devlink path then creates managed links after the PHY device has been
initialized for link registration and before its driver can probe.

Apply this to both ordinary OF discovery and the exported registration
path for a pre-created PHY device. Leave the package links intact so
every member, including one registered later, can acquire the same
dependencies. This preserves probe, unbind and runtime-PM ordering
without adding PHY-package policy to generic firmware parsing.

Fixes: 385ef48f4686 ("net: phy: add support for scanning PHY in PHY packages nodes")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - Move PHY-package handling out of generic OF property parsing and into
    OF MDIO registration, as suggested by Saravana Kannan
  - Copy package supplier links before device_add() so the normal
    fw_devlink path creates real member links at the correct stage
  - Cover both normal OF discovery and pre-created PHY registration
---
 drivers/net/mdio/of_mdio.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..ff540049b847 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/fwnode.h>
 #include <linux/fwnode_mdio.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -34,9 +35,26 @@ static int of_get_phy_id(struct device_node *device, u32 *phy_id)
 	return fwnode_get_phy_id(of_fwnode_handle(device), phy_id);
 }
 
+static int of_mdiobus_link_phy_package(struct device_node *child)
+{
+	struct device_node *package __free(device_node) = of_get_parent(child);
+
+	if (!package || !of_node_name_eq(package, "ethernet-phy-package"))
+		return 0;
+
+	return fw_devlink_copy_suppliers(of_fwnode_handle(child),
+					 of_fwnode_handle(package));
+}
+
 int of_mdiobus_phy_device_register(struct mii_bus *mdio, struct phy_device *phy,
 				   struct device_node *child, u32 addr)
 {
+	int ret;
+
+	ret = of_mdiobus_link_phy_package(child);
+	if (ret)
+		return ret;
+
 	return fwnode_mdiobus_phy_device_register(mdio, phy,
 						  of_fwnode_handle(child),
 						  addr);
@@ -46,6 +64,12 @@ EXPORT_SYMBOL(of_mdiobus_phy_device_register);
 static int of_mdiobus_register_phy(struct mii_bus *mdio,
 				    struct device_node *child, u32 addr)
 {
+	int ret;
+
+	ret = of_mdiobus_link_phy_package(child);
+	if (ret)
+		return ret;
+
 	return fwnode_mdiobus_register_phy(mdio, of_fwnode_handle(child), addr);
 }
 

-- 
2.53.0

