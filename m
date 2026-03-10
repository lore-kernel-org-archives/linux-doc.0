Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A03EBF0F
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127791; cv=none; b=obEG+9BZDdAh/gJKmMt9GcBsuMqutmpB/mObRAE4a/uXJepMqaySbcwH3S3DAU8ywHgCGTY3W3BOCB+itQlSVcqkbhpqA2wwC/AYENkcNmgUdBpmUzMRCLSYkzZ23gOjG1xwWjkm79kulgPwTPB6mZ3F3JzyutYfP+rF4fL4rbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127791; c=relaxed/simple;
	bh=FqJg3tER+3ZakLbAqodEwX5qMpqX5ohA1t7cv/evT/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXjpEUdubGm53cXX//u6TaGwkdJsUxruZsJ/64mVjd84MOsSRcaOikhsGYK/29Ah/yRDJmDgdhpZgihvuab1dPQCjf/ZIMhstaMyHzkQfoiMOl3LNuepuNAAvutLdBK6j1X4KE6ETrtNm+dru1Mf3yJZ+ewEiUm5ENrgtPaOK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ke85yFH0; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke85yFH0"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be1d9c356cso7336483eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127789; x=1773732589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfIfejfLL8bAkAX0LN1/a1iIMrdC2id01EppEdgKGLI=;
        b=ke85yFH0OglxdcpWrXuZso0k+xZp+5KO3yAfeNuPzEzGmhyD/rECSg6uJ2jXstAnc8
         f+hEDxHbKyvz7es7Ct1P9d8r2A8Ht4wQ7bTIyWGwoGU8+/y5KT4HvoENd2AtpNxMc8tE
         n23gMWIeHV+f4CXpIpa8VNr/KI2MJ01LSnrwAIwUk19JCn26lFU40F4+Ms1rbdBDGGOS
         VhqiTs0UitWevlNtJJX1xFQSRp8Zx/QWxU9E6N1w7qGisoGruxIS3+gmoaueqbZCN2EK
         9qvm1yFa5yPX5n1lUKGvPIEa/WAWt28vtbdr1w3Xj7qDHBH6/I7puE/EvN/puo5wvgR3
         qnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127789; x=1773732589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rfIfejfLL8bAkAX0LN1/a1iIMrdC2id01EppEdgKGLI=;
        b=ZPyK4Rxxmi+6x+Z0ZNQ+n+7rAtKLtCuagBO+kqXIT//uE+okEzDtP+l/760rozGADj
         4NJb9uDjJIvuipuBmDKU7QUcF14N7/3dAuiW4Bt1lSiX2zyOHXbnAcms/jUhibi1RRUS
         U/EV24XULyvlhWS/Adj2A9bd5jmpnS//Msp2WI/FwJczhhswEEd0wGXLvAh0Nvk56ERU
         sv7ETxXleTvGZmDUAOOxVtAKoPyVzqqTPALP/MntMnG3Tv6b/egQVVj/pIycnWEGoaWv
         IFlon10zRUUjfIfELsJihTqe+bAwvXNueFO14jgslE60ZHUbLDvpmsK0huR7tgDl54bk
         0rbw==
X-Forwarded-Encrypted: i=1; AJvYcCW1g3EJnaJBrrPie7xXqJCyPQlxryypvosbm2lpDQK5pBxrUWu3YLqTAmcGECpGLSxTi3b26OLFgF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDodOwmlnfqJIitGW9puQ1FkxIqYblDz8PXocyoDGmMCSNQzWm
	aIV7I5mRCa0935s76TcclQCIhykRJJT0E36sVLmEIIddXR5ce7KDG81m
X-Gm-Gg: ATEYQzwhEQ47Ha7VZm3qIc9+00JjOncNbu3L4sYJHF6i0awqPpcCT37dVsaHQJuSPRX
	DpmkIhxoGCKkDQSDhrhUMsXKq8Bb0s4l2pUQOpaULfLNVtEQzlL9voozFH5lLNRmvVd2oAfglOl
	Xwfx3XMR0ykNN6SHQnste+Iu4KDfWPVDLYDM0A5jpXuRGa+nBHtllxpo987+sefmDVZcOGILLCM
	Fm0GCrY+FQiq5AB3lcbfkQp+wL2wUpfhL3pgB1N0qI8A9hIWbVggoWn65DUqcPmsAH/y8f/MOSK
	bnfQcpfcBzfcr+KhqO+POeSwxeYcQeeF/mew5WsCeILSzroJwGh7CPViJzsn//1PbpoDftPD211
	8NYayCKyVE8/nVtbJ3j63C72MCmhkfEKdfSnfPB1otVw5/Do/DmFZezcyCQYqMZ8U3J4BiJqg1H
	nccTZE8Dz1x5qh/GMGL5VUevd+sx1Ch3qBeVD9vxHamniOG4kD0uhDbe60Y2f2TMwUW6fJ8XHo+
	K3x
X-Received: by 2002:a05:7300:3724:b0:2be:27db:b16 with SMTP id 5a478bee46e88-2be4deaedb6mr6266093eec.15.1773127789119;
        Tue, 10 Mar 2026 00:29:49 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be81209142sm721925eec.12.2026.03.10.00.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:29:48 -0700 (PDT)
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
Subject: [PATCH v6 09/19] HID: Include firmware version in the uevent
Date: Tue, 10 Mar 2026 07:29:27 +0000
Message-ID: <20260310072937.3295875-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
References: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
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
firmware version, and so if that is exported to userspace fwupd can
discover it and avoid needing to detach the kernel driver until it's time
to update the device.

Introduce a new member in the struct hid_device for the version and export
a new uevent variable HID_FIRMWARE_VERSION that will display the version
that HID drivers obtained.

Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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
index dce862cafbbd..ce728c8d5bdc 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -698,6 +698,7 @@ struct hid_device {
 	char name[128];							/* Device name */
 	char phys[64];							/* Device physical location */
 	char uniq[64];							/* Device unique identifier (serial #) */
+	u64 firmware_version;						/* Firmware version */
 
 	void *driver_data;
 
-- 
2.53.0

