Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446C2EB87F
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562298; cv=none; b=At1xO1ARfblD7AY7+mC8l7dP8apAWmz6CC+zRSDPp9FwY1GT94SKIsMzJyUMyN+bydqrMsAcSukAWnGp7WHjwOxH/amSBs1RBiPZEMnkfZYFZGUhkOg0JCwU5C3pMki7i/aYLTxA3IWcsX37N3SRRIuHSTrl4XyS8gzW6YXPF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562298; c=relaxed/simple;
	bh=C3JR6g0Sas4kB+Y9QTc/bGVdciXlgmAK1IrGoVCuBt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxPtO3RqWQCpDGg70z5R5pBxNUy7urunGaICis96wTY1JrympjmX6jhkh1JSGa6e4cUc6SUc+BG48MGCyda9sRySy/27EWnibg5bAlDQ6M+Q43XS5vZs8urnpdkCNQJobT7TJ+eorvB/qVmYQECKaTvR8GRkyOQUZ1qwx7oL0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRcDpRW/; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRcDpRW/"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64b4b89c482so2801256a12.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562295; x=1768167095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNOBG85Xy8cdjBjzjHxVJyG6BfNKbQYZeOQLA90PZUs=;
        b=dRcDpRW/BcZFkc3oHHO0U+nEQmu4slDBW/M7ASx8BUzdYu+jjHDCAjzbMxGm8aZ13Y
         +RsJbxgc3EY6rGpwITPfjXnqajV+P/m9bMoHRqZ0VUjgvJhgX3HEaV0vgp5Rrk/WaFmB
         6F3drwlB9/wl+UK9c8CUAPVjhJljkZYbhyjBaIeNSb+YyGTVt7G8wsO/UvhHrAKyBTMv
         nOX+KcfkHfgfbUvpek9sCnqMgqPiJjfLqZRiKWCIKRtYScoAJ8mX8cyKXuQDbXV/I74F
         +AegRp1v76a+xENR5TThaDPxwtIzJXm8qVkE+pvEc3Nhc5eSXFyLw+BpW3/ntcprOXFg
         6YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562295; x=1768167095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kNOBG85Xy8cdjBjzjHxVJyG6BfNKbQYZeOQLA90PZUs=;
        b=AVol3g7nyjnJcwHYbRgMVdILWZcPs+xgBdPSay8UHwhIM6Uf1xEK1XbjawhbslmuJ4
         OaXi6GSXYlfR+jsDoO6isDgI4ZEcwqXpJtAYeW7tTPD8GusIeJSKRCvWfXSqFagFWQKa
         4cHxmwrElB9j9XRYqjH2ki+WDwB3KyymjsECXih1vgEEpOZgsBkrGP9EriWROj60DGfN
         PyZ/T8EGSL5KGyDyLDuSy5ucPN1UEihYK0KxYeVriRxE4vJ9kqgZBPqwdnp46A6JkfmP
         VdkvaBo2CnAJUsmb1rtHqu2zIntZ5Ke3KKhVVW/boXTjU9/V3Y9V5fNuv0e08RzJ063x
         FPJw==
X-Forwarded-Encrypted: i=1; AJvYcCXNTF56lRpszbiN2uZW+AKY7KQ/WJLxUFb3XzzhRZt6uuvWrTEqMmJHGRI1uxKlJRR1AGYlVU8PfV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8VN7x9rp77VDZc9EabVwimkih8zE/Trk49tgniFzi7xETZWzF
	Ot1oPycoOb8VL/b3y3jRRyxvnuIBGRxLa+6FeTQedK/OzzcghI7X2LIg
X-Gm-Gg: AY/fxX4xcMsoDTQbL+FDZVFaI76LJ3NK8T3v40SxajGjKRyzY5C9esVvq9ce272+hHm
	ky/W29cH6NsTJ0GMbS88HAdzjIcXM1OGO2IDXPv9JfT0Ph+tYhEIaed7OixAyo+PlvBtv7K8L96
	4C0v47v5Q67EiB/ajoYLX8S7ICnAcsileQqpH0Pq59CVjQFH+csPHjKkWEB8YRlz0p2vMsHOZSp
	pazEcsOcylGZ4Z1UrT7h/TVx16PktVxmFTZ7NTxlg0vLxJOnT+OP7C+3zCzW/CFLGqfP0LEAL2G
	LH1ENNNFHsr6y6WpcZ0a4uC9EH58j8wxt93x/f70hkYHB3yxGTJz5M6l7UMN8wGLgnNsMdzwQTV
	5kUf8h7CwfIGSb8NXbYIeMYU3mx0hDP13kuh2jLr5+Ty1UOLgpO0Zzv6wEKUMtLi0IngVqksVvY
	Gh+mLhUvx6TxUfZG8B0FLy5CCsmxwHOK7UvTcNX14Rm/SHeLHMv36CoBSnLFLbQTTb
X-Google-Smtp-Source: AGHT+IFp1Q3/HUuxiOTFczGNZI4zqQO6mImnPSIg80YYgcO2gFHg65+7gjjTh3EfyWvi5spIDfDlww==
X-Received: by 2002:a05:6402:3550:b0:649:9aff:9f42 with SMTP id 4fb4d7f45d1cf-64b8e3a43e5mr24517580a12.0.1767562294773;
        Sun, 04 Jan 2026 13:31:34 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:34 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 1/6] Input: Introduce EV_BTN event for generic buttons
Date: Sun,  4 Jan 2026 22:31:27 +0100
Message-ID: <20260104213132.163904-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will be used to fire generic button events that only transmit
button number and it's value, not related to any defined usage.

Made for HID joysticks but could be adopted by other devices.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 Documentation/input/event-codes.rst    | 5 +++++
 include/uapi/linux/input-event-codes.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index 4424cbff251f..c387eaa63dfb 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -59,6 +59,11 @@ Codes section for details on valid codes for each type.
 
   - Used to describe binary state input switches.
 
+* EV_BTN:
+
+  - Used to describe state changes generic, numbered buttons without defined
+    usages.
+
 * EV_LED:
 
   - Used to turn LEDs on devices on and off.
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 30f3c9eaafaa..1c853c37b58a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -42,6 +42,7 @@
 #define EV_ABS			0x03
 #define EV_MSC			0x04
 #define EV_SW			0x05
+#define EV_BTN			0x06
 #define EV_LED			0x11
 #define EV_SND			0x12
 #define EV_REP			0x14
-- 
2.52.0

