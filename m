Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328B246788
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 03:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447812; cv=none; b=Nr3WHzkEefUDBnExJngBn5XBesT/pY8ZoY+PxnIO8D6mgyqfJzgFi7LZQoUwd7BB/9DFkC2Az+HqEJYEBRYaNhAZjKmObrJgm/x4ftXdcqfrbvxt89UiRxbLQhcuCxmDF7MugKJdWOSr+QCjb2MSlHJikv+lMNb7cfwhOM/Udrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447812; c=relaxed/simple;
	bh=62HFnepFZP90FsZhJ6jPVaeKY/NWRxc3uPHaG2yO4DI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LBmRybKZ1bT8joIa9MIXzSI3rPZYChez45a1HSn3B6jbXp+Npdj+sdbkfN/kE+iVuNlG7q9ibyYSMTnb+bP25yX2aiiFSckW6DbfbE/qMRTX0vNfwKEdaLa1/jJUGaiWlt1FJ3BGvdM9skfOtTjqkgYbsloMYLSU3ZqQs2GrMPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPuKlBiT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPuKlBiT"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81db1530173so196142b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 19:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768447810; x=1769052610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpRX2CypnBmpF1Zh2HL0+7/J4ILuLCOUDnWHN01D8Ns=;
        b=QPuKlBiTz7FhNfH1QqbSJqCWQkRZkGl5h0FroWa3gvrhpJrIAX2lh6jGBDSnxKTkuh
         CvOmJGVztWEyDvw2hAoBG+1CZtE/vkOs+B9FUGexHnNBUBpy7dxR8wT/gVieRhQ+Dt7o
         5uJQd1ZPOGTbiNYkOILCt6KasP89pGVEOrYurwZTUujA4AUOtITkXrsdsfw0vsvKB02P
         LrqB4/0fsc4T95G/B9s2dFaBXqaT41U/Ti0zxj2OF7N/ggLiXttXCnq0uxYP5p+0vPb+
         O2GqKovvvPnRCFSv3SoVvxiOdV9Xm28q5gODPg3OVFdxXV2LSV5UUabHkG5PMkii+KAG
         9Zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768447810; x=1769052610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpRX2CypnBmpF1Zh2HL0+7/J4ILuLCOUDnWHN01D8Ns=;
        b=cm8YjMQWXK12QLMS7c0850JFbgWAX2tAZtbFdH58Rgvb06GwBb+S7RpGvMVRBgb2mO
         ufsFvVRFMWwYZl+UrBVvMdrue+dd8iFAPsUbZGX9CWdqv8niEiI9VZeZcavycZ/FFKYr
         O/bZR6aASUHy49OkX1A44Gkg6jOWzq3DgBMA/FLRJXXo0KsrQiq8uBVzUQyRKvPcafz8
         Z14POIKoVwNTpy5GR7FfNSED0r9n9RDiBbuQZVl7lTD9/to0YpzuijkAN6ppnmWXZ3Gd
         SPlzHBfH2hBX1sIcCCohe41fQIzlz6tYporYG5J0mCawOG4WaF8S2v34zoi3q+jkn6bJ
         RARg==
X-Forwarded-Encrypted: i=1; AJvYcCVXwRixuMKVcUY9Gs5PJNwPuhe6EJa6+ZnjyMHuES2nMVelgyacRvEttNCM/ul0roYLvYqISavwlKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyomaFhbf3qJLzL8JjGL5fCLCOdErpgUGHdJR66tyuOE4IFhZe1
	THPWPfyvD70KRP0QpqjxQWmWqvV8aYUvMVz7J4D8DcYraZ3oKzERjUAK
X-Gm-Gg: AY/fxX7sw2bUaZTMbgcjFC7nOc3TmdH8/99kAaBU5Uax+HpbhfHgK5JOHbHRKbtvRO1
	Xotwd2j6XBCvrPrP20e4fVk9MbqFN0h/heagd/+wm1k9naoeWOsaiso7ppKyQLpCW1XT1mR3Jag
	O9J4g4R4OV5+pKyPfhkWCpDjZkLRy6AgDVdpYb5nil0yNJwaYH36UC6F91loLW2Fkw0+ZX9uBY/
	ktH+n6O4KbX9vs91Uu14NDyCLG1wpBysc68FIzF5oW2eAn02h2bHVfrCzHJ0sI3YAQFiH/hQjGe
	/PPLZVpB+1Uri8e0lAtWvqC9d82WkmdaJOPdetg0kXpqL6ooG0cIKTf0l/IIWsPJaONHybrZ8S5
	LmpH5IC7pEMopnQT2X8+QPPnKOzp3TFifl6N2k56mzrsVBF2kfaC2Wc4hO+b39conWUD/0RGh8z
	umhoTDpVg07mOezwsIx0SSfA==
X-Received: by 2002:a05:6a00:a883:b0:81f:3d13:e081 with SMTP id d2e1a72fcca58-81f81fa2fabmr3888270b3a.41.1768447809862;
        Wed, 14 Jan 2026 19:30:09 -0800 (PST)
Received: from localhost.localdomain ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4df4f8sm945797b3a.16.2026.01.14.19.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 19:30:09 -0800 (PST)
From: Yiwei Lin <s921975628@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: hdegoede@redhat.com,
	srinivas.pandruvada@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Yiwei Lin <s921975628@gmail.com>
Subject: [PATCH] scsi: docs: Add description for missing options of link_power_management_policy
Date: Thu, 15 Jan 2026 11:29:52 +0800
Message-Id: <20260115032952.6658-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the kernel update we have more different policy for SCSI
link power management. Add the corresponding description to
the file.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
---
 .../scsi/link_power_management_policy.rst       | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/scsi/link_power_management_policy.rst b/Documentation/scsi/link_power_management_policy.rst
index 64288dcf1..07fbfd937 100644
--- a/Documentation/scsi/link_power_management_policy.rst
+++ b/Documentation/scsi/link_power_management_policy.rst
@@ -5,13 +5,13 @@ Link Power Managent Policy
 ==========================
 
 This parameter allows the user to set the link (interface) power management.
-There are 3 possible options:
+There are 6 possible options:
 
 =====================   =====================================================
 Value			Effect
 =====================   =====================================================
-min_power		Tell the controller to try to make the link use the
-			least possible power when possible.  This may
+min_power		Enable slumber mode(no partial mode) for the link to
+			use the least possible power when possible.  This may
 			sacrifice some performance due to increased latency
 			when coming out of lower power states.
 
@@ -22,4 +22,15 @@ max_performance		Generally, this means no power management.  Tell
 medium_power		Tell the controller to enter a lower power state
 			when possible, but do not enter the lowest power
 			state, thus improving latency over min_power setting.
+
+keep_firmware_settings	Do not change the current firmware settings for
+			Power management. This is the default setting.
+
+med_power_with_dipm	Same as medium_power, but additionally with
+			Device-initiated power management(DIPM) enabled,
+			as Intel Rapid Storage Technology(IRST) does.
+
+min_power_with_partial	Same as min_power, but additionally with partial
+			power state enabled, which may improve performance
+			over min_power setting.
 =====================   =====================================================
-- 
2.34.1

