Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A78378832
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 04:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980088; cv=none; b=gowvSH4cj5U9WI/gKBKr2b2VHlU8rGBpVmPGJdQzbaYAKbA8HvK4hXZ36JCHKK5zWoDk6qOidtlNe298huDhzy/JFy4aH5/qMYTk392kI6W8AeL9vCYyO30q/rtCKdlUITKi2zmlhGyUU+e3nRItn9SrYFCE21aLfZXdt29tO0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980088; c=relaxed/simple;
	bh=JA2M7AiLUuSc6veCi/kbJrYplg8DlHt3oDIafgdkMi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HeiNny1KDl9uvpiflPZj3MERpZBxLPUyPz6rBM2XoueJ3k7TYsNuOzpqxlfwAjFnrn6a29J8Hzr7WsSfqDGcJfwJzWwPb1LGel3cA4M6u9h066uZbCBURoM7/HPXa1A46jahUYYwVCZPVvtsMIVBsjJjQHfsFduGmrLu/qmsmqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FtNIrr5b; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FtNIrr5b"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf2247e38eso52400115ad.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 21:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780980086; x=1781584886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA0puiI12gkUUrChccEFoedZkqg321TG7vWV3+7W2Ns=;
        b=FtNIrr5bpJw5cCz9yjGqXFQxfbfSh3Ro21BPtakPw+eYYgW1GCRW2n+jFCcGA9ohoR
         7mjyGbCQrtBVq8BhEqKd9fqKyN5DBV7ka7zdhHI+gQ6j/3y+ZCrW85jrmjax2BCqvTXN
         vmWpQll0TOTG36Wgs1criDWj9c8+lDH/r17S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780980086; x=1781584886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eA0puiI12gkUUrChccEFoedZkqg321TG7vWV3+7W2Ns=;
        b=EE2n8gHweyR6PqfaxZ/znlhZbtEfSjIsysjfcUzTYaYgi9hQw7wX3bXx4skAPje6ug
         vyhyC/hJwqcU2V2fH/hiFo43e1ZrKJdQb2FPbPKCD142MhzN9eje+beqqR9F57aiOqam
         wp8aooem4wNs2sl/ZWrCj7DPJ5lbtaQOL8EeDdfMrt9Tvgh2rRJDBfxpnmUMbMUTxcCt
         Tsyr7qpixNbdhgqKMIZlRE9wqwVqmdBqPjGJr+qOpRnbDDkNf/Fi2kvuoeelftnYv2zQ
         DrrDTAeaErCLXceT+RrmaAq+8J7k4UVa1qv0QVnPHNJGxg8Dh2f3P15NsGMLnDN+YmBl
         8Itw==
X-Forwarded-Encrypted: i=1; AFNElJ9+Drm7y9tPMgZZPdYfjfb/ob9rL6Qvy8J5Jbe+yGkFFkuH938ADk2U3kirlRkdAifF2YOn+rBhbgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiFOdrrNP49lrC+kqvxyE9SIaeNIdLdODd6OttkR+xngDuUMV
	5R8rKBk6Z2ezFOWI0LF4U5ttxZge2OA2vVXlDvvXcedfhkxoQPRawOXwJKin6CSW7w==
X-Gm-Gg: Acq92OEFCZY4DvQGPYdf5OdVRU55uRil6UaZf69p01yMoAVpdrcPv5M9qQzaq1FTis3
	DgHsve5NGlzB3Tj8eBckxa3a+/1NuwF0K7Nohu9vnP9kMFIDKyPRy0YXhcVu5Yxv65isk8CsK2J
	t4qV9ekPGQOWrZXUpBbB/PAdWqR7vVMgvqBy/8QfmKnSkg4oFsGtPgS9HuHHBWvf/7YUIj15qmi
	hJaxOAo+/CdQUcnMn17fdkOSOpkS/8ukblGXhbEOVmxwNDvbmrJfc3PiszJd/KdkI2+WXtnEtFg
	SZQT8mpKQ2WXnwxXYUseTxJQ4Jf7vkSEMPbpreAi2g/fpqJoWuzJMSwuqFWk1p6dEBkXe8FnZ5e
	oqBA4fXak+EGF1H/1cy9ZKcHpRZPu7DN3dFrLiO05ZiRBl4G923gOfvz2h6IASTtQ2OMpCQ5MeA
	ma5z8Jwvz/IG/9UbiLDxOInMYf55Th14kd3Ln+yIlWtUvybWA7P92us4vA5JEpw9Ot+MQsOW+H4
	gUuU7EF4Aoj5jICH9vHWYIGGIA74ehtU1uUcHHsHBjS
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr219282855ad.30.1780980085929;
        Mon, 08 Jun 2026 21:41:25 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm200736065ad.80.2026.06.08.21.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:41:25 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 09 Jun 2026 04:40:52 +0000
Subject: [PATCH v4 01/11] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-send-upstream-v4-1-b843d5e6ced3@chromium.org>
References: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
In-Reply-To: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
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
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780980084; l=1213;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=WgXF5HKmPVI1MEtrLNcqmUizKiLvnC1/DeVVEsJVV4k=;
 b=MRn8ThmipL8aQeFe4El0wwHcRed1esJP/XYC9aYnkuywJVUaIVxu3P8Moai80Jt3iW7OzC0El
 WxYiULYHaqZCIsSH0OhJG6kcJ1FO8J7LYW+q6zH+Xa0pPw0DZ8OiK0e
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
2.54.0.1064.gd145956f57-goog

