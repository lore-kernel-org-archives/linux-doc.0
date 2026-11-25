Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581457;
	b=IqM5LBc4JAYFOIbOwijdhLtnYOkEswB5Gh9nrnNHdOhH3hkxASKOYZOAZ13tIcB4VNUQ
	 peZd26wZsAdrvb69GHRVJkzjtuMuC+QmABkWRqMCpVjoMyqYr0RP/WMt/K6xWNGw0WOr1
	 pskM2g0cKRIh9AEXXf6Ak9Kj1Hk7jEzglXD9S3RldgZQAlwJlPR8kkwS+TjsVqvr8xE5Q
	 +OR+IN+6T7+9GHzrzKUIZQoPz2TKJcr/ExPBi+kS/vBfiXVfN0ioQ3PSQi9t/dG8pSDF1
	 92LNTvhK6CVC0917RJsCJ2CuKuXVg8HIcljxs3PgM5fXG/fnZXTQFnjjKdL6T3Bsqyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
	b=YO6I6WmrC9gMdPQ4L0OTgVVIGb7/f6sQBtjpiaYdhva+7bjUtRoNEtIwXx5brXOrc0nl
	 d49m0C3KX1ApcELCVy4PpJt3YF7PdCNGi/L7+6aHDdBBmQUtEKhzbgz2DTFo1FG2oXB94
	 dEFLtACqXfbriWLADGvHYWlgBwFmbv8At7KZXr2lG4KQZvi4bccmV8IOkhj0+rg4jAlj7
	 5inMMy3qycAbyPQgzjpudXZNQV2MF/0Kfx2hdf+zcYs09mxSr+7ZiiboktMWBnV/XU+fS
	 EcgYf6yAskIC92mVUnwQhZRMDAA0Y7R97HAG5RonVooFZ2+oBVXEpD4jvKqh99ETidg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wr1g3rtd;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD4606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 04:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45FD4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wr1g3rtd
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so2002926b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 20:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581455; x=1796186255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=wr1g3rtdkM1+iqfuEpAmW2uI+mDmxkhSbZUiHOjNGeXYWtGHcIpm0T5xgOIxQQO6y+
         U59F7Ek6tl8AX+VqB01IBuq2pW6ZMPiryT3UBENNYfv6S5IMIW042XtKvcoGUj9cAFBt
         IHwGOuSNPp51RYHkspBjfvXMUWOL6qRntcTaduvUm3TaglWRPtcfjvJ5t24ZWMvrhQ6E
         9TBkjFdjAn9+5e3/2jRO/4Kyd1QEfCNZq71N4/f23NClZF/8bXp2hRGEdEPcrJBJRjge
         8slxvAWhDcRyMFBox42yrr4HCHu9s3fLIkdYqGTXSGLvVGkog2A3x4MX5SwGT2fh0pkd
         gFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581456; x=1796186256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=rINwuUrLnRiCtRF4ZGnOLXC1b2zyRTV+hbGM0OCPdJyQBQJTug8DqPY/EGtVOmwIKe
         wkiccnJUY7+wS/armTGusOydtzzsmzkGbOP4WSuB++/Or50RAMITRNiyBWmOuU/fzfcO
         7pgYLViGawbVEbb1pBdOuKL423mX0Z2mATRqRIFtXHHoP2UU2ksMNedY7gVkCFdKRA5X
         TbmGFBVmvivAkGBnmyZUVWzcogdWpBL8NK56oBjAAA14xFYxlUG76ZKV7PhFHMSbOIml
         d/FSYsPvogYmqEkY3HhcxOB6EyN48dTB/CvfeXbm6enOcDsivI37qVf97lBhDbAVMlIX
         Bn4A==
X-Gm-Message-State: APuU4Z+m3dOnTT2pNpAqriEvsZQoRaOUPPhgVSnCwAaUrXMtcpwJ6S7f
	NI6JBlGCYjXGsk0VKtQ+NL38onpq0KmJVTVFvChq1SCmnKZ/XublRglg
X-Gm-Gg: AZFdTZfr303FP7qNMt/xJdZgT+BqH1clWKkjN0yz+Ps+fRp9tzRia3rHzuKzD30vHtm
	3imsDW5wlVYq6MCSlgxE/ZiHyi0+COdaVxBytpPFKhp5FpQtEwGVC35H9BcOUSR+2yDw+eM8Oqb
	As+WYuvpD25cz+S8IFyNHArFyifpvIXG8xto3HLe3/xZ1tpMxhXaXQ454lY5lPevo1MkH6HJTLk
	73738mL1Ysbmgw7Yixuc6WjAzHLNfuDFBRzdwzTi+qcSarhofcG1VyPvGX7F5p/M3eKggZc+o8P
	xNDfJYlxy0JCeN91smxyrIfk+sFwwVZLB6dP+4kWWdW4hK87UqEAflE2mA7tllXjiMR6Vu4p5V7
	ICkQYhlPwlz0LC5qgT+MKBbqqLN/By3UYbaqGv9hlOHtxsKfKDCb/dbQQQdsPR0eTWGfhr1QMkz
	H+diB/sPKRhW5xhr05dgesS+DvKaV29QwqX3mR4+SHJlcW7DbJLed6BLhVxKc5AcicFO87PPbch
	Edc7CAQtkltEDu/L+d2DzNrEevu73EXVboYa5xJxbWdV+aqTOBzmZR1VYcM7pJHvcUxwmCqJ8gU
	LW2D9JgSVvk6id11thzQXX/4YoA=
X-Received: by 2002:a05:6a00:b92:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-8c87bcbcee9mr14392696b3a.9.1795581455547;
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm8215994b3a.31.2026.11.24.20.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 6/8] doc: phy: Document some bulk helper functions
Date: Wed, 25 Nov 2026 12:36:37 +0800
Message-ID: <20261125043639.249525-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document all newly added bulk helper function, it can be used to manage
a set of PHYs automatically. This is useful when the driver want to
simplify the management of multiple PHYs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/driver-api/phy/phy.rst | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..cae3d4700814 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -114,6 +114,12 @@ it. This framework provides the following APIs to get a reference to the PHY.
 	struct phy *devm_of_phy_get_by_index(struct device *dev,
 					     struct device_node *np,
 					     int index);
+	int devm_phy_bulk_get(struct device *dev, int num_phys,
+			      struct phy_bulk_data *phys);
+	int devm_phy_bulk_get_all(struct device *dev,
+				  struct phy_bulk_data **phys);
+	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+				     struct phy_bulk_data **phys);
 
 phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
 In the case of dt boot, the string arguments
@@ -129,6 +135,21 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
 devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
 reference based on name or index.
 
+The bulk helpers are useful when a controller operates several PHYs together,
+for example the lanes of a single PCIe port. To get a set of PHYs by name,
+the driver supplies an array of ``struct phy_bulk_data`` with the ``id`` of
+each entry set to the corresponding PHY name. devm_phy_bulk_get() returns
+zero if it obtains all the requested PHYs or a negative error code on failure.
+The driver owns the array and keeps it valid until driver detach, when the
+PHY references are released.
+
+When a controller needs every PHY listed in a device node's ``phys`` property,
+devm_phy_bulk_get_all() obtains them from the controller's device node.
+devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
+node. These functions return the number of PHYs listed in the node, which may
+be zero, or a negative error code on failure. They store the allocated array
+in ``*phys`` only when the return value is positive.
+
 It should be noted that NULL is a valid phy reference. All phy
 consumer calls on the NULL phy become NOPs. That is the release calls,
 the phy_init() and phy_exit() calls, and phy_power_on() and
@@ -149,6 +170,14 @@ The general order of calls should be::
     phy_exit()
     [[of_]phy_put()]
 
+After acquiring a set of PHYs with a bulk helper, the order is::
+
+    phy_bulk_init()
+    phy_bulk_power_on()
+    ...
+    phy_bulk_power_off()
+    phy_bulk_exit()
+
 Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
 but controllers should always call these functions to be compatible with other
 PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
@@ -172,6 +201,12 @@ PHY framework provides 2 APIs to release a reference to the PHY.
 Both these APIs are used to release a reference to the PHY and devm_phy_put
 destroys the devres associated with this PHY.
 
+For devm_phy_bulk_get_all() and devm_of_phy_bulk_get_all(), driver detach
+releases both the PHY references and the allocated array. To release them
+earlier, use::
+
+	void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
+
 Destroying the PHY
 ==================
 
@@ -221,3 +256,8 @@ DeviceTree Binding
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+Missing Bulk Helpers
+====================
+Currently, only a few bulk helper functions are added as they have users.
+Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
-- 
2.56.1

