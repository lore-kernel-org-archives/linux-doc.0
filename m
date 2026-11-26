Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661028;
	b=XxuxwU6G3yA1Ionj0xPZAyeyGjN79kkV3lVF6RAdyPS+pRWhzM2Kqj81dZVFXIWhM9mj
	 x3Dc/Am5AQWN3jPlOUsllU+5L83UXKn53OvAv0P74qrOWEIf/P+8WC0xuNSdPX98Ot2fn
	 9/5hlPcLh+x+XrTaReFWXL8s0DkZY7Ex8sY/t0NNFxuD7Uo+6IDKYyfEPPom3T+BhwARn
	 XbXgGPFKiRA5CRy8+1lD1CoZQBnizgSuI9yPMiyzedbH/xcKuMES6zSXesg5DjblzItHS
	 6pP/HMc6oSkZr0UhN6ULe2lpK3LfbRIjhA6LUIUChV9rKyO+6eZele9D/DyDYvEV97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wlB0rbo2aRHGXw7eVLnZ6xPO6friQTpYCVcGasiGcT4=;
	b=nO/QyRDZqqN2znlC1fUc+Mf94N6EoBlafX9VlcReDOTwXI3KI8HeuDat0gPx7BL78JNF
	 I3LQzLEnlNa3HJCHFewnrNDYPI7NtES/1lKAEbagT9BBhlsNN1fmA0UeFZFoPWEZdnrHk
	 l2vzqtMFxSZg/q6wnAwvEtXAzuxIFbwiaC00HxQR3NPYw2NWs1xjWmdNaxJrxSxEF6bDD
	 mHK6gWEznWRHttzoTy13Zu1A5Uz+vCz2ncs9WG0YW73qHqwtHdHPNKwFxEMnhhXP4T33f
	 PRylT7NesopXu3N/+JpGRmA84zP46++nGQ7gqFoPMphbblOKv8n5ytJr3aX5U3xz5ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jz4NK4DJ;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B667606A323
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 02:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B667606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jz4NK4DJ
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so6894183eec.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 18:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661027; x=1796265827; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlB0rbo2aRHGXw7eVLnZ6xPO6friQTpYCVcGasiGcT4=;
        b=jz4NK4DJXBmQolbmhPdIrhh8SREy/rLdKzBNoXmGmylMmaSll/nWJb3IGnFwXe/iK0
         UB3xgtzp0xuFPSvEnRrCE6JozFN7BgkFYG2npatues7UdMYvzr0FwLK/VqCTP69ERr6u
         yqZOhk71A5Ed4bx3YIGbBbdrlRtZHvrQbUtn9a0Ye7f6pqFpqVhbCZrusvZKUCZT1hj4
         jgCWoMvlDyVqYHPDbCNBEuRb8Cc5fU3/pR32Y13hbiIIXuioabI5YK7ES45UQt19RD9k
         qIdQmzUVbIXe2DJJLSQ5tc4garDc/bMNP65QkTg5MqCxp9q3OXVIPW37lbE+LuXbazDT
         tfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661027; x=1796265827;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlB0rbo2aRHGXw7eVLnZ6xPO6friQTpYCVcGasiGcT4=;
        b=0u68M1dcummw2qCht0O1DDPNKYC3iRBfjOmESJCzMjFpFkLjA5VNHbq8v7lTGgyLMq
         GIGR6MqsQWVynd2e3A0Um70GYufBKXOlKjRzjLI0rH6TsPkEroQIBIdFFRA0RbJB7nv5
         LiQptbznUwRWDhg5h/ACaH7ukf637zA2jcaHk0dKszCQG2+LTw5cBv7dqn7s5AC2G7iz
         xR7SwLlCWsCxy1qVboGDLbky44zjk8f2xvhoGu7HM3j3xZnkOo7agAo68X9Mq46AMaPZ
         U6R8a4IxpgcrpoA/7vP6ihs/rAE2hjTeis6OTCAa74JuOtEm84akaAylPLPvNPC81aef
         JRzg==
X-Forwarded-Encrypted: i=1; AL+hErEeYUcOd3POXmlfcPSO+ziGO1s32USY9KmuuNU0W5S9qkHKgVKknrK++YcumuPt/Ddqn8WDpqWW4CU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ynsbAtt6nMx8v+uRewrQBypzkNUOh0fi3tOyLmxAEf8+yL5Hb
	NmMSE+LW7U0/c8xsSrHcOG0lP6pSBhJ6fHU4y7dDkroVPtz0mYSSZyWqVgmD9rpJjGNjcg==
X-Received: from dyrp20.prod.google.com ([2002:a05:693c:69d4:b0:386:b61f:b88e])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6010:b0:382:105f:e7e
 with SMTP id 5a478bee46e88-3857170e441mr24867685eec.36.1795661026952; Wed, 25
 Nov 2026 18:43:46 -0800 (PST)
Date: Wed, 25 Nov 2026 18:43:35 -0800
In-Reply-To: <20261126024337.4168845-1-svv@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126024337.4168845-1-svv@google.com>
X-Mailer: git-send-email 2.56.1.911.g883d8bcb20-goog
Message-ID: <20261126024337.4168845-2-svv@google.com>
Subject: [PATCH v2 1/3] Input: add ABS_TWIST event code
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jason Gerecke <killertofu@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

Some styli can report the rotation along their long ("barrel") axis.
This is typically referred to as "twist".

Unlike ABS_MT_ORIENTATION (which describes the 2D alignment of the
contact ellipse on the surface, analogous to stylus azimuth/tilt
projected onto the surface), twist captures the roll of a tool around
its own longitudinal axis independently of tilt or azimuth.

In the HID usage pages, twist is already supported as HID_DG_TWIST
(0x000d0041). However, this usage is not reported to userspace via the
evdev interface today, since there is no MSC_SCAN equivalent for axes.

Peripheral OEMs get around this today by mapping this axis to other axes
like ABS_Z or ABS_RZ. This is not a valid way to report twist.

As a result, userspace programs that would like to support twist must
account for the various ways specific OEMs map this, since there is no
generic axis for this.

Unify this behaviour by introducing a new axis, ABS_TWIST (0x1d). This
axis applies to single-pointer devices (such as styli), as opposed to
per-slot multi-touch devices (which would use an ABS_MT_* axis).

Document ABS_TWIST in event-codes.rst with its value semantics:
clockwise-increasing when viewed down the tool's major axis toward the
surface, 0 aligned toward the top (-Y, north) of the interaction surface
matching HID_DG_TWIST, supporting either non-negative [0, maximum] or
signed [minimum, maximum] full-revolution ranges, and resolution in
units/radian.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
---
Changes since v1:
- Moved ABS_TWIST directly below ABS_SND_PROFILE in event-codes.rst
  (Dmitry).
- Expanded event-codes.rst documentation with precise value semantics:
  clockwise-increasing direction viewed down the barrel toward the
  surface, 0 aligned toward the top (-Y, north) of the surface,
  non-negative [0, 360) and signed [-180, 180) ranges, wraparound
  behavior, and distinction from ABS_MT_ORIENTATION (Dmitry).

 Documentation/input/event-codes.rst    | 23 +++++++++++++++++++++++
 drivers/hid/hid-debug.c                |  1 +
 include/uapi/linux/input-event-codes.h |  1 +
 3 files changed, 25 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index 77a6c9b3956d..4f03dcacbd55 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -247,6 +247,29 @@ A few EV_ABS codes have special meanings:
     An event is emitted only when the selected profile changes,
     indicating the newly selected profile value.
 
+* ABS_TWIST:
+
+  - Used to describe the rotation of a tool (such as a stylus) around its own
+    major (barrel) axis. Unlike ABS_MT_ORIENTATION (which describes the 2D
+    orientation of a contact ellipse on the surface), ABS_TWIST reports the
+    tool's roll around its longitudinal axis independently of tilt or azimuth.
+  - Values increase for clockwise rotation and decrease for counter-clockwise
+    rotation when viewed looking down the tool's major axis toward the
+    interaction surface (e.g., from the eraser end of a stylus toward the tip).
+  - A value of 0 corresponds to the tool's neutral reference orientation (e.g.,
+    its primary barrel button or flat edge) facing toward the top (-Y, north)
+    of the interaction surface.
+  - The range reported in struct input_absinfo may be either non-negative or
+    signed. A non-negative range ([0, maximum]) covers [0, 360) degrees.
+    A signed range ([minimum, maximum]) is centered at 0 and covers
+    [-180, 180) degrees.
+  - Unless the hardware only supports a restricted angular range, the
+    [minimum, maximum] range spans one full revolution and wraps between
+    maximum and minimum.
+  - If the resolution is non-zero, the twist data is in units/radian. If the
+    resolution is zero, userspace may assume the full [minimum, maximum] range
+    represents one full revolution.
+
 * ABS_MT_<name>:
 
   - Used to describe multitouch input events. Please see
diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index f44e6e708404..2e9ff8a3b2cf 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3518,6 +3518,7 @@ static const char *absolutes[ABS_CNT] = {
 	[ABS_HAT3Y] = "Hat 3Y",		[ABS_PRESSURE] = "Pressure",
 	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
 	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
+	[ABS_TWIST] = "Twist",
 	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
 	[ABS_SND_PROFILE] = "SoundProfile",
 	[ABS_MISC] = "Misc",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 4217950e5d16..d4ed115fdeca 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -892,6 +892,7 @@
 #define ABS_TILT_X		0x1a
 #define ABS_TILT_Y		0x1b
 #define ABS_TOOL_WIDTH		0x1c
+#define ABS_TWIST		0x1d
 
 #define ABS_VOLUME		0x20
 #define ABS_PROFILE		0x21
-- 
2.56.1.911.g883d8bcb20-goog

