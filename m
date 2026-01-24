Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4731CD1E4
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 01:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219362; cv=none; b=nH8eJQ8mJ8oS0x4mXlE0rS6QO7fYqqYpNP7gynSnLY/0bCf5zZbjwW7AhzoacDgDiGMxok5jjnIfzc2SLS6MiZsF/4NmeBB7vmSCenzjGsBhSRhnkWUXwXaIJvvg+qI2rQ7qsNsTDM1ezZvUE6u6HbEh52BUz3URy8bwhaJCFEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219362; c=relaxed/simple;
	bh=yyHWHTZ3q3DotbU1mpLzfWDbwKx97IS2+wB4iEtV00w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlpiXldmEhMe3jeommWho0VMS/cmDJcGGDg5y8XlXxz2mIPln6ZOrC/BdFhlE5rXplwVI0By/ig0+bCGJU/QabZup9nLQzv2kCLSBHCiqGK56QwDQkZBoDz5aA1sc7HDhyiOdiGJG0v809ED/oRPWv0xVhBP4P3D71e9gAC9cDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moF0QcdZ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moF0QcdZ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b1981ca515so3234841eec.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 17:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769219359; x=1769824159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwReS+VyqVAE69wkUgUOvkftIiDVyESdfXyVkGzdV9k=;
        b=moF0QcdZe++W5ptyLNjzpFOLk+uc6uV2JpNxY1fKjb5POXB7wnP9rF4PLr+lyylmqA
         +yDzgpER8Gif2IhL/FtFs6b8aIBbSty2zhBaKKDXoh2MK9oYpTO5/tVSb2JpV1NVuvS2
         kQ17rDspaHSTnGETXnBBp6cWaMjYv3U83656aBNZre4Y9HQ4fNWknkoJVAG+LYYqyY0K
         7onJlFnRabP+4Rv7ogTs/asgZgHXsM5xqhpr5VUiTTxvzTbRgMF34Yq03kE9+aZQNg16
         vDUMxouA48XitdzRXnEvt38vXxFTlEPYWp4id+aUe99quA0L6R8IIvChmAXHuyyVmibv
         JAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769219359; x=1769824159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LwReS+VyqVAE69wkUgUOvkftIiDVyESdfXyVkGzdV9k=;
        b=sJff4l8iQcmSJcXv+sqvobc3O+HTACyQ47H6IJl2Yjw7+OMQt8NxqcrOkRmqc+MoGZ
         WSdCiUl18tdGapE4Bh/poE1iqBGa9gxxzpAR5djP5t7T8VqY51M1rTb8zvze5GJPEKfr
         aoSwi4x+N5PJlrodu6Ts5HSwPkXV216uhCJuDOGt+YOUNZnzztiCJtZPxyexssy2Qg3p
         8uc1qT09f2X1UVt0dtt4EeqX5U5b2MahmvloSNbIE0ssS9APRU7MZN0D2nDVXvW/faHJ
         YPkmZDCdRQP57cW1GlwW2Bqbh73dFLNNKIqhO0EgKpY4vJYU/dhgP31VI02A28K9Jubd
         D9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4cJL5eonGyxIP0yWre67vhg9QrMqucNrL7Gp2/QD2JKj+WaOLSwk3nwNbuYIylW2MYAtAfy6o0J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1jbvEzsNbZjf9hkyeFH0epG4srI8j2tPgsH5/m4Qp6cprm9I
	7z7jEVAodAqaViwvH3bsDGO0/Mk6AeZ6KM2dqwKfGfK/B67vm+JHIYW5
X-Gm-Gg: AZuq6aKWCD9vnIKqx7xf7Ay5E9Oliln1v8joR8o/mklVxugjXQv4pEvE7TA+ZJjhqzn
	ftw2KaiAWNCCFN1uvDPw4Sm/rNiTO9rKNXbEwexMiQTljBRmTlOtkk44GP0xMzBaiQrLSeTTRD/
	S44CX6mrocnpMYpRd9RSa13sBXRctcDm4pzyr8QaG8MbC/EilmZ9VHvUWX7whPUolNM7EYyk5O+
	NFN9tW57g/Bu2DOteax6KKguCvUZTZ9U6DKqJbO62S2BHSsCIsfzR1VIhSHk21pWh/0R5jqLVkI
	qQNpLoQcvXCCP5sKNIV4/DMR1ADIKD8omx1SQZICHNGSsTnq9Cch8T2RnY7iWfUUOqfcJDFfo+N
	MvMarN4zqwxcD4b7mIwgIgqBMBJf589M4n6zmaSRRRPJbJEpdyT39JxBRcx5helhY2810XhwgFm
	CqnrhO3M+gGLRoPof515fbmKSe0wRETzIHmw4FTPcXis69USh82hsek+DlEG8msVg=
X-Received: by 2002:a05:7300:ed0e:b0:2a4:3592:c60e with SMTP id 5a478bee46e88-2b739b961cfmr2913536eec.31.1769219359370;
        Fri, 23 Jan 2026 17:49:19 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5160014eec.29.2026.01.23.17.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:49:19 -0800 (PST)
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
Subject: [PATCH v3 09/16] HID: Include firmware version in the uevent
Date: Sat, 24 Jan 2026 01:49:00 +0000
Message-ID: <20260124014907.991265-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124014907.991265-1-derekjohn.clark@gmail.com>
References: <20260124014907.991265-1-derekjohn.clark@gmail.com>
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
2.52.0

