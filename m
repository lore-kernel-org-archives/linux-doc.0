Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27F43550B
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782799; cv=none; b=g7IhX6UqYeds+blZWBriHUkNRSjruYdCbOymijKdsMgWxN1dCaRh0VjPm3Rkf3sM7lVu1E1TENh9B5yCmDE4I7rh0hTRSECzyq8UHdt+7uv0dIa1+WSLAXV//BJQxJ2MD+gdm0zTHl3xyJWFH8uU4mm5qhVlD/gbOIa0U1cv0jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782799; c=relaxed/simple;
	bh=zTvGTNkJ/wqnyMbPR7YJxhbtHyE5HaI2GyeFefAOijU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NHMi7+KZpTynfgkHFmuXtvDqF1Lyn73BD1am0hMVMsClQzJCnWi9j0i70M0TwUCue1BasEwtj5JZSx8Rnurx4nfcdCloQN4Dc9xY8dF+uFMW1SzCzxWhDtYC0SD13AbI7gkRUiw/y4pEmSt1TuwBN46iOdAZyeoeYA3+yRbo96w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3DxXNWB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3DxXNWB"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3410440a91.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782796; x=1786387596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDX03Rc6Co4fp263PbZY9y3DOwf1pY8yl2EntzRzQTY=;
        b=p3DxXNWBV4j1dRrCXPXV2jngu7hR8QrSTUuufJb3yqY4LkE3D7DmdBA6hSRZMWU0Sb
         Iq96xFqkD9bMIbjCE1pRLkx9dHrCFP/AYyn2Eb7C1XPFgZ6wcO1nEN5S3bmnyADMjqlt
         CfcH5sigpi5xGyU7PRhIqEopqORQAV3PUMZprsBn39xJ/FOqy5YYGRKvocMKonyUa/X5
         XoMIUlJfVZQ3qVX57rfMwSlwPKsuQWVzXJq4WX9mh/BUBKyLUP/leJErGM0Fzczn6epM
         iINk/wH1OjU0d2G3x+adq2/ZikIykp+INIOHKtiyOIWOWlHeM2WVdMp1RpvfJTfh6KrY
         /MNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782796; x=1786387596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDX03Rc6Co4fp263PbZY9y3DOwf1pY8yl2EntzRzQTY=;
        b=orzTVpUvaER3yDDNXXAK7Og1TdfU7J5KBbySFx4tXuOyUcA9antkQmhmLTk6UBEZq/
         EUktPfKGQh1FFReV9N0W8CCjkCG2CSjgIRmVSBZP6+v/MBl+2Qr8dFxPfLBn/siiH2jU
         RUhgn4XbB2LWMG1zJEOgfMD7QrVGsd3UpSrEhy7hjZipszZr+udeCohowjCq82gRtgFB
         SAzU1SK/0IGbR0iRxxDeNEpjS6TqIo519shrS3QVh64zTTTB4NgEOeNugjyB03NvN8Dg
         ZgO0PfybrNk2hJi7P/tR++MdQt1tjjXlI53Aeo7r+M7tM5udb1tSi+aMb3owmHeeVz6O
         G2Hw==
X-Forwarded-Encrypted: i=1; AHgh+RpJj01Tuph+Xf0ZMUYtQskDvgm5DNaMbSPwvKZRG0e13ebHwGLCW4bStXDISNDj4Bar0bjc66X787M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVq/k7kpCmsn9+1qQxNkUziVd4Kqwd0YYKDI3VoDkstM9Ea5os
	k+2nQS2Pg6RZq7eYmbtd3oRJ+4xLr2+AbGktB79i6Np8Put83FR95VDl
X-Gm-Gg: AR+sD10abah1N7QHkZAStcz5OZLIDPEinnBMtHmJtt1NBGaGMFpRgdt7ADL2OPGy2sj
	M2UOWYQFFa29APz6qkH4vDTe6E6CARxAXL966NtA9/wDQiUuYoHh86nhDrwyyZeg1JfdaYX1LUT
	AHhn3lgvd3B80kxvlzewxHbX2Yh7gyAX8I1xvyDppSisrmoSaW9va/9N0lZx1xrjSRBO7/hGrgU
	fEmO3Hg4Aj0dXeKy/eQNVmd8L6Jqa/fBfzjdCkRvwp+w7UcvNPvQLKBF0gBmLNYfnuyym/RVUD5
	2VHMCDobaH9xbyPGYkBsuBvKMqwr9izE0LDo3LHOMawYbouUvEBoGV69cvZILXIAMM4LFKWkZec
	poEpdDnYqRR911V/Z2Dbkmmrn4cYkPQfF0aCFE/V7VHmmDgGw8PTP9QNEqPOhzwHkGlpM9kXP4m
	w6WjgBQWYJMPbOc+2QBs5nNB9BBc/Uzu4JxicwZej/1qtQ6XdoXeGKdwyG8yJl6BCO9Bqa8iQTV
	EmNcSy7Q+Vc3iiYYtnuhm8YlfBO2xqqp+8/zanmt6S9yRXL+A2Z
X-Received: by 2002:a17:90b:540b:b0:38e:e9b:ffa7 with SMTP id 98e67ed59e1d1-38fbc51f1e4mr10231317a91.28.1785782795558;
        Mon, 03 Aug 2026 11:46:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:35 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:26 -0700
Subject: [PATCH 01/21] HID: core: automatically initialize generic FF if no
 other FF is present
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-1-1dc9bbacd88c@gmail.com>
References: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
In-Reply-To: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, cocci@inria.fr
X-Mailer: b4 0.16-dev-b242f

Some HID drivers initialize their own force-feedback support within
their .input_configured() callback. In such cases, we should skip
the generic PID force-feedback initialization to avoid conflicts and
redundant setup.

Add hid_has_ff_input() helper and use it to check for existing FF
capabilities before calling hdev->ff_init().

Since we now have a dynamic way to detect if force-feedback is needed,
the HID_CONNECT_FF flag is redundant for conflict resolution and can
be ignored in the core initialization logic. Generic PID support will
now be attempted by default for any claimed input device that doesn't
already have FF capabilities.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index f107f5103b35..2767a171eae9 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2287,6 +2287,18 @@ static const BIN_ATTR_RO(report_descriptor, HID_MAX_DESCRIPTOR_SIZE);
 
 static const DEVICE_ATTR_RO(country);
 
+static bool hid_has_ff_input(struct hid_device *hdev)
+{
+	struct hid_input *hidinput;
+
+	list_for_each_entry(hidinput, &hdev->inputs, list) {
+		if (test_bit(EV_FF, hidinput->input->evbit))
+			return true;
+	}
+
+	return false;
+}
+
 int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 {
 	static const char *types[] = { "Device", "Pointer", "Mouse", "Device",
@@ -2336,7 +2348,8 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	hid_process_ordering(hdev);
 
 	if ((hdev->claimed & HID_CLAIMED_INPUT) &&
-			(connect_mask & HID_CONNECT_FF) && hdev->ff_init)
+			(connect_mask & HID_CONNECT_FF) && hdev->ff_init &&
+			!hid_has_ff_input(hdev))
 		hdev->ff_init(hdev);
 
 	len = 0;

-- 
2.55.0.629.g250fe7f194-goog

