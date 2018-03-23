Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 803BB7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 11:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755899AbeCWLAj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 07:00:39 -0400
Received: from mail.bootlin.com ([62.4.15.54]:43837 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753331AbeCWLAg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 07:00:36 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 9EDAF208B0; Fri, 23 Mar 2018 12:00:33 +0100 (CET)
Received: from localhost.localdomain (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
        by mail.bootlin.com (Postfix) with ESMTPSA id ADCB1206FB;
        Fri, 23 Mar 2018 12:00:22 +0100 (CET)
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        linux-gpio@vger.kernel.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 01/11] i2c: Export of_i2c_get_board_info()
Date:   Fri, 23 Mar 2018 12:00:10 +0100
Message-Id: <20180323110020.19080-2-boris.brezillon@bootlin.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180323110020.19080-1-boris.brezillon@bootlin.com>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Boris Brezillon <boris.brezillon@free-electrons.com>

I3C busses have to know about all I2C devices connected on the I3C bus
to properly initialize the I3C master, and I2C frames can't be sent on
the bus until this initialization is done.

We can't let the I2C core parse the DT and instantiate I2C devices as
part of its i2c_add_adapter() procedure because, when done this way,
I2C devices are directly registered to the device-model and might be
attached to drivers which could in turn start sending frames on the bus,
which won't work since, as said above, the bus is not yet initialized.

Export of_i2c_register_device() in order to let the I3C core parse the
I2C device nodes by itself and initialize the bus.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Changes in v2:
- fix memset() call
- rebase on v4.15-rc1
---
 drivers/i2c/i2c-core-base.c |  2 +-
 drivers/i2c/i2c-core-of.c   | 66 ++++++++++++++++++++++++++-------------------
 include/linux/i2c.h         | 10 +++++++
 3 files changed, 49 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a00bf443d06..e57715f5064c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -736,7 +736,7 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 	client->dev.parent = &client->adapter->dev;
 	client->dev.bus = &i2c_bus_type;
 	client->dev.type = &i2c_client_type;
-	client->dev.of_node = info->of_node;
+	client->dev.of_node = of_node_get(info->of_node);
 	client->dev.fwnode = info->fwnode;
 
 	i2c_dev_set_name(adap, client, info);
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 8d474bb1dc15..7470bc418a3b 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -22,56 +22,66 @@
 
 #include "i2c-core.h"
 
-static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
-						 struct device_node *node)
+int of_i2c_get_board_info(struct device *dev, struct device_node *node,
+			  struct i2c_board_info *info)
 {
-	struct i2c_client *result;
-	struct i2c_board_info info = {};
-	struct dev_archdata dev_ad = {};
-	const __be32 *addr_be;
 	u32 addr;
-	int len;
+	int ret;
 
-	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
+	memset(info, 0, sizeof(*info));
 
-	if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
-		dev_err(&adap->dev, "of_i2c: modalias failure on %pOF\n",
-			node);
-		return ERR_PTR(-EINVAL);
+	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
+		dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
+		return -EINVAL;
 	}
 
-	addr_be = of_get_property(node, "reg", &len);
-	if (!addr_be || (len < sizeof(*addr_be))) {
-		dev_err(&adap->dev, "of_i2c: invalid reg on %pOF\n", node);
-		return ERR_PTR(-EINVAL);
+	ret = of_property_read_u32(node, "reg", &addr);
+	if (ret) {
+		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
+		return ret;
 	}
 
-	addr = be32_to_cpup(addr_be);
 	if (addr & I2C_TEN_BIT_ADDRESS) {
 		addr &= ~I2C_TEN_BIT_ADDRESS;
-		info.flags |= I2C_CLIENT_TEN;
+		info->flags |= I2C_CLIENT_TEN;
 	}
 
 	if (addr & I2C_OWN_SLAVE_ADDRESS) {
 		addr &= ~I2C_OWN_SLAVE_ADDRESS;
-		info.flags |= I2C_CLIENT_SLAVE;
+		info->flags |= I2C_CLIENT_SLAVE;
 	}
 
-	if (i2c_check_addr_validity(addr, info.flags)) {
-		dev_err(&adap->dev, "of_i2c: invalid addr=%x on %pOF\n",
-			addr, node);
-		return ERR_PTR(-EINVAL);
+	ret = i2c_check_addr_validity(addr, info->flags);
+	if (ret) {
+		dev_err(dev, "of_i2c: invalid addr=%x on %pOF\n", addr, node);
+		return ret;
 	}
 
-	info.addr = addr;
-	info.of_node = of_node_get(node);
-	info.archdata = &dev_ad;
+	info->addr = addr;
+	info->of_node = node;
 
 	if (of_property_read_bool(node, "host-notify"))
-		info.flags |= I2C_CLIENT_HOST_NOTIFY;
+		info->flags |= I2C_CLIENT_HOST_NOTIFY;
 
 	if (of_get_property(node, "wakeup-source", NULL))
-		info.flags |= I2C_CLIENT_WAKE;
+		info->flags |= I2C_CLIENT_WAKE;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_i2c_get_board_info);
+
+static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
+						 struct device_node *node)
+{
+	struct i2c_client *result;
+	struct i2c_board_info info;
+	int ret;
+
+	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
+
+	ret = of_i2c_get_board_info(&adap->dev, node, &info);
+	if (ret)
+		return ERR_PTR(ret);
 
 	result = i2c_new_device(adap, &info);
 	if (result == NULL) {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 419a38e7c315..3e38c10748e3 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -873,6 +873,9 @@ extern const struct of_device_id
 *i2c_of_match_device(const struct of_device_id *matches,
 		     struct i2c_client *client);
 
+int of_i2c_get_board_info(struct device *dev, struct device_node *node,
+			  struct i2c_board_info *info);
+
 #else
 
 static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
@@ -897,6 +900,13 @@ static inline const struct of_device_id
 	return NULL;
 }
 
+static inline int of_i2c_get_board_info(struct device *dev,
+					struct device_node *node,
+					struct i2c_board_info *info)
+{
+	return -ENOTSUPP;
+}
+
 #endif /* CONFIG_OF */
 
 #if IS_ENABLED(CONFIG_ACPI)
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
