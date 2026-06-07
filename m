Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB0338595
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875929; cv=none; b=rIuUtiisCe7VpvjmT7pyxX7Us5zR+hps83QSpgKXI3vTtMoI5JlR5hPeFzPjuQBJx09cCgPCUt4bkjFqJLNnlzNiBJLP8l6bcZGQldlXin71rz4u0fG8HATFLeYM8+lCsliEdqI0QnRrJBXZXnxuZzsKt2GGs0dFlLMqKFmsMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875929; c=relaxed/simple;
	bh=KJTRCy7wNY+N6IrE/mRVGcB/+axShhI0D7cUwSRv3Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuyme3PwUJOKsCpC2yvPSBCj14lDurB1iFdNc1NAAIGXmW7YYhz1jpxgRwLVCI1OHS3f63n0PEwNiVcze58WV3dPhW/5+AcFrA3WzCF7D9gMJ6t7eKfwOMTLqDU0fAy3vYxNiVPIdJZA2moh4mESU92mtrMUfv7ONSBq90l+Shk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfXaCEIz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfXaCEIz"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423f1d8902so1407339b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875927; x=1781480727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaQl7dtgCPoeeJ0ksgq85IpZKAoo0yYD7cImexjDLms=;
        b=NfXaCEIzgPw9KMgLquOrieq1tveEjSb1X+Osk33RZeynIwunbKnR+mjfEhLYS0smB0
         2tnklm4n7mrS2qtsI2lMcDCPf5KFq46B4OsHHwO8+DHQWtpc4ccoXWi0rHxdwwQ7cmee
         aCRmpSq1ZGkXqWgq3mFOtuDc+cX/08mbTAzQFkdrt48q8CEza4MgJJy2zu0Zu8BtJI1C
         ngFpXkBSRrQhXD0pr8GbD/IzoDHVnTb+s2dXqrD5tsGkJZy6VhDNr1EMqy/P+OuE5iXS
         raUCeAZh4BiMb8VZj7btGI2iKdSAQCcX4xF5Hky7MQEEi81jbdzNQctkookv5ougt3Ry
         nkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875927; x=1781480727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TaQl7dtgCPoeeJ0ksgq85IpZKAoo0yYD7cImexjDLms=;
        b=Pn2opiOAeiYsIi762OdQs1KPAtUIWdIZjsJ6Y87tXU5OfbaJvHnSNIjN9TUqS6alqC
         r077wurr1cABc+NFwH82TTOouieKBcOvn4SGbnYKBtezuV4oQyQYdwwxIBOBq7vyekjl
         PwYeABHctQ7d4UuPSXlhkap+sj8WeMPU/+r7faPnKyqp5mV2bIJHprfdXw5VYMd9Tlo7
         wWcrCewCzEcHBiRKkX6xC7HcpllIjbi+YrgSjtnR0wAnEyd5m9e4may8WqgEhQeGprXt
         08nlBD01xOciLEp0g/Xwpm2QGJwzhu/FRH7x+ZC/nmnxF7AmQEgiYUxsEmXdPOsyxyur
         PuLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gDKPbOzKfByuL+q2i37nqJnbKHu8s3NCmUk2AnppyVelGktxN7dU4gPmTYjcUYGnQY2MFupluufc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IGhHaXPgmwuGwNLct/O/ju8RaL40mDSgqH83P0di2984OMFQ
	/yZEPIahbDX587rrYs8Yh93bEtbiUfsdK9HlYNRm19+8BccMPcm2cn7N
X-Gm-Gg: Acq92OH5vbSYjWXhJia9BxYVs9g/aZEvL+F7MHM/6JWEH/F5VaVvmBMwEP9n7s8B3nK
	dzSjOKzSN0hdfJYVL41NJkBQmSCCbi2CUwdWAs4b38TnfKQxCBVAykfjlnocHgpgLjG3I1cfzu8
	Xjb7NmjXf5jGjpSaV4IxioUVViGiIiwSTLz24aaDBzNVR6pJoB8QsHDh6Ha1Pgy+zr/oB9z60Fv
	Cywt3gDro3t5yLI5Ui8RUMdUCD0iumfS+gE5I1rOuDXRNAgT/PlNoY3IKgv3Dcfg0N//WKbC/tM
	Itxhed6QzHu0Ib/Bl6l3+dBhbvv2TjvSwLphSy2hW0Scu13NgawkRsqezawxYnN++vEtLZCiVd0
	zuQqChUIl6CrdKrZY+eKL4Qa118xn5rS8ISyuQ9pJvtt79Dpg86C4GMnkSXosu5eAlJ8ZKgtvMJ
	DdmcX5nfRNUomRgCDdS3uBOTWw8YAg0sDWDxhOcM8dIyu5DO+sEmkjJwpKXc+WFQkMjH53Z3nLd
	sSs69Tt2pStTDzaCIOh6gdWUUUpidnimuJZuYeRZ4h4mqIa
X-Received: by 2002:a05:6a00:3d4a:b0:842:5712:c2c2 with SMTP id d2e1a72fcca58-842b0fb6d60mr11804229b3a.41.1780875927308;
        Sun, 07 Jun 2026 16:45:27 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:27 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 4/6] iio: osf: add stream parser
Date: Mon,  8 Jun 2026 08:43:41 +0900
Message-ID: <20260607234343.22109-5-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the parser focused on frame assembly.

Let the core decode complete frames once.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_stream.c | 38 ++++++-----------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/opensensorfusion/osf_stream.c
index a2739c987..957f73716 100644
--- a/drivers/iio/opensensorfusion/osf_stream.c
+++ b/drivers/iio/opensensorfusion/osf_stream.c
@@ -62,8 +62,6 @@ static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
 
 static int osf_stream_process(struct osf_stream *stream)
 {
-	struct osf_frame frame;
-	size_t decoded_len;
 	size_t discarded;
 	size_t frame_len;
 	u32 payload_len;
@@ -82,10 +80,8 @@ static int osf_stream_process(struct osf_stream *stream)
 		if (!stream->len)
 			break;
 
-		if (stream->len < OSF_FRAME_HEADER_LEN) {
-			stream->stats.partial_frames++;
+		if (stream->len < OSF_FRAME_HEADER_LEN)
 			break;
-		}
 
 		if (get_unaligned_le16(stream->buf + 6) !=
 		    OSF_FRAME_HEADER_LEN) {
@@ -106,34 +102,18 @@ static int osf_stream_process(struct osf_stream *stream)
 		}
 
 		frame_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
-		if (stream->len < frame_len) {
-			stream->stats.partial_frames++;
+		if (stream->len < frame_len)
 			break;
-		}
-
-		ret = osf_protocol_decode_frame(stream->buf, frame_len, &frame,
-						&decoded_len);
-		if (ret) {
-			if (ret == -EBADMSG)
-				stream->stats.bad_crc_frames++;
-			stream->stats.dropped_bytes++;
-			osf_stream_drop_invalid_head(stream);
-			if (!first_err)
-				first_err = ret;
-			continue;
-		}
-
-		if (decoded_len != frame_len) {
-			stream->stats.dropped_bytes++;
-			osf_stream_drop_invalid_head(stream);
-			if (!first_err)
-				first_err = -EMSGSIZE;
-			continue;
-		}
 
 		ret = osf_core_receive_frame(stream->osf, stream->buf, frame_len);
 		if (ret) {
-			osf_stream_discard(stream, frame_len);
+			if (ret == -EBADMSG) {
+				stream->stats.bad_crc_frames++;
+				stream->stats.dropped_bytes++;
+				osf_stream_drop_invalid_head(stream);
+			} else {
+				osf_stream_discard(stream, frame_len);
+			}
 			if (!first_err)
 				first_err = ret;
 			continue;
-- 
2.43.0

