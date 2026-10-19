Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436492;
	b=JYb94mh1rba469H8MGUpdgkFqwRJgF4IdtGML6KKMHJ5mYWd3ZE64xT4J7PPtgGLG28H
	 nfO+7vjc+FM44hSofTdwmMcfRsljAe8pFsbqQ9as6QYKc4x14h3xtNVqP644rQPvt7sRq
	 IUhfmCE5TigcJZzvLEZZ0jep6V9+5ISejK3ERxKF01oiEAD1Ng5Qi+HDTIRM3ALLjvHuO
	 rO1Lx+J09ilJdzmnvIfNqZWeBQvdA9bu3N/Aa+x3U12dPy6m/bIQNPTaZ087jRaPL7x1+
	 KlRFL2irD03dzZGb3ETU1syruJrQ5mt1338YSUAXtfOBpj99LWUpBPjvutTNird5SSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
	b=T4XRZPTwZ8YYZ/ohszuto4tJhgdchmToJLb7+FxhdFQNg5LiHaCWrE5r66MpUM70d2RE
	 PwQji79Xyd6q32PG1XYJZt5C+/F2P4sj1scp3T8X9Ob/djzq4OpwsjEbGjOCh9653GKWG
	 1N/L81WUL3nxKN8/QCOk8QQFRXIqr6UsK8UpPnqz7ad5Cl4e8HzYB9z1+suTX/4lAvSDX
	 xE4eB+qpTJrJtFbLXDvzkiMhbck53v0x7UKcm8JjJUyvnJbU+0MXKDWNSyyexmRSGAFCz
	 2sWIlJd3J0S7p/jYFeK1Pqf4hNFMl+7hiLpBKV/NClrlxC/qaDAAVTjWZ1JrxIuWIZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRYpaBTM;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3BB606A329
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 19:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3BB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRYpaBTM
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9e53d011eso9183515ad.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436491; x=1793041291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
        b=cRYpaBTMVC7XVXSau9iQnNb982otn5J294NaNijuz0X4dHP9n0KRgvYCrOplTS5aBb
         QNtAHSxHVdqETcgFENkX00iuJS60yVQO36lr6lyNUs5Ej+Qd7WqPb8JUoXieKTCCu/1R
         qJufzAwS5wu0jOzMVbtHU+oqZexlZf/2UYxKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436491; x=1793041291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
        b=cf8rURGmX15Zl0JTp6rT3RqGtyf7So6/69tDhLMBnUrq9D105pSQQ4A9cwCQpNvwO8
         6Jm11UFHIUpfB3t2EjuuMGgkIDSteVzbPN0u9IXBn7FKrK+R+BVpHF0P/C/YKzgL8UUc
         SShG9oMQ0dZdfkURLSLeeqtqhGlefLlKX+lqpyRXQAsTYUo1MV0hsU3OhlaQtjdfXJgc
         k3KGdE7Jx4Rv5fW2m7xGfRzEh8S9eXUii6N6/wUCRV5aiE27EOtHNvCc00jsgeod/w7c
         2ldVMUUZPb95ma3timy8NC+fDfq5uuSzfFYMHHpAXul+QQ+UtWfeiVsHyUq4NvgCyZ4f
         +epA==
X-Forwarded-Encrypted: i=1; AKwUvBy/8WjJYUkc4YrsGwx2bOXDmQW3v4lMEqBHa0AjGZcnwH9ucYoEJB/ug7+GDFEJ8ZUmhk4kxK2xjjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKInAcB2wkpxWAWQXSYAM9QI8O7YvRXyfEoODLmrFKo1wL3yGR9
	aeNs5eFUMkKxKDFDqizoxOzSbNRd4YwRwe99pymp+yd0FJ5yKiEu1E5Twz2wWue4ow==
X-Gm-Gg: AYBFou32NmEZhfVi2sKiyBcSeU1/4jYpuvakBdfnDUOhzCY97N6r9AjSiWcZaoCoQki
	4UbXX478XLf0+cptigaRT/ruJVLKtVQq141erQY/lIsbmT4EYo7O1LkK4DU2J3kMIhbj0tVBE00
	1q9E0QBedotXE5AnWpeM5bJIwt6fJteV42ug9s3SZttKrZkAWk0sMKOh+D8ihlNFYZOSp2Y2/dI
	MF2UUhqP/87UohpkD+h+FRT2Z+8DySrNFS3FVhptOd0YMMKFIGkZL7mKCcvw61h4iM4gxiXXTKH
	HoxNSsKhyVWRJHF947nmfypB+t3ItJv1fMkfjwnS0szdz6KgGFZQmT7SW1Zr02eug2c52JsVknJ
	w+g/K2a9R6fp9e9PgBQFOigr1sW0stS4R+5hoA5jcWo8Tyc72lI3mTf3psNioGoCtIHQIXzVDZx
	6YMpxdDdBBZsgKHZEzYg9/O7ISeaGGkTMW6DLbfB+/guZnhs5qyDM07ks7UdOw/l5zJGLvAa9OM
	306FiCbcP2Pl20tZEDtzoStgnoKnmZeiI+NFkrCiWywGYbSTTi2bzLg/5g4KXVYZVMbl2QNa/xq
	6auvhQ==
X-Received: by 2002:a17:903:22c6:b0:2e4:b37a:d583 with SMTP id d9443c01a7336-2e9a6d367b9mr71528345ad.61.1792436491064;
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:30 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:13 +0000
Subject: [PATCH v6 01/11] Documentation: Correction in HID output_report
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
Message-Id: <20261019-send-upstream-v6-1-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=1212;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=3F0PUGRvwtvEKibOIad7sMQuPUN5v644d10H48NGstE=;
 b=oNrr9I9JcmB+rovcLexc52aW/JcbxtVxrpwrTYSTNrVT9zSgQ72OmH3qacvYoupyivVC/2ZPi
 FOYyp9GlaJNCdYZ/PxNSjL5MCAqvSVv1uPmyoBi0jqFRO7HCzmMYTCH
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
2.56.0.212.g129ede20d9-goog

