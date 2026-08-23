Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1303ABD8D
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 03:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787455821; cv=none; b=FzlZL+BfJAyYunYAvU35T29nsNji3Rw9bBD+ayTiaeQPZG8EF+8+3gNXA20mmVKgfQjIlwy0h4/Sl5EvwwPyMj5iC17WOgMe141c8l3iJy3/03XRjSFviTnmSUAEpyg/ODQW2rYr/Bb7AWttMLH11TqG0YnFw36yhJCV5Jjogfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787455821; c=relaxed/simple;
	bh=odra2VZjpA+fNo6c1sHn1YdBhevb290OHSdsszE1tR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDNV5Um2rcSQvK2FFNOWcyH5w427pu4RWOAig1Yof3xqX+Xs+BNBclcFw9mM3bQ1M2XUOd4R453lSsf0UOS6kqF8hTkBOD4zhsGnhXHBbu9lhR1QDkDm6WWCuedXxIi8fC9HzbxtmoGc3XpKIDFCZKHRxY6UMs5px5WP2pLSYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+Bxvo9u; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+Bxvo9u"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d5cad1a6baso21910915ad.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 20:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787455819; x=1788060619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stLZT/okqSNFXuljKE8tIV/AU6lfezXDB7JUzrH4ujw=;
        b=h+Bxvo9uG8oRyD9F1wmvLWyuP4iaPPcwTq5srStnEvFZC7lCerjAqLu826MENlzkS2
         mJBIjQRBOeM1mitPmnXO8e1pHTztct29V+goIremNuB42uCtZ2dWnNACm0oTgDevvhDk
         pnAY9TlIqroqJt7i8n8YV41sGEXb7SFub0qWJoc2ChE4yvdP697J5YFyeobTggtVYjGo
         uukuOLmOTpPVO6OCKf01vFbewj2UF5ANjAZdBCUh7yeQlFVypK2ulTgvO2E0atzHtw/z
         NfvdLUP8cxc9jWdMrg4YyL5gkuTYuQJW4Ty9vhZ2mQ2vTO02EwV1WiWa9YfXFGy9Zoac
         0FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787455819; x=1788060619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stLZT/okqSNFXuljKE8tIV/AU6lfezXDB7JUzrH4ujw=;
        b=b9ekvvyVN5tdbeG8h3zGWuBkbAfn0F30R9N/mwnsaY/p24pCOHc7+hhspovAuTBdUY
         +9sf7DOLr/USyMVVtbbEIuK/3Twga4XQZuLVBLccOocnSG8EIp7hArZtEw/bmwgqnFH5
         i0jq2qyqLQqt84Qc9HZoME1sQNLcponPXfeBoDwo6ez++bvMw18bLF9BmLNctk01Eqq4
         epFqM+XrgVkiBhYqRRkTruQgSWXnLCtC5+r1kb14PyH+SN+YdJ5hTJ/GQBsY0NZziR9X
         vKBiIk0nsMiqszbvuraEsJgTOVgSGdDCHT1ZiJOpf4xdCvUTZz3l3umKcm+xKF1qYAfh
         aV7A==
X-Forwarded-Encrypted: i=1; AHgh+RrZE0hDHlVT9PCHaUUGLukVqom9P1Sa4jHMRmAm6iu6NKBSbompFBiubFJeEcTinrCNxZP3dvQQwW0=@vger.kernel.org
X-Gm-Message-State: AFuF++nsJHtPtnHed+HX3kVHPtR/734i+W1z8k4Q8LeG84duumA3vHPc
	+vUICdtGoUqJhO17/kqfBARGpoPTLf4ywLExrB4+OGk3wXlaUJPu20I1
X-Gm-Gg: AR+sD10jsto1gGwltuASwAL5IkeWeogXe+cYh9XiX3qitEKj40nsWN+pgyabn3WQrZ4
	IJEV9ghLqq8UvbMup9JwY3t5MVc4A0U3B5bFqF+/2OJloukKyO7oyHMN7DWSonTM+h5gMuPcBQp
	hlMLFdK3Oe3UEvZbFfzL+wCNcPJBOXL9Z7E05v1uC1HfEfX5RhOWnA5WcVGDr6HMxPgUV842857
	CW0VGuknC7kWDyy+BTX0wR1vGX3ZWwYYhIWpOKX46z/Jlfz7mDjFsh0VGTV2d8g0s6/18AfQ0+7
	KkM5QOrKgXhEgOqUQZPmwHzkkF0Fww7zFyZoNck70GW183P+m8s+p5Vai3rFA3AkenPyFaZ9Q2p
	03D3wFoXpVeX10LKrY7ehEt0vCXjicDeG0Y12e+Mg5V9SwIz0W8vBjb30caujEQ3E7JMiABRE78
	S6nD8KvV7bgDD2gbQto4jiX/sMoMYY9+1GA9bRIlba7WciCE6eXDvFvfU767HO5BqMmMXjXSPFn
	PJMWuNpkzE0Ec5wewsjOWuk8CPchOepjkIlDjU=
X-Received: by 2002:a17:90b:5288:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-395c3368e30mr34024160a91.4.1787455819561;
        Sat, 22 Aug 2026 20:30:19 -0700 (PDT)
Received: from DESKTOP-NUG3VVK.localdomain ([39.117.86.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8d26sm4601465a91.10.2026.08.22.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 20:30:19 -0700 (PDT)
From: Yongho Park <yhpark7i@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Yongho Park <yhpark7i@gmail.com>
Subject: [PATCH] docs: wmi: fix spelling of "frequency"
Date: Sun, 23 Aug 2026 12:30:06 +0900
Message-ID: <20260823033006.45651-1-yhpark7i@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the Lenovo GameZone WMI documentation.

Signed-off-by: Yongho Park <yhpark7i@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 1769ad3d57b9..3579aa32c5d6 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -152,7 +152,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
     [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
     [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
-    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
+    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 OCOffsetFreq;
     [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
     [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
     [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;
-- 
2.43.0

