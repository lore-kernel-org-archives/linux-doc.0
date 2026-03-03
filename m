Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274136DA1D
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772518427; cv=none; b=H8UP/hXOuXy62FyCXeBSKt9Z5LQ6bL7QrFKINbSWhFXQWz2d+EI55WYTaQLA3WG4m9keK9FnthFnSqpEpvUmqvaEQSVW18dizwQexcptHpHK5qhenncQvVXDqH34Ke2/b10M5t+32iF4cFEaaSHVXnV/sL4P9nfbCWk44wdxuxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772518427; c=relaxed/simple;
	bh=G66u8aauHLh3hv8Ltv8yWkfXW+pytZrpTmIScPLSZyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRxwc7hRsAb8aw44JfAwzgLPo5JFhwsBIyrRd6hP8ftms6T9LqYELYijOTqPXXcdnRcm1rcfEywmYHCT8HkDDqeyjkcVpWPLQHVMhR9JtLeDbgVRpqFJ/SZtf/LbNXnmIj5qrXhlVTuirWo2IRDWQk3H4vgbt8P96EVB0k7ogog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YB5gyq+9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YB5gyq+9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae50a33ff8so14383635ad.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 22:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772518426; x=1773123226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBLRd0VVPT6JgeA/gmRFgTBh/C6/jiLo21KLSX9AmXs=;
        b=YB5gyq+9Jx/lm59QV8g/z0+2iozkEQnGdc/kAIsB9JpJTq7as0CQs9EhfBvcGCpD+f
         kTsyDpnRDmBrpTZ2uNx4PYMfFz4jLPCFTlgIe22H0kFOhIaoMzn8fS7Yht3rXY+Km7Ow
         uI8hKu6C18NFhyzz69Q88leyNI4L9GPnKdSUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772518426; x=1773123226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TBLRd0VVPT6JgeA/gmRFgTBh/C6/jiLo21KLSX9AmXs=;
        b=rG392QgI8Acd8V9mneBBQ2NVxhjMl4uRH3y6Xz3I86rOhnVv9pHowmeGJQx5/B+rRP
         IIHUvNuv7ImH7Kv5rfIhbUfXnZAy1l2y1yYruwmD35j7knipJn9Mbupi43lSzb8D5NTc
         wgUzHVVTiahC21TCI8i9T80wbqgj4mBVyPjxuZpG8jKvOlR5YhRxMf+1BKIqWjC0FU2l
         cT8beRjOTx1bQ/FqyyAqdS5RzSrgxOJ76dTkan/7zteZZql6LQh416S5a5vQU3LhmBtI
         XSl82vXZV46ndggV6bf6r4/zKA6pMM+n7oSgcFajG3DqcHIRyeJWK61INLdmfJKzIz45
         ff5g==
X-Forwarded-Encrypted: i=1; AJvYcCUkTVq452ZSonhxaDA652nrm1A1ykyg5lWE51EFAKbNKbCxTgMLPuNs93Z2OEmYBfXgqnAGa2VrOso=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSagzgl6IosT+Cdz7K5ghhf2jb5N+3yKplFwCyFg1Tk6ApQIY
	5sU62/SGdnHvKL4MNJNdu88L8TfffeLFc018NkR7NqzpKdNws6bhfqcZYSk52IBqdg==
X-Gm-Gg: ATEYQzx11vY5ajXzIu0HuZFdVnSTua9LBunFvjl8D1ZJsJdheaqaGhyavQOxYoOAZTV
	lfl/qfqmIN60bDggso05yHgA0mg5aelcZASH66tth8/fbAYH/R4LVyFWP4GTnQuI0kJuVm5OTdh
	3Sws7xSUKJqOz5M3Bpwk++ICd7HtleJo96X0vw8Cnyx4+z0BVPPX5fGrefJ4G0mDvZs11NW4Q6J
	3y+p3YlbZ2jqpCjP45l15TVlYtUFZl1rHV/YmEKegctSOMsnZ0OQF2cZt2Dm92fVXGteEzHI6NY
	34LwirATYaep0kSoLy0vSyIoRuCIEqey3LUnDwaGQ8nqZ9w+9kGSYgVFXrFOdyA6qzQBQICGC3Q
	EFOMcdiNBqmfMLMZg9auOoOEXBjBiUE9TlAF1ggL4aU1z4ObcHHqZobz0CDucSKkPksb7Xx3BXD
	GnT9qjXHORtOtwdOoU6RCsfIxhHEkNnZbApnuHS5z2u17+CFESlPVxEGDP78Y56Fp8JRxqhFGD3
	15qWAHnMyOEAcwnWfSRz0fLVl8jLArRYw==
X-Received: by 2002:a17:902:f70f:b0:2ae:506e:4711 with SMTP id d9443c01a7336-2ae506e4abcmr61194795ad.31.1772518426248;
        Mon, 02 Mar 2026 22:13:46 -0800 (PST)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6fe4f3sm152639735ad.91.2026.03.02.22.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 22:13:45 -0800 (PST)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 03 Mar 2026 06:12:53 +0000
Subject: [PATCH 01/12] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-send-upstream-v1-1-1515ba218f3d@chromium.org>
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
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772518424; l=1154;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=Ko4HAge31pJ3y5sK3I4VHU62kcrFbomkgScSw+0vFnc=;
 b=i1wJDOCOTKohS8sUVAT9KTdbS7usX9DiYzDm8pdpDiH1LnyATV9bgGB6dBKN6tIy1Yav+kyUU
 1E/czgHhZrsC9IXUbBdK9LOimEy3qzdp6R0G3SqQS+y4oZSRJt3mGxQ
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
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
2.53.0.473.g4a7958ca14-goog

