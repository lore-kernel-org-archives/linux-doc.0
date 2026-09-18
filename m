Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6A4E7814
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731622; cv=none; b=KN9eCQ8rzuYYXhW4OwcXe3N4PELxOIxVgYGwGX7rAtQdCAsccbz3iJI9KVQeAGpPjxvstG79USQLecXEgB94A9nN4/zSnxusSD45ILNJEWow98KtGRX2SWsa5aUF4d5V5H89P6qUmCOYUS79UBZ5GZrxfwo6gsGzM4kKqSJ+ZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731622; c=relaxed/simple;
	bh=VLOgYBB284e6UvetsR2kb8uGxt30t++4NGeUIM3BLp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbXdwfzMMIRmzGDfnDMHTl69sHpu2bwnpc6SIfnrJyQEqrs2RtuOc6nXx+W7ElWaGnvUl9gbkZBgTNKiTfPMvttFAFpWoOPNv9AUW88f4bFKs/u4MdkAFOUiYW8jdk+8Bc2FNcPugrTz5KihVeod+8Iwqf4MoKHzTSPylFgo6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL9OR3op; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL9OR3op"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so485825f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731615; x=1790336415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsOk67V7rRXI6BMJYe6ZaVYzC3vxvy2AFyjxpdxDJNc=;
        b=oL9OR3opRltkdNEaiQgKlwLG84MyajATZZ0WJE8TW0M5AeWKrDatabbzveClZIzRw1
         gGknTcWTw7xfeNfYc59SWKIUF3VnSlFKosVM+uzjcGDuQOkBvTpiLRLHkEPEz67aB9Wm
         aZRr5cYLV8kl/RIm4sfMHOuwH5rlnqHFnDScerPLdHQCJHfdmLFWIMf51M/TzSMM9IJK
         7CIBJQajUiO11xe2cauIStjgnj/HfLTaOXaB1LTceonGJ4fPdIIen6xjE2HVzmvPF6P2
         fjYtjHRgZN58qFucWA5UmskufYFPq3mLVV1GcKhTcosTrrQbyKfNF77d43XQAwH7mnw3
         ONnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731615; x=1790336415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsOk67V7rRXI6BMJYe6ZaVYzC3vxvy2AFyjxpdxDJNc=;
        b=P94nnIpL2iz0m7/F0MqrthDF9nIDYGtSJa8bvdP8fwliqbr4m6h80mic6InENceyIt
         xqgD7i2UEsyGqoPLxSUPrHWT2eG98cyglMR80kBREnSMpc2MgDximdPNLpIU0+y4CFgJ
         wcVQmYoDQO1oQezbl47E6N1wgKexuoAqhjyBRzhKXkQZuh/sUw1174ulHLcW9BSOBWp3
         mhm0fOswhE7/ktIR9WPddR7HuavGg0/0AGkaHL9RCc32Zej8XrxWISjQ52+OgcKdG7Oh
         HJF+ZcVpjBOeJQ/W6Kug/vDOXKZGUv/GC1UYVoGrE7vl0Bej0oSB2VXmAuyH5jNX4b0b
         litA==
X-Forwarded-Encrypted: i=1; AKwUvBw09s5KPUvPuBPX41lpxACcdj+e4BMWloRXS4rONk7UqKHEzWid/1HlqJcU5tiTKWGe6qlEUQIuu48=@vger.kernel.org
X-Gm-Message-State: AFuF++kqUkqxdZHCHtIBgPqHe0FKhJmfknuqrYK4yYsADEl2UhHfBjeG
	/gE9AylYQw5Xr0kJRvHF0ZMv78a5TomPRXDHw8JH/ydkRCvgKiJ4YPYd
X-Gm-Gg: AYBFou09CKNbbfV0pUwGTdw3pvNloRXeU95dte8CCZWCjD6MeXi9/kRiYuSJzd8TTlI
	vO5K2maFHQsMLLbS3C4YZ3hYbjaQaER0l9whTCFEVRVpaFi5sr4fIqgZz6IAqfuy9yXJpN3AiVc
	V6kYuyfkpWvG/fbevpGSkFH92Eal87twPcdkntqisPneyRLyDNDSbyxYcueyXzS0QFbF97GchOM
	HQ1Q0sqDCpjeCcVhT6IoUVMyQyyn+c2qR19V6yVIeIAGCnhtVDYI/f/WU+kGZJI2kosK66h9cKz
	8syqKw5P6eLqIicXvo6/lydc0q6C7HXR33lcF54yIbe5MvPda8wXhPZb6XLV8zHqIoCL1pp6rJG
	WUpczg6xVR7rYU6fF+68QCFBB76vsWjwF5c1bMBOmuqxrXaXwBPeWmB1m4bl+9HuNJZYxTVKeST
	IBmLJVGOPU+JdL9nv8zgHlmXT1/QH1EAYm5hkek877bL9oYLttzyluKm4IqxTkoWOyYkeAJOXnl
	H13CFa7k3xA4cmFnMOjkRuupZE=
X-Received: by 2002:a05:6000:4904:b0:486:fed8:8710 with SMTP id ffacd0b85a97d-4871e367d9amr3116450f8f.38.1789731614971;
        Fri, 18 Sep 2026 04:40:14 -0700 (PDT)
Received: from cachyos ([41.143.99.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm3734893f8f.5.2026.09.18.04.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:40:14 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v5 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Date: Fri, 18 Sep 2026 12:39:41 +0100
Message-ID: <20260918113944.76871-6-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113944.76871-1-i.bahloul01@gmail.com>
References: <20260918113944.76871-1-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Kills the stream and lets the PCM core suspend substreams (apps get
-ESTRPIPE and restart) on suspend; resume re-runs the cold init and
replays the cached mixer state.  Front-panel poll start/stop around
suspend is added by the front-panel patch, once that poll exists.

USB autosuspend itself is out of scope (already disabled at probe in
the first patch of this series) - this is S3 system sleep only.

Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro.c | 48 +++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index c15fca214..ccf3dbf36 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -1592,6 +1592,52 @@ static void babyface_disconnect(struct usb_interface *intf)
 	snd_card_free_when_closed(chip->card);
 }
 
+static int babyface_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+
+	struct snd_device *sdev;
+
+	if (!chip)
+		return 0;
+	list_for_each_entry(sdev, &chip->card->devices, list) {
+		if (sdev->type == SNDRV_DEV_PCM)
+			snd_pcm_suspend_all(sdev->device_data);
+	}
+	cancel_work_sync(&chip->stream_work);
+	mutex_lock(&chip->mutex);
+	if (chip->streaming)
+		babyface_stream_kill(chip);
+	mutex_unlock(&chip->mutex);
+	return 0;
+}
+
+static int babyface_resume(struct usb_interface *intf)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+	int err;
+
+	if (!chip)
+		return 0;
+
+	/* The device lost its state across the suspend; re-run the cold
+	 * init and re-apply the cached mixer state.  Suspended PCM
+	 * substreams are woken by the core - apps get -ESTRPIPE and
+	 * restart (the trigger re-arms the stream).
+	 */
+	mutex_lock(&chip->mutex);
+	err = usb_set_interface(chip->dev, BF_IFACE, chip->alt);
+	if (err < 0)
+		goto out;
+	err = bf_cold_init(chip);
+	if (err < 0)
+		goto out;
+	err = babyface_restore_state(chip);
+out:
+	mutex_unlock(&chip->mutex);
+	return err;
+}
+
 static const struct usb_device_id babyface_ids[] = {
 	{ USB_DEVICE(USB_VENDOR_RME, USB_PRODUCT_BABYFACE_PRO_FS) },
 	{ }
@@ -1602,6 +1648,8 @@ static struct usb_driver babyface_driver = {
 	.name = "snd-usb-babyface-pro",
 	.probe = babyface_probe,
 	.disconnect = babyface_disconnect,
+	.suspend = babyface_suspend,
+	.resume = babyface_resume,
 	.id_table = babyface_ids,
 };
 
-- 
2.55.0

