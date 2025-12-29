Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64A256C83
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978290; cv=none; b=WrmQ37UWaiL+1XjjnXvQiXiB1Ym0hYrvvj4LVchA2O6d1RvCSnRabsMYJ0kcqk/Bu41M3smRtXUA/xTksHaSFtwSxwrs6nxIrsd2O0XZRUR1l2mF+oHgK6Jn8T2GIhI0Mz9X/qTAA+u883a7IMwc4Vgb4aKV51Lj4+tC8hlDATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978290; c=relaxed/simple;
	bh=9+pJd3NBP++1JTk1sqOowLELYEPW5+pC2QloAQLjOjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZQHX+3ICJQMkvefsJsbcCzcs1Ha2pzUQL/kHrVk9IpXUtRu/lNmjlrmV1D3+ovVVcpr3KYoxXDHAtbIRpGVPau1DRmAi41Y5k3fn/F7D66dbD4SCuKz56g1oKSgJx38jFr79uG4wLpr9MjiSGWghGZvmze8IdQPT/QetgaZ9I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC0hM66p; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC0hM66p"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0f3f74587so124955245ad.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978285; x=1767583085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5fLauwF03o87S7cIGBwSfbxsvXnHNtEz/FCDWnd8ng=;
        b=iC0hM66pQzv/0cNJ5dAl8AcF8iVP/J7Sf0QmZxmmg0mK4EiqEWkVpziuEBKWKxotmH
         69wnxE6KX+bwc1vAJZ4gSboRmGQE7n7pq1XnB7ACy6ehOAd/rfdipBu1dp1JpmumQ52l
         pteyhl6eUVBfC4XYFOrpc05p654ffF7EXj6tSf8WDs6unIsDi3TJN0czoVEnmY+naV04
         YGnt66g9tzCaGISXoDvVMNGa3Wp/TLiEZosXhN2tcFntuXi/imHkK0X3rqFtWYYyXoyc
         Xzv6dSp4NG091bVz9CoMc1jQWjO0ouHuaHKb5hNjgPEbbhGVv+BUPkikSkqaThXbko6E
         uT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978285; x=1767583085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5fLauwF03o87S7cIGBwSfbxsvXnHNtEz/FCDWnd8ng=;
        b=oKzVZZFHVtJzXhZZyu2BIeX+9aXP6cVW6408ypY9wm2YOQyLa2HIokgQ25Ka5uvYKq
         AM6mdn89VXaPleGpPdc4djd/08BGecIwqJgDlzLAO3GxTg28RimEVF/ualC+3hwBa9Bt
         rWXZ17ZiXBvwtQL8R6XGYw6eqeb9gySjWs8Cc8jDzLDC+TZwHSeLRLjSrExmd9t/AbjU
         QQdt7CKzFzVSR4q0Y8XEmejR6HV9c6PdRuVDUKyTXNZcc21u3gcEpcev/MAc+IClHGT+
         SNaSt0MEq/NZ9IfoQtnCpge/xi11XKsClbeqhTD7bR1L0ws8t+YF9zNkyML2BjeWzjMB
         4zzA==
X-Forwarded-Encrypted: i=1; AJvYcCXwhSKlhjgwcdNTTPpN/DcHhPLE7VIA3V8uUv29jrVBySnjQ9080+Q/isG0oPxFiECvYvVbtTiMVLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+/K/d+JAehLKRb1tY12iVRFIBqdDRrXQ+4dqATW0lSudJrnq
	rZe0u133GQKFcrRN+Z8fN1Q0qK2UO5hhJ+s0xeblN6HgqpAyMrmpPzqA
X-Gm-Gg: AY/fxX6E9Gtll5AJKZUKFYnCQxNArjfJ88e3ILWus5HzF9B3MhuwdJlXinvBsJKgF/d
	ZzhNiGOjn121fIj7jvJUvAI5+NY5nisgk6lPzf72M6siZQzmGy1971rhJVu5j2sfdCprb1SI+pk
	KRc36Qbtg349P+MCfxORP4Qe7nHwbdt7nO1kAM6S7WQVV+UVZk7i859/7s1IKvac2rtgWuphUl8
	66OAL9s5vYoL9tgSHqAmQu9YbfADG33DQlmIlqAbi1JhRK/nRSPu0gdtomOwPpne2cgQoD5AxaK
	9frZinWJlOuOoSqeAPLpkCI4XYAIlVKyUYal416W+pv/qxGZ8NQNwLlV204GGnro/rCprIi6Azj
	48iKny2UAVnKcLmmrEvZ2L7gX1n1jsNRARDspGlg36WoVK1s0DUq/DPXLTNTFh9yTgHsbuhKoZk
	KCDjINaTmgFGfz8zgvkc0hoWydB7Gu1M5hl+8LPT9lMb9s4PujmUR44eG6LRgg6SI=
X-Google-Smtp-Source: AGHT+IHxlvbsjIIiGCdaZR2kNkfJhhczYREzl56thhmxe0C7ocWaa7i+0Rinex+uCUd+z7fHP0XHDg==
X-Received: by 2002:a05:7022:7e8e:b0:11b:bf3f:5208 with SMTP id a92af1059eb24-121722ac21bmr29615714c88.1.1766978285028;
        Sun, 28 Dec 2025 19:18:05 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:04 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Hughes <hughsient@gmail.com>
Subject: [PATCH v2 09/16] HID: Include firmware version in the uevent
Date: Mon, 29 Dec 2025 03:17:46 +0000
Message-ID: <20251229031753.581664-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Userspace software fwupd probes some HID devices when the daemon starts
up to determine the current firmware version in order to be able to offer
updated firmware if the manufacturer has made it available.

In order to do this fwupd will detach the existing kernel driver if one
is present, send a HID command and then reattach the kernel driver.

This can be problematic if the user is using the HID device at the time
that fwupd probes the hardware and can cause a few frames of input to be
dropped.  In some cases HID drivers already have a command to look up the
firmware version, and so if that is exported to userspace fwupd can discover
it and avoid needing to detach the kernel driver until it's time to update
the device.

Introduce a new member in the struct hid_device for the version and export
a new uevent variable HID_FIRMWARE_VERSION that will display the version
that HID drivers obtained.

Cc: Richard Hughes <hughsient@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-core.c | 5 +++++
 include/linux/hid.h    | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a5b3a8ca2fcb..524f2b9ed512 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2887,6 +2887,11 @@ static int hid_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODALIAS=hid:b%04Xg%04Xv%08Xp%08X",
 			   hdev->bus, hdev->group, hdev->vendor, hdev->product))
 		return -ENOMEM;
+	if (hdev->firmware_version) {
+		if (add_uevent_var(env, "HID_FIRMWARE_VERSION=0x%04llX",
+				   hdev->firmware_version))
+			return -ENOMEM;
+	}
 
 	return 0;
 }
diff --git a/include/linux/hid.h b/include/linux/hid.h
index a4ddb94e3ee5..8249da55c9ba 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -698,6 +698,7 @@ struct hid_device {
 	char name[128];							/* Device name */
 	char phys[64];							/* Device physical location */
 	char uniq[64];							/* Device unique identifier (serial #) */
+	u64 firmware_version;						/* Firmware version */
 
 	void *driver_data;
 
-- 
2.51.2

