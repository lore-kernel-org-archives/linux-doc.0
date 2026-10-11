Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42603939AE
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 23:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760497; cv=none; b=jvgNONo5BdlGIkHMNTfSSVq2lJ9DURubgCdUmY1jdqAXGPxbEnffYH2U3RCtIdr62W3nRLEJYCMnqdGcpNtNidUenTMgtSw6dRz6nuyMGH4GxbTEaLZTfIjOb4cZyg77rzS4zprJfYZfjrGGOIMOhwXthSj7jOJIM6UXA+Ml91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760497; c=relaxed/simple;
	bh=j9TEXVAcSwedKGIDXr8iVETEC3fWt8srHl7aXBBaKfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbO31iGcpLpjWsuskko8/jIGp9qd9npam87LI0ncNpoy9WBg+CPGFFXdaIKcJDBB4kF0Z0gX+velgUaWeRTdnj/wTDrk5shlKEQDDCEJyq7eaF7cmNlcTL1b81oOXjqTiuXlxdecBw9+5AeVAMyrwQnvhrQNP6H3LBVMh58iYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncavpUmj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncavpUmj"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-872024e2b4eso360982b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 16:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791760495; x=1792365295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouIyWbSxwXCoSedafwvAM0EZ4p7Bi8juSi17c4q2igc=;
        b=ncavpUmjSCEbVkKG+15PYoY6vhz1hvCoW4YtdOrG94ADnpFc7Ej/iUY3W2agcu03fk
         J4XBFSRSIFpVtNTmZv6otCMbNePW4KFQtpdkKdwb4ZgiZqSmp+qtjOjwkAm0pTqNGjLM
         ErzwrQ86+hEHX6bFzmlqWYjL+eIObUz8qzrQ/RQIX7JncRQqIyPXz9Lk9E2GuQDelORY
         WqHMgkC2vM81ib6E1PYhh464BViFpExpRIoQ0ldCAGTHYfsinNngsqD/QCmVEjfvzKUP
         xQfcS/n3/+IEnAs9Vyxy2Jwf9l5fpKVbGQKRu7GWsOHadvUYXu/7CL248z9837Pw3UHK
         U9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760495; x=1792365295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouIyWbSxwXCoSedafwvAM0EZ4p7Bi8juSi17c4q2igc=;
        b=A1L3Y5OD20LRW0AG/hWhMJ39VRS/Ggw1+//ax/+aVkaKektpzd3zIYKouPCU4MposK
         PSkjL5NE55MVNHw2rVjk8PYe/sspt7/U5DMmuUg3WbeeA8g1vxF32XEYdAHNar+M+zrN
         UXBqwxZd1Hd0ddcPMqc08qpe4N/gk+2wb/NZ8s7QSLIJRchFIKnmG0LUMgnDjjk0VreZ
         WRExoOwz7RUEtYQJVxryY5tBJkOt85k1zpwm/tCgCCLx2dKFRo8j0NTbFWXkgUMaRauC
         bHI3+tu3su5rvUDG68MzpMzaTJyCRcfflGblROslcjLy0dnyeHAbbNeIXP6juGGjSeZV
         cR7w==
X-Forwarded-Encrypted: i=1; AKwUvBy9U12KmtIssvZXLN7I+vdnbpsiwmQNLmtrN8L9txahrG69Dp5HKrF+Xmnl4fl9Uf81Vf2er3PzYTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGApKNijx+nqCzhdZ6avrJh1L88kbR4g5u7YEzltD4yCZ1BvFQ
	xOaZSzB1/mE7PwSDkTHZuJxjAIZFpzqxYSGWqK+022FpFCTVuTdynOfY
X-Gm-Gg: AYBFou37z29OACI8ZfttzVhfK4HYTjGlZjDogI8l03cxb5ipzu2Eh1rXGW70xD2Y1YH
	/Dr/P8/Nkoq5idWpT1fKlnPfDyCot5pMhrqX2kq1DMdqBTUD9pGoIgcqTyd8x9dZ045qmauWZPo
	DsxqNgWAypOCDNddzQetEGFYHmjX88g/kfAGoXpHOX18jLX2YdLIj3wV8XNEY0dRFmqwKoA9/+v
	75msiIHUVHvJ0veUeDAI7ACZ1oN9hH3ieClxrXVFGnA7yA4h78RuWAMGcrP33Nr9F5lSnzHDdRc
	/ufl82JEwRgPXJeIkaXOtcyaMgWOD2XMmGlYuFI4ZXctPRZDlm9wqi798mHIwhCqYo5tMB8uz4n
	j3lYSKRSt23hgTEX696exV/fk34aF92PeAUlqLNQvaJqFcRbwPkSj0r0rJBatL1fkA/76gC0VAo
	TUelInyHs0aFewzPo26FZnJpt8dV/IjeWRAWlP9OlrckLKSyVMdjfKQwi4E+ZQfaA+3IwHXf89j
	erCWGiQzZAqWohafLCn550g88YImZzXYgiIt8fu96cVsNcuJzWKQQmGDDywXpjvf9ea8osWim2/
	gxdpJrA=
X-Received: by 2002:a05:6a00:a1b:b0:888:1763:b07f with SMTP id d2e1a72fcca58-897c3ff4adbmr6608122b3a.6.1791760495108;
        Sun, 11 Oct 2026 16:14:55 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c48945dcsm3188917b3a.54.2026.10.11.16.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:14:54 -0700 (PDT)
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
Subject: [PATCH v11 3/8] iio: osf: add protocol decoding
Date: Mon, 12 Oct 2026 08:13:35 +0900
Message-ID: <20261011231340.42885-4-kimjinseob88@gmail.com>
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

Add helpers for decoding Open Sensor Fusion frame headers and supported
message payloads.

Validate the fixed OSF0 envelope, payload bounds and CRC before exposing
decoded frame contents. Require exact known payload lengths and decode
capability entries structurally so the core can apply support policy.
Tolerate reserved padding as required by the fixed protocol contract.

Use explicit little-endian wire storage sizes and designated
initializers for decoded output structures.

Assisted-by: LLM
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS                               |   1 +
 drivers/iio/sensorhubs/osf/osf_protocol.c | 215 ++++++++++++++++++++++
 drivers/iio/sensorhubs/osf/osf_protocol.h |  99 ++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 drivers/iio/sensorhubs/osf/osf_protocol.c
 create mode 100644 drivers/iio/sensorhubs/osf/osf_protocol.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 86a3e5de2f01f7a1e9791724caa6e19df4e61d70..663e4e46ec0a45a4627bb08db0e6710ee3c1c70a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20542,6 +20542,7 @@ M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 F:	Documentation/iio/open-sensor-fusion.rst
+F:	drivers/iio/sensorhubs/osf/
 K:	opensensorfusion
 
 OPENCOMPUTE PTP CLOCK DRIVER
diff --git a/drivers/iio/sensorhubs/osf/osf_protocol.c b/drivers/iio/sensorhubs/osf/osf_protocol.c
new file mode 100644
index 0000000000000000000000000000000000000000..0e3f9cc708a45940a0b441e86ef9791ae916ea7d
--- /dev/null
+++ b/drivers/iio/sensorhubs/osf/osf_protocol.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/crc32.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "osf_protocol.h"
+
+#define OSF_CRC32_INIT		GENMASK(31, 0)
+#define OSF_CRC32_XOROUT	GENMASK(31, 0)
+
+static bool osf_sensor_type_valid(u16 sensor_type)
+{
+	return sensor_type >= OSF_SENSOR_ACCELEROMETER &&
+	       sensor_type <= OSF_SENSOR_PROXIMITY;
+}
+
+static u32 osf_crc32_ieee(const u8 *buf, size_t len)
+{
+	return crc32_le(OSF_CRC32_INIT, buf, len) ^ OSF_CRC32_XOROUT;
+}
+
+int osf_protocol_decode_frame(const u8 *buf, size_t len,
+			      struct osf_frame *frame, size_t *frame_len)
+{
+	u32 expected_crc;
+	u32 actual_crc;
+	u32 payload_len;
+	size_t total_len;
+
+	if (!buf || !frame || !frame_len)
+		return -EINVAL;
+
+	if (len < OSF_FRAME_MIN_LEN)
+		return -EMSGSIZE;
+
+	if (get_unaligned_le32(buf) != OSF_FRAME_MAGIC)
+		return -EPROTO;
+
+	if (get_unaligned_le16(buf + 6) != OSF_FRAME_HEADER_LEN)
+		return -EPROTO;
+
+	payload_len = get_unaligned_le32(buf + 10);
+	if (payload_len > len - OSF_FRAME_MIN_LEN)
+		return -EMSGSIZE;
+
+	total_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
+	expected_crc = osf_crc32_ieee(buf, OSF_FRAME_HEADER_LEN + payload_len);
+	actual_crc = get_unaligned_le32(buf + OSF_FRAME_HEADER_LEN + payload_len);
+
+	if (actual_crc != expected_crc)
+		return -EBADMSG;
+
+	*frame = (struct osf_frame) {
+		.protocol_major = buf[4],
+		.protocol_minor = buf[5],
+		.message_type = get_unaligned_le16(buf + 8),
+		.payload_len = payload_len,
+		.sequence = get_unaligned_le64(buf + 14),
+		.timestamp_us = get_unaligned_le64(buf + 22),
+		.flags = get_unaligned_le32(buf + 30),
+		.payload = buf + OSF_FRAME_HEADER_LEN,
+		.crc = actual_crc,
+	};
+	*frame_len = total_len;
+
+	return 0;
+}
+
+int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
+				      struct osf_sensor_sample *sample)
+{
+	u16 channel_count;
+	u16 sample_format;
+	u16 sensor_type;
+	size_t expected_len;
+	const u8 *payload;
+
+	if (!frame || !sample || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_SENSOR_SAMPLE)
+		return -EPROTO;
+
+	if (frame->payload_len < OSF_SENSOR_SAMPLE_BASE_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	sensor_type = get_unaligned_le16(payload);
+	channel_count = get_unaligned_le16(payload + 4);
+	sample_format = get_unaligned_le16(payload + 6);
+
+	if (!osf_sensor_type_valid(sensor_type))
+		return -EPROTO;
+
+	if (!channel_count)
+		return -EPROTO;
+
+	if (sample_format != OSF_SAMPLE_FORMAT_S32)
+		return -EPROTO;
+
+	expected_len = OSF_SENSOR_SAMPLE_BASE_LEN + channel_count * sizeof(__le32);
+	if (frame->payload_len != expected_len)
+		return -EMSGSIZE;
+
+	*sample = (struct osf_sensor_sample) {
+		.sensor_type = sensor_type,
+		.sensor_index = get_unaligned_le16(payload + 2),
+		.channel_count = channel_count,
+		.sample_format = sample_format,
+		.scale_nano = get_unaligned_le32(payload + 8),
+		.samples = payload + OSF_SENSOR_SAMPLE_BASE_LEN,
+	};
+
+	return 0;
+}
+
+int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
+				     u16 index, s32 *value)
+{
+	if (!sample || !sample->samples || !value)
+		return -EINVAL;
+
+	if (index >= sample->channel_count)
+		return -ERANGE;
+
+	/* Samples are little-endian two's-complement signed values. */
+	*value = get_unaligned_le32(sample->samples + index * sizeof(__le32));
+
+	return 0;
+}
+
+int osf_protocol_decode_device_status(const struct osf_frame *frame,
+				      struct osf_device_status *status)
+{
+	const u8 *payload;
+
+	if (!frame || !status || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_DEVICE_STATUS)
+		return -EPROTO;
+
+	if (frame->payload_len != OSF_DEVICE_STATUS_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	*status = (struct osf_device_status) {
+		.uptime_s = get_unaligned_le32(payload),
+		.status_flags = get_unaligned_le32(payload + 4),
+		.error_flags = get_unaligned_le32(payload + 8),
+		.dropped_frames = get_unaligned_le32(payload + 12),
+	};
+
+	return 0;
+}
+
+int osf_protocol_decode_capability_report(const struct osf_frame *frame,
+					  struct osf_capability_report *report)
+{
+	u16 capability_count;
+	size_t expected_len;
+	const u8 *payload;
+
+	if (!frame || !report || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_CAPABILITY_REPORT)
+		return -EPROTO;
+
+	if (frame->payload_len < OSF_CAP_REPORT_BASE_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	capability_count = get_unaligned_le16(payload);
+
+	expected_len = OSF_CAP_REPORT_BASE_LEN +
+		       capability_count * OSF_CAP_SENSOR_ENTRY_LEN;
+	if (frame->payload_len != expected_len)
+		return -EMSGSIZE;
+
+	*report = (struct osf_capability_report) {
+		.capability_count = capability_count,
+		.entries = payload + OSF_CAP_REPORT_BASE_LEN,
+	};
+
+	return 0;
+}
+
+int osf_protocol_decode_capability_entry(const struct osf_capability_report
+					 *report, u16 index,
+					 struct osf_capability_entry *entry)
+{
+	const u8 *payload;
+
+	if (!report || !report->entries || !entry)
+		return -EINVAL;
+
+	if (index >= report->capability_count)
+		return -ERANGE;
+
+	payload = report->entries + index * OSF_CAP_SENSOR_ENTRY_LEN;
+	*entry = (struct osf_capability_entry) {
+		.sensor_type = get_unaligned_le16(payload),
+		.sensor_index = get_unaligned_le16(payload + 2),
+		.channel_count = get_unaligned_le16(payload + 4),
+		.sample_format = get_unaligned_le16(payload + 6),
+		.scale_nano = get_unaligned_le32(payload + 8),
+		.flags = get_unaligned_le32(payload + 12),
+	};
+
+	return 0;
+}
diff --git a/drivers/iio/sensorhubs/osf/osf_protocol.h b/drivers/iio/sensorhubs/osf/osf_protocol.h
new file mode 100644
index 0000000000000000000000000000000000000000..a79151e106f9e826fbe23eaf306f1df76a7dee4f
--- /dev/null
+++ b/drivers/iio/sensorhubs/osf/osf_protocol.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _OSF_PROTOCOL_H
+#define _OSF_PROTOCOL_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+#define OSF_PROTOCOL_MAJOR		0
+#define OSF_PROTOCOL_MINOR		0
+#define OSF_FRAME_HEADER_LEN		38
+#define OSF_FRAME_CRC_LEN		4
+#define OSF_FRAME_MIN_LEN		(OSF_FRAME_HEADER_LEN + OSF_FRAME_CRC_LEN)
+#define OSF_FRAME_MAGIC			0x3046534f /* "OSF0", little-endian */
+
+#define OSF_SENSOR_SAMPLE_BASE_LEN	16
+#define OSF_DEVICE_STATUS_LEN		20
+#define OSF_CAP_REPORT_BASE_LEN		4
+#define OSF_CAP_SENSOR_ENTRY_LEN		20
+#define OSF_CAPABILITY_FLAGS_MASK	GENMASK(1, 0)
+
+enum osf_message_type {
+	OSF_MSG_SENSOR_SAMPLE		= 0x0001,
+	OSF_MSG_DEVICE_STATUS		= 0x0002,
+	OSF_MSG_CAPABILITY_REPORT	= 0x0003,
+};
+
+enum osf_sensor_type {
+	OSF_SENSOR_ACCELEROMETER		= 0x0001,
+	OSF_SENSOR_GYROSCOPE		= 0x0002,
+	OSF_SENSOR_MAGNETOMETER		= 0x0003,
+	OSF_SENSOR_BAROMETER		= 0x0004,
+	OSF_SENSOR_TEMPERATURE		= 0x0005,
+	OSF_SENSOR_HUMIDITY		= 0x0006,
+	OSF_SENSOR_AMBIENT_LIGHT		= 0x0007,
+	OSF_SENSOR_PROXIMITY		= 0x0008,
+};
+
+enum osf_sample_format {
+	OSF_SAMPLE_FORMAT_S32		= 0x0001,
+};
+
+struct osf_frame {
+	u8 protocol_major;
+	u8 protocol_minor;
+	u16 message_type;
+	u32 payload_len;
+	u64 sequence;
+	u64 timestamp_us;
+	u32 flags;
+	/* payload points into the caller-owned frame buffer. */
+	const u8 *payload;
+	u32 crc;
+};
+
+struct osf_sensor_sample {
+	u16 sensor_type;
+	u16 sensor_index;
+	u16 channel_count;
+	u16 sample_format;
+	u32 scale_nano;
+	const u8 *samples;
+};
+
+struct osf_device_status {
+	u32 uptime_s;
+	u32 status_flags;
+	u32 error_flags;
+	u32 dropped_frames;
+};
+
+struct osf_capability_report {
+	u16 capability_count;
+	const u8 *entries;
+};
+
+struct osf_capability_entry {
+	u16 sensor_type;
+	u16 sensor_index;
+	u16 channel_count;
+	u16 sample_format;
+	u32 scale_nano;
+	u32 flags;
+};
+
+int osf_protocol_decode_frame(const u8 *buf, size_t len,
+			      struct osf_frame *frame, size_t *frame_len);
+int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
+				      struct osf_sensor_sample *sample);
+int osf_protocol_decode_device_status(const struct osf_frame *frame,
+				      struct osf_device_status *status);
+int osf_protocol_decode_capability_report(const struct osf_frame *frame,
+					  struct osf_capability_report *report);
+int osf_protocol_decode_capability_entry(const struct osf_capability_report
+					 *report, u16 index,
+					 struct osf_capability_entry *entry);
+int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
+				     u16 index, s32 *value);
+
+#endif
