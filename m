Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BCF43553E
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782800; cv=none; b=sXPhX2NfkbVWHO2X7QTfq2UYK/+NWOA05rlcpe+ypDf56SpJrqXSZdDNktMTLaWZqJXrC2Muz/72pSz1sdLRMveyV74FOpGJoqAZnOLX3bkQhwi4skQJuUcVfTYp/kPVGjBXJUKJWXk16d5f0oEuVaue47BGa4Y9L2VfvDpaMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782800; c=relaxed/simple;
	bh=8u/qkG7wp8Tnfhp3mb6hbztJWkMu+m5Wx8tTB2tw9fQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KtAefqsdX69/eX0Kn4yh4pfC+p7o8x/NutrevTtIMr7JrAyKYk+tLdmbwrrTIj8WCkSTG2jHzrhzZDGdGd2chRd8kOwWzslGDhdUHbc9StUDo7aHQsJXdP+8RQzaAmFuRKTpcJHcXihxlijYWQXe1uISUVBAVsElfmlszGetDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU9DXDhc; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU9DXDhc"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso2051417a12.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782797; x=1786387597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsWWvcYaCFCv1CbGg2pDl41UZP3CmZipcaKgtx2duHQ=;
        b=FU9DXDhc/5buxFJkdpsreQ0cc7Y05Bpy143T5BEAlgLMTH/41nfavtZOm6uWGNgiF8
         vvvK8BUfVMmW7XKtlAdnlpT/MgYVyexeci4qiJAaiCDodCtvr650r+O9aK/pk5AteIpE
         L/eg388NsXU1KbEv8L1nerRVscDQKSoYvvyJRnwtLMkp6R1j6RsgX9b2REp4+PXeYMkM
         Am1rygwQJHsfbnpTaNKJ89Uu5I3+RMGcywADapf5iXjNgop9dUPkH3ML03K3K3QMvN2J
         GovlCJeF0z2ntizWH3hyfr/vQnD6raA/MeS7ddJwROvNxW9As23fl12qAC2aJ+s5Slqj
         iLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782797; x=1786387597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PsWWvcYaCFCv1CbGg2pDl41UZP3CmZipcaKgtx2duHQ=;
        b=A6i5z12wQKD9shtCHhe/wgw2S1bDB6JitCCfeoUvPQY2vQWx4qyazP1m+kdiaxdByD
         o4Agz7wmxVMPmxMJDVEQwp6wuVXj1rMul8LZLeb6cUQt7WhYW50geVndLBYVsf4iIoX3
         0hJOKansWEXWuRjJWy34RBjciucnc+KSU/QOTRAgE/KIZGpzviXH+JCI8bkz0qrxWhK5
         G9dKol1Qaow3UmfSifHTLBX3crY5qx7LNlsXrWlbrrphJ/FluDSkShN2XS/YkjLJWY+l
         mCOaJop0O7vcQRPw1BsbarCMO9yNO/bzROCtnKMgRVYXOMm5u/3Qt76NAV9H6gCmFXFI
         nRRA==
X-Forwarded-Encrypted: i=1; AHgh+RoZM7brpS20AcUb2pwqo6w2bwSFilkVoli+DQOtkjRsnbj8i0xxEK+7ttKtQjJmOIsSR9lXBffLSog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz086dybxGM/e3saV6t9QPMC48Q2WpdBzHIvp0889G+v4lN6mX0
	ldYuyTaSNrslYYX9tNLukDjTKHLmFRoWnkLnYYpRUKg5G3pdYSpUFIar
X-Gm-Gg: AR+sD11FrE0kS6WtNHHTBQZHjaZT+h31vvgSYLm7Z7QCKY0zu8M4H0sAPHQ0LtpwANx
	yjiSJfONpq/7+h/AhKjJ80DkIG6/JqtyUD8WJKC7vy0JjgPhqZ802cQXJvp/yPxgNmxGMvVSkxl
	leJcmPm6FIVP5oUOy8z2NiifRqZq6T5QBZqpSOnKwwGn5L6USx+qfwFT5WZgXJ+4y6USfD8Bd8D
	Zma9ja+xhmrgX62Ef2HpRlsrey0+fXecTDfFwRdtOzi/+hzKN53lrEI8V7/0swDWy85xXNxMHxn
	MRu+T19cGuE+JKrmWEI3o9ITKJzzQJB+2NQ0r4jjcGda5sU0k4hCiiyfypdw8/JoiM/hEZqEe0F
	DTqR4+nNUUOA+C8Ep0ut0QNzq6Ycc9vU2QhxaN7feZmoomkBfJ9syXU6Snwzi0Ezdi5HhHH+SYe
	XxgDS2WuwftbbNELZqTkdnvBqhM5Zmu7K1xFQAZAX/uG3nOSDpmdtY5NcwydvyALHR2tqhFjsHx
	/KtGdXH31oWfjeRBtSNxwidqf3oED+bnavFcqlNzgALtcs/i+UJ
X-Received: by 2002:a05:6a20:7f8a:b0:3c3:875d:c531 with SMTP id adf61e73a8af0-3c92a598347mr11161616637.6.1785782796909;
        Mon, 03 Aug 2026 11:46:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:27 -0700
Subject: [PATCH 02/21] HID: add documentation and Coccinelle script for FF
 registration race
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-2-1dc9bbacd88c@gmail.com>
References: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
In-Reply-To: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, cocci@inria.fr
X-Mailer: b4 0.16-dev-b242f

HID drivers that rely on the HID core to register input devices must
ensure that all private data and capabilities (like force-feedback) are
fully initialized before registration.

When hid_hw_start() is called with HID_CONNECT_HIDINPUT, the input
device is registered immediately. This is racy if the driver attempts to
augment the input device in probe() after starting the hardware.

The correct way to handle this is to use the .input_configured()
callback.

Add documentation and a Coccinelle script to detect and prevent this
anti-pattern.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/hid/hidintro.rst       | 50 ++++++++++++++++++++++++++++++++++++
 scripts/coccinelle/hid/ff_race.cocci | 34 ++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/hid/hidintro.rst b/Documentation/hid/hidintro.rst
index 73523e315ebd..5d367dfca0b8 100644
--- a/Documentation/hid/hidintro.rst
+++ b/Documentation/hid/hidintro.rst
@@ -522,3 +522,53 @@ This should really be your last resort.
             vendor: 0x093a
             product: 0x2510
     ...
+
+Input Device Registration and Lifecycle
+========================================
+
+HID drivers that rely on the HID core to register input devices (by using the
+``HID_CONNECT_HIDINPUT`` flag, which is part of ``HID_CONNECT_DEFAULT``)
+must be aware of the registration timing.
+
+When ``hid_hw_start(hdev, flags)`` is called with ``HID_CONNECT_HIDINPUT``,
+the HID core immediately parses the report descriptor, allocates ``input_dev``
+structures, and calls ``input_register_device()`` for each of them.
+
+This means the input device becomes **live and visible to userspace** before
+``hid_hw_start()`` returns.
+
+If a driver needs to perform additional configuration on the input device (such
+as adding force-feedback support, setting extra bits in ``evbit``, or
+assigning custom event handlers), doing so in the ``probe`` function after
+``hid_hw_start()`` is **incorrect and racy**. Userspace may trigger
+callbacks (like ``play_effect``) via ioctls immediately after registration,
+leading to potential NULL pointer dereferences if the driver hasn't finished
+initializing its private data.
+
+The correct way to augment an input device before it is registered is to use the
+``.input_configured`` callback in ``struct hid_driver``. This hook is
+called by the HID core after the ``input_dev`` is fully formed but **before**
+``input_register_device()`` is invoked.
+
+Example:
+
+.. code-block:: c
+
+    static int my_input_configured(struct hid_device *hdev, struct hid_input *hidinput)
+    {
+        struct input_dev *input = hidinput->input;
+
+        /* Initialize private data and capabilities here */
+        set_bit(EV_FF, input->evbit);
+        return input_ff_create_memless(input, NULL, my_play_effect);
+    }
+
+    static struct hid_driver my_driver = {
+        .name = "my_driver",
+        .probe = my_probe,
+        .input_configured = my_input_configured,
+    };
+
+Drivers that require even more control over the lifecycle should mask out
+``HID_CONNECT_HIDINPUT`` and call ``input_register_device()`` manually
+when they are ready.
diff --git a/scripts/coccinelle/hid/ff_race.cocci b/scripts/coccinelle/hid/ff_race.cocci
new file mode 100644
index 000000000000..479f5d1e3184
--- /dev/null
+++ b/scripts/coccinelle/hid/ff_race.cocci
@@ -0,0 +1,34 @@
+/// Detect HID drivers that initialize force-feedback after hid_hw_start()
+/// when HID_CONNECT_HIDINPUT is used. This is a lifecycle violation as
+/// the input device is already registered.
+//
+// Confidence: High
+// Copyright: (C) 2026 Gemini. GPLv2.
+
+virtual report
+
+@r@
+identifier probe_fn;
+expression hdev, flags;
+position p1, p2;
+@@
+
+probe_fn(struct hid_device *hdev, ...) {
+  <...
+  hid_hw_start@p1(hdev, flags)
+  ...
+  \(input_ff_create\|input_ff_create_memless\)@p2(...)
+  ...>
+}
+
+@script:python depends on report@
+p1 << r.p1;
+p2 << r.p2;
+flags << r.flags;
+@@
+
+# Check if flags include HID_CONNECT_HIDINPUT (0x01) or HID_CONNECT_DEFAULT (0x0f)
+# Note: HID_CONNECT_DEFAULT is 0x0f, HID_CONNECT_HIDINPUT is 0x01
+if "HID_CONNECT_HIDINPUT" in flags or "HID_CONNECT_DEFAULT" in flags:
+    msg = "WARNING: force-feedback initialized after hid_hw_start() with HID_CONNECT_HIDINPUT. Input device is already registered at this point. Use .input_configured() instead."
+    coccilib.report.print_report(p2[0], msg)

-- 
2.55.0.629.g250fe7f194-goog

