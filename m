Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC62FDC5E
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 01:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388779; cv=none; b=rAaUoNAmHbEo5hGPu3nz0s7fwfFnWBePFpEBQw/wPoaDkk/3wZJr005ZSQ3/NgDd/cTV7gtxCtDGISeyd070TtUTZHF7G42jcFYmTYWxkdMZ2gpvRSLPLkh/AUbMU5d+RhDYHF4Kv9V6rfTkro1vrry7wB1k5eObT6+SSftbd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388779; c=relaxed/simple;
	bh=9hTmZRWJeKGMd3vBe0CyLd+Qs2L/Gy779zvWqmh+sYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JN5gfzm95ahq0YwlMlINuj20JB6XXu5c+mQAxVqgK3ulzaX08BOMMKQg1sLJjegPo9/K1gMd09mRqQAtdqYWy2NAidsvYAK52BDcd9qKODdpXc1KqCuvqQx1wuCoLKK4RfGMwD7D/a5m43aJHF3qDitU8bfcbfKCftkvyGNjsg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9Kb8L7X; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9Kb8L7X"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8478fe07f65so3704507b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 18:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783388777; x=1783993577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMWWPchMmMcQoCvolwY8cIAK7jrID7lRZ9HxFMGcCz4=;
        b=r9Kb8L7X9nvKR7Sn9J9Rqtw1TwZlMo2nthQq0B0gE2oP6vH4H3NUcdRvsEQhBrZXF5
         A3FYEkkJ9/mD0AXTZES4Db4Bbwbu/OyvBdMeR5DZaol2cvVtfZfitlQ7+MusxzKGezE3
         tnfOF11vy4U3LEsn2WNZwAQDJQ0TwIjLRCIT/EZcQLQHfLVvSSazYOzOsoxjwJFdZ7yQ
         SaE/XMgvFeyph/sRSZoc9mqvWn3+jVL9cBDvgXFWWZYDDGg3tEsYXxeckVt+L3HUycBv
         Qby6yqwnZDYQ9tTDMjN6o4pfWkfyn2Qqf6a+LSkFq3jb4goiNv+NBQMCJBNO8FsoSb3g
         9OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783388777; x=1783993577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMWWPchMmMcQoCvolwY8cIAK7jrID7lRZ9HxFMGcCz4=;
        b=fKjUcxYJ+/rZ5+jqDus6yAic4s/NaIFw6cXjwI1kCEKESsIbQ3AFPpUatA/tul8rOQ
         FaahbwHHF7nU24mZJXq8ARX840rExWNav0yK/onmA5jVYIBzH7xgdsj4HnvWh4lsQBiu
         c3CnWs7SDiXDDlSsBSdWYoukT1YV1YniPMX/76hpFzIjze9y53VZMoQXgwvjm7M1STaC
         V1IyIFnFa8mLY+vEEBa0pfypsV7Y/i/eK6iiECVB1Ri4BgkKcImP5LPBo8LkrqQtNT/5
         BollZC4ACO6zrQfTg7FN9xqw8BDitT4XQsCT2XzHsoLbuMJWFAD+tqQ8Sk+RWTNAjBfR
         NHog==
X-Forwarded-Encrypted: i=1; AHgh+RqxgZZ6QA43KsFGb9MtsamlElHBp8fwcWK534Pso1F12v7bO1U8lFrXCd3RZCVZItzyOn/g1uZB9KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzFab+dnEtOCzdrCiZdbxEBDj2/y5sZVOgqBvFwz3OwbpZK9Tu
	V13VjtgiIZ4F5CcPmphutVC3YyZ/nuXunj4VYZvslUXDeDkSVbVl9V9B
X-Gm-Gg: AfdE7cn4m+ZWAbFpOmI+B7n5CefXNKsBupeZuhFx1mQM5SGdFlySFLZPNg6MOcs0HoQ
	fNK6jkrrW49lOZw0Td+cW+XlGfzThfH5P671kVLQW+T8yjbwaGnsj87svKxFp+ZSffvdD6QiXeh
	y5S7Q4Su6g18SZ/WkDJ87X2KXWy613KR3jjJ3zCcCDx9Fa0O8rci72snAu3neW1hKHLeqdxooqU
	qeujb/g1G1UZpJ67audEsg8vLEv8Gank0KIsgEz4q3AcSv5lvg1KTRkSDt/6gP4BBxM2oqniADP
	iEoeC1GiZnS9dudNiBNfewoidhNfKjVp33fLNu4f6yFLY09U6TqH43U42jTILhGmpRkkggk9oZx
	/YP79QUzPcZ5HkgjUkNe3e3XhElGUCHRrJpjZIKVDgaLuqSB/suCUuMdXUy3/fNVnysN5ZO7atG
	7xsA97wFodABgbboKQKT2yfJi2e5eU9FSlZLZYzB1M1O1llq8eQ4zNQTVJimdBPk8Z6XckpF9/3
	KWcV1y+V7LIU+60G2rC+h9bu/4pebl3IztWOjw=
X-Received: by 2002:a05:6a00:1c91:b0:846:f502:4cd5 with SMTP id d2e1a72fcca58-84826c2f31fmr3057718b3a.20.1783388776635;
        Mon, 06 Jul 2026 18:46:16 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm4645653b3a.28.2026.07.06.18.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:46:16 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/5] iio: osf: add authenticated stream parser
Date: Tue,  7 Jul 2026 10:45:24 +0900
Message-ID: <20260707014525.1015-5-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707014525.1015-1-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a UART byte-stream parser for Open Sensor Fusion frames.

The parser searches for the OSF0 wire magic, keeps partial frames
buffered, checks header length and payload bounds, and passes complete
candidate frames to the core decoder.

Rejected candidate frames drop only the current head byte before
resynchronizing, so a corrupted unauthenticated payload length cannot
make the parser skip later valid frames.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS                               |   1 +
 drivers/iio/opensensorfusion/osf_stream.c | 189 ++++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_stream.h |  30 ++++
 3 files changed, 220 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 32d3e7674..3d4199d9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20017,6 +20017,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 F:	Documentation/iio/open-sensor-fusion.rst
 F:	drivers/iio/opensensorfusion/osf_protocol.*
+F:	drivers/iio/opensensorfusion/osf_stream.*
 K:	opensensorfusion
 
 OPENCOMPUTE PTP CLOCK DRIVER
diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/opensensorfusion/osf_stream.c
new file mode 100644
index 000000000..fb27c0615
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_stream.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "osf_core.h"
+#include "osf_protocol.h"
+#include "osf_stream.h"
+
+#define OSF_STREAM_MAGIC_LEN	sizeof(__le32)
+#define OSF_STREAM_MAX_PAYLOAD_LEN				\
+	(OSF_STREAM_MAX_FRAME_LEN - OSF_FRAME_HEADER_LEN - OSF_FRAME_CRC_LEN)
+
+static void osf_stream_discard(struct osf_stream *stream, size_t count)
+{
+	if (count >= stream->len) {
+		stream->len = 0;
+		return;
+	}
+
+	memmove(stream->buf, stream->buf + count, stream->len - count);
+	stream->len -= count;
+}
+
+static void osf_stream_drop_invalid_head(struct osf_stream *stream)
+{
+	osf_stream_discard(stream, 1);
+}
+
+static bool osf_stream_frame_prefix_match(const u8 *buf, size_t len)
+{
+	for (size_t i = 0; i < len; i++) {
+		if (buf[i] != (u8)(OSF_FRAME_MAGIC >> (i * 8)))
+			return false;
+	}
+
+	return true;
+}
+
+static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
+{
+	size_t old_len = stream->len;
+	size_t match_len;
+
+	for (size_t i = 0; i < stream->len; i++) {
+		match_len = stream->len - i;
+		if (match_len > OSF_STREAM_MAGIC_LEN)
+			match_len = OSF_STREAM_MAGIC_LEN;
+
+		if (osf_stream_frame_prefix_match(stream->buf + i, match_len)) {
+			if (i)
+				osf_stream_discard(stream, i);
+			return i;
+		}
+	}
+
+	stream->len = 0;
+	return old_len;
+}
+
+static int osf_stream_process(struct osf_stream *stream)
+{
+	size_t discarded;
+	size_t frame_len;
+	u32 payload_len;
+	int first_err = 0;
+	int ret;
+
+	while (stream->len) {
+		discarded = osf_stream_discard_to_magic(stream);
+		if (discarded) {
+			stream->stats.bad_magic_resyncs++;
+			stream->stats.dropped_bytes += discarded;
+			if (!first_err)
+				first_err = -EPROTO;
+		}
+
+		if (!stream->len)
+			break;
+
+		if (stream->len < OSF_FRAME_HEADER_LEN)
+			break;
+
+		if (get_unaligned_le16(stream->buf + 6) != OSF_FRAME_HEADER_LEN) {
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
+			if (!first_err)
+				first_err = -EPROTO;
+			continue;
+		}
+
+		payload_len = get_unaligned_le32(stream->buf + 10);
+		if (payload_len > OSF_STREAM_MAX_PAYLOAD_LEN) {
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
+			if (!first_err)
+				first_err = -EMSGSIZE;
+			continue;
+		}
+
+		frame_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
+		if (stream->len < frame_len)
+			break;
+
+		ret = osf_core_receive_frame(stream->osf, stream->buf, frame_len);
+		if (ret) {
+			if (ret == -EBADMSG)
+				stream->stats.bad_crc_frames++;
+
+			/*
+			 * Decoding failed before the frame was authenticated;
+			 * payload_len is still untrusted. Drop only the current
+			 * head and resynchronize.
+			 */
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
+			if (!first_err)
+				first_err = ret;
+			continue;
+		}
+
+		stream->stats.valid_frames++;
+		osf_stream_discard(stream, frame_len);
+	}
+
+	return first_err;
+}
+
+void osf_stream_init(struct osf_stream *stream, struct osf_device *osf)
+{
+	if (!stream)
+		return;
+
+	stream->osf = osf;
+	stream->len = 0;
+	memset(&stream->stats, 0, sizeof(stream->stats));
+}
+
+void osf_stream_reset(struct osf_stream *stream)
+{
+	if (stream) {
+		stream->len = 0;
+		memset(&stream->stats, 0, sizeof(stream->stats));
+	}
+}
+
+int osf_stream_receive_bytes(struct osf_stream *stream, const u8 *buf,
+			     size_t len)
+{
+	size_t copy_len;
+	size_t space;
+	int first_err = 0;
+	int ret;
+
+	if (!stream || !stream->osf || (!buf && len))
+		return -EINVAL;
+
+	if (!len) {
+		ret = osf_stream_process(stream);
+		if (ret && !first_err)
+			first_err = ret;
+		return first_err;
+	}
+
+	while (len) {
+		space = OSF_STREAM_MAX_FRAME_LEN - stream->len;
+		if (!space) {
+			stream->stats.dropped_bytes++;
+			osf_stream_discard(stream, 1);
+			if (!first_err)
+				first_err = -EMSGSIZE;
+			continue;
+		}
+
+		copy_len = len < space ? len : space;
+		memcpy(stream->buf + stream->len, buf, copy_len);
+		stream->len += copy_len;
+		buf += copy_len;
+		len -= copy_len;
+
+		ret = osf_stream_process(stream);
+		if (ret && !first_err)
+			first_err = ret;
+	}
+
+	return first_err;
+}
diff --git a/drivers/iio/opensensorfusion/osf_stream.h b/drivers/iio/opensensorfusion/osf_stream.h
new file mode 100644
index 000000000..c1761b6e6
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_stream.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _OSF_STREAM_H
+#define _OSF_STREAM_H
+
+#include <linux/types.h>
+
+#define OSF_STREAM_MAX_FRAME_LEN	4096
+
+struct osf_device;
+
+struct osf_stream_stats {
+	u64 valid_frames;
+	u64 bad_magic_resyncs;
+	u64 bad_crc_frames;
+	u64 dropped_bytes;
+};
+
+struct osf_stream {
+	struct osf_device *osf;
+	u8 buf[OSF_STREAM_MAX_FRAME_LEN];
+	size_t len;
+	struct osf_stream_stats stats;
+};
+
+void osf_stream_init(struct osf_stream *stream, struct osf_device *osf);
+void osf_stream_reset(struct osf_stream *stream);
+int osf_stream_receive_bytes(struct osf_stream *stream, const u8 *buf,
+			     size_t len);
+
+#endif
-- 
2.43.0

