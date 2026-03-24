Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760663C3C06
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334406; cv=none; b=pyo3oINHPb35oABd5kVRWFNpKch5fzNB5G4T3d4RHEnTMiePpAhyGj1JcSQ4it9xdBizZkOL7luTtYn95rqdidrksAEl+Uv1E4tL4vhkf22SAoU6GynbDEQhnwPAtGGGpgcIFerqaIgiTF0pgkAWRwroyBZpjV7Gsqg5NV9oFKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334406; c=relaxed/simple;
	bh=0MRwoqw5wBg+zBFOjDilpjbp56zFoFLhnDMQTh6a7UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTrVIxIGEajXLLuLuB2B7FleA6b8QTg5ECqGM/R5VOZPjxnO8MGnnfdQhKGjZozRcb+92u6eRmFKUz0rnXQf/H+ZrK4cmqek1n8dFIo05rOZlhrYcQGwrlInwwMY3h/oS/ZrhUkGKJMrdNYFlFyPYzFf1nrgIjTTyvvZFX/DhLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CeY9lp5Y; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CeY9lp5Y"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35c05d7e0e9so143335a91.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774334403; x=1774939203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhItGXqvjBzAtcGycfEOYT3KW2DCoWkdBzqgD2ulkLc=;
        b=CeY9lp5YU2BQ6NgnzLbQIEn+Ur+2f5QHwOmeVWdz/5n2YnouTw+AjJr7MWVg64nDAA
         M5hBSFDSSOVHbaEXiSQKCshYNoGtoW3V0x3ICDqPv0pd9K2KyqMqm2HBXbVuO+0Lq+ry
         rap5uiysgw+4GOvebqoZQmuJIJXPQqzsl1QMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334403; x=1774939203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhItGXqvjBzAtcGycfEOYT3KW2DCoWkdBzqgD2ulkLc=;
        b=ooCwC5T9hWl/h72M6TIUxsl2dx2MYY3IgRzv36570qC+jaRgwnnsycD/HdTUnQDVHj
         GmThKIg6JCkkW6VlOu67/GOEuEB5hyB8xDi3Dm73d3fBexaMZDRUxNLbvD59bggPsKPa
         lQaYLpljotn8s37x+Q8IPU0RerH+pp7Ihzk5eYQapMVmVF5w/XlGfB19B3IhAOa0YDJB
         VxI51XdGO7xpLlA08bIDHEl/rdEhn6lIF3sLFDDqkGR9ZPUAyMgXUTmer/VUQkaZcUDa
         ZgaIUDdpScpew6MQ4DkWQhqHf4mtBwHPAizp7KlpXzNvcaDO8siBbP/B1JG3wsip9L01
         rcNw==
X-Forwarded-Encrypted: i=1; AJvYcCXdakG0kdm8UTvhZHhLx2l6fpQjH28+3fQMc1utyVvQOFBTu2Pcvx8QBzU+H0EZmTSLmUDpT4S2y0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRL+KOXQM6wUMnatVExGmRkvKLCJ7Gd6r5e9D0vNsPqfY6jZH
	ZVd3rq62VGhhyHbOw8KGNqtqsTXlRk7YvbydKJ6u4+AI2852v+hzWdt4m27Z1BnVcg==
X-Gm-Gg: ATEYQzznHGcT5a6TC8cl8a1P/gPk5xzto56N+JoBq3cpHO5oSJntIc8BGKSTaeAC6Al
	74Kbmln1QDwmvB3FnjuAlqkVUXwL1Yyr9RoK4WTU++CAY4zzOYTP/JcsG1D/RCfpw+IDHCpppnn
	qOqxo4ALaM0cd3ChoZSw/HY5NGZc62Ac7T6RFqey/W3vljhYIVc0ts1EpeyX4gXrBGpp4UTYLEG
	e3XsQsd0fa4sJEpQxYORK42VUDij2PDgppTDofo+DxlSqqBUzW2iIvGUB4BLlAO1QBxx8osBDUE
	iGbvPcZyvBM6uh1gf28VDfcKQDmE7xXHuP6+EvneN5Fp9sPFRaOzXIVzlzi8P6nsdwOStALhhOA
	e8l241U8AzPaKmbekK9zA5DXtYVIMK/G/qAWsUbA5sB2oZKanrzeqHUpPjCwa1FOiDaDaJD0lTx
	WydqTvu7zSNKl0I+p+QIxSVy062NzNWK8Hh7CpCRM83EishWJzFzb2N96WGIAvzVtTevBTVxdXX
	UtcfV+h1NiRc6NDMDkkbq9/8ybRG/Ev7A==
X-Received: by 2002:a17:902:f690:b0:2b0:7ab2:d6b8 with SMTP id d9443c01a7336-2b0827a927bmr149389995ad.36.1774334402723;
        Mon, 23 Mar 2026 23:40:02 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835429afsm128416545ad.26.2026.03.23.23.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:40:02 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 24 Mar 2026 06:39:34 +0000
Subject: [PATCH v2 01/11] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-send-upstream-v2-1-521ce8afff86@chromium.org>
References: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
In-Reply-To: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774334401; l=1212;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=g0tTzL+m8OoXUsAyqNr7/kY2I7leLpyd2bbtWafD9xc=;
 b=e9WXzKEaP6dKZsubkQtfy4jQ5em+iOpYLHwdy+xoCyJJ+pWSMrJ8EtnerWdutqavxYwIMquzd
 W+ZBPSj7126A1zOwtkXYQKscPXUXvqC5leMmWC5njPZNofkO+xsI7Tm
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
2.53.0.983.g0bb29b3bc5-goog

