Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E94530E0F4
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426930; cv=none; b=WQ59QPlbAXpys/LvOEaYRsYta9ls+hv1DIvY884kYPosFyrUGN7zCWTOAPBAo4DIVTztNrOZqfCHab797Nqa86ruhJUyvfT7MVxooUp9GwmIBJJ49Mv4h+2gkojf9gIkP4ZKHuTTO1vJZGPOa63L0Efg9dWHrhERUzLqicYc7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426930; c=relaxed/simple;
	bh=Gw0kS6MfKMn5a9ABcytBo6kusWBX6HUjXXjCnSLOoM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g4t5ekW5CdNYZxCPfnJEnKBYxB7sdz5Ivo4NyTFsR6CjoujSO3nahghxJkUqn+KE7R23ukUDfPz0c73BZR+5AwbLlkkpDC5i32uZRI/h93LjtEyuQWM8ulshng6fd/NumnS3OTVIXeTo0Gd4lGhPMCM80mbnIe9M9KwGJtQEV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz2t1760426860t6f534f5b
X-QQ-Originating-IP: YMWdd08nqTJKzbxUXvjjF+DV3mo55BgnvU4rM74e7ds=
Received: from localhost.localdomain ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 15:27:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9935090016473382452
EX-QQ-RecipientCnt: 13
From: Dong Yibo <dong100@mucse.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	andrew+netdev@lunn.ch,
	danishanwar@ti.com,
	vadim.fedorenko@linux.dev
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dong100@mucse.com
Subject: [PATCH net-next v14 4/5] net: rnpgbe: Add basic mbx_fw support
Date: Tue, 14 Oct 2025 15:27:10 +0800
Message-Id: <20251014072711.13448-5-dong100@mucse.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014072711.13448-1-dong100@mucse.com>
References: <20251014072711.13448-1-dong100@mucse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Np4vjJaFyq9jHdq1kPoWfYUoO5cX/xry+1Xokmrliwq3JRRaG1Oo08K3
	UwoQcoxR90sqa6Op/XM5H3kLrvvycxbpVtv5KmiTPj81PjfgMkVKE4sA2vwUsljCilaTEW4
	cKRg+KQP27yZUdo0m4mKyLbji9gCmGI6dJNvG2NeP2oMG6oWqLesDkThKMzkSHdjyWaNCtL
	bgUFSN4DYu1xT5EcNa6IJdrwOOxP4BTRL8EMFxW3N6Shf9Rh5n5yzzZ3BuL2dN1Pv1Fm3+a
	fLweR2c7cFLvNGgly83xR1w40s3eNVYdfTndyZMb2pWiniucCassEu+CYt7ZS0FmzVuRURh
	3pRe0yDy0nBcQ8bXQBjW+M7+2RCgH+Ga+0m9jQO9vwV0wahTPoOFFyCJpeDj0oVuiovutVP
	epqdQGKCVNyTaS6NHn6pvDUI9zz+WmOSISGTg8i/oQXodn3UoPuRECm0+asSWZp8yE+3bIo
	sYmHIcprWVT9UN3iHdqJzsdS9HaEcO5mULuk0338A8tuulBkAX/D66KUkkAWaTEvST2NQPm
	VGSpAYAVle9LrSACdbzML4ECy8bpsrVAONI9SW2ez4qLjk+UO+f93MFljsqqkBUSnkqNpoP
	KLPXE/5qmB9J9/9WSQ8QZXKq2pdxlplJVco9SOOencee1f74hQeYTLhtN2KZkSnjZxPVAXP
	vL92g/77blOgJP0waey6PL0WfgEjYAIu+fP1oUlvY8MlTEaarCISgqqfmpZM/4zgdEqilDF
	amWqXp55Psb9imzqXiPKiLKWlFQSyuk8+E1rhBa/kAREclefzzGVMfMNlqHsDZXxfNi9nx3
	JnBpfnLx+U+7CeXGzJUxfccgEcJh1srUQnbJx0Z5zwz8i2TqbHb00/1j3LNdDXzkTfAw985
	m4ulxtF7qojoV1FW3z+K/WNSy2DywMCm4s2qJ3qewLIkgxTJLnMVnYLEHLyaFdf8DzkVneB
	nG5soks0mI6xtqCBJC4Hunzr6zMz6GR5UYaRsmC1BVbDdHM40wh7dYgAyqii1KR0n/VnOGI
	gRBS5km/NZA9UE5sSXWFQL1IETF2vu8qwxFkZ0Qw==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Add fundamental firmware (FW) communication operations via PF-FW
mailbox, including:
- FW sync (via HW info query with retries)
- HW reset (post FW command to reset hardware)
- MAC address retrieval (request FW for port-specific MAC)
- Power management (powerup/powerdown notification to FW)

Signed-off-by: Dong Yibo <dong100@mucse.com>
---
 drivers/net/ethernet/mucse/rnpgbe/Makefile    |   3 +-
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |   4 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c    |   1 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c | 195 ++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h | 121 +++++++++++
 5 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h

diff --git a/drivers/net/ethernet/mucse/rnpgbe/Makefile b/drivers/net/ethernet/mucse/rnpgbe/Makefile
index 5fc878ada4b1..de8bcb7772ab 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/Makefile
+++ b/drivers/net/ethernet/mucse/rnpgbe/Makefile
@@ -7,4 +7,5 @@
 obj-$(CONFIG_MGBE) += rnpgbe.o
 rnpgbe-objs := rnpgbe_main.o\
 	       rnpgbe_chip.o\
-	       rnpgbe_mbx.o
+	       rnpgbe_mbx.o\
+	       rnpgbe_mbx_fw.o
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index f4af04b3117e..794581471b22 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -5,6 +5,7 @@
 #define _RNPGBE_H
 
 #include <linux/types.h>
+#include <linux/mutex.h>
 
 enum rnpgbe_boards {
 	board_n500,
@@ -24,6 +25,8 @@ struct mucse_mbx_info {
 	u32 delay_us;
 	u16 fw_req;
 	u16 fw_ack;
+	/* lock for only one use mbx */
+	struct mutex lock;
 	/* fw <--> pf mbx */
 	u32 fwpf_shm_base;
 	u32 pf2fw_mbx_ctrl;
@@ -34,6 +37,7 @@ struct mucse_mbx_info {
 struct mucse_hw {
 	void __iomem *hw_addr;
 	struct mucse_mbx_info mbx;
+	u8 pfvfnum;
 };
 
 struct mucse {
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c
index b7e3d5dbadad..9c0e62ed33d4 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c
@@ -411,5 +411,6 @@ void mucse_init_mbx_params_pf(struct mucse_hw *hw)
 	mbx->stats.msgs_rx = 0;
 	mbx->stats.reqs = 0;
 	mbx->stats.acks = 0;
+	mutex_init(&mbx->lock);
 	mucse_mbx_reset(hw);
 }
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
new file mode 100644
index 000000000000..2eaf24aa117e
--- /dev/null
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2020 - 2025 Mucse Corporation. */
+
+#include <linux/if_ether.h>
+#include <linux/bitfield.h>
+
+#include "rnpgbe.h"
+#include "rnpgbe_mbx.h"
+#include "rnpgbe_mbx_fw.h"
+
+/**
+ * mucse_fw_send_cmd_wait_resp - Send cmd req and wait for response
+ * @hw: pointer to the HW structure
+ * @req: pointer to the cmd req structure
+ * @reply: pointer to the fw reply structure
+ *
+ * mucse_fw_send_cmd_wait_resp sends req to pf-fw mailbox and wait
+ * reply from fw.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+static int mucse_fw_send_cmd_wait_resp(struct mucse_hw *hw,
+				       struct mbx_fw_cmd_req *req,
+				       struct mbx_fw_cmd_reply *reply)
+{
+	int len = le16_to_cpu(req->datalen);
+	int retry_cnt = 3;
+	int err;
+
+	mutex_lock(&hw->mbx.lock);
+	err = mucse_write_and_wait_ack_mbx(hw, (u32 *)req, len);
+	if (err)
+		goto out;
+	do {
+		err = mucse_poll_and_read_mbx(hw, (u32 *)reply,
+					      sizeof(*reply));
+		if (err)
+			goto out;
+		/* mucse_write_and_wait_ack_mbx return 0 means fw has
+		 * received request, wait for the expect opcode
+		 * reply with 'retry_cnt' times.
+		 */
+	} while (--retry_cnt >= 0 && reply->opcode != req->opcode);
+out:
+	mutex_unlock(&hw->mbx.lock);
+	if (!err && retry_cnt < 0)
+		return -ETIMEDOUT;
+	if (!err && reply->error_code)
+		return -EIO;
+
+	return err;
+}
+
+/**
+ * mucse_mbx_get_info - Get hw info from fw
+ * @hw: pointer to the HW structure
+ *
+ * mucse_mbx_get_info tries to get hw info from hw.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+static int mucse_mbx_get_info(struct mucse_hw *hw)
+{
+	struct mbx_fw_cmd_req req = {
+		.datalen = cpu_to_le16(MUCSE_MBX_REQ_HDR_LEN),
+		.opcode  = cpu_to_le16(GET_HW_INFO),
+	};
+	struct mbx_fw_cmd_reply reply = {};
+	struct mucse_hw_info info = {};
+	int err;
+
+	err = mucse_fw_send_cmd_wait_resp(hw, &req, &reply);
+	if (!err) {
+		memcpy(&info, &reply.hw_info, sizeof(struct mucse_hw_info));
+		mucse_hw_info_update_host_endian(&info);
+		hw->pfvfnum = FIELD_GET(GENMASK_U16(7, 0),
+					le16_to_cpu(info.pfnum));
+	}
+
+	return err;
+}
+
+/**
+ * mucse_mbx_sync_fw - Try to sync with fw
+ * @hw: pointer to the HW structure
+ *
+ * mucse_mbx_sync_fw tries to sync with fw. It is only called in
+ * probe. Nothing (register network) todo if failed.
+ * Try more times to do sync.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+int mucse_mbx_sync_fw(struct mucse_hw *hw)
+{
+	int try_cnt = 3;
+	int err;
+
+	do {
+		err = mucse_mbx_get_info(hw);
+	} while (err == -ETIMEDOUT && try_cnt--);
+
+	return err;
+}
+
+/**
+ * mucse_mbx_powerup - Echo fw to powerup
+ * @hw: pointer to the HW structure
+ * @is_powerup: true for powerup, false for powerdown
+ *
+ * mucse_mbx_powerup echo fw to change working frequency
+ * to normal after received true, and reduce working frequency
+ * if false.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+int mucse_mbx_powerup(struct mucse_hw *hw, bool is_powerup)
+{
+	struct mbx_fw_cmd_req req = {
+		.datalen = cpu_to_le16(sizeof(req.powerup) +
+				       MUCSE_MBX_REQ_HDR_LEN),
+		.opcode  = cpu_to_le16(POWER_UP),
+		.powerup = {
+			/* fw needs this to reply correct cmd */
+			.version = cpu_to_le32(GENMASK_U32(31, 0)),
+			.status  = cpu_to_le32(is_powerup ? 1 : 0),
+		},
+	};
+	int len, err;
+
+	len = le16_to_cpu(req.datalen);
+	mutex_lock(&hw->mbx.lock);
+	err = mucse_write_and_wait_ack_mbx(hw, (u32 *)&req, len);
+	mutex_unlock(&hw->mbx.lock);
+
+	return err;
+}
+
+/**
+ * mucse_mbx_reset_hw - Posts a mbx req to reset hw
+ * @hw: pointer to the HW structure
+ *
+ * mucse_mbx_reset_hw posts a mbx req to firmware to reset hw.
+ * We use mucse_fw_send_cmd_wait_resp to wait hw reset ok.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+int mucse_mbx_reset_hw(struct mucse_hw *hw)
+{
+	struct mbx_fw_cmd_req req = {
+		.datalen = cpu_to_le16(MUCSE_MBX_REQ_HDR_LEN),
+		.opcode  = cpu_to_le16(RESET_HW),
+	};
+	struct mbx_fw_cmd_reply reply = {};
+
+	return mucse_fw_send_cmd_wait_resp(hw, &req, &reply);
+}
+
+/**
+ * mucse_mbx_get_macaddr - Posts a mbx req to request macaddr
+ * @hw: pointer to the HW structure
+ * @pfvfnum: index of pf/vf num
+ * @mac_addr: pointer to store mac_addr
+ * @port: port index
+ *
+ * mucse_mbx_get_macaddr posts a mbx req to firmware to get mac_addr.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+int mucse_mbx_get_macaddr(struct mucse_hw *hw, int pfvfnum,
+			  u8 *mac_addr,
+			  int port)
+{
+	struct mbx_fw_cmd_req req = {
+		.datalen      = cpu_to_le16(sizeof(req.get_mac_addr) +
+					    MUCSE_MBX_REQ_HDR_LEN),
+		.opcode       = cpu_to_le16(GET_MAC_ADDRESS),
+		.get_mac_addr = {
+			.port_mask = cpu_to_le32(BIT(port)),
+			.pfvf_num  = cpu_to_le32(pfvfnum),
+		},
+	};
+	struct mbx_fw_cmd_reply reply = {};
+	int err;
+
+	err = mucse_fw_send_cmd_wait_resp(hw, &req, &reply);
+	if (err)
+		return err;
+
+	if (le32_to_cpu(reply.mac_addr.ports) & BIT(port))
+		memcpy(mac_addr, reply.mac_addr.addrs[port].mac, ETH_ALEN);
+	else
+		return -ENODATA;
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h
new file mode 100644
index 000000000000..375b8b86303e
--- /dev/null
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright(c) 2020 - 2025 Mucse Corporation. */
+
+#ifndef _RNPGBE_MBX_FW_H
+#define _RNPGBE_MBX_FW_H
+
+#include <linux/types.h>
+
+#include "rnpgbe.h"
+
+#define MUCSE_MBX_REQ_HDR_LEN 24
+
+enum MUCSE_FW_CMD {
+	GET_HW_INFO     = 0x0601,
+	GET_MAC_ADDRESS = 0x0602,
+	RESET_HW        = 0x0603,
+	POWER_UP        = 0x0803,
+};
+
+struct mucse_hw_info {
+	u8 link_stat;
+	u8 port_mask;
+	__le32 speed;
+	__le16 phy_type;
+	__le16 nic_mode;
+	__le16 pfnum;
+	__le32 fw_version;
+	__le32 axi_mhz;
+	union {
+		u8 port_id[4];
+		__le32 port_ids;
+	};
+	__le32 bd_uid;
+	__le32 phy_id;
+	__le32 wol_status;
+	union {
+		__le32 ext_info;
+		struct {
+			u32 valid : 1;
+			u32 wol_en : 1;
+			u32 pci_preset_runtime_en : 1;
+			u32 smbus_en : 1;
+			u32 ncsi_en : 1;
+			u32 rpu_en : 1;
+			u32 v2 : 1;
+			u32 pxe_en : 1;
+			u32 mctp_en : 1;
+			u32 yt8614 : 1;
+			u32 pci_ext_reset : 1;
+			u32 rpu_availble : 1;
+			u32 fw_lldp_ability : 1;
+			u32 lldp_enabled : 1;
+			u32 only_1g : 1;
+			u32 force_down_en: 1;
+		} e_host;
+	};
+} __packed;
+
+/* FW stores extended information in 'ext_info' as a 32-bit
+ * little-endian value. To make these flags easily accessible in the
+ * kernel (via named 'bitfields' instead of raw bitmask operations),
+ * we use the union's 'e_host' struct, which provides named bits
+ * (e.g., 'wol_en', 'smbus_en')
+ */
+static inline void mucse_hw_info_update_host_endian(struct mucse_hw_info *info)
+{
+	u32 host_val = le32_to_cpu(info->ext_info);
+
+	memcpy(&info->e_host, &host_val, sizeof(info->e_host));
+}
+
+struct mbx_fw_cmd_req {
+	__le16 flags;
+	__le16 opcode;
+	__le16 datalen;
+	__le16 ret_value;
+	__le32 cookie_lo;
+	__le32 cookie_hi;
+	__le32 reply_lo;
+	__le32 reply_hi;
+	union {
+		u8 data[32];
+		struct {
+			__le32 version;
+			__le32 status;
+		} powerup;
+		struct {
+			__le32 port_mask;
+			__le32 pfvf_num;
+		} get_mac_addr;
+	};
+} __packed;
+
+struct mbx_fw_cmd_reply {
+	__le16 flags;
+	__le16 opcode;
+	__le16 error_code;
+	__le16 datalen;
+	__le32 cookie_lo;
+	__le32 cookie_hi;
+	union {
+		u8 data[40];
+		struct mac_addr {
+			__le32 ports;
+			struct _addr {
+				/* for macaddr:01:02:03:04:05:06
+				 * mac-hi=0x01020304 mac-lo=0x05060000
+				 */
+				u8 mac[8];
+			} addrs[4];
+		} mac_addr;
+		struct mucse_hw_info hw_info;
+	};
+} __packed;
+
+int mucse_mbx_sync_fw(struct mucse_hw *hw);
+int mucse_mbx_powerup(struct mucse_hw *hw, bool is_powerup);
+int mucse_mbx_reset_hw(struct mucse_hw *hw);
+int mucse_mbx_get_macaddr(struct mucse_hw *hw, int pfvfnum,
+			  u8 *mac_addr, int port);
+#endif /* _RNPGBE_MBX_FW_H */
-- 
2.25.1

