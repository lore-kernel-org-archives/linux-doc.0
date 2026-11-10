Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276421;
	b=Le7M2YcUmOT9WxqAdN+zg3AltUubEP5xzBkAQaid/48utJxRYBtSN7uUJUaohW/SxSEe
	 B+QtWAK2yzS+gC/c1TKGSL369hJAowfD4xjiFGwHT98jx6Ps01PHqw7apeMsSiFKztV7x
	 XYP593qIgJrNUBBFb8vBiQT5J7/WE7NRAVU0DJdjzrScGMsKmLKvgwIAbEORj6r8a74km
	 9dtHBxHi7KkmzpI1n8oWPQKb0gFkFlTqIQr24BlegKdAL/Nhe9BDAArGdGXbQOXC70JKV
	 5obrle1nQBvxy66lyJ2yeHCobo3u0E5wpwZcyC7X82aX61aQJsRvpPWBbkO5fOFq6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=J0T89Mm+Cl6JghlTWTDFBiTbzLpBKNVNjiNMZMUxxTI=;
	b=jTjnwqvIfhxxLMDyr2+qua/p6sXu/atOCNhLbchQhf2GXQju9KNVpgND+dHvvbijqi2W
	 bghrFJ9t5kNPaV/KABAM6KA3hA4QHq6JTn7zCM/iPL+mXprFK/1+NHfd6WVE377/ctMHj
	 CATQCL4ANscW3kagPyxPC19aYMDcLO1ZJcZDId8ghgBVsfXgGogMBLJRsPt3tmT9KdSXK
	 QtF3vrSFCmn/HEJ4SKkKpgeHbK2hShXY/VC+uQXivP3lOlYMIEdOKhGi9mBnv2jviCx2d
	 d95vyOINSL2YMyItaia1eqb837IyRJuksMp7vT94x4drfe3hwZLcTqvx4ads1fbupjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gwlA4WxK;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A566606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A566606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gwlA4WxK
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso2314948b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794276419; x=1794881219; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0T89Mm+Cl6JghlTWTDFBiTbzLpBKNVNjiNMZMUxxTI=;
        b=gwlA4WxKRoU8Qm7AzOZOBh3c0l0w1+LqQmRHl996cIRG6B9eUUmxzSA+wkhZ7xBisT
         IjuGVK11H6TAjus85ZMvSqvh2kYcP5d8rCpxeHpsMDzvbKrFgf0Z3gJkTG7pTskA1tGa
         kAgEwf7XerlTcUtI1q4wJN45kiJLAnByVFiZigfGIFsHgoLF70n0WuBJw5OKI2iiLtq5
         2rg/jgWSxRd6wBhaoQ8Zh9J1LczBqOG777we6pb2bu1IQGLuZGXlRK3SJqSAOnzS7WD5
         YmYuZf+Z73qgb5uE4ldEDv9qRd88Tlj13rei6YItQuICaCVz00bKQ2AcK75sjJEY7DlT
         6J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276419; x=1794881219;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0T89Mm+Cl6JghlTWTDFBiTbzLpBKNVNjiNMZMUxxTI=;
        b=mFt4w2s+RfV+OZcoKG4b45augACT53z5M6rvLbGVpCjyH/qULe10N6jJ205BTul523
         7RzN9CZMAb9AP+mCouO3+6wI2ppkuZjFskK7ZhCh3+zJVx81+o7wdgfe/wG12zC9Q5ul
         UVYUqdp4J7cksamElohtNatK3qvp3omY/bGiNffPGMt/hSVdwWGd964VZOhNyVoyw3ab
         EREpy18y/QYiy3Sa+wCLmWdkHv8oGfwDSehNpfoORzXqy7xdbYLuYLPmOJEQm3y5mDvR
         Dd6dOFR9mXtdzqkkUDxixJfIDNulZm88oNb+6JPOgzCuJVFyp5NX8PQzXj+BpBH8t1rb
         IogQ==
X-Forwarded-Encrypted: i=1; AL+hErEaNkoiW+6YZtQIm31+GWt9QInB711dYObd2/2Bi8Egma4BGlVyuic54qBI8dlpIc/j+IJceA/dbWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qh9ae9qcIgpf3U5w2bJJaqOH8OCayMcNVtm4Y6VQ73nCCKrbv
	ldPmow9UjdGiEtqdRlsyMDfUbJ8N6m5vawftPoydpkBBzVpZ3sUbiwMLZ5rn2SlU1yWt1A==
X-Received: from oixg11-n2.prod.google.com ([2002:a05:6808:e7cb:20b0:4f4:b26a:174b])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f4c:b0:4fb:ac9b:b06c
 with SMTP id 5614622812f47-5683c9e2f4fmr1154358b6e.1.1794276419045; Mon, 09
 Nov 2026 18:06:59 -0800 (PST)
Date: Mon,  9 Nov 2026 18:06:30 -0800
In-Reply-To: <20261110020632.4003499-1-svv@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110020632.4003499-2-svv@google.com>
Subject: [PATCH 1/3] Input: add ABS_TWIST event code
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

Some styli can report the rotation along their long ("barrel") axis.
This is typically referred to as "twist".

In the HID usage pages, twist is already supported as HID_DG_TWIST.
However, this usage is not reported to the userspace via evdev interface
today, since there's no MSC_SCAN equivalent for axes.

Peripheral OEMs get around this today by mapping this axis to other axes
like ABS_Z or ABS_RZ. This is not a valid way to report twist.

As a result, the userspace programs that would like to support twist
must account for the various ways specific OEMs map this, since there's
no generic axis for this.

Unify this behaviour by introducing a new axis, ABS_TWIST. This axis will
only apply to the single-pointer touch devices (stylus), as opposed to
"per-slot" multi-touch devices (which would then suggest something like
ABS_MT_TWIST).

Here we define the ABS_TWIST absolute axis code (0x1d) to report the
rotation of a tool (such as a stylus) around its major (barrel) axis,
and document it in event-codes.rst.

The device can specify its twist resolution as units/radian.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
---
 Documentation/input/event-codes.rst    | 6 ++++++
 drivers/hid/hid-debug.c                | 1 +
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index b4557462edd7..f1f7fd502081 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -235,6 +235,12 @@ A few EV_ABS codes have special meanings:
     BTN_TOOL_<name> signals the type of tool that is currently detected by the
     hardware and is otherwise independent of ABS_DISTANCE and/or BTN_TOUCH.
 
+* ABS_TWIST:
+
+  - Used to describe the rotation of a tool (such as a stylus) around its
+    major (barrel) axis. If the resolution is non-zero, the twist data is
+    in units/radian.
+
 * ABS_PROFILE:
 
   - Used to describe the state of a multi-value profile switch.  An event is
diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 15e35702773c..594cf5248163 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -1015,6 +1015,7 @@ static const char *absolutes[ABS_CNT] = {
 	[ABS_HAT3Y] = "Hat 3Y",		[ABS_PRESSURE] = "Pressure",
 	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
 	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
+	[ABS_TWIST] = "Twist",
 	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
 	[ABS_MISC] = "Misc",
 	[ABS_MT_TOUCH_MAJOR] = "MTMajor",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index f410c22e080d..cdc718fc1c4a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -862,6 +862,7 @@
 #define ABS_TILT_X		0x1a
 #define ABS_TILT_Y		0x1b
 #define ABS_TOOL_WIDTH		0x1c
+#define ABS_TWIST		0x1d
 
 #define ABS_VOLUME		0x20
 #define ABS_PROFILE		0x21
-- 
2.56.0.455.g6c5a503b38-goog

