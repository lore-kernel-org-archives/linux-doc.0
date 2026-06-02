Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85E32C92D
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417055; cv=none; b=q0lIPKmxnuNn/Zgas6TJJSYNuttkWsjbSMHThQbflUv03+aWV0+Mz7CeXZd+t+1Xht0IYH1aZgYYl0a+bb646PL7HYgVic8RYnwtEezGL9HsUYwNzwu7ZmWMLD6cvCnMuiLe+mEteUceZyugkZ5w8braf+sG1GYkjEDFxgNHxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417055; c=relaxed/simple;
	bh=Xj+FqJb2WMpKsicxTWR3GcsJJt8XMdowbQUXKH2oD6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2rHmYXnATYvkzeWQjrU2136zFbYE9tQ6cIv8prtJaNizBxgTGzQAp8lHQ7r6FFH1VafwIooQd2QMlay8F17dgjL4g3dkiJz5umyNztoRzN3+dTJYC15vOlgQnqa2wDs5B2SZHYB8ikRWzdcoUOMWegBjUMpuVUixrr9WL7QP9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ag9KD8bf; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ag9KD8bf"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-137dd5161feso66056c88.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780417053; x=1781021853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ajva4//4bxspriKRwU9VltKASgTH4F65lB5PSd9V+c=;
        b=ag9KD8bft6llelonnu+TUplIqsTWZNG3qc5QaFxl1F66wVW+5fyXd4PEt+Kw0sxYI4
         64gCz9oxLKDR4CwRNpHHz9FGg/ZdsZLIOsLt4YbzG1jwXQwUlHVV1I9vPl0l8U0DsyfB
         jytj3O0P6dGMdoJIhhNTn9OlcvLv4ggBTyH4vAbLgWoO+/HsPx0XO4KnZ0XNPP/EBEFZ
         gE3LorYA5l8Ilm4OLWcIPTHcqLZvRltrFswd0XfUj/qKWrpOFO570cXIH4Zodpm4/7bT
         U2GEuxXoWmR8uQhVuSSLNsx03bruQamPM1yfOW7gPhmKksg835ut9zC9QZZvM5hJMtxx
         utkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780417053; x=1781021853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ajva4//4bxspriKRwU9VltKASgTH4F65lB5PSd9V+c=;
        b=QQeAeKrOmjWNg6F1Xrwhd9pjSnlCSlwC7Af8ylTmLNEzYAyVh5KdZzggQAiN5r4Rac
         IciWngKzObTdd+2wpoFrQcxwHdava0ua1Hfxm0MCUXwYIVNNXrqqr6/m+0v91Lqefk97
         NC6kppgoAccwx1NlWVaqxYMykmwye8yRMBEqKq3VrLgy78qhFX0xyV6ZRqLId04KTW9U
         Aeh6Cp7ieOHb2JwXpVxydNXjjsnljPhBip/qoc2oEr/ZkjbtfW+m3HcTzSlZ/Ki0m9JF
         y9iD8sSwkGx/Hs/JT2tNLtJEf0F7ni9Wu2TTSoOcHFm1CfyoE8vPM1KWczG/0eL+Hg0l
         vG/w==
X-Forwarded-Encrypted: i=1; AFNElJ+HBTQ5rqwCeLPN5gsBxM8vc2V44Psf1WuR2b05pV1UZ7/gizwvbmSmKRXXzgCitDi/07CY+mnbGHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyddwps/jsdIrXUGwv9Np5fO13RfK8w9EVJBACloSm8P88jQJ9
	Ov6pd+J4xRNLoaHnjY5n6BRr4x0LeLw8IyiJZKoLnR8auFEWBXCSjGbd
X-Gm-Gg: Acq92OEoh4n2ycS1AFJF+YdBwp92iehzxjVyl544usiQgzYZZQMQLIc2un0d7X8VIZB
	tmMxKQM7N4NdJXNxmhemO9gYt5fEcj6THFC+kSyGq4kL/BCtR5j3CF0K7UAYfoh7VwjS/HpjPmg
	cn2pf3I1Oi2Vkzl3duI5zXG/VDKLwvbsOpcTwbGCrgCtOxdCjK3deXXxsgoHkI4ZIWS7q6fbK6X
	nUqnRyvFSLazIlYsNvAFvCLbsA3sPi69UtUgWca3aj8IFaC9oSQPP2cEnR/cyKCphUOlh6yIIl/
	JzWP347i+9WgBM5+2Vfaxo0KtHAKnm6gLCmodQmaC8bcWKb53+Doh8Y60mwVCKBzSubpF/ca22j
	CiiAY0YW7GZzCutnr0SVnFnRQzXyIlCKa4Zh7OqQojw58Shd8gI9XXRRFTnC2g7mqOltsZ+82k9
	0MKYpLb8QbLv4+KpVnwgg9wnfTrIkb2a44
X-Received: by 2002:a05:7300:6427:b0:304:d75b:f5f4 with SMTP id 5a478bee46e88-304fa67e9c3mr8513884eec.16.1780417053229;
        Tue, 02 Jun 2026 09:17:33 -0700 (PDT)
Received: from zhanwei.. ([192.227.223.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b8fbbsm11976463eec.26.2026.06.02.09.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:17:32 -0700 (PDT)
From: Zhan Wei <zhanwei919@gmail.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: raag.jadav@intel.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Wei <zhanwei919@gmail.com>
Subject: [PATCH v4] drm/xe/hwmon: document DG2 fan speed reporting quirk
Date: Wed,  3 Jun 2026 00:17:07 +0800
Message-ID: <20260602161707.18922-1-zhanwei919@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ahqN8Esjz9SmGofH@black.igk.intel.com>
References: <ahqN8Esjz9SmGofH@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On DG2 the driver always shows two fan channels, because the
FSC_READ_NUM_FANS command does not work on some cards. OEMs decide how
the fans map to tach channels, so two fans can share one tach line.
When that happens, the second channel reads 0 RPM even though the fan
is spinning.

Note this on the fan2_input ABI entry so the steady 0 RPM is not
mistaken for a driver bug.

Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v4:
- Add Fixes: tag and collect Reviewed-by from Raag.
v3: https://lore.kernel.org/intel-xe/20260529172449.41504-1-zhanwei919@gmail.com/
- Drop the dedicated Documentation/gpu/xe/xe_hwmon.rst doc and the
  index.rst hunk; add a short note under the fan2_input entry in the
  existing ABI doc instead, per Raag's feedback.
v2: https://lore.kernel.org/intel-xe/20260529135028.20763-1-zhanwei919@gmail.com/
- Drop the code change that reported a single fan on DG2; document the
  shared-tach behaviour instead, per review feedback on v1.
v1: https://lore.kernel.org/intel-xe/20260527115311.13398-1-zhanwei919@gmail.com/
 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 55ab45f669ac..0da739d9a816 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -251,6 +251,13 @@ Description:	RO. Fan 2 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+		On DG2 the driver always shows two fan channels, because the
+		FSC_READ_NUM_FANS command does not work on some cards. OEMs
+		decide how the fans map to tach channels, so two fans can share
+		one tach line. When that happens, the second channel
+		reads 0 RPM even though the fan is spinning. This is normal, not
+		a bug.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
 Date:		March 2025
 KernelVersion:	6.16
-- 
2.43.0

