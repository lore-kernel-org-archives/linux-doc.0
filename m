Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8CA3B6BEC
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034790; cv=none; b=bsENZ5RqqE6keHkOp4juejg+/5dokTdC5ExY+Ia/jQXryY5+Sag8LX84AR3jiAN6LqCOKEbDNEHYIePeEPA+ouI4jl9art3RKf6Hmmfd4by8zFGRnmwSeFWw7bnPuKvBH3KyOlMeCp5oS4Nn67cE4cfhXFz3dAR6YHkl9qMTIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034790; c=relaxed/simple;
	bh=mhuTpIbfyq3SIzgk0CJMINKU5CuIKzC3LnXUSUFv45M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmdrjxNfOKAo/isa21JWEBZBKoc82vZRyd3dUO2w1/MXBXfLvs0eA7cmzM+I9qX2On6XGsHAAZZtEMmCqhoZ0WgeABIoZ6PNpjxSx77x+l3DW9jlF/DlmF0BdkuDC3wybswul7rfUTGDWL5OTP2fVEAm/yPgriPKTia2Ur0oPcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FTFtTWLL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FTFtTWLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775034787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AFoE+BHETSvnDnn6Q4Tz2Gj1izB0cSeVWxhoo852x4=;
	b=FTFtTWLLyTo1DSIs3A4ojyZndoZmQbLEJ6BN/YyUv23Qc3KqfLrXdwy4qv5ckX5AbzXprJ
	R2UPI7QC000F7rN997m9JEPcqdhnzbhm+NvZh2ALOc829smW5q1dDevwv9tP6HIDK62Kem
	SaiDkvMYq1hh5hiwraUrdua3xyFG3Yo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-5A_U-xVaMj2K6bVLX-KRfg-1; Wed,
 01 Apr 2026 05:13:03 -0400
X-MC-Unique: 5A_U-xVaMj2K6bVLX-KRfg-1
X-Mimecast-MFC-AGG-ID: 5A_U-xVaMj2K6bVLX-KRfg_1775034781
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E8DE1800371;
	Wed,  1 Apr 2026 09:13:01 +0000 (UTC)
Received: from p16v.redhat.com (unknown [10.44.33.175])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A5F119560AB;
	Wed,  1 Apr 2026 09:12:55 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Michal Schmidt <mschmidt@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/3] dpll: zl3073x: implement frequency monitoring
Date: Wed,  1 Apr 2026 11:12:37 +0200
Message-ID: <20260401091237.1071995-4-ivecera@redhat.com>
In-Reply-To: <20260401091237.1071995-1-ivecera@redhat.com>
References: <20260401091237.1071995-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Extract common measurement latch logic from zl3073x_ref_ffo_update()
into a new zl3073x_ref_freq_meas_latch() helper and add
zl3073x_ref_freq_meas_update() that uses it to latch and read absolute
input reference frequencies in Hz.

Add meas_freq field to struct zl3073x_ref and the corresponding
zl3073x_ref_meas_freq_get() accessor. The measured frequencies are
updated periodically alongside the existing FFO measurements.

Add freq_monitor boolean to struct zl3073x_dpll and implement the
freq_monitor_set/get device callbacks to enable/disable frequency
monitoring via the DPLL netlink interface.

Implement measured_freq_get pin callback for input pins that returns the
measured input frequency in mHz.

Reviewed-by: Petr Oros <poros@redhat.com>
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
Changes v2 -> v3:
- Changed measured_freq_get to return value in mHz

Changes v1 -> v2:
- Renamed actual-frequency to measured-frequency (Vadim)
---
 drivers/dpll/zl3073x/core.c |  88 ++++++++++++++++++++++++++-----
 drivers/dpll/zl3073x/dpll.c | 100 ++++++++++++++++++++++++++++++++++--
 drivers/dpll/zl3073x/dpll.h |   2 +
 drivers/dpll/zl3073x/ref.h  |  14 +++++
 4 files changed, 187 insertions(+), 17 deletions(-)

diff --git a/drivers/dpll/zl3073x/core.c b/drivers/dpll/zl3073x/core.c
index 6363002d48d46..cb47a5db061aa 100644
--- a/drivers/dpll/zl3073x/core.c
+++ b/drivers/dpll/zl3073x/core.c
@@ -632,22 +632,21 @@ int zl3073x_ref_phase_offsets_update(struct zl3073x_dev *zldev, int channel)
 }
 
 /**
- * zl3073x_ref_ffo_update - update reference fractional frequency offsets
+ * zl3073x_ref_freq_meas_latch - latch reference frequency measurements
  * @zldev: pointer to zl3073x_dev structure
+ * @type: measurement type (ZL_REF_FREQ_MEAS_CTRL_*)
  *
- * The function asks device to update fractional frequency offsets latch
- * registers the latest measured values, reads and stores them into
+ * The function waits for the previous measurement to finish, selects all
+ * references and requests a new measurement of the given type.
  *
  * Return: 0 on success, <0 on error
  */
 static int
-zl3073x_ref_ffo_update(struct zl3073x_dev *zldev)
+zl3073x_ref_freq_meas_latch(struct zl3073x_dev *zldev, u8 type)
 {
-	int i, rc;
+	int rc;
 
-	/* Per datasheet we have to wait for 'ref_freq_meas_ctrl' to be zero
-	 * to ensure that the measured data are coherent.
-	 */
+	/* Wait for previous measurement to finish */
 	rc = zl3073x_poll_zero_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
 				  ZL_REF_FREQ_MEAS_CTRL);
 	if (rc)
@@ -663,15 +662,64 @@ zl3073x_ref_ffo_update(struct zl3073x_dev *zldev)
 	if (rc)
 		return rc;
 
-	/* Request frequency offset measurement */
-	rc = zl3073x_write_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
-			      ZL_REF_FREQ_MEAS_CTRL_REF_FREQ_OFF);
+	/* Request measurement */
+	rc = zl3073x_write_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL, type);
 	if (rc)
 		return rc;
 
 	/* Wait for finish */
-	rc = zl3073x_poll_zero_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
-				  ZL_REF_FREQ_MEAS_CTRL);
+	return zl3073x_poll_zero_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
+				    ZL_REF_FREQ_MEAS_CTRL);
+}
+
+/**
+ * zl3073x_ref_freq_meas_update - update measured input reference frequencies
+ * @zldev: pointer to zl3073x_dev structure
+ *
+ * The function asks device to latch measured input reference frequencies
+ * and stores the results in the ref state.
+ *
+ * Return: 0 on success, <0 on error
+ */
+static int
+zl3073x_ref_freq_meas_update(struct zl3073x_dev *zldev)
+{
+	int i, rc;
+
+	rc = zl3073x_ref_freq_meas_latch(zldev, ZL_REF_FREQ_MEAS_CTRL_REF_FREQ);
+	if (rc)
+		return rc;
+
+	/* Read measured frequencies in Hz (unsigned 32-bit, LSB = 1 Hz) */
+	for (i = 0; i < ZL3073X_NUM_REFS; i++) {
+		u32 value;
+
+		rc = zl3073x_read_u32(zldev, ZL_REG_REF_FREQ(i), &value);
+		if (rc)
+			return rc;
+
+		zldev->ref[i].meas_freq = value;
+	}
+
+	return 0;
+}
+
+/**
+ * zl3073x_ref_ffo_update - update reference fractional frequency offsets
+ * @zldev: pointer to zl3073x_dev structure
+ *
+ * The function asks device to latch the latest measured fractional
+ * frequency offset values, reads and stores them into the ref state.
+ *
+ * Return: 0 on success, <0 on error
+ */
+static int
+zl3073x_ref_ffo_update(struct zl3073x_dev *zldev)
+{
+	int i, rc;
+
+	rc = zl3073x_ref_freq_meas_latch(zldev,
+					 ZL_REF_FREQ_MEAS_CTRL_REF_FREQ_OFF);
 	if (rc)
 		return rc;
 
@@ -714,6 +762,20 @@ zl3073x_dev_periodic_work(struct kthread_work *work)
 		dev_warn(zldev->dev, "Failed to update phase offsets: %pe\n",
 			 ERR_PTR(rc));
 
+	/* Update measured input reference frequencies if any DPLL has
+	 * frequency monitoring enabled.
+	 */
+	list_for_each_entry(zldpll, &zldev->dplls, list) {
+		if (zldpll->freq_monitor) {
+			rc = zl3073x_ref_freq_meas_update(zldev);
+			if (rc)
+				dev_warn(zldev->dev,
+					 "Failed to update measured frequencies: %pe\n",
+					 ERR_PTR(rc));
+			break;
+		}
+	}
+
 	/* Update references' fractional frequency offsets */
 	rc = zl3073x_ref_ffo_update(zldev);
 	if (rc)
diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
index a29f606318f6d..d788ca45a17e5 100644
--- a/drivers/dpll/zl3073x/dpll.c
+++ b/drivers/dpll/zl3073x/dpll.c
@@ -39,6 +39,7 @@
  * @pin_state: last saved pin state
  * @phase_offset: last saved pin phase offset
  * @freq_offset: last saved fractional frequency offset
+ * @measured_freq: last saved measured frequency
  */
 struct zl3073x_dpll_pin {
 	struct list_head	list;
@@ -54,6 +55,7 @@ struct zl3073x_dpll_pin {
 	enum dpll_pin_state	pin_state;
 	s64			phase_offset;
 	s64			freq_offset;
+	u32			measured_freq;
 };
 
 /*
@@ -202,6 +204,21 @@ zl3073x_dpll_input_pin_ffo_get(const struct dpll_pin *dpll_pin, void *pin_priv,
 	return 0;
 }
 
+static int
+zl3073x_dpll_input_pin_measured_freq_get(const struct dpll_pin *dpll_pin,
+					 void *pin_priv,
+					 const struct dpll_device *dpll,
+					 void *dpll_priv, u64 *measured_freq,
+					 struct netlink_ext_ack *extack)
+{
+	struct zl3073x_dpll_pin *pin = pin_priv;
+
+	*measured_freq = pin->measured_freq;
+	*measured_freq *= DPLL_PIN_MEASURED_FREQUENCY_DIVIDER;
+
+	return 0;
+}
+
 static int
 zl3073x_dpll_input_pin_frequency_get(const struct dpll_pin *dpll_pin,
 				     void *pin_priv,
@@ -1116,6 +1133,35 @@ zl3073x_dpll_phase_offset_monitor_set(const struct dpll_device *dpll,
 	return 0;
 }
 
+static int
+zl3073x_dpll_freq_monitor_get(const struct dpll_device *dpll,
+			      void *dpll_priv,
+			      enum dpll_feature_state *state,
+			      struct netlink_ext_ack *extack)
+{
+	struct zl3073x_dpll *zldpll = dpll_priv;
+
+	if (zldpll->freq_monitor)
+		*state = DPLL_FEATURE_STATE_ENABLE;
+	else
+		*state = DPLL_FEATURE_STATE_DISABLE;
+
+	return 0;
+}
+
+static int
+zl3073x_dpll_freq_monitor_set(const struct dpll_device *dpll,
+			      void *dpll_priv,
+			      enum dpll_feature_state state,
+			      struct netlink_ext_ack *extack)
+{
+	struct zl3073x_dpll *zldpll = dpll_priv;
+
+	zldpll->freq_monitor = (state == DPLL_FEATURE_STATE_ENABLE);
+
+	return 0;
+}
+
 static const struct dpll_pin_ops zl3073x_dpll_input_pin_ops = {
 	.direction_get = zl3073x_dpll_pin_direction_get,
 	.esync_get = zl3073x_dpll_input_pin_esync_get,
@@ -1123,6 +1169,7 @@ static const struct dpll_pin_ops zl3073x_dpll_input_pin_ops = {
 	.ffo_get = zl3073x_dpll_input_pin_ffo_get,
 	.frequency_get = zl3073x_dpll_input_pin_frequency_get,
 	.frequency_set = zl3073x_dpll_input_pin_frequency_set,
+	.measured_freq_get = zl3073x_dpll_input_pin_measured_freq_get,
 	.phase_offset_get = zl3073x_dpll_input_pin_phase_offset_get,
 	.phase_adjust_get = zl3073x_dpll_input_pin_phase_adjust_get,
 	.phase_adjust_set = zl3073x_dpll_input_pin_phase_adjust_set,
@@ -1151,6 +1198,8 @@ static const struct dpll_device_ops zl3073x_dpll_device_ops = {
 	.phase_offset_avg_factor_set = zl3073x_dpll_phase_offset_avg_factor_set,
 	.phase_offset_monitor_get = zl3073x_dpll_phase_offset_monitor_get,
 	.phase_offset_monitor_set = zl3073x_dpll_phase_offset_monitor_set,
+	.freq_monitor_get = zl3073x_dpll_freq_monitor_get,
+	.freq_monitor_set = zl3073x_dpll_freq_monitor_set,
 	.supported_modes_get = zl3073x_dpll_supported_modes_get,
 };
 
@@ -1572,6 +1621,7 @@ zl3073x_dpll_pin_ffo_check(struct zl3073x_dpll_pin *pin)
 	struct zl3073x_dev *zldev = zldpll->dev;
 	const struct zl3073x_ref *ref;
 	u8 ref_id;
+	s64 ffo;
 
 	/* Get reference monitor status */
 	ref_id = zl3073x_input_pin_ref_get(pin->id);
@@ -1582,10 +1632,47 @@ zl3073x_dpll_pin_ffo_check(struct zl3073x_dpll_pin *pin)
 		return false;
 
 	/* Compare with previous value */
-	if (pin->freq_offset != ref->ffo) {
+	ffo = zl3073x_ref_ffo_get(ref);
+	if (pin->freq_offset != ffo) {
 		dev_dbg(zldev->dev, "%s freq offset changed: %lld -> %lld\n",
-			pin->label, pin->freq_offset, ref->ffo);
-		pin->freq_offset = ref->ffo;
+			pin->label, pin->freq_offset, ffo);
+		pin->freq_offset = ffo;
+
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * zl3073x_dpll_pin_measured_freq_check - check for pin measured frequency
+ * change
+ * @pin: pin to check
+ *
+ * Check for the given pin's measured frequency change.
+ *
+ * Return: true on measured frequency change, false otherwise
+ */
+static bool
+zl3073x_dpll_pin_measured_freq_check(struct zl3073x_dpll_pin *pin)
+{
+	struct zl3073x_dpll *zldpll = pin->dpll;
+	struct zl3073x_dev *zldev = zldpll->dev;
+	const struct zl3073x_ref *ref;
+	u8 ref_id;
+	u32 freq;
+
+	if (!zldpll->freq_monitor)
+		return false;
+
+	ref_id = zl3073x_input_pin_ref_get(pin->id);
+	ref = zl3073x_ref_state_get(zldev, ref_id);
+
+	freq = zl3073x_ref_meas_freq_get(ref);
+	if (pin->measured_freq != freq) {
+		dev_dbg(zldev->dev, "%s measured freq changed: %u -> %u\n",
+			pin->label, pin->measured_freq, freq);
+		pin->measured_freq = freq;
 
 		return true;
 	}
@@ -1677,13 +1764,18 @@ zl3073x_dpll_changes_check(struct zl3073x_dpll *zldpll)
 			pin_changed = true;
 		}
 
-		/* Check for phase offset and ffo change once per second */
+		/* Check for phase offset, ffo, and measured freq change
+		 * once per second.
+		 */
 		if (zldpll->check_count % 2 == 0) {
 			if (zl3073x_dpll_pin_phase_offset_check(pin))
 				pin_changed = true;
 
 			if (zl3073x_dpll_pin_ffo_check(pin))
 				pin_changed = true;
+
+			if (zl3073x_dpll_pin_measured_freq_check(pin))
+				pin_changed = true;
 		}
 
 		if (pin_changed)
diff --git a/drivers/dpll/zl3073x/dpll.h b/drivers/dpll/zl3073x/dpll.h
index 115ee4f67e7ab..434c32a7db123 100644
--- a/drivers/dpll/zl3073x/dpll.h
+++ b/drivers/dpll/zl3073x/dpll.h
@@ -15,6 +15,7 @@
  * @id: DPLL index
  * @check_count: periodic check counter
  * @phase_monitor: is phase offset monitor enabled
+ * @freq_monitor: is frequency monitor enabled
  * @ops: DPLL device operations for this instance
  * @dpll_dev: pointer to registered DPLL device
  * @tracker: tracking object for the acquired reference
@@ -28,6 +29,7 @@ struct zl3073x_dpll {
 	u8				id;
 	u8				check_count;
 	bool				phase_monitor;
+	bool				freq_monitor;
 	struct dpll_device_ops		ops;
 	struct dpll_device		*dpll_dev;
 	dpll_tracker			tracker;
diff --git a/drivers/dpll/zl3073x/ref.h b/drivers/dpll/zl3073x/ref.h
index 06d8d4d97ea26..be16be20dbc7e 100644
--- a/drivers/dpll/zl3073x/ref.h
+++ b/drivers/dpll/zl3073x/ref.h
@@ -23,6 +23,7 @@ struct zl3073x_dev;
  * @sync_ctrl: reference sync control
  * @config: reference config
  * @ffo: current fractional frequency offset
+ * @meas_freq: measured input frequency in Hz
  * @mon_status: reference monitor status
  */
 struct zl3073x_ref {
@@ -40,6 +41,7 @@ struct zl3073x_ref {
 	);
 	struct_group(stat, /* Status */
 		s64	ffo;
+		u32	meas_freq;
 		u8	mon_status;
 	);
 };
@@ -68,6 +70,18 @@ zl3073x_ref_ffo_get(const struct zl3073x_ref *ref)
 	return ref->ffo;
 }
 
+/**
+ * zl3073x_ref_meas_freq_get - get measured input frequency
+ * @ref: pointer to ref state
+ *
+ * Return: measured input frequency in Hz
+ */
+static inline u32
+zl3073x_ref_meas_freq_get(const struct zl3073x_ref *ref)
+{
+	return ref->meas_freq;
+}
+
 /**
  * zl3073x_ref_freq_get - get given input reference frequency
  * @ref: pointer to ref state
-- 
2.52.0

