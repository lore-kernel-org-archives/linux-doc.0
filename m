Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC8305E2B
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762464088; cv=none; b=BNcQZbv3VzYTC5CigxEblAJTZGDJmFO3DAchKXKz+jeP+fs5K9SooEeC3jyGCRuuAlwUEaXmx74mmztYkezsoD5+y07KPwOMKiaYHq7awtsO4OpaAcpPVGqXx818ux4gXl8VwHc+32J1KsrHp3/qfl2FOdixLBSjdx+u+ivbRFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762464088; c=relaxed/simple;
	bh=FwLNkRtTJ0ikM5eQQDKNv4zZ9hcnAfdUu1+o6OVb/0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsBFc6IzWrASewxPk3eKM79mm+onF2f5A3kOy2UZUkjyNNJq7SySDJemOL1ip3gSGph4u48JnAWqacJS0Hx6U8FYqgN9rHMynjT5SvgBgKkSA5YAicvYoqkHUjV36b9fl5MAvaYFLCscUdJi0gFwRzZKIKdKwTZoNMMUTxeUbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkFqUJuf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkFqUJuf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781997d195aso59921b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762464086; x=1763068886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0aw0d1VUDeF7yPt0q4o8kNpDsBTJNsxGr/Ot8TJH68=;
        b=dkFqUJufs/gefI7oojiNkMK37ZiU0I5XYR7HrCY15zbUspsLt6zKkar5R0+nsVJD3M
         6A25t5Rte/UMQRPhrCVLUkRk7kqScub6qKiqf7TCTBgjieU5yiA7VTGvBNJ0GYOvOG87
         Q5bxO6nF9esjh1tVmU7s7tkCSz1E39iMzsCyptmv3sjn0/Z4XubvmHJIpX6/56l+mDzN
         959RW8QC5e3qFfoP9mfX4DXXOHiDsI19eWIVnU24fIODnH/YE0Fe53FhNjo/GHaetFdI
         JQgdJTATE4v94R2V3DI10uJbEWaMeaLLOjFunGNGEhAKFG+l6JfFgBVvjdNRVCx1nuRA
         GJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762464086; x=1763068886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0aw0d1VUDeF7yPt0q4o8kNpDsBTJNsxGr/Ot8TJH68=;
        b=YlOGKvjAWDMsuSe9WxCX7hTMsnvzOoZ7jBt5xu+vVnBIhrpEVuq3QTNY8MUE9rknNT
         J7Or0xXuIh5v0J66ymc4Ib184eMrwluhMtW9cvSC7+thn+u7jBzCuNEe7UpioWRxSwOm
         Mes6L1oXP9K+2v067VBJbdiOHn9SGrjeH3Czd6Fd+V3CDfivXzdQJcZEIlJr0sjY08mU
         quKcF1RD31iSZoCvsnmXXzcqIx8xpYsqsPCFvFXk1SfNyHMLHtaHO1MJpOjPikkrJ5EO
         rSFgl0NYrRJtOjx03XvRDSyRJOUle4iaV9x765bTHutsmAoXhjbe1DNedX9PYhUuQOce
         sh3A==
X-Forwarded-Encrypted: i=1; AJvYcCXv+HgIVTtNDa8qCCggki741XsFqYPYG82S9kn4VZEpUgnpat1HYeS6CZEynMcA0IqJI5J8iaHSna0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzs/F6y1bJhOOQQTpSe0J+CDqnxXYv9wbsx2f76rGZligaLEnI
	bQqMSZqvDQ3kePz+Dh1vgL0kcOu5Lwcf1lN7sU9CQd0IihdFTvxmzNNI
X-Gm-Gg: ASbGncuIqGg/q+1LCp9V0Zjli3j5RPTppHw3fjriInA13dkI7k2s7suMi61hkj4yy7X
	fzUk8oC76iFr0NZQg2kiR+/lO6O6VXfDs+3+2/rUM+DiAslMjLVX2wBEKOedutr2ttIW9I2zWPn
	MHrHIM/wolER5Y66SUpNL5zqAiK8349RUobOKoR6yRTv+PuA4gUy9QDS/HRmiVFJ1ThnEtByUGu
	O+bKD3lIng5I5LE1fvIpCGTyoGtJO5isI0CrVVGf+Nt7k4aYcs2/Pvr4654yGMp4JnXlWRqgX5U
	wFJt3iSaDum1NoPgZRaUObR11tSKnsyh7vBfqjdRitl+rldIaSRXi/+bdRdPMS1zLENiqzVtafW
	n0cwfQ6O8dOxeisOWPrq0fKxcp1F42XBOt19g8sRoSXDpmKZW1SLnAV4T4VTx/QGk/ex2jL3ZgD
	S/IHHWN0FWV1tISK8EDqnaO3q190fEWA3IX7gOz6RksISHT4eDIVdL563vBA3/EJOoSmc=
X-Google-Smtp-Source: AGHT+IH826EutkUvFfzktmcjLwXuQGckXss6+pYKmU2ELz6Vx83zq+dwqtEf8PtHFijWmAc6wuQmlw==
X-Received: by 2002:a05:6a00:4b11:b0:7ab:c5b9:615f with SMTP id d2e1a72fcca58-7b0bd98b115mr1101362b3a.22.1762464085919;
        Thu, 06 Nov 2025 13:21:25 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953d0a6sm521360b3a.12.2025.11.06.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 13:21:25 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 1/3] acpi: platform_profile - Add Extreme profile option
Date: Thu,  6 Nov 2025 13:21:19 -0800
Message-ID: <20251106212121.447030-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106212121.447030-1-derekjohn.clark@gmail.com>
References: <20251106212121.447030-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices, namely Lenovo Legion devices, have an "extreme" mode where
power draw is at the maximum limit of the cooling hardware. Add a new
"extreme" platform profile to properly reflect this operating mode.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-platform-profile | 2 ++
 drivers/acpi/platform_profile.c                        | 1 +
 include/linux/platform_profile.h                       | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-platform-profile b/Documentation/ABI/testing/sysfs-class-platform-profile
index dc72adfb830a..9bee8deb4dc9 100644
--- a/Documentation/ABI/testing/sysfs-class-platform-profile
+++ b/Documentation/ABI/testing/sysfs-class-platform-profile
@@ -23,6 +23,8 @@ Description:	This file contains a space-separated list of profiles supported
 					power consumption with a slight bias
 					towards performance
 		performance		High performance operation
+		extreme			Higher performance operation that may exceed
+					internal battery draw limits when on AC power
 		custom			Driver defined custom profile
 		====================	========================================
 
diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index b43f4459a4f6..78da17e16d9b 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -37,6 +37,7 @@ static const char * const profile_names[] = {
 	[PLATFORM_PROFILE_BALANCED] = "balanced",
 	[PLATFORM_PROFILE_BALANCED_PERFORMANCE] = "balanced-performance",
 	[PLATFORM_PROFILE_PERFORMANCE] = "performance",
+	[PLATFORM_PROFILE_EXTREME] = "extreme",
 	[PLATFORM_PROFILE_CUSTOM] = "custom",
 };
 static_assert(ARRAY_SIZE(profile_names) == PLATFORM_PROFILE_LAST);
diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
index a299225ab92e..2bf178bde2b5 100644
--- a/include/linux/platform_profile.h
+++ b/include/linux/platform_profile.h
@@ -24,6 +24,7 @@ enum platform_profile_option {
 	PLATFORM_PROFILE_BALANCED,
 	PLATFORM_PROFILE_BALANCED_PERFORMANCE,
 	PLATFORM_PROFILE_PERFORMANCE,
+	PLATFORM_PROFILE_EXTREME,
 	PLATFORM_PROFILE_CUSTOM,
 	PLATFORM_PROFILE_LAST, /*must always be last */
 };
-- 
2.51.1

