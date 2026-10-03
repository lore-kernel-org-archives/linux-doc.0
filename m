Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A736648F02F
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056537; cv=none; b=FMV9Ru2HYiTt/2eAw+3bn8ZOcjPZR1d5nVbaLD3ncBEXIKZWn/gXvDulCCke4vVGsfy31Sc/deg6d7wdIlmP4LbXOSab8SkcJZXaAayK80LPU/05/To6eJRzEsyX0eiv/JOJ/aSvCXPq55I7EM6trvhugXjGT1zm0uSGHeaBfM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056537; c=relaxed/simple;
	bh=UTMNVBmpziD/6OkhW7k2qdyc4szYQYqPlEN6mgqscUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKT0Frvby/vjsIMaiIwYdgroPj91Wzzcw8+MWbq1y+IUN5HWFLpYyy+e3nSRzkYGFFUzDc1LKjAPzY7Ph9I0CDddruX5XFtUYMQvK6UzADd58r8NFoLpc5P/EDMvw+BIlsRJsL8lzUq0e3ZA7pCA26LDSFyXnBeQryJW9DTDW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLAUkh8c; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLAUkh8c"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so10945185e9.2
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2026 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791056531; x=1791661331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QTR+lSUTRfb3BDBDCpeSoEx+7dbL4rm5VwUuFbtL9I0=;
        b=GLAUkh8cLDCLuokFm8MtDcli5ZE9QarmEpArCgbXkKOqB6MmwRBMWoOzMMQ537zlxs
         NKCHx4L0Z82cEPH/PoLrFr2lpjGu3meQu3cDDjknuspFSHSOiC9VfNhQUsPpjJcQAG5x
         Io9q2skV6cmdsftzSdDZJr+PHCIzVursfyksRzuJgjeK/qGoJ53+KFNUmY2lslsyR/yZ
         JugM50trlxLLFDq8qwvtkZ/EmatVBXk5vIRZMLaVNp7mCpzg5IqjUBixtdHRylQLtoXc
         qfZCAMGoDdyBHSt3z6tXnrfwy4u4QnAzKXGzaoYfPtbxbOqTvd6PFt4LLK1e+Dp0GDEK
         gYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791056531; x=1791661331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTR+lSUTRfb3BDBDCpeSoEx+7dbL4rm5VwUuFbtL9I0=;
        b=mHNsOO/0UA4yTZOCt82GmyHlklDj2IxlRLXh/LPM1BzmtiR2+f7GhKrqE4B/2/uusW
         EB2gIJslo4ALI1sH4c6LAuZ47Xb3Kab011G53Rc/XqTSDEAE8kf991/2UJOiSE3xEiCD
         +JIguJ3BuidO5sCsaTzYBCnO3I+7jyc4YaeNCiSjD2hx8zwwj1VlYfKI6clYTpzU4xFV
         9WYqxAJvP6OEabP062RH1COQlki53pqlsflETA4Li/TSiCg5dUbhmrX+/bhitokLQbaS
         Jc/xz0Vb0GIb5zYRKp0cwwUpaTP33PBtVH7yLLLHS5W6AnmS6niBomqH452DolYGmn4O
         qb0g==
X-Forwarded-Encrypted: i=1; AKwUvByGrDnLtTSBeA92CJXruq6+OvJ7WIBPrPav9lb4OP6oz6IStF8VBVmDmL/Mdtkua171jQChjXqU8tk=@vger.kernel.org
X-Gm-Message-State: AFuF++nG+JCT2/xyUK6616v4j+1HGT2bdcHBcG3iHoQNIjyhvgUtDTgx
	Uja/2by1iGMbn8Weijmxwj3rXGs1szFR2wJtDKkByXcQVb6by8M49yxC
X-Gm-Gg: AYBFou0CaC/ioVb6vhkzzjm3pfgkIXnXF7xaFwRTrorARM1DTaiMBl2v7Ki5v9WwkC0
	e2LuYmwvSOlorf9wsP9x1bdwjTYWV1DehVnAWHSoZ+gqr3GvAl6lO4veM2xJWYHtH9BzLs2OCxj
	TU1Vu+ACb/fae0KQJTtNtG+kzRPFr1xphn0RBulvBq6x0QDhuNmc1VDO/gLcMWkzZSM2mXxDJpp
	8Bzt/n94MPqyG461qVl+fwMNN6J3bApi7ajv1ei/UO1TA2aolytgPhTevkqWFpGzbsZ1YqMkAAi
	Tuk2Ftp19zdK2iQbEmRD6j8KO5WZkrXBmAcw8QWWtLxGlg3Vl3cn8k3oYI8yBgzF5NQffpkKWre
	dstOfOC04P/ADkrfU5jszX1EqIt/nAaoBSMVA9WjAk17rLDAk33AMc9BBe4pPnFAVwTrchasKfG
	ILQhsbyg+TunM+PNhAqFQSl4MsmXT0LiSaGZCkUL4if2g0VYWAbTynIBDCNKE2yr5QVvs3ykZlQ
	5ZzMcOuA+bbhx8xfGiQ9FB61/iibR7wTjjDHn0bU5HPqCnRmp9ye0s/HoFUgYsPUvOBn9V9zYYb
	4B3ecFSoPqzp0cdf6OgEH+Z1
X-Received: by 2002:a05:600c:3e07:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a0275864a6mr106751835e9.17.1791056531016;
        Sat, 03 Oct 2026 12:42:11 -0700 (PDT)
Received: from cachyos.home (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm161520495e9.15.2026.10.03.12.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:42:10 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>,
	David Fredman <davfre@gmail.com>
Subject: [RFC PATCH v6 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Date: Sat,  3 Oct 2026 21:41:34 +0200
Message-ID: <20261003194137.86176-6-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003194137.86176-1-i.bahloul01@gmail.com>
References: <20261003194137.86176-1-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The device loses its registers across a system suspend.  On suspend,
let the PCM core suspend the substreams (applications get -ESTRPIPE and
restart), then kill the session's URBs before cancelling the stream
work their handlers queue.  On resume, re-run the cold init and replay
the cached mixer state and flags.

USB autosuspend stays disabled: nothing in the driver holds a PM
reference while streaming.

Co-developed-by: David Fredman <davfre@gmail.com>
Signed-off-by: David Fredman <davfre@gmail.com>
Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro.c | 77 ++++++++++++++++++++++++-----
 sound/usb/babyfacepro/babyfacepro.h |  6 +--
 2 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index 0678bea58..aaa74ee68 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -3,8 +3,8 @@
  * RME Babyface Pro / Pro FS - proprietary-mode USB audio driver
  *
  * Core driver: USB vendor requests + cold init, interrupt-URB PCM
- * streaming, mixer-state persistence across re-probes, and the card
- * lifecycle (probe/disconnect/module entry).
+ * streaming, mixer-state persistence across re-probes/resume, and
+ * the card lifecycle (probe/disconnect/PM/module entry).
  *
  * See babyfacepro.h for the shared device state and register map,
  * and babyfacepro-ctl.c for the ALSA control surface.
@@ -200,9 +200,9 @@ int bf_pitch_write(struct snd_usb_babyface *chip, int pitch)
 }
 
 /* The cold-start init (cap_coldplug.pcap), verbatim from the user-space
- * reference (protocol::streaming_init).  Run at probe, where the
- * device state is unknown; a session start does not need it (see
- * babyface_stream_start()).
+ * reference (protocol::streaming_init).  Run at probe and after resume,
+ * where the device state is unknown; a session start does not need it
+ * (see babyface_stream_start()).
  */
 int bf_cold_init(struct snd_usb_babyface *chip)
 {
@@ -280,8 +280,9 @@ int bf_cold_init(struct snd_usb_babyface *chip)
 static LIST_HEAD(bf_saved_list);
 static DEFINE_MUTEX(bf_saved_mutex);
 
-/* Re-apply the whole cached mixer state to the device, whose registers
- * the cold init cleared.  Caller holds chip->mutex.
+/* Re-apply the whole cached mixer state after a resume (the device
+ * lost its registers across a system suspend - TotalMix does the same
+ * re-apply).  Caller holds chip->mutex.
  */
 int babyface_restore_state(struct snd_usb_babyface *chip)
 {
@@ -409,7 +410,7 @@ int bf_state_apply_flags(struct snd_usb_babyface *chip)
 	/* Re-apply an engaged DIM (the fixed -20 dB Phones pair + flag).  The
 	 * level DIM releases back to is not persisted: it always tracks the
 	 * Phones master while DIM is engaged, so rebuild it here - otherwise a
-	 * DIM released after a re-probe would drive Phones to
+	 * DIM released after a re-probe or resume would drive Phones to
 	 * silence (dim_saved still zero on the fresh chip).
 	 */
 	if (chip->dim) {
@@ -979,8 +980,9 @@ static int babyface_stream_start(struct snd_usb_babyface *chip)
 	/* A session start is what the RME Windows driver sends
 	 * (cap_audio): the trigger pair, the URBs, the arm.  The device
 	 * keeps its mixer state between sessions, so nothing is cleared
-	 * or re-applied here; the cold init runs at probe only.  The rate
-	 * is written first: hw_params only re-points the speed multiplier.
+	 * or re-applied here; the cold init runs at probe and resume
+	 * only.  The rate is written first: hw_params only re-points the
+	 * speed multiplier.
 	 */
 	ret = bf_clock_write(chip);
 	if (ret < 0)
@@ -1667,7 +1669,8 @@ static int babyface_probe(struct usb_interface *intf,
 	chip->card = card;
 
 	chip->dev = usb_get_dev(dev);
-	/* USB autosuspend is untested: nothing in this driver holds a PM
+	/* USB autosuspend is untested: babyface_suspend()/_resume() don't
+	 * check PMSG_IS_AUTO, and nothing in this driver holds a PM
 	 * reference while streaming, so an autosuspend request could race
 	 * a live stream.  Disable it explicitly rather than ship an
 	 * untested code path - full autosuspend support (correct
@@ -1925,6 +1928,56 @@ static void babyface_disconnect(struct usb_interface *intf)
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
+	/* The URB handlers queue the work: kill them first. */
+	mutex_lock(&chip->mutex);
+	if (chip->streaming)
+		babyface_stream_kill(chip);
+	mutex_unlock(&chip->mutex);
+	cancel_work_sync(&chip->stream_work);
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
+	 * restart (prepare starts a new session).
+	 */
+	mutex_lock(&chip->mutex);
+	err = usb_set_interface(chip->dev, BF_IFACE, chip->alt);
+	if (err < 0)
+		goto out;
+	err = bf_cold_init(chip);
+	if (err < 0)
+		goto out;
+	err = babyface_restore_state(chip);
+	if (err < 0)
+		goto out;
+	err = bf_state_apply_flags(chip);
+out:
+	mutex_unlock(&chip->mutex);
+	return err;
+}
+
 static const struct usb_device_id babyface_ids[] = {
 	{ USB_DEVICE(USB_VENDOR_RME, USB_PRODUCT_BABYFACE_PRO_FS) },
 	{ }
@@ -1935,6 +1988,8 @@ static struct usb_driver babyface_driver = {
 	.name = "snd-usb-babyface-pro",
 	.probe = babyface_probe,
 	.disconnect = babyface_disconnect,
+	.suspend = babyface_suspend,
+	.resume = babyface_resume,
 	.id_table = babyface_ids,
 };
 
diff --git a/sound/usb/babyfacepro/babyfacepro.h b/sound/usb/babyfacepro/babyfacepro.h
index 783ea03ac..e324e8411 100644
--- a/sound/usb/babyfacepro/babyfacepro.h
+++ b/sound/usb/babyfacepro/babyfacepro.h
@@ -12,7 +12,7 @@
  * snd-usb-audio quirk.
  *
  * babyfacepro.c holds the card lifecycle, the PCM stream and the
- * mixer-state persistence across re-probes;
+ * mixer-state persistence across re-probes and resume;
  * babyfacepro-ctl.c holds the ALSA control surface - the hardware
  * mixer.
  *
@@ -344,7 +344,7 @@ struct snd_usb_babyface {
 	struct snd_kcontrol *dim_kctl;      /* for snd_ctl_notify */
 };
 
-/* The mixer state cached across interface re-probes (see
+/* The mixer state cached across interface re-probes/resume (see
  * babyfacepro.c's own comment on bf_state_save/bf_state_restore).
  */
 struct bf_saved {
@@ -395,7 +395,7 @@ void babyface_pcm_stop_both(struct snd_usb_babyface *chip, snd_pcm_state_t state
 void babyface_stream_work(struct work_struct *work);
 extern const struct snd_pcm_hw_constraint_list bf_rates_constraint;
 
-/* Mixer-state persistence across interface re-probes. */
+/* Mixer-state persistence across interface re-probes/resume. */
 void bf_state_save(struct snd_usb_babyface *chip);
 int bf_state_restore(struct snd_usb_babyface *chip);
 void bf_state_purge(void);
-- 
2.56.0

