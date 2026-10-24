Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803113;
	b=0c10BfGrUhYyL/CCuc8Nn8rtZHrWcNqg5eC22qu7S/NDUrG+WFinbvs3fD8EprGdG95F
	 d/AyhXcqS6dwnR01KQyOEbm7q1UAKDPmizdHxZLXei5WHVXybUssl+hlR00DCwHl/eQj4
	 RKR51A6Ap37ErNW6qaJbg+T8rJkHIEpvgWQhLrVYrV/zO61vGVkPr2d0v763yDTxWQsWe
	 u4TzqJFlbzlljn/1FZxtQ52Q4UXeGKgQtnCGzMB6y6vBRgALNgr3tZHcbaSb07xTUip+K
	 /GqvfQjkKfMfp1pxj+caGZxa1qvbMSlTOeNUC+WnyMYfE06IsMpHDgkjXsODvdzVq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+y0vpLA6rDnZkZJGvTpFSS8QdG6zDUiFg4vlqbK0zls=;
	b=AbRDy3flMntISwkErxYu9Pu3DbPMjWS4LzjqMxul7+6wesILkF1TFB3mnRXtn10Xv5c5
	 Fr/g399s5yiWkfVTy6mq/aRjSmfBPTPLWuesElnDtXDnBNxmnfG7VbgykqZ/giigk4GOE
	 iEwK596AGCZGoLDnO54Dn6kA1Sus9niWdnSvmKxiedLRGyJpdK8Kf+sPogact4we53NzD
	 Bee0Gn5faOjGG9z3neZL5XI8a38BTJT4K+RPj8Bh0mE2pEn9Rp5S5VpeaNK9940VqOE+n
	 qBljdFDbeci3LRovK4YR+jXExbDPCwTQdvNddqT1AnGDgbB5e/1j5s2+I0To9x6rfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1cZa65q;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1503D606A327
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 00:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1503D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1cZa65q
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so837606a12.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792803112; x=1793407912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y0vpLA6rDnZkZJGvTpFSS8QdG6zDUiFg4vlqbK0zls=;
        b=Y1cZa65qKf3rNeVmoPQnEIKAF6xrQhj1+SuXNOEflQZczWW776jP9jQfcFQR6OfJV3
         yqF6PfKNfijIBpSnQqCst/hTuWflEY7lqwUKFO8OO5VZ5DjzBE+b3dFU9PwoJxIoU5yx
         wkHl06/LmYFBuagl6SSUwI0oJW4wcEXUQyUOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803112; x=1793407912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+y0vpLA6rDnZkZJGvTpFSS8QdG6zDUiFg4vlqbK0zls=;
        b=mnNLBjn6JIoDMdwTPrPeNymbNbqJKmS+NPaw+LU0u3zrgCpzfPVMTC0kuRJ07CJiYK
         cIk8VqBVzbNsL01H2J5Hy+ftVKiw9tgeaWCOsmqXHtav/MujhvsfefeK0huE3KQCm3Ha
         sDWWyqLJkjmglkOCumjBnGs8uBIow+biU4dUcdMoDLrS+mOg+hJDhd1xZV4phjSmGEjW
         peYuFnlWLcvfKEwrqkf9jj5wB6Ce0T3b8rb8f64XiBYHdDN7esamWBPIKfdTVtWH0oxy
         v4p3LY+wBkecJTv4oDEM8mHimLk44h/WJwgrUKjN1j2vc7wm8QKnocLg09O5+eZajR/J
         Oz/A==
X-Forwarded-Encrypted: i=1; AKwUvBwapNN2/QjNsjBcBpZgC8N38AqmhdDNH3eAzc1mdMrHaItGYf2dEFaaZyHepDJrRDtttSOf90Fw+/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg/NQRTxx4E7cR+I0Hw6Iicev1iLrLc5qDPqEHf4jZY/+WdFU9
	GYb9NWCkNVPv+6AK3LnuxfvfFU0+o9FAbBy2Sakum9uzrsdSk6i1GdIV/fCxoTRT3g==
X-Gm-Gg: AYBFou1f7xKnwDkSHZkLlFFV2L9gygTS21rVjIxK2CkzlIc6tTfTvQsmt5n2KBLcerJ
	XGqebzdco/Sey88fSMdR9dJM88vi+PKxLRsvOWQiJsdriAYrrrbcmUDD39G0IYjlWUTnOjCOhN6
	v+LCiWBxYhLnzXdR/7MO4S1GrbWTz9mfLq7+SZA4/oFkJDZx2VcI0TjVJw/Is0IfGa8SQJOkYVR
	8UN9RtgNhkq+P5TPsIOoPoTpvWxoZfZESobgnMnEsgT5EGTazgxY6OHs1WPXTNV2KXrQ60uJXR1
	SApHwF2pKkHaRiKbi+urvzwE2cnrFZLw+HF3DdwgfJ9QmT2Y5VvjWEw+taQnskJ5WQkln10q+26
	DqMhf1PIZEy92QXf+QKjwaLW1FML9WZQwHCoRYvQlDJMGEmb9lPpchESr4aha7l3Wa6ZuxUVFaK
	O9SQZYvYNTbrUV9yN5vLrlNjFTCb9AWr08LJ02bqcdbmQYv4XXOKlaHrErh6mNKTk4DGFnUKZwv
	uVGKYeBFyWWJlcgzBsOyc+4JTVY7Z691vp29pHCfdmx9L8iNevB6YYqyupU9eSSUArDhM5r8z8t
	dpvkIZlevuIvXcShX+5Y6kDKFkq6CbCpTGAoMAeKNXd0BwXh/cscD/HvD1PGwfE=
X-Received: by 2002:a17:90b:33c7:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3adeae78223mr710221a91.50.1792803112460;
        Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm843763a91.9.2026.10.23.17.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Sat, 24 Oct 2026 00:51:35 +0000
Subject: [PATCH v7 01/11] Documentation: Correction in HID output_report
 callback description.
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-send-upstream-v7-1-abad13174b43@chromium.org>
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
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
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792803111; l=1212;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=IwRF58jgSTKP3fdajEFSeRD6vCiZwxLFM3sXfjl8RPQ=;
 b=sqNkuLc95RysONWlhkLkd5q3xh/LjwcP5ptF4HGTo5fIv2IBDuCMHn321hsAylqkyHBNqNSSl
 je7LcVE/CrEDf3mcpNveHsUUJQfwXAnE0sFD4Emc7TLquH4W7kkL6F0
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.56.0.257.gf7497c7d27-goog

