Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E6A3822B1
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 06:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772518435; cv=none; b=ljnmn+EprDcMCl6yBr0naS1xnPUS/Xfgqb2CsUewpAlL+wyFJyvoDNU8cQnY5EMoTLzSA7UbwZFjNheN1HLNB4X1vdABODyjJ1tGPdru2wEWHYZQN1kqTh15YLoLrTJBWKUVgomcIvNW5THHY97WCBlgt6x7I32O8JKf4ruxEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772518435; c=relaxed/simple;
	bh=0g1QWhz6+O5/l4VAgRjYr0puTKmj3ArJ8Y9hJXu55P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHYa2j0DGyf5FG2abjFjgOvFqN5JUxtgnV6BbUDJOVHoBwQvQwTiDzxAYHhUAkcDhKYI2FUdO9xXE7QglaXgO8QdCjwenfKWOyRlJS7s9gTBMxL9Nz6yJ+PzP9oZWjQBnfcDk4mLuFNGwpvD2gs8bjV/ag6UdqM7oO2NR7CLLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fQc9FI/q; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fQc9FI/q"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab232cc803so25237485ad.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 22:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772518431; x=1773123231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGp9P+3go41oALz0pMzSRlLuZvq3NDQcuPYrLYr8Lw4=;
        b=fQc9FI/qg9JiU2kWDLyC74bseHi46wYpBL14liOwg7iTpj9vttOHVFyuI/o+Cgom2o
         EmS4mSHHvnb0k3UdmrT+B5vzlcnFEs8s1gxXmCpEC5O/heGYqrmUJkdBvZ1ARWyuNjHE
         ItB+kyA8FomVyPqHRo+pALiRntSAuZcn3+SSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772518431; x=1773123231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PGp9P+3go41oALz0pMzSRlLuZvq3NDQcuPYrLYr8Lw4=;
        b=UK+mYUh4whXJkSKv25CRH5GAhftF60aEx4lZ8UsU0I3bqDP7uY2Zwz8ukCzocQ/7p3
         XUy4RujjKob6gpZd+Se0eNXlA4lR2d1a2IAgNvO0ZphO/51GtwDg72hJfCWq5MfAqb/V
         1DnwOygxxJi7+T5XvJH63v5KRyiSCW6S5dwQb4lKN+MljYKnqbjpQPApxEcJuucC2TBL
         CLgpOuIH6UEAFglNeTEETjvS0LQUFCAal50kGClfzppUoSb1StFjEk2oCT0LDe2hD8kA
         TV5zVPcAia6parwOkmVQKlNRf9dAOXuJsZSlFS3uvIGuQ5zP0128u20hB/6+sFz2vkpt
         uw7A==
X-Forwarded-Encrypted: i=1; AJvYcCUGRswTrkE4lF0a3e8Ag0x94dERLI2n4wuuda9VWKEn1oqpaqZ3CTw4qHMVrIY1hLDfvVM9CKE6hhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQ6HCS+ruI4V3OYcPcTzshi65Bx9Er0tpVHMjNzrWdoh+HXwd
	y1uNGhg+D+GKuIYXpJ8DrSg7EorsMSbR2J1j1SoEtYsXoxUAs59YCFs23C7GEd3/Gw==
X-Gm-Gg: ATEYQzw2OsDryUco6/z4llSbQf7eqmGtUpM8QIgt173qpf/f+WXApCFCIAWZ8iqT9iP
	/s/rMUvZIxMCyvWqvZmI6n8SczGkOQePvq6eeoJnja1IE5as87VMxUkjCYx6+rhXDI2yViyVBXE
	QeY+avQIYbsza4j5boOn8rMfFom66Q/IHHBQl3XHXDy/I+y5oNg4hPs7pLEccrNpEXHl/vbMjLv
	t9WvLqlJzMeVpq1/AP2IWrpf4d5C0u334GIvGL/7iPRngZKhHh1QF0YA/hdugjfKAx0e9CLKKE7
	BLm0OTIeTVqBFiNuUS/8uA0MexSxEslfzbXS5giLvxdvpqB96o754I8DAniTDhO1ruxaPI2Y2zO
	xk8gxICtjR4K3xbdbHI11wnK7eBR0dyrvvdv3tR/8ZtVvKQ6x5xCrlr/Q/0oHL2PF6qCNXHR+j7
	AUwO85BlEvqScxKyfdiHT6LDnx62zZJm/sA3Nqz4MYllOHdncUXDtRhJSgcgH38q1E7tpKrfx6J
	KQEsxZNOH1aIwsJ3RdPH/3AUY7xMEo/Cw==
X-Received: by 2002:a17:903:1a0d:b0:2ae:5b3f:a751 with SMTP id d9443c01a7336-2ae5b3faa62mr32971725ad.45.1772518430878;
        Mon, 02 Mar 2026 22:13:50 -0800 (PST)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6fe4f3sm152639735ad.91.2026.03.02.22.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 22:13:49 -0800 (PST)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 03 Mar 2026 06:12:58 +0000
Subject: [PATCH 06/12] HID: spi_hid: add spi_hid traces
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-send-upstream-v1-6-1515ba218f3d@chromium.org>
References: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
In-Reply-To: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, Jingyuan Liang <jingyliang@chromium.org>, 
 Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772518424; l=11596;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=0g1QWhz6+O5/l4VAgRjYr0puTKmj3ArJ8Y9hJXu55P4=;
 b=aaYml8IyRBxlBFUMYwPYesuynyGMClXYcXM4fD66yuuDrQQYNh/I3Cix0L9E0/yoB+0Xgy8Zu
 vEtA+HCHwXHCQvBBR4iXNLogdRr2+TyCTvQ8NiCDnt04VBi66qSQe8G
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

Add traces for purposed of debugging spi_hid driver.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Angela Czubak <acz@semihalf.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/spi-hid/spi-hid-core.c |  71 -----------------
 drivers/hid/spi-hid/spi-hid-core.h |  83 ++++++++++++++++++++
 include/trace/events/spi_hid.h     | 156 +++++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+), 71 deletions(-)

diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/spi-hid-core.c
index 08865d42555f..e3273846267e 100644
--- a/drivers/hid/spi-hid/spi-hid-core.c
+++ b/drivers/hid/spi-hid/spi-hid-core.c
@@ -81,13 +81,6 @@
 #define SPI_HID_CREATE_DEVICE	4
 #define SPI_HID_ERROR	5
 
-/* Raw input buffer with data from the bus */
-struct spi_hid_input_buf {
-	u8 header[HIDSPI_INPUT_HEADER_SIZE];
-	u8 body[HIDSPI_INPUT_BODY_HEADER_SIZE];
-	u8 content[];
-};
-
 /* Processed data from input report header */
 struct spi_hid_input_header {
 	u8 version;
@@ -104,12 +97,6 @@ struct spi_hid_input_report {
 	u8 *content;
 };
 
-/* Raw output report buffer to be put on the bus */
-struct spi_hid_output_buf {
-	u8 header[SPI_HID_OUTPUT_HEADER_LEN];
-	u8 content[];
-};
-
 /* Data necessary to send an output report */
 struct spi_hid_output_report {
 	u8 report_type;
@@ -118,19 +105,6 @@ struct spi_hid_output_report {
 	u8 *content;
 };
 
-/* Processed data from a device descriptor */
-struct spi_hid_device_descriptor {
-	u16 hid_version;
-	u16 report_descriptor_length;
-	u16 max_input_length;
-	u16 max_output_length;
-	u16 max_fragment_length;
-	u16 vendor_id;
-	u16 product_id;
-	u16 version_id;
-	u8 no_output_report_ack;
-};
-
 /* struct spi_hid_conf - Conf provided to the core */
 struct spi_hid_conf {
 	u32 input_report_header_address;
@@ -155,51 +129,6 @@ struct spihid_ops {
 	void (*sleep_minimal_reset_delay)(struct spihid_ops *ops);
 };
 
-/* Driver context */
-struct spi_hid {
-	struct spi_device	*spi;	/* spi device. */
-	struct hid_device	*hid;	/* pointer to corresponding HID dev. */
-
-	struct spi_transfer	input_transfer[2];	/* Transfer buffer for read and write. */
-	struct spi_message	input_message;	/* used to execute a sequence of spi transfers. */
-
-	struct spihid_ops	*ops;
-	struct spi_hid_conf	*conf;
-
-	struct spi_hid_device_descriptor desc;	/* HID device descriptor. */
-	struct spi_hid_output_buf *output;	/* Output buffer. */
-	struct spi_hid_input_buf *input;	/* Input buffer. */
-	struct spi_hid_input_buf *response;	/* Response buffer. */
-
-	u16 response_length;
-	u16 bufsize;
-
-	enum hidspi_power_state power_state;
-
-	u8 reset_attempts;	/* The number of reset attempts. */
-
-	unsigned long flags;	/* device flags. */
-
-	struct work_struct reset_work;
-
-	/* Control lock to make sure one output transaction at a time. */
-	struct mutex output_lock;
-	/* Power lock to make sure one power state change at a time. */
-	struct mutex power_lock;
-	struct completion output_done;
-
-	u8 read_approval_header[SPI_HID_READ_APPROVAL_LEN];
-	u8 read_approval_body[SPI_HID_READ_APPROVAL_LEN];
-
-	u32 report_descriptor_crc32;	/* HID report descriptor crc32 checksum. */
-
-	u32 regulator_error_count;
-	int regulator_last_error;
-	u32 bus_error_count;
-	int bus_last_error;
-	u32 dir_count;	/* device initiated reset count. */
-};
-
 static struct hid_ll_driver spi_hid_ll_driver;
 
 static void spi_hid_populate_read_approvals(const struct spi_hid_conf *conf,
diff --git a/drivers/hid/spi-hid/spi-hid-core.h b/drivers/hid/spi-hid/spi-hid-core.h
new file mode 100644
index 000000000000..2bfdfbe6d7fc
--- /dev/null
+++ b/drivers/hid/spi-hid/spi-hid-core.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Microsoft Corporation
+ * Copyright (c) 2026 Google LLC
+ */
+
+#include <linux/hid-over-spi.h>
+#include <linux/spi/spi.h>
+
+/* Protocol message size constants */
+#define SPI_HID_READ_APPROVAL_LEN		5
+#define SPI_HID_OUTPUT_HEADER_LEN		8
+
+/* Raw input buffer with data from the bus */
+struct spi_hid_input_buf {
+	u8 header[HIDSPI_INPUT_HEADER_SIZE];
+	u8 body[HIDSPI_INPUT_BODY_HEADER_SIZE];
+	u8 content[];
+};
+
+/* Raw output report buffer to be put on the bus */
+struct spi_hid_output_buf {
+	u8 header[SPI_HID_OUTPUT_HEADER_LEN];
+	u8 content[];
+};
+
+/* Processed data from a device descriptor */
+struct spi_hid_device_descriptor {
+	u16 hid_version;
+	u16 report_descriptor_length;
+	u16 max_input_length;
+	u16 max_output_length;
+	u16 max_fragment_length;
+	u16 vendor_id;
+	u16 product_id;
+	u16 version_id;
+	u8 no_output_report_ack;
+};
+
+/* Driver context */
+struct spi_hid {
+	struct spi_device	*spi;	/* spi device. */
+	struct hid_device	*hid;	/* pointer to corresponding HID dev. */
+
+	struct spi_transfer	input_transfer[2];	/* Transfer buffer for read and write. */
+	struct spi_message	input_message;	/* used to execute a sequence of spi transfers. */
+
+	struct spihid_ops	*ops;
+	struct spi_hid_conf	*conf;
+
+	struct spi_hid_device_descriptor desc;	/* HID device descriptor. */
+	struct spi_hid_output_buf *output;	/* Output buffer. */
+	struct spi_hid_input_buf *input;	/* Input buffer. */
+	struct spi_hid_input_buf *response;	/* Response buffer. */
+
+	u16 response_length;
+	u16 bufsize;
+
+	enum hidspi_power_state power_state;
+
+	u8 reset_attempts;	/* The number of reset attempts. */
+
+	unsigned long flags;	/* device flags. */
+
+	struct work_struct reset_work;
+
+	/* Control lock to make sure one output transaction at a time. */
+	struct mutex output_lock;
+	/* Power lock to make sure one power state change at a time. */
+	struct mutex power_lock;
+	struct completion output_done;
+
+	u8 read_approval_header[SPI_HID_READ_APPROVAL_LEN];
+	u8 read_approval_body[SPI_HID_READ_APPROVAL_LEN];
+
+	u32 report_descriptor_crc32;	/* HID report descriptor crc32 checksum. */
+
+	u32 regulator_error_count;
+	int regulator_last_error;
+	u32 bus_error_count;
+	int bus_last_error;
+	u32 dir_count;		/* device initiated reset count. */
+};
diff --git a/include/trace/events/spi_hid.h b/include/trace/events/spi_hid.h
new file mode 100644
index 000000000000..e9a579b3806c
--- /dev/null
+++ b/include/trace/events/spi_hid.h
@@ -0,0 +1,156 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Microsoft Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM spi_hid
+
+#if !defined(_SPI_HID_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _SPI_HID_TRACE_H
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(spi_hid_transfer,
+	TP_PROTO(struct spi_hid *shid, const void *tx_buf, int tx_len,
+		 const void *rx_buf, u16 rx_len, int ret),
+
+	TP_ARGS(shid, tx_buf, tx_len, rx_buf, rx_len, ret),
+
+	TP_STRUCT__entry(
+		__field(int, bus_num)
+		__field(int, chip_select)
+		__field(int, ret)
+		__dynamic_array(u8, rx_buf, rx_len)
+		__dynamic_array(u8, tx_buf, tx_len)
+	),
+
+	TP_fast_assign(
+		__entry->bus_num = shid->spi->controller->bus_num;
+		__entry->chip_select = shid->spi->chip_select;
+		__entry->ret = ret;
+
+		memcpy(__get_dynamic_array(tx_buf), tx_buf, tx_len);
+		memcpy(__get_dynamic_array(rx_buf), rx_buf, rx_len);
+	),
+
+	TP_printk("spi%d.%d: len=%d tx=[%*phD] rx=[%*phD] --> %d",
+		  __entry->bus_num, __entry->chip_select,
+		  __get_dynamic_array_len(tx_buf) + __get_dynamic_array_len(rx_buf),
+		  __get_dynamic_array_len(tx_buf), __get_dynamic_array(tx_buf),
+		  __get_dynamic_array_len(rx_buf), __get_dynamic_array(rx_buf),
+		  __entry->ret)
+);
+
+DEFINE_EVENT(spi_hid_transfer, spi_hid_input_sync,
+	     TP_PROTO(struct spi_hid *shid, const void *tx_buf, int tx_len,
+		      const void *rx_buf, u16 rx_len, int ret),
+	     TP_ARGS(shid, tx_buf, tx_len, rx_buf, rx_len, ret));
+
+DEFINE_EVENT(spi_hid_transfer, spi_hid_input_header_complete,
+	     TP_PROTO(struct spi_hid *shid, const void *tx_buf, int tx_len,
+		      const void *rx_buf, u16 rx_len, int ret),
+	     TP_ARGS(shid, tx_buf, tx_len, rx_buf, rx_len, ret));
+
+DEFINE_EVENT(spi_hid_transfer, spi_hid_input_body_complete,
+	     TP_PROTO(struct spi_hid *shid, const void *tx_buf, int tx_len,
+		      const void *rx_buf, u16 rx_len, int ret),
+	     TP_ARGS(shid, tx_buf, tx_len, rx_buf, rx_len, ret));
+
+DECLARE_EVENT_CLASS(spi_hid_irq,
+	TP_PROTO(struct spi_hid *shid, int irq),
+
+	TP_ARGS(shid, irq),
+
+	TP_STRUCT__entry(
+		__field(int, bus_num)
+		__field(int, chip_select)
+		__field(int, irq)
+	),
+
+	TP_fast_assign(
+		__entry->bus_num = shid->spi->controller->bus_num;
+		__entry->chip_select = shid->spi->chip_select;
+		__entry->irq = irq;
+	),
+
+	TP_printk("spi%d.%d: IRQ %d",
+		  __entry->bus_num, __entry->chip_select, __entry->irq)
+);
+
+DEFINE_EVENT(spi_hid_irq, spi_hid_dev_irq,
+	     TP_PROTO(struct spi_hid *shid, int irq), TP_ARGS(shid, irq));
+
+DECLARE_EVENT_CLASS(spi_hid,
+	TP_PROTO(struct spi_hid *shid),
+
+	TP_ARGS(shid),
+
+	TP_STRUCT__entry(
+		__field(int, bus_num)
+		__field(int, chip_select)
+		__field(int, power_state)
+		__field(u32, flags)
+
+		__field(int, vendor_id)
+		__field(int, product_id)
+		__field(int, max_input_length)
+		__field(int, max_output_length)
+		__field(u16, hid_version)
+		__field(u16, report_descriptor_length)
+		__field(u16, version_id)
+	),
+
+	TP_fast_assign(
+		__entry->bus_num = shid->spi->controller->bus_num;
+		__entry->chip_select = shid->spi->chip_select;
+		__entry->power_state = shid->power_state;
+		__entry->flags = shid->flags;
+
+		__entry->vendor_id = shid->desc.vendor_id;
+		__entry->product_id = shid->desc.product_id;
+		__entry->max_input_length = shid->desc.max_input_length;
+		__entry->max_output_length = shid->desc.max_output_length;
+		__entry->hid_version = shid->desc.hid_version;
+		__entry->report_descriptor_length =
+					shid->desc.report_descriptor_length;
+		__entry->version_id = shid->desc.version_id;
+	),
+
+	TP_printk("spi%d.%d: (%04x:%04x v%d) HID v%d.%d state p:%d len i:%d o:%d r:%d flags 0x%08x",
+		  __entry->bus_num, __entry->chip_select,
+		  __entry->vendor_id, __entry->product_id, __entry->version_id,
+		  __entry->hid_version >> 8, __entry->hid_version & 0xff,
+		  __entry->power_state,	__entry->max_input_length,
+		  __entry->max_output_length, __entry->report_descriptor_length,
+		  __entry->flags)
+);
+
+DEFINE_EVENT(spi_hid, spi_hid_header_transfer, TP_PROTO(struct spi_hid *shid),
+	     TP_ARGS(shid));
+
+DEFINE_EVENT(spi_hid, spi_hid_process_input_report,
+	     TP_PROTO(struct spi_hid *shid), TP_ARGS(shid));
+
+DEFINE_EVENT(spi_hid, spi_hid_input_report_handler,
+	     TP_PROTO(struct spi_hid *shid), TP_ARGS(shid));
+
+DEFINE_EVENT(spi_hid, spi_hid_reset_response, TP_PROTO(struct spi_hid *shid),
+	     TP_ARGS(shid));
+
+DEFINE_EVENT(spi_hid, spi_hid_create_device, TP_PROTO(struct spi_hid *shid),
+	     TP_ARGS(shid));
+
+DEFINE_EVENT(spi_hid, spi_hid_refresh_device, TP_PROTO(struct spi_hid *shid),
+	     TP_ARGS(shid));
+
+DEFINE_EVENT(spi_hid, spi_hid_response_handler, TP_PROTO(struct spi_hid *shid),
+	     TP_ARGS(shid));
+
+DEFINE_EVENT(spi_hid, spi_hid_error_handler, TP_PROTO(struct spi_hid *shid),
+	     TP_ARGS(shid));
+
+#endif /* _SPI_HID_TRACE_H */
+
+#include <trace/define_trace.h>

-- 
2.53.0.473.g4a7958ca14-goog

