Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90BF2DC798
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779022408; cv=none; b=cJl0fOwH2RcB/fuA8GNui7Qe7KXFlf2KJxlETDbuPV+EOFAJlbbqctd2oI4FAjKSxb0M1aGlPKaS+jXxnoFToVV+ZTQHFFzHNSEVfd++pVJymgp9rtW3pTFaDW70aRoEpbkGf/UWZnNLYZ+kQoATKQxKMCaJyrA5L67k62PVdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779022408; c=relaxed/simple;
	bh=391qIWo4cYVk+od4CnAXI3LRAlbBgSeafbcDlO1t8dE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ho+YiMfQr18T72V+hI3OLHc7/PnNZlvgTCjpJGx/tJzCo+kyIPgLb83EgoHN18vfibcWCeRJR43p0cjOy9k1S9BnMr/QSrY+BcmyaanIQdTwy9Qbialch0qc5sxPJ5Yio2E+0UuiGVhjx/wBR1hbADRhaagbIif/HjION+eAGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJsZfePT; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJsZfePT"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1087795a12.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779022406; x=1779627206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHZ1M4yEHAJJ16tGf5b4knwqeJ/DaNdMkNl3YNcxA30=;
        b=TJsZfePTaj6ODxDjQSanombBTZZBx+PVwSOnJeLxTcrow3h2sIFG/UuKnePae/+ItK
         crF3Ls+Bh9RXmYqYSYVd28JkCNP/WTiu5+SZ4kZimUHhSV39VrzgUuy8msj+9vEUu7Xm
         M3LK1Hnzjz+6awd+P4iJzpx/MEF5bCxLLkeg64rSfXtM9dtHqi9aWy74VoRhLTyRCrs0
         ZTq4BaGhd0y9DmljrVj0UuGNiBk85CqfdGjNoyYNBqFWkJFxVPISKfueFF0pp7K37Ofx
         t5Nrq3dksP7selcJcBTDehdmGqyQX5l2p8YAyYtQ7zrz/N8cAEs/EPE2ti2/TEPrVy6+
         ce+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779022406; x=1779627206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHZ1M4yEHAJJ16tGf5b4knwqeJ/DaNdMkNl3YNcxA30=;
        b=pto1M9rLTqC/v/cRggJfZ4okLUuzT/1+UFmatjReGui+4iqCm1dnbDVzPDW73LbJp6
         Tz9K2HyWcSpoKqViP+GVYZM+qenNhcdQXrXJR+WAORQ0euMMHcYojvB61YGHKJJOIM+j
         8+6a+lUxT4w5hsiN+0hBD9/zd5iCvknulIybRIWc35eX5pCCtG/UE3xlwB0S/O6gopUm
         2dgtbiU3PZHtrrsHAUvuN+mndgOkLoXFFQu4pQFilr6NyaWnnQbXCeUPZ037mbWrowB2
         y34nKRAPoMxrIUFcNgPIbd0GV8aXx2TwpusmYOzdAa49zTOyymQK9PpxNCMDFskIflFs
         JD/g==
X-Forwarded-Encrypted: i=1; AFNElJ/32tV4H3mN7XJQzN6MBaMAPSKy9MCZcLHHppnrD4O8RZeC8yAniEdvQ6qIh2TVbGRvuoTfLEOuGXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSP7SqvqCNmE3DaTVXv2zTvbgPhUOIHnVAS/h0ZN2rwPXBQyg8
	dPI1MTNIYmfEFNNPgB7mo5vQOP+INJlbChk1rVUFk8CHp3IhCzM8b4gA
X-Gm-Gg: Acq92OHxz3RMD2kdeD2As+m8hUiGwB1KJnNmxY/Ck8zCnhADOzxIzjJScoMWOiB+3YL
	u7aWY2Dl/BYCT564U32JlIShuExhjYQsor+ouYuAw85S/kSaMkk+NWFkX65fNKVEmdf7SUhk21I
	ga6WB+mymHVTqFtmF3HSAH65QLorVcuiwt2xTl0TIG+yWXxwiNLf0J1q9ubpVEZV1bCjVz97xj7
	ceEEwHBbZxwqaCq6Rl7kWT7liypcuwbc4Erajsls80BmRX32T6eHNXHPIJJjOoH4qUlcDH8n8wX
	v6XqM+LWGZz+jGKTud6yC41dgkyH6nrWsTxcu3+N5+xpflPCh2+PanD5rzk8ZwnvyJqkWpkYlId
	kTr6JkgwdsW5Bp8R2qYKG4yUZkjuK5eMVstvIvvvNcgBUVfGLSeY9j47g8zV7eBAmZyqyBS51bV
	bf4Ioy6G9sYL5v1Q8hJuZhlUHARaKJNITxvsGlU/MPL2P6qCX2y9sVI1KW2r+gZMLvVfJPI/q2a
	iczG+G8+JyOBrMv0DajzEUV4ThHy9fSSzpDqSASz7u1I65GWDk3yDMue2QB8UY=
X-Received: by 2002:a05:6a21:3294:b0:3a0:b9d8:96b with SMTP id adf61e73a8af0-3b22ebe1b3dmr13415750637.26.1779022406159;
        Sun, 17 May 2026 05:53:26 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb115c38sm10688596a12.28.2026.05.17.05.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 05:53:25 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: hwmon: htu31: document debugfs serial_number
Date: Sun, 17 May 2026 20:52:21 +0800
Message-ID: <20260517125320.2196-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the debugfs serial_number file exposed by the htu31 driver.

The driver creates a debugfs entry for the sensor serial number, but
the documentation currently only describes the sysfs interface.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/htu31.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/hwmon/htu31.rst b/Documentation/hwmon/htu31.rst
index ccde84264643..9ab774dcf65d 100644
--- a/Documentation/hwmon/htu31.rst
+++ b/Documentation/hwmon/htu31.rst
@@ -35,3 +35,10 @@ temp1_input:        temperature input
 humidity1_input:    humidity input
 heater_enable:      heater control
 =================== =================
+
+debugfs-Interface
+-----------------
+
+=================== =========================================
+serial_number:      unique serial number of the sensor
+=================== =========================================
-- 
2.53.0

