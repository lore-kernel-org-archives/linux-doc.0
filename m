Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7515C46D2DA
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 23:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760510; cv=none; b=dwSIwv6G5oBr3744doNdpqHKlEpTQe+Jge994+Jo+q74i68I3uW6tjX53lDyS14cu9aye9ntqsdF8d3a89vuh+P0vL0VQmGsKtpn3bVGqio94OywRtHu+xDHze1m3Wl3llFk4Y6wn76uMspNIAQ7QPFbitWHuRKcWUZ5UQmyQns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760510; c=relaxed/simple;
	bh=yMtUmcLBAbCX+ZUhOM2rbSuHAlQDx0F33+20HFCwKwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ut0RlOKpnlIGgAij4zohLRBBMeO1KjDubOwy6N3gkKtwTjHemJ++UBh4x5BH9P/65fPyPk9qE9paivOSs4ezy/hmkhLdrsFfEU7zPZzrIfh4VUdKLJi24psNsS7OKooAlb9vG/pUkSpT+0e6Hx5r+/z3yhoGmkrBp7YTzg6bPmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvwthIXb; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvwthIXb"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-891d19d00ceso329513b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 16:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791760506; x=1792365306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AOoTioqcMuicgG8b89ECx0a5v1cwzZdeTbpwR1FZ8I=;
        b=cvwthIXbGSIP31hRzZKFq6wcRmlThRzhd2Y2As6YWm5HA0UScNBSjXzw6e9Hy6fKUI
         C61iQazXcF1zFKhnWe3Opcr4MFW4ZkJOaanWXi4S5kIbxWAtrMVwH5Xya4HPHkqLURjw
         flTdhv9QswBtOMdR7jPWgOvU2U5YDfUZmrNnyWZU2fzwDHh7Tz410YhiWuGcnGGikfhu
         Dt/HsrTyO9XtWA4QH60RIwQPP/MJjJvptDy1Z9KmXKi/v10f5bLaobBWjomSnZeRjQr2
         uXm3BJoMrYD6rJuNrrF13lpVJlBabWbFvV0ivFljhaczRYtam0w1dSLnUnrj0xPJjWin
         Q0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760506; x=1792365306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AOoTioqcMuicgG8b89ECx0a5v1cwzZdeTbpwR1FZ8I=;
        b=GDMnqpYylHJVBzSks+dUKducqZwD9CrlcOJ/81eImxJ+wijyehoJ5YrodNyBj2J2pe
         y2iTcAZpEm/3Kn1DgoU35MXJBFtroXBVGFxdXFycUda8DrCz60pc6bVIYjpOrsdNu8+m
         9tePs35NJrblvBWCzl9CtkMGvfQnEqchRyegMpxHOOgjiDlLAWQ/6wE/NVpjxNvsWvQ8
         VSebog/LZnfGGtHbVmaSrcyzoi0fdIeq9RQ/UH2EcBSfdJxbRlErH+LkZqOCHesnfY/l
         h2uLtUQ7+J0CbGQUP6nzsVNXDz9peHdUjYmbYzYfqnYPlghdGpzDUzED3iOOFp90Z40Z
         a1lg==
X-Forwarded-Encrypted: i=1; AKwUvBzi1vkl6J1KaAXCVly1Ly6FyYv2JCnHqE0YHuJeDu1atcdaTg6yooYEnWB7HmXlZ2jNpqJNnbRiGAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA+xf9vhwvAt2rHiyC7B2UNJu22wEC9SZ/3Qy3mVKYv/vJXphq
	lqQIjQmMIXbwdbjTieHLNgE9KTYkyri2LEgSCCIvhmc8M6M6pCO//8kj
X-Gm-Gg: AYBFou14hQpolz6RqRcmzuJ2towi1UE2YcM2GwqE+UX/Uy31PyQkHZwEcSNLVq6JV1Z
	XZ1RoiwpM9/Kd50J8pPJrOEq3iIYlfyQ2vbNwt+ZfKV3oGRhqnCCJB1iKTkLRANTGP2CfDmu21q
	NOAeGYqcHLbQB8el3euFXDgMbSfPlDGHJluxfLVUAReV2HU3i+Mbz4aSfFf/eZf0spspI6mgfu+
	0lQ0mbVafUmUqPLM1SBq4r0sPV51JhrgGWT8ksOdHM6glyYZHN6gQjn1Q2X3LWLV4K0dKCMliVX
	I0BFoTLloDGe6hhbwaWz81CFqr+ycuw7irLP35V3xaLkvLN/jDDSLAxerMDAIr7TKQvVpXekUeO
	QP4oRm/sH8+NetFhs8Y9FuTDvOg6gKA9tLMYC0gnJgiGpaeb6BuQqhwMt5C93Xifdo1KCuxq+rz
	72BuBwlW6TeyoCtoS9Zv8pJMswJj8EEmuOqmKKSjV20thJ7CvsCps3xG3pOU2GCG64dDCL00EYz
	gvr7rdKmlpdYpVDj+ss5OD2kxZeS3XNw+28cwt1DDT//H5HU0cPK6oInApQ/rRsvSqT/yIeFQRd
	ObdCf80=
X-Received: by 2002:a05:6a00:1c89:b0:891:6721:370a with SMTP id d2e1a72fcca58-897c634d4c3mr5691666b3a.29.1791760505730;
        Sun, 11 Oct 2026 16:15:05 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c48945dcsm3188917b3a.54.2026.10.11.16.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:15:05 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: kimjinseob88@gmail.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	andersson@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v11 5/8] iio: osf: add UART transport and core receive path
Date: Mon, 12 Oct 2026 08:13:37 +0900
Message-ID: <20261011231340.42885-6-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011231340.42885-1-kimjinseob88@gmail.com>
References: <20261011231340.42885-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Connect the validated stream parser to a serdev receiver and cache device
status. Configure the UART before enabling the supply, and close and drain
the receive producer during managed teardown.

Assisted-by: LLM
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/Kconfig                     |   1 +
 drivers/iio/Makefile                    |   1 +
 drivers/iio/sensorhubs/Kconfig          |   7 ++
 drivers/iio/sensorhubs/Makefile         |   3 +
 drivers/iio/sensorhubs/osf/Kconfig      |  12 ++
 drivers/iio/sensorhubs/osf/Makefile     |   5 +
 drivers/iio/sensorhubs/osf/osf_core.c   |  96 ++++++++++++++++
 drivers/iio/sensorhubs/osf/osf_core.h   |  29 +++++
 drivers/iio/sensorhubs/osf/osf_serdev.c | 146 ++++++++++++++++++++++++
 9 files changed, 300 insertions(+)
 create mode 100644 drivers/iio/sensorhubs/Kconfig
 create mode 100644 drivers/iio/sensorhubs/Makefile
 create mode 100644 drivers/iio/sensorhubs/osf/Kconfig
 create mode 100644 drivers/iio/sensorhubs/osf/Makefile
 create mode 100644 drivers/iio/sensorhubs/osf/osf_core.c
 create mode 100644 drivers/iio/sensorhubs/osf/osf_core.h
 create mode 100644 drivers/iio/sensorhubs/osf/osf_serdev.c

diff --git a/drivers/iio/Kconfig b/drivers/iio/Kconfig
index 652557a5b851f461adc0b14d1a94c275efe7ca3a..202f9d6792f8b56ac3a8a6dea68656cad61ef288 100644
--- a/drivers/iio/Kconfig
+++ b/drivers/iio/Kconfig
@@ -112,6 +112,7 @@ source "drivers/iio/potentiostat/Kconfig"
 source "drivers/iio/pressure/Kconfig"
 source "drivers/iio/proximity/Kconfig"
 source "drivers/iio/resolver/Kconfig"
+source "drivers/iio/sensorhubs/Kconfig"
 source "drivers/iio/temperature/Kconfig"
 
 endif # IIO
diff --git a/drivers/iio/Makefile b/drivers/iio/Makefile
index f03a4100c800b09e23bd06389cbb9df75a452bc2..4e1d930108de1971d5831d5cc4fdc37129894b22 100644
--- a/drivers/iio/Makefile
+++ b/drivers/iio/Makefile
@@ -44,6 +44,7 @@ obj-y += potentiostat/
 obj-y += pressure/
 obj-y += proximity/
 obj-y += resolver/
+obj-y += sensorhubs/
 obj-y += temperature/
 obj-y += test/
 obj-y += trigger/
diff --git a/drivers/iio/sensorhubs/Kconfig b/drivers/iio/sensorhubs/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d248b05d6767720d0cdb088302c76072385e0bea
--- /dev/null
+++ b/drivers/iio/sensorhubs/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Sensor hubs"
+
+source "drivers/iio/sensorhubs/osf/Kconfig"
+
+endmenu
diff --git a/drivers/iio/sensorhubs/Makefile b/drivers/iio/sensorhubs/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..68467c0201026c7bb5fa21b305e1a904cc948edb
--- /dev/null
+++ b/drivers/iio/sensorhubs/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-y += osf/
diff --git a/drivers/iio/sensorhubs/osf/Kconfig b/drivers/iio/sensorhubs/osf/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..fa25ad24bef6e37ea53617894e121cb9f625ddb5
--- /dev/null
+++ b/drivers/iio/sensorhubs/osf/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config OPEN_SENSOR_FUSION
+	tristate "Open Sensor Fusion UART receiver"
+	depends on SERIAL_DEV_BUS
+	select CRC32
+	help
+	  Build the Open Sensor Fusion UART receive path.
+
+	  The driver receives and validates OSF protocol frames over a serdev
+	  UART and caches device status reported by the sensor hub.
+	  Message types without an application handler are ignored.
diff --git a/drivers/iio/sensorhubs/osf/Makefile b/drivers/iio/sensorhubs/osf/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..940c82eddc2e54d5a04dccf3ecb36c98ac638244
--- /dev/null
+++ b/drivers/iio/sensorhubs/osf/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_OPEN_SENSOR_FUSION) += open-sensor-fusion.o
+
+open-sensor-fusion-y := osf_core.o osf_protocol.o osf_serdev.o osf_stream.o
diff --git a/drivers/iio/sensorhubs/osf/osf_core.c b/drivers/iio/sensorhubs/osf/osf_core.c
new file mode 100644
index 0000000000000000000000000000000000000000..b76619335335f5b197374af90056a616c1c08f82
--- /dev/null
+++ b/drivers/iio/sensorhubs/osf/osf_core.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+#include "osf_core.h"
+#include "osf_stream.h"
+
+#define OSF_RESERVED_MSG_FIRST		0x7f00
+#define OSF_RESERVED_MSG_LAST		0x7fff
+#define OSF_VENDOR_PRIVATE_FIRST	0x8000
+
+void osf_core_init(struct osf_device *osf, struct device *dev)
+{
+	*osf = (struct osf_device) {
+		.dev = dev,
+	};
+}
+
+static int osf_core_handle_device_status(struct osf_device *osf,
+					 const struct osf_frame *frame)
+{
+	struct osf_device_status status;
+	int ret;
+
+	ret = osf_protocol_decode_device_status(frame, &status);
+	if (ret) {
+		dev_warn_ratelimited(osf->dev,
+				     "rejecting malformed device status: %d\n",
+				     ret);
+		return ret;
+	}
+
+	osf->status_cache = (struct osf_status_cache) {
+		.uptime_s = status.uptime_s,
+		.status_flags = status.status_flags,
+		.error_flags = status.error_flags,
+		.dropped_frames = status.dropped_frames,
+		.sequence = frame->sequence,
+		.valid = true,
+	};
+	osf->last_sequence = frame->sequence;
+
+	return OSF_STREAM_FRAME_HANDLED;
+}
+
+int osf_core_receive_frame(struct osf_device *osf, const u8 *buf, size_t len)
+{
+	struct osf_frame frame;
+	size_t frame_len;
+	int ret;
+
+	ret = osf_protocol_decode_frame(buf, len, &frame, &frame_len);
+	if (ret)
+		return ret;
+
+	if (frame_len != len)
+		return -EMSGSIZE;
+
+	if (frame.protocol_major != OSF_PROTOCOL_MAJOR) {
+		dev_dbg_ratelimited(osf->dev,
+				    "ignoring unsupported protocol major %u\n",
+				    frame.protocol_major);
+		return OSF_STREAM_FRAME_IGNORED;
+	}
+
+	/*
+	 * Handler failures are validated application rejections. Keep the
+	 * trusted frame boundary and let the stream consume the complete frame.
+	 */
+	switch (frame.message_type) {
+	case OSF_MSG_DEVICE_STATUS:
+		ret = osf_core_handle_device_status(osf, &frame);
+		return ret < 0 ? OSF_STREAM_FRAME_REJECTED : ret;
+	default:
+		if (frame.message_type >= OSF_RESERVED_MSG_FIRST &&
+		    frame.message_type <= OSF_RESERVED_MSG_LAST) {
+			dev_dbg_ratelimited(osf->dev,
+					    "ignoring reserved message type %#x\n",
+					    frame.message_type);
+			return OSF_STREAM_FRAME_IGNORED;
+		}
+		if (frame.message_type >= OSF_VENDOR_PRIVATE_FIRST) {
+			dev_dbg_ratelimited(osf->dev,
+					    "ignoring vendor message type %#x\n",
+					    frame.message_type);
+			return OSF_STREAM_FRAME_IGNORED;
+		}
+
+		dev_dbg_ratelimited(osf->dev,
+				    "ignoring unsupported message type %#x\n",
+				    frame.message_type);
+		return OSF_STREAM_FRAME_IGNORED;
+	}
+}
diff --git a/drivers/iio/sensorhubs/osf/osf_core.h b/drivers/iio/sensorhubs/osf/osf_core.h
new file mode 100644
index 0000000000000000000000000000000000000000..7095e3f967fcde473f3f64b05061c3e9ab0996e4
--- /dev/null
+++ b/drivers/iio/sensorhubs/osf/osf_core.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _OSF_CORE_H
+#define _OSF_CORE_H
+
+#include <linux/types.h>
+
+#include "osf_protocol.h"
+
+struct device;
+
+struct osf_status_cache {
+	u32 uptime_s;
+	u32 status_flags;
+	u32 error_flags;
+	u32 dropped_frames;
+	u64 sequence;
+	bool valid;
+};
+
+struct osf_device {
+	struct device *dev;
+	struct osf_status_cache status_cache;
+	u64 last_sequence;
+};
+
+void osf_core_init(struct osf_device *osf, struct device *dev);
+int osf_core_receive_frame(struct osf_device *osf, const u8 *buf, size_t len);
+
+#endif
diff --git a/drivers/iio/sensorhubs/osf/osf_serdev.c b/drivers/iio/sensorhubs/osf/osf_serdev.c
new file mode 100644
index 0000000000000000000000000000000000000000..791bef93e4b8495fdfdf673faddc2059696e8872
--- /dev/null
+++ b/drivers/iio/sensorhubs/osf/osf_serdev.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/cleanup.h>
+#include <linux/device-id/of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regulator/consumer.h>
+#include <linux/serdev.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "osf_core.h"
+#include "osf_stream.h"
+
+#define OSF_SERDEV_BAUD		115200
+
+struct osf_serdev {
+	struct serdev_device *serdev;
+	struct regulator *vcc;
+	bool vcc_enabled;
+	struct osf_device osf;
+	struct osf_stream stream;
+	/* Protects parser and receive state, including publication setup. */
+	struct mutex lock;
+};
+
+static int osf_serdev_receive_frame(void *context, const u8 *buf, size_t len)
+{
+	struct osf_device *osf = context;
+
+	return osf_core_receive_frame(osf, buf, len);
+}
+
+static size_t osf_serdev_receive_buf(struct serdev_device *serdev,
+				     const u8 *buf, size_t count)
+{
+	struct osf_serdev *osf_uart = serdev_device_get_drvdata(serdev);
+	const struct osf_stream_stats *stats;
+	u64 validated_before;
+	int ret;
+
+	guard(mutex)(&osf_uart->lock);
+	validated_before = osf_uart->stream.stats.validated_frames;
+	ret = osf_stream_receive_bytes(&osf_uart->stream, buf, count);
+	stats = &osf_uart->stream.stats;
+
+	if (ret || stats->validated_frames != validated_before)
+		dev_dbg_ratelimited(&serdev->dev,
+				    "rx count=%zu validated=%llu handled=%llu ignored=%llu rejected=%llu bad_magic=%llu bad_crc=%llu dropped=%llu ret=%d\n",
+				    count, stats->validated_frames,
+				    stats->handled_frames, stats->ignored_frames,
+				    stats->rejected_frames,
+				    stats->bad_magic_resyncs,
+				    stats->bad_crc_frames,
+				    stats->dropped_bytes, ret);
+
+	return count;
+}
+
+static const struct serdev_device_ops osf_serdev_ops = {
+	.receive_buf = osf_serdev_receive_buf,
+};
+
+static void osf_serdev_release(void *data)
+{
+	struct osf_serdev *osf_uart = data;
+
+	/* The TTY controller drains RX work on close; hold no RX lock. */
+	serdev_device_close(osf_uart->serdev);
+	osf_stream_reset(&osf_uart->stream);
+	if (osf_uart->vcc_enabled)
+		regulator_disable(osf_uart->vcc);
+}
+
+static int osf_serdev_probe(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct osf_serdev *osf_uart;
+	unsigned int baudrate;
+	int ret;
+
+	osf_uart = devm_kzalloc(dev, sizeof(*osf_uart), GFP_KERNEL);
+	if (!osf_uart)
+		return -ENOMEM;
+
+	osf_uart->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(osf_uart->vcc))
+		return dev_err_probe(dev, PTR_ERR(osf_uart->vcc),
+				     "failed to get vcc regulator\n");
+
+	ret = devm_mutex_init(dev, &osf_uart->lock);
+	if (ret)
+		return ret;
+
+	osf_uart->serdev = serdev;
+	osf_core_init(&osf_uart->osf, dev);
+	osf_stream_init(&osf_uart->stream, osf_serdev_receive_frame,
+			&osf_uart->osf);
+
+	serdev_device_set_drvdata(serdev, osf_uart);
+	serdev_device_set_client_ops(serdev, &osf_serdev_ops);
+
+	ret = serdev_device_open(serdev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, osf_serdev_release, osf_uart);
+	if (ret)
+		return ret;
+
+	baudrate = serdev_device_set_baudrate(serdev, OSF_SERDEV_BAUD);
+	if (baudrate != OSF_SERDEV_BAUD)
+		/* Keep accepting controller rounding after reporting the mismatch. */
+		dev_warn_probe(dev, -EINVAL, "requested %u baud, controller set %u\n",
+			       OSF_SERDEV_BAUD, baudrate);
+
+	serdev_device_set_flow_control(serdev, false);
+
+	ret = regulator_enable(osf_uart->vcc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable vcc regulator\n");
+	osf_uart->vcc_enabled = true;
+
+	return 0;
+}
+
+static const struct of_device_id osf_serdev_of_match[] = {
+	{ .compatible = "opensensorfusion,osf" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, osf_serdev_of_match);
+
+static struct serdev_device_driver osf_serdev_driver = {
+	.probe = osf_serdev_probe,
+	.driver = {
+		.name = "open-sensor-fusion-uart",
+		.of_match_table = osf_serdev_of_match,
+	},
+};
+module_serdev_device_driver(osf_serdev_driver);
+
+MODULE_DESCRIPTION("Open Sensor Fusion IIO driver");
+MODULE_LICENSE("GPL");
