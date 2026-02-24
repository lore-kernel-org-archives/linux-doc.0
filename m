Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9E2561A7
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896752; cv=none; b=af4sNEmQW+eICdn7rV+s1noFJpNlCuJUi3BJOKZ6aZKDCUUEGRp6Q9v+SiO5+cDrsmcVX3hiu+iKrhv+c0TJtdEpu5C6L2J81AH1ltUiLjZ/cX2LGNpJSYJIP5YQXdUu6+paRKp2uCq+0OJ62j+W+fM2rpnRrDdfpO3Zf7+nXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896752; c=relaxed/simple;
	bh=hUo1MvYccpbWMaWLjJzMWrm+A+W/DdILFntNUVeXgaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvEdGjHfuXthUtRA/MxoYt4iX5yCUmiwxUHohSqXyCL9aYaq6taZtRL8WGg2YSDDp0uxWw5mb04BCWJ5lCH5OEi4u+1CJr9ojdJ1tg/N+sdHHvbSNafS0Hzc7OMr9ak5lg6Q6TeuURFSkQNiKWe9DvFlsi5nHLC2/QBXzXGTzso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8UnYf+g; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8UnYf+g"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba94dbf739so5433069eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896749; x=1772501549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFj2OTG3aeriS2nQMueP/Sb6Nx66D9fuh6qoYGYRpGo=;
        b=d8UnYf+gk0hMIczhCOELyg7sTflNdW7BIdBSON78kI5jIzgeyJWlecBztQyZBqyen5
         nFKMbRZTGskMnFh8R1N3ibPaK014yS+TTGC0BN0RB/SlPwUjVr/ZXLP3+jpto6i4R8f9
         qtJvQk96LkxLzetYnK98ysqoCfm/BiaVl/lZKL2qnJ63v06UyWxuA0QNUhrAzwuxBL1J
         wEe1HCHEEPGhOw98dtEt1NnvA7qnC1g+mFmQU8PhSoO6Cv/gAJnGtaowkAF4Pe0snuWb
         WmDF0eANy/NfuD0E/0Xkh9MJVHw9TeYEh6xBgxfCeilYYir7bhwXHm1CGKXopCnKIpe5
         npIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896749; x=1772501549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFj2OTG3aeriS2nQMueP/Sb6Nx66D9fuh6qoYGYRpGo=;
        b=bI0Ng9lN6y6NbrvJX2sQG16IQkeIJuzHNWmxkNU8rDWQ6Lh81AnACydpiQh6n9wQRt
         4eU2ZFORexqp7pZMfD/Xls/xA+1Ayx6nAe23tLlrU2J2/givHDiDSTZ5AfK4OO4juILJ
         au47xVr0ZmFJNeLKbGDXSh/78K1VKbVFGijaK9QGHl7nRvfxsZicQClHDl21VJI2Fig5
         qsyd8NXbUFEUuEhewPrrsx5etTZThu0bhxfjPILPRPxywvV7pNZ7sCL3YqcNMzJDtlBy
         L8XakfN9Qm9Fq6x9VaekiFEQKAUZqkKlWu6PtazOBkxrcuZ/KYzFrZO5RtWb9QnQ9Ec7
         vSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd7xmtywZhKuOkV7GmQIVf6romtmm4V6EiQfAge+iQW2oKg4aU3g9ukvneVZ3s0zovfkU+R2h2u5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLb0iGKcxilvmLhvRTYRsmB357tZdCqqF5/YNNa4Jsc+GpdB0O
	BPsGWKVGP/F2TBDHdpPsA8qy672z9SqF6nF1TeoWiDEtvmx3sWXkV0GB
X-Gm-Gg: ATEYQzxz5uSj79uLYhjzNukJdFoDqyJi6cbklLpfF9UATYkgUsJvNnmxXGPOHPRYHSp
	HTlqDYs3DF1oa1zOgaKQt8+ImdmGAw2ssAKGoeV7WV3JF96ElCkKGxEcwbpyeHfJXlS30AbRUyx
	kAK00ZTPcamd6F7nw5sM8AG3lyAGzn7ex/VKEgKWFAjThsjQlw13EsJ4izUzfdlIQ/worThRLpo
	gXY1DunSfjeB8u6VIyPvRdMQm69DTMWf8it3PpEHZEk+JDPaoxoa39JzlZtVc6KHV9xA4lZRlQa
	Hn2AGMZqAPomMYEX7tDRrRCCYaeLw36/rt27adDykY3UDim47Ukb1B2KwzRSnbx3JtoALR2bB7a
	FB0sdhfE3xXr+IMO+nMKMH7jmhm+uyK/7tU/aTi+PEi4ai8xuKVshDSwcQfOG0PekgHZiW3jJu+
	upEvDERfPok5e2DGPwOMttWkq0EEbBZT6iChw5Dy1A0YYj5i8syzLtE25QyMAUKL9F1SemUh9dd
	pk=
X-Received: by 2002:a05:7301:3e07:b0:2a4:3593:466d with SMTP id 5a478bee46e88-2bd7baea76emr2780020eec.9.1771896748880;
        Mon, 23 Feb 2026 17:32:28 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm6485015eec.9.2026.02.23.17.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:32:28 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Richard Hughes <hughsient@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/16] HID: Include firmware version in the uevent
Date: Tue, 24 Feb 2026 01:32:10 +0000
Message-ID: <20260224013217.1363996-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
References: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
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

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Richard Hughes <hughsient@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-core.c | 5 +++++
 include/linux/hid.h    | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a5b3a8ca2fcbc..524f2b9ed5121 100644
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
index dce862cafbbd3..ce728c8d5bdc4 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -698,6 +698,7 @@ struct hid_device {
 	char name[128];							/* Device name */
 	char phys[64];							/* Device physical location */
 	char uniq[64];							/* Device unique identifier (serial #) */
+	u64 firmware_version;						/* Firmware version */
 
 	void *driver_data;
 
-- 
2.52.0

