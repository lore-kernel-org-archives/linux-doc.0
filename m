Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB7119D081
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376368; cv=none; b=PT2DZcm93Y1t4qf5cwMGt/6Qr39CV7VJOJq3csDvm5ua6TnoV4H6AObo15+BIQauvm+5w+0pAghUrmsYPCKbxfAgt3LTRHovgRGKSlwMOwlrdnS1vdb/2kfY4uRtPhirx7VhNOu6/ej2lIJP2sNV1EAAG6/YQfdxgtebDNdh6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376368; c=relaxed/simple;
	bh=Jh/783xqciUdedh9IDWPXZ2+CVD4b9ocBmZqKoH0yfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXfvzF65xj+7X1eiG5lWC3YECokudNaVC5Zf1WqcDeqMtQJ12AS2KhaHArY2ijO+7v4E8x4zqMFlBjvXnDSmQbQ4u6fg1wBQvv4NNR3Ae78pzAHSp88VVcOoGQzjqQFMdLeeJr9EcnZtFVxY+Ih++MC+cYP7yYSME7JwmDaKgAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5xWHzJa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5xWHzJa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2958db8ae4fso24016825ad.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 16:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376366; x=1764981166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/sv0PvGQwRqr1vhXxlC6sNnbZ+cS/dp1dWnLHgBvKk=;
        b=m5xWHzJaC25waKlq8PWRMMsWaBuRYjbdHb4bxvMtihJg6qriRih3ZS1UjNSVBmv2hp
         jjzJ7Px8EV+BkMtlM4BDvuPDg5pXOKX1V4TW7x61B6tFGZLaQdzQ4nkvnTNBONq3v4j7
         i6FwR70xsWvB22LsB4/UBwWR6lZgg+EhPirPTOehl3qeyLkqLHB290vMjPGOQr0Smfu3
         2Ukszl2IUwqqhYhlmuArNcetE19nVMjQ8SSYDc0q87f14ibs1mQ1W2QFMl2h4Du8clUD
         dTStBoYiGDQmUtt8uTHn6VbWq5EJTCJ14NsTD/kDMLnqg3hujMxyYsIde1Fe+KQEFhHT
         Nh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376366; x=1764981166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/sv0PvGQwRqr1vhXxlC6sNnbZ+cS/dp1dWnLHgBvKk=;
        b=FAMslc9Rz7+0pcRD3Vmz3TZLN6splwyD1ILB0vPEuy75NuFngvgsQb8ELB3EQLgemC
         qUvDgqu4VEUralpnzC4ZOZavGUG44oRpji9ks1Z819P8aXQ0CCnEImaAyrnusGGEm9Kw
         aF7coOvqVknAp5NRhYpKOuwrbuUKGOSC7YubQN01H2QSiP7Adq3FufJC99DHx97qzu8U
         1H9XlOm2CsofPCpfHeGQ+Z8AMf2mu6Nc6hHIHXjAckMpj3YMH8S8+fPMSXlQQ3h/nt9p
         r4w9UNCkKZP8DvFV2ZdZPkeCXWicdtc6iNLb14DapET7nBi6X5dBaAud8d9ijtxKhT/I
         D3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVGDEhmxiZ0Sa3TwouK5gGye309Azv57dvO/KBQjPcYNSVLRJ95yyqyIYn6vlMeb7FU6VSuf4AkmnU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CLTuLx2gf7SbKEIhtj/1W78MKzGHefLh5ms3cQoc6enqvfb7
	biXVFsS6rhV6kGpRapsJh1+PIBYWnP9707qLhk1Dmv7UNCLszWEZGV7p
X-Gm-Gg: ASbGncvnhAVdaOlPLPHzCQDGg1NI6R/H1jdIlpWHUiAGm65WrvBaZe5/RgXN0RRcN13
	v7D6S591tJuIVNgdu8slZK/3Y2Hb5o9DXhZy7ZrMzPpctsOLBIKg0ntCp+bRlv4423tg44VFKP3
	fZ3PP2wQd3xrR4pzouhDJIpjifxvn3zrCUORkQyI38qIwmqddr1RhQLfKL973wXaM1QN4M2TN95
	Q5H0fOdiR4D39PCUbkzCCCCRJxPLNdBPaJbWUkOaozhxP2yaO250ab1R8pnWKYzfLSJy5hU3x8p
	i1LeGGoVoYbMRUEzXwV1oWyc7DoJDzciUY9gmPkpwD+CGuEZ20N2bAXc6+Guf7Gw2JgrwDchJGn
	At0QNq1Oq0GnWAKF1qHbeM436YzuJlJtMGPajLeM8ZVvcOyWF5m/XgHAXUzq1ryat4atvVX5hL6
	ZcP+dX/CqXPFu4GsryeZiMz7+Jmgk/Zl10Pm+OvGNNH/yXxZOO6elpWJ0zgVULCzQgYiYlIofIy
	flb
X-Google-Smtp-Source: AGHT+IGaG7HX0TRE9DPtAnNXxioWmI46iVYPjVATZ6u7cdhnEXZz3iP5AEmvXo+W0mfvPpLft8hqUQ==
X-Received: by 2002:a17:902:fc43:b0:295:6e0:7b0d with SMTP id d9443c01a7336-29b6c6bb2f3mr323906235ad.56.1764376366189;
        Fri, 28 Nov 2025 16:32:46 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:32:45 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 3/3] Documentation: thinkpad-acpi - Document doubletap_filter attribute
Date: Sat, 29 Nov 2025 09:25:33 +0900
Message-ID: <20251129002533.9070-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129002533.9070-1-vishnuocv@gmail.com>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the doubletap_filter sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..a1e84d25e151 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1521,6 +1521,26 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_filter
+----------------
+
+sysfs: doubletap_filter
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_filter
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_filter
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_filter
+
+Values:
+	* 0 - doubletap events are processed (default)
+	* 1 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0

