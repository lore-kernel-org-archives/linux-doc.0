Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E569366546
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310862; cv=none; b=p4i7HIWDjWeZ4Fvucx0gmwEmkEVxA182JJRHNJpyK5TTY/LnszSPzGE3h4uXOMxwfnp+P+LphtJjaSEdOe5nQtqxy+KOQM0zewC+MI/X9l7YBPnqUrUC8WbUAib+14ckPxq2o+ffOoiv8kO7f0Iiq7BOzJuZYDm+Yejeh+AzNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310862; c=relaxed/simple;
	bh=plmgoBpbYhRCWT0JxnAm9IkKn261Mxy3FSq1pxN2Zlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qj5J9wfwN1tNMGjKRNsVGSkrJCNVTypzpWVVQD3gZy/VQ6OKCu1yEZMUCoGArgfLZ6Jg10sjWV8+1NVs5k8bshQFEg9rFmV/ypfMueQNBXrikBwbEd2i1EqRb0zO63Q1IUsw0AddqHHveNsJ7kKXFwd5bqRwQ5kp2KnUXcmudjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRfs2bNc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRfs2bNc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso8838555e9.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310859; x=1786915659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9SsY0QKXcaRlIAy+QAk19WmDERCo8fOpysI9MsNVJk=;
        b=iRfs2bNcpJBT4HCjcAbVEMC1RcNSUxS8tRJZO7EJ3xz1h5LDXTnWALlU5QlJqaW7gw
         dnept+Rv/xH1oljBkuBjdlRwlge5dtX7B2s1wGSZHpmutBlilGhxJA2y0wbe7HLATLME
         TXXPY7WuuoZmWmp+CqOipCojuLvy8ypTQrBJCO+ghIMeZf97miEIvJC2HfRWPYH6gnzA
         R/q2t1zRZ8ktsRhARxvWrs76sefe3BZVl0vIj3SJoesw85PHeoTirPvHQF2cvhyIWJpT
         n831dMPqrdZ0fG7uY47cCAfhbBwGkg7bpHZXrCNPwx0jX3AoPKOLzLWggQpBBEkAGQV+
         nl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310859; x=1786915659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9SsY0QKXcaRlIAy+QAk19WmDERCo8fOpysI9MsNVJk=;
        b=a5FWbNBeNGJvg29jWX1gby0d+K3xjTqi3w5wVe1k81wGmu5tchGZyPPLHMz4hNKOsL
         3vu9iAsrIvF1dpPGVLwJ4hjw9gkyq+376Y2748SfSNDkr3tsZIEYhbmAdEaC4p3lRJCz
         WUwW0r6+1W7vNhNGu+NxjXWV63qUesTAgr+W5+cRzFzefQOO+V9zSZW3Atzgl/cBFdOc
         JbwLR2t6VzVRosPZEnIZlTOotMT8C5Q/eoe7VRw+GgFHwZJRzxoGcvJ090YwzUKx3LPD
         01JzrBsRL+xxX5bcpWJCC+eOY/ibwuTog2aRCQ2uLUvkpBO6xptBUfeHgthVCUuVPbkk
         d4Fw==
X-Forwarded-Encrypted: i=1; AHgh+RoIIwZHHsof/0eYegj+YGQHPINoL3Iqj2eup6y/ehNXUfRgHZtbdZSwnZ5U7LOky+tAczffZBrFqE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj80f++eLyXZeztrrAIfQpSPmlzsLL8eswP3IN70h1Q6izufH9
	hkFpE6q+iPZ6e4FWSbcMXce2xTWGg8BgmtgwkqWhl2SOr8gwGMJhYdT/jGupqIT8
X-Gm-Gg: AR+sD12KYJsvVDf5VIgTAFdjKX28+w2GJ2jiyXfPGYp/D790C77LpL6npY7Y33720q/
	Q+zDB3gtiJZ/Itwg5sy9VquhDOTskZ+1g2uRfB/igsg5kSobY6YEOe9WzwrTzIXsmXtdYBeN1MA
	YV040KuTySkufHwhWqbb3sogPIYGi+y8m+o//c85zUU2s/20dhEDHiIRSx3oy4Xkl38AMvXwbDW
	dkvd3fJfeEUTZqr01VOK2g6fuKGH1zRh9LS0jMrUOj/QHjSGMj5M8DE3wo7kyRt4KqWiYO7Q4FV
	85DBBSfTTiEQjwlbobGFlB7L1HdKWnZKaVhrN/UVhieuL3Vzee6TjmMeKiEdfVW2lzvlrLD3qcJ
	PhFMobns/1kyo+z2QOSrg69H52ZXvLKDcjIEvuhFXMkExTl6jCXZMBi16TdcX5t9X2mrRGqn68A
	LBYXzT25r5I1xNE8PxGuJWH5KsFWytkLwjj1bT2bWxUNenHEHyH1a8ZR4LvD6T+6ZydFZREzmws
	nXAo215jXmrDFnqxA==
X-Received: by 2002:a05:600c:1553:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-4995e0d0182mr234037635e9.10.1786310858679;
        Sun, 09 Aug 2026 14:27:38 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7164sm286806455e9.2.2026.08.09.14.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:27:37 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Rodrigo Araujo <araujo.rm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z390-E GAMING
Date: Sun,  9 Aug 2026 23:26:53 +0200
Message-ID: <20260809212705.1501382-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rodrigo Araujo <araujo.rm@gmail.com>

The ROG STRIX Z390-E GAMING and Z390-F GAMING are essentially the
same board apart from the E's onboard WiFi, so they share the same
EC sensor layout.

Signed-off-by: Rodrigo Araujo <araujo.rm@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index a5db48d5a72e..2c68a343a2ed 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -52,6 +52,7 @@ Supported boards:
  * ROG STRIX X870E-E GAMING WIFI
  * ROG STRIX X870E-E GAMING WIFI7 R2
  * ROG STRIX X870E-H GAMING WIFI7
+ * ROG STRIX Z390-E GAMING
  * ROG STRIX Z390-F GAMING
  * ROG STRIX Z490-F GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d386f056dc55..e43645e884fd 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -976,6 +976,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x870e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-H GAMING WIFI7",
 					&board_info_strix_x870e_h_gaming_wifi7),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-E GAMING",
+					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
 					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-F GAMING",
-- 
2.55.0

