Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A3310784
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095183; cv=none; b=sR9Vy9OiaoY51fYcsjBtRe6+cklz7U3tartF9ncpzmDeCc9qHhKFFXXN7sbRqz4URVMWP7hBBv08FQ5SCn3mWyDyMX9A/CtD17jkKbtbVJjb/7h4gXu/qAEYUqWtsAQGzM0Jqwfrr1NZcNO1/j6P9IPT3f9QkJbQilJJriBsQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095183; c=relaxed/simple;
	bh=BDcoGzUEgpCGDfndnWpejoVBe/vKuqQ4SnpVtpHMd0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmFpaKvRSh/k5FMoKooCobSDwhtbOU0rsk5YFwFr/1JCWdY2T4gaSx2O4MAtO7Yb95WhCVB1j0tzsKuTO3/wGNkGJp1+Ez1b+WgTMfJp1JbYtU/JXkcLXwfpunPc5OKjIJkwQsZo3zUU0mi7k3rY2ys2/fbJDQw3kRS7qmA41Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JyUMCfsE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JyUMCfsE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab077e3f32so997015ad.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775095182; x=1775699982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzHrAn4/x3CwheBfg3e0ZTKZNKx+9iUkLN9KNaFrA10=;
        b=JyUMCfsEzJUvnAMUaH8pFk7JOJz5S6j4yc2RPRMEDvcR7+AHkR2RcjSaIaWqcS1bk1
         pYXgyC2RR8ANzfyWQI2dZu03PBe2k9eQDah7UHIYUoXK+HKo+CrxeS0+HybIbbmEtud1
         M3Tr2cQDeNwYp6bFGqBDUUyAFrSsM5AQoXgXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775095182; x=1775699982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzHrAn4/x3CwheBfg3e0ZTKZNKx+9iUkLN9KNaFrA10=;
        b=bykRw0iLjZsd11kQBFFn7bJVojZXvt2BAMHiKlxNe9Dck+cSJX3Hc6A6SxGnUOpEpo
         rXLBpQQKQW7D6f/k8CJv0RMJ3o8HGMM/9AI6lf/ka3BHF2AqS9SDKNPHpS24vU/Zy2jx
         qrZlvkIAp3hhdSqZcKn0cZDa/NIErWZsZ3CDURbp98wj6xBKPC/Px1eUZdGo0ez0cK+S
         5CBLDHissKGJm+NU/VIjVR7LInE7C08sY0NMOMDPX+FibwLq968zbZVhnh7YUcFZLkkK
         aXPGz9CK+El7ZNGqdDBuqk0zmpGAa1EgyQQMTw11j2oo0K3yi3xwV7Pfyw9aL9GTB5l6
         2d/w==
X-Forwarded-Encrypted: i=1; AJvYcCWDhNuvgqUufJ3Crkj/Nd82xuO5CfaaurrivUH97lIYrXK7lTQlVgZNkQ+MOny3D4B29OtUidyMpB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuhSfXJnOubIpNecqWbiClkge/8c4T6NqyGOm+PliYN9iWwojg
	qQ8CeEbZgmNmxVN5Z1ZPZF+5WK+PXpGcYxScGz2/9GnPg9V4V5vexbNXFcA8fpu2Fg==
X-Gm-Gg: ATEYQzzi2cZRoErYw9HIsXFTSYmnq8dU5FFZUd1KbblzyChlFuiNvox1cTQHD2BWS4g
	irPo/Umsclmt28kS5JZWqhfhHnxwbccRtvlI+kiqcPaUIEu0f4T5ATkYLZebUXr2bUOHau0Ple1
	yTNgMmgiSuWT8bnv06VNMVeTsrengUBs/l5FB3KnLlpg1Mp/R3F+mFz/KrR6DtFg0kLbyEbfy0n
	oMinx2NhhAPFz9aGtOKEMOmPs9OMQxFYsBPQFSBt0Q6zZHpgf38R+geyDC69ZFxLvLPbJCgFxwk
	MJVsjyDnzLZz2Vdf+Iiuz/cBW12P8c88aTdHPnsE/qizaI5yHicb/WqT22gbtyBvBndk2t8U2lp
	5OzNPw37/6ZSTXFm4hYFUKxe9FU3f6KktzBCl8vAAR2TamdK7uSc/71YD9E7Vh25r0stpVYnmL8
	S+lbJm6Vdv5h0ED3TwNVSd1mgtO0vcMEMSFpO3X/zwGjI3cdDkFGL98fxIk+6kEL7+z/u2tWdAs
	37rSRhPGeSGGkVqlU8LVHRwM6uBxlpOCg==
X-Received: by 2002:a17:903:b8d:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b269c9b80fmr50932815ad.27.1775095181703;
        Wed, 01 Apr 2026 18:59:41 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm11187535ad.29.2026.04.01.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:59:41 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Thu, 02 Apr 2026 01:59:38 +0000
Subject: [PATCH v3 01/11] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-send-upstream-v3-1-6091c458d357@chromium.org>
References: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
In-Reply-To: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775095180; l=1213;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=sHkk34xkCVNuYNvgvLM4yfgwiPvB0kDmMlwDb9gzQSI=;
 b=sWAbum2KtSMvIZHpotQFRl3qPX0w5lDPo0wVXGjdcQZ4Iy/Q1lBj1M1z1kObb2Say/DR3abDE
 qMXRcGAYSZjCwmC4SoKf0troiioLGh8ZBZYI6TTyyS5zWbVHFTQHQ7k
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
2.53.0.1185.g05d4b7b318-goog

