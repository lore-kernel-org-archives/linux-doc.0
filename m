Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246139A07E
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594610; cv=none; b=Gr/c3PK01XUTJWuEdrNkRXlhI4+rdutQV3qMHXf0ClH/XpazxL4KucmAURKob9i4IMBX8EULwzH+BrKFcrRHixVyLZCco67tzobD8HDmUXfKWbo6YsgD9KuyYwxru+85SJVKpcoPoKlUyK8VMRthQnRnfSlMS8J989qOGSLDunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594610; c=relaxed/simple;
	bh=orJKnz8A/ts3XV7xtArDycRggN7piS1Bkvao5j5Tg3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKmpC4Ddz2Ljmj/dgs62mLgRqRJGi6nwFW0KKSKI89unGlMDGwb952rig3dbYEsjERJKKQFxaFTqqU0Re61TN3mLMkXAEx7BH1slAoqAGUzqYI29IPL890LS5StKrQN8oCWj7OWjqt6K0D6neP953hV1bszZuFjf5L6eM8Sh8DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9vjlZJY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9vjlZJY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0b944f6edso43258865ad.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 00:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594608; x=1782199408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izxxCz6Viw+xLa1Vs7mitQS14XdrMYqPUGXYD/bDaVY=;
        b=G9vjlZJYNRUy2MnOKRIX6zGRGY6WUVso1F+9Cgj35ZZnL0kXehBQl+Y1URqbQeF9C/
         Dq/cienaDT6HBa+3P9LFNA55qPeW0xplHjp/Ppnq7BZlgsA32enoZGAHJRHrjgtX1isp
         luIaNhv6B1N7curLviAFo70sh1W2htvz/1Se/adZVnMbS2CzataUxJBfYB7fM+UUXuQv
         71pwkpsCg67mL0k9ri2Hpid3su91gUG0Q2s1vmwzjzAqEJgWgnrAutvsvoncQgdHG90W
         LZIdT8AP64OPwzAuXyDc/7h/QQ9cvthu2b+BZctsDrfnsFMsU0h10TTBqUgwqGaP74qO
         9NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594608; x=1782199408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=izxxCz6Viw+xLa1Vs7mitQS14XdrMYqPUGXYD/bDaVY=;
        b=EuMcRJTr3dqfen91J8Qmjt6qNzV0wZPU104K19cPdF+Hec/kGaJSiSeACLdqdaok/Y
         RI7iPPAD4jidpuhh/+zJxLVY9aonAQsghfw8YXrD6wh67ZrajzRhmhyCpC0eZM1HP8kS
         UjlIggliE0K/nhUm0vpIgLxb/1gXl23qoGiZt5VXfo7SRQ8q3/Iwpfb0w1Piv4uBJKJx
         0KxS22/hR8/JmtkxBL8BfRlUspBnHMYBHtVYl8y5/FEsWE0/zE8V8LP8zemHHOKN6H/M
         lEkGUf/0sdIONrxiM7k3qMJ4c+EMy1Hqw1qe7zlFrN/Y0I1CH97SE7ijYChp2UsVnwWo
         TssA==
X-Forwarded-Encrypted: i=1; AFNElJ9D8EMUFv+L8UVlLQon0XuyoFh/8DFMnsWya1sn9ngNY5WVJCKhpEQQuIQU6DcMTlZMsl5zzHBMpPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4a3MxVasQRey8GlnwL71dzpxJPNc7ZBRGwi2v3CvoLd18qQw
	vsnoBKecJzEVtVMW/tFZxTN8JTWBOiy6sGX+CO4zM+exW8n5qxcCiR69
X-Gm-Gg: Acq92OGMu5jGWrwj5axBRer/tUMnN6AWaxQIDrhLK63dM0UJN1ilZ75AOIKcV4+7oaY
	Ax+ni67tT6PZB00ErOdisBSyRS2WYntpm7IJ7VGVchFRMkwqXA/pX+rHk1GfE4pFjDCA7NeOlKm
	qUqyzxaZ2QrU1FXcjn1wZGWhiBithzy/8BvVjYbjdjq6Y37XatpWs7266kFe9jE0CPekT4Nfj3H
	EUxNcsYY12EsbT7lPwHIk+adlYlcy0L9dhcaf5+nCjTaVcKsiufpDFghPDZG7STl3TySa1vAO32
	jEOYu5hDr6T6+xgO2sUV9UuVcO7dYypjdDmyrBQTsntf7Nw4Mh4vmxh/jF6XjRtIZgVr3rhayC7
	+Io6Dc/fbedoHEslM0iASUbhLJzounCsZKCYg2mGIZF4wTVQS6zJj4nSQtQQ9dD6yBYJykUjKuy
	3ELPk2yxon0uy1urqhU/TUVWEihOoVlYutTRnwDFmNVfTzRBxeLHVbYjAn3m8lq8tugynCvfxD1
	F/6kKEzEbSob1zsNrklbFr46XzR/lPwJJr8uK8=
X-Received: by 2002:a17:903:380f:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2c690ecf6bcmr67385075ad.8.1781594608191;
        Tue, 16 Jun 2026 00:23:28 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f1014sm123513435ad.16.2026.06.16.00.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:23:27 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v5 4/6] iio: osf: add stream parser
Date: Tue, 16 Jun 2026 16:22:40 +0900
Message-ID: <20260616072242.3942-5-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616072242.3942-1-kimjinseob88@gmail.com>
References: <20260616072242.3942-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a byte-stream parser that resynchronizes on OSF frame magic, validates
complete frames, and forwards decoded frames to the OSF core.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_stream.c | 187 ++++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_stream.h |  31 ++++
 2 files changed, 218 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/opensensorfusion/osf_stream.c
new file mode 100644
index 000000000..957f73716
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_stream.c
@@ -0,0 +1,187 @@
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
+#define OSF_STREAM_MAGIC_LEN	4
+#define OSF_STREAM_MAX_PAYLOAD_LEN				\
+	(OSF_STREAM_MAX_FRAME_LEN - OSF_FRAME_HEADER_LEN - OSF_FRAME_CRC_LEN)
+
+static const u8 osf_stream_magic[OSF_STREAM_MAGIC_LEN] = {
+	'O', 'S', 'F', '0',
+};
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
+static bool osf_stream_magic_match(const u8 *buf, size_t len)
+{
+	return !memcmp(buf, osf_stream_magic, len);
+}
+
+static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
+{
+	size_t old_len = stream->len;
+	size_t match_len;
+	size_t i;
+
+	for (i = 0; i < stream->len; i++) {
+		match_len = stream->len - i;
+		if (match_len > OSF_STREAM_MAGIC_LEN)
+			match_len = OSF_STREAM_MAGIC_LEN;
+
+		if (osf_stream_magic_match(stream->buf + i, match_len)) {
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
+		if (get_unaligned_le16(stream->buf + 6) !=
+		    OSF_FRAME_HEADER_LEN) {
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
+			if (ret == -EBADMSG) {
+				stream->stats.bad_crc_frames++;
+				stream->stats.dropped_bytes++;
+				osf_stream_drop_invalid_head(stream);
+			} else {
+				osf_stream_discard(stream, frame_len);
+			}
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
index 000000000..f7f9477fe
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_stream.h
@@ -0,0 +1,31 @@
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
+	u64 partial_frames;
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

