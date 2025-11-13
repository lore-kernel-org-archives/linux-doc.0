Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C62323411
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 21:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069206; cv=none; b=SPPAa6T03ii6VQRf+iNnCka3mvkkZH3jIopvVO7CRjsfQUtPutbj97OpLT/SFpK+jgMm+pLgRmPO0V2ErZ3FlZ9XpZHzaM6XTZuIjdbhhyEYsdlMEdItts2Xl6Bv2NhQogRC5Wx0OK2fyOeJV1mQjyvxkbgTNlmIwehxRIm57sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069206; c=relaxed/simple;
	bh=Aowo0IlaBztSOOQxDvKMq5NmrZZmaP5pZMs9pRTujV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvYdQ84BoftQ5fvhzhhIs0RpOC3Z56tHr5F2mC8SCM0m7idlIGkJixWdRotm0njekQURGZ1Z7ekLoGa0SrPrwKKUx4ygbj7PEdtoN0khrwr9/1AeZoeOFQO6EjzLWC24VDbVj8NTT/vsBlfC2SrqYfqlclTunD+sQ7kWwdH+54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeK1dBjm; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeK1dBjm"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc09b3d3b06so740106a12.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 13:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763069204; x=1763674004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gup8jlztTqVVoO7AH7wg8TZA7qN2MbWnEYHaxHfLc6M=;
        b=eeK1dBjmAF3nRhKL4Sn+8bDmP+zlgZWX6piXua+ugK7M9e///LbcAJchYWzCtjv3iM
         yW8reGZeDY2IWJFpmJGbjC5wd/+QMRJPjkfoQkPoo2YRKZe99gPZGtHxk8ZN2Fl899ly
         2R5ELAjKUtrgLjdls6sEhxy5py48oKnJBc2JuJlmvb5jGhVU7IpCxgvwzjQ/xZIjjl2l
         Kf9wmgBXR40kqCm31UFsygx5ycSnrFVwBAuO2F54nGJJEG2Qrr13fEMHUdlrIpdjcXU0
         7uhhd6bP4Ydv2EQsxcoKvzuXvHQ8fLN6lPj9NscAX93U5pOlmmzBrviLg8Acw8gEo7x8
         prcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763069204; x=1763674004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gup8jlztTqVVoO7AH7wg8TZA7qN2MbWnEYHaxHfLc6M=;
        b=Qj43yVQtHH+8tAn5xz76QSNvPG2zI7QHpsOSOVy+Ut3px/pBMnEVgQZqiZ9CjYLU7f
         4x942ys5o1WLqYkhzzlmNtfm3+tnWFQyJB886X1rTujXG/RoUYmJVMsUr+r/RunvbqvR
         lYlxxG1XOxG0zy33vUMLqBoeFuglMmBiwmLLgtX1n/ymbBJo8IZ7GS9B/5lY6TqbDqdA
         da77BMbAgbGtDDA3yLk6m1OXRZIDzMyUq6EGVHE2nhblZ7TAwehXCzlyEzffE+WgpYny
         z+YaNu6hC/hODLXZT4cbszh0P7vBnWlsUv9KnSeL3C+LlInNdiytT3Im+75PORTbLl06
         qcgw==
X-Forwarded-Encrypted: i=1; AJvYcCVSm89xN7+dy8tJElEUyLS/pe9VTT2Q0gX5jLqHweQVF0YMqhEPjHzZ2abTyZk3pJb1YlL1n9jadU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRfum1cW2EvpLvdKG19j2j7SdQLfmWWVeA+pkK2CoOj/6u7Fj4
	mTn90up7nreWRwWfksnmgrMibmtcZnSUqNJ7imarbRh27iNphJHYG1oT
X-Gm-Gg: ASbGnctgQ93Z+IkAndoIIhSDwyREStBn037cq8HcC1jvetRwD54seaJuC16qsK4FGp6
	aDITRs1watM2VxRIiPVKvo7zIlfnhSHlPjLC0kOhF9ioiq14gjvqH5oATzyTUothlx4I1bjbwpE
	wlTiTLJKbTolBAEEPY+O4IrakzNNq3tyfhPmVHGfC6pXZFncw5NJrD8LxRHwQkKvfZvC+OcmBrX
	Dx+LsdGGUWspeN7deEmkG7dKrRYv13cpOz10J6HmpDXRRaq5JijGpgrMYX1WHtGRQb712et5teP
	C3XwvfHduAfdpmejhjeIGtx5dmkJBJwcYrnBbZnhubrKebAojSnUwRqqqbeIXQPb+SwaS8XCSwV
	KVvy8VspTEb+/hjqSN+GYlfRBrdNOV2CdrskMu0Hns+JFhdZ/RQm3TxOXSGljARbQL4oTxSsu5C
	S02Dro1LcZAkj7+NtHAPprCmBJzwLDK17rEBk86XlUZ6Br4lw4BeVFdV+HxLBTLffJefc=
X-Google-Smtp-Source: AGHT+IHDHzMyGrR9XzZFFbHiUHCu+jeBztlrSt+PxD2cgPY1wVsNA1mn7BCOfms8yNm5tlIFGPONXw==
X-Received: by 2002:a05:701b:240e:b0:119:e55a:9bf0 with SMTP id a92af1059eb24-11b40f9404fmr260328c88.12.1763069203573;
        Thu, 13 Nov 2025 13:26:43 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1811414c88.1.2025.11.13.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:26:43 -0800 (PST)
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
Subject: [PATCH v3 1/3] acpi: platform_profile - Add max-power profile option
Date: Thu, 13 Nov 2025 13:26:15 -0800
Message-ID: <20251113212639.459896-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113212639.459896-1-derekjohn.clark@gmail.com>
References: <20251113212639.459896-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices, namely Lenovo Legion devices, have an "extreme" mode where
power draw is at the maximum limit of the cooling hardware. Add a new
"max-power" platform profile to properly reflect this operating mode.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-platform-profile | 2 ++
 drivers/acpi/platform_profile.c                        | 1 +
 include/linux/platform_profile.h                       | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-platform-profile b/Documentation/ABI/testing/sysfs-class-platform-profile
index dc72adfb830a..fcab26894ec3 100644
--- a/Documentation/ABI/testing/sysfs-class-platform-profile
+++ b/Documentation/ABI/testing/sysfs-class-platform-profile
@@ -23,6 +23,8 @@ Description:	This file contains a space-separated list of profiles supported
 					power consumption with a slight bias
 					towards performance
 		performance		High performance operation
+		max-power		Higher performance operation that may exceed
+					internal battery draw limits when on AC power
 		custom			Driver defined custom profile
 		====================	========================================
 
diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index b43f4459a4f6..aa1dce05121b 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -37,6 +37,7 @@ static const char * const profile_names[] = {
 	[PLATFORM_PROFILE_BALANCED] = "balanced",
 	[PLATFORM_PROFILE_BALANCED_PERFORMANCE] = "balanced-performance",
 	[PLATFORM_PROFILE_PERFORMANCE] = "performance",
+	[PLATFORM_PROFILE_MAX_POWER] = "max-power",
 	[PLATFORM_PROFILE_CUSTOM] = "custom",
 };
 static_assert(ARRAY_SIZE(profile_names) == PLATFORM_PROFILE_LAST);
diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
index a299225ab92e..855b28340e95 100644
--- a/include/linux/platform_profile.h
+++ b/include/linux/platform_profile.h
@@ -24,6 +24,7 @@ enum platform_profile_option {
 	PLATFORM_PROFILE_BALANCED,
 	PLATFORM_PROFILE_BALANCED_PERFORMANCE,
 	PLATFORM_PROFILE_PERFORMANCE,
+	PLATFORM_PROFILE_MAX_POWER,
 	PLATFORM_PROFILE_CUSTOM,
 	PLATFORM_PROFILE_LAST, /*must always be last */
 };
-- 
2.51.2

