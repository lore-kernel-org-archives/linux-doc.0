Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55285379C5C
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 18:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790446142; cv=none; b=TxT8MrCS8KttBKa7iHoq78ilXzjzqO77Us7UqDyeEFTW/J7T6PxPxJqtNwYElEmhTKgoWbxNiedH/PIbYVA5s86oN50BFUmHxqhr29/C85jDXRlZdLU3jNaK7cnlSiP898WqYobmmOFxbuvuJW3gV0ppX1eFAQx4Px12lw8bx44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790446142; c=relaxed/simple;
	bh=Rpoqo/LAKWfUX3MyC76PV9C9VzGFsJlzurqGevU2VRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEebKCtAVyPmZQ9l2UWXZGr7eubC4nX/jxgSyfae83P8msKNM31F82of696dTMHZYexEUhs4HZfeaXVCWIpqxzk7SXRo/uk/XFRO16ouHxaG3/zEwB+4TXMmYSiCmkV1jyK4T/v0+vazUtusMOz8CYqQu5VR9dq8BxEBbceLjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKQuoIYZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKQuoIYZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so20861205e9.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790446139; x=1791050939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4TwWCzTQc4rX6168G4yldJx8YNbbiNpoduODQNumLI=;
        b=TKQuoIYZBPhKfLMvkugYfr1LIQfp2eo1yVA/X7WT2Wt4cF2RuyXvvwGAfva7TZtfkp
         s5Bos8isEquEIrsHRnmz6zjaumikwQOGj2y3SsL22izqW3FXw8cNfeVvpHt7zsDiIge0
         5OFZAiOL86OkgV7JYJY9xpnTleupZ0MswLUTK9QglyG82WFUXfbU9dJI9X3E5Oq0gp8s
         2JH8dDa4ARG5Nr8t8Obq0PvbAqc3ELXiWfVdvWxMoAAcRZFQtRgI9XlM7EizrsLZLng/
         +T1eojcWcg/xoKQ5kufxs/E8eZEnsZw+mIYzbFCMaBVPT4mptjNSqvLi9fUE0Cg4GD5a
         1/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790446139; x=1791050939;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4TwWCzTQc4rX6168G4yldJx8YNbbiNpoduODQNumLI=;
        b=zbSBXEiX2p1SJPOoucYywXNdJepSBw7da21xH2ylbZkR54kXUQZP4N0eC7dBb2GoZb
         9dDUO8x/oFqtYIMRa70l9WZXOM2x9d7Cn0tXKT1iyTi4dHnOA+Yum7DdfC7ip/oPO+dG
         xBMOiAzGuOox4KvhkeQYEwH2/Xw+7XegClKZiqhshtToNuDEyS9pEv/2bG8wE5gRvvve
         p04SsK67OYHLMkLM96UHEGksLS/qHTRqS1dVZKTPI48Rp5VXE5tIZG0ala0SLBYNktJc
         H6+PtHlcv34XiM4LEDeSUeIvN7Ogu+L3TmNiaYt/zhRLFubo6gXyd2xb/VO2v2akFJ6p
         r0bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxCF7IfY67qBfQp9yZi7SOdnyL4yWMeac+Nsefb4VUGoItbTFmq8pVJWFqs0ScpFV8ltazvF6zKWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mJFGKK/XgkCCaPywNIx+JQ3jzDj6AntnV0gyK/C14yNIPaP7S9
	qKN1SG9DoimtUgJkaG0dYqFcwpB0fmZgm+0vLfvIhxAsW1WjbcE5j18=
X-Gm-Gg: AYBFou3HztygGz9TDwsJBUTOm+3EX+9/OTJ7H4CpHrh4DtZzFBBzptHOq2+JQSO66+5
	e4eWhkYWCTl9MqLwzoBfR1cFrRDSLujKS9Rxwujthf4PSfIDpteWvmOzyZyKhMMoUNEa+fX2sJ6
	+Hp1Iw4ZWdqFHx6eC4u3rC82G/pmVhenJ+rWXR6CaEzF8IvNMgLvx1MnlKqi65uH4m6S2Y41mOI
	fWGrcWb3UE8P0r7hsg0uL17LenKFiI+nXGJ3Dse/bnTasgV8Cy6cEEHQ9aoHv1poO/oAIN9vJKc
	gzMjNyXBq9IThsTr8bi1cEx6HCRFFImBloRqV/WsFLodanHuyyY75Sc9kvNJjTMlA1F8X3obGDs
	NW1sUydqss3D/WgE2J9whe0GAg38qdhsJ/KL0Ni/HBQKJ38PAvNSYQNrkPWPRzMgXKM6NokylPc
	+ZP+mj/t4Fv8Lf1QMnN4jCf8/a+bpvo9UNYGC4R4zXdlMPbENejUZNjAK4MHeWy0HGgXs/8T8Pg
	RUZQUG5POp736mHESWtEFUDUwk1TpMmFo3UhZETRU87xDc=
X-Received: by 2002:a05:600c:628c:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a000f41d51mr1214755e9.4.1790446139508;
        Sat, 26 Sep 2026 11:08:59 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm111337785e9.3.2026.09.26.11.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:08:59 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: skhan@linuxfoundation.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v2 2/2] [PATCH v2 2/2] docs: timers: hpet: Document userspace API and ioctl commands
Date: Sat, 26 Sep 2026 21:08:38 +0300
Message-ID: <20260926180838.8145-3-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260926180838.8145-1-habilerenturker@hotmail.com>
References: <87o72mg21g.fsf@moria.home.lwn.net>
 <20260926180838.8145-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a dedicated 'Userspace API and ioctl Commands' section to clearly
document the supported ioctl interfaces extrapolated from
include/uapi/linux/hpet.h, including the layout of struct hpet_info.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index fe02bfd5d..cc9fb3e37 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -27,4 +27,32 @@ initialization.  An example of this initialization can be found in
 
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
-``samples/timers/hpet_example.c``
\ No newline at end of file
+``samples/timers/hpet_example.c``
+
+Userspace API and ioctl Commands
+================================
+
+* ``HPET_IE_ON`` / ``HPET_IE_OFF``
+  Enables or disables the interrupt generation for the timer channel.
+
+* ``HPET_INFO``
+  It is used to query the capabilities and current status of the HPET. 
+  When the ioctl call is made, the kernel populates the ``struct hpet_info`` 
+  structure and returns it to userspace:
+
+  .. code-block:: c
+
+     struct hpet_info {
+         unsigned long hi_ireqfreq;	/* Hz */
+         unsigned long hi_flags;	/* information */
+         unsigned short hi_hpet;
+         unsigned short hi_timer;
+     };
+
+* ``HPET_EPI`` / ``HPET_DPI``
+  Enables or disables periodic interrupts. When activated, the timer 
+  triggers continuously at the specified frequency.
+
+* ``HPET_IRQFREQ``
+  Sets the interrupt frequency for the periodic timer. This request 
+  takes an unsigned long argument specifying the desired frequency in Hz.
-- 
2.47.3

