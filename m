Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2114A33
	for <linux-doc@vger.kernel.org>; Thu,  8 Aug 2024 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723118212; cv=none; b=ER2TcS+scgev9yOmh2f9nL+3HXw8W8nyPSGdPapoAg4ciV7xmddkvjOqD2dvDYAm3WXcMEGdPUhuK8HuwGKaCeex3aAg2Svor78NsD3RvniGWabow5vD4HQXUI4yFIG9+IBd9yR/hO4NvGqLXFa6BeL1kP5V7zaf/YKXGCndFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723118212; c=relaxed/simple;
	bh=ilNmvTDZQ1EoYBMOGdOW2S15HgIwHt1jm+DZM6JPQs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPRBVDSKPPHysJI6bxwXYT/Dts76SKpkJR7Bv5WkbX/tt4NJ7iMsk8L+w4JGb+hSsVN3CH+9RzAabm+Vec6MIOZ6zeBN4OnW15PlsaWX4Abhp8Ek59uVyGqNzcSFiBX4Zads8/T+eBZSK5cLinM6ErCcP38bYOBUf9OZt3AqaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=n7JrJJVq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="n7JrJJVq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3685b9c8998so400046f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Aug 2024 04:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1723118208; x=1723723008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw/aykIl4BLuTIpDTGcYiu6jAZpQ1T5paa6TP3fg26c=;
        b=n7JrJJVqrVlCA3UVvlMqUKsI15C8kRXHOibkvCXAOVpxX9jUf1iyos8kWYXLJ/lrRV
         bB033Kd6TigB0C3mpPi2/R35tICMqg6OTNWAGCDwSvbvA40X4EYcMse9ld9w2NTfYKv2
         nXssxNS4fELzB2wuEdBLh1L6CXIExbc90AHaaK+dHTmPa34YWzoD7shXxtG2471DNn/f
         ThQPm0xG2PXg4K9o1oPjXf7GN1mCNKm8xs++IF097Vt93Y9udxGDPOqD3XR3e3Tx3zLr
         9Ie+wM13akcxeeWzep8pNGGcjEBeG/LA/Nhhbe6H/c+PZyNQFAK+V2RSuNTQnMHlpU7h
         lnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723118208; x=1723723008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw/aykIl4BLuTIpDTGcYiu6jAZpQ1T5paa6TP3fg26c=;
        b=N+xhtAG7c3A7maJCoQgEZb/8xDVKnPK1NQZlDPyQUWO5bSooYSxqsDZtlTZImV83pp
         50DhLD1B00ODgNKgXjx3mgw1D5uQQpkFDEl2xUrZaAkFlAA1sddTvbdYl3B2bGFFnvzO
         gmvRTaBLytpgt6qhvyoo80TGQ6h2QFc98LzT8qrfmCGB+j3H4uioHPgTcvzDwI2JYOS5
         8y8K/ih/Mf1P+2GooKPzdjb8RjtvJ4nQUB6pSmY2XezTYd7BNl7r9LlsTrL8ttwGPpt2
         /DJK+E0IJP0wLEhJyQlge7c4Xn7P07yf/4Aei0HBbdzRfH/CHNDQLDhXbziU46/1LOUR
         iA1g==
X-Forwarded-Encrypted: i=1; AJvYcCWQHGANGQ21anuTfBwEe2x8b1Axcwj2bV2ZTRHYsU4qJH6augZw13bY38twdQ1Dhwu09HEApIlRhXP7bYofoU6q9lHOpbN5dun9
X-Gm-Message-State: AOJu0Yxldr3OwHqUuw9lwRtO0FoRNZcgGfeRG0Ke42qQ5K5Pu93kHAjK
	odHZ/gutFeEkjmekc6GOeCuboDQAqmERRfNWjmh6Z93qdk6KOT00b0J3Ahi4ktM=
X-Google-Smtp-Source: AGHT+IFW0UfAtsFgpD8Bt2sTIzz83ftbnXaKa1ZD9m/W7UsLKpZkqaokLX0Iy4D0V+ir7sylTQ1vNA==
X-Received: by 2002:a5d:4105:0:b0:36b:c66a:b9fd with SMTP id ffacd0b85a97d-36d273c787amr1487787f8f.6.1723118208195;
        Thu, 08 Aug 2024 04:56:48 -0700 (PDT)
Received: from localhost ([213.235.133.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2718a4a6sm1690659f8f.58.2024.08.08.04.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 04:56:47 -0700 (PDT)
Date: Thu, 8 Aug 2024 13:56:46 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, donald.hunter@gmail.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: Re: [PATCH net-next v1 2/2] ice: add callbacks for Embedded SYNC
 enablement on dpll pins
Message-ID: <ZrSyfgv5jHCUAYku@nanopsycho.orion>
References: <20240808112013.166621-1-arkadiusz.kubalewski@intel.com>
 <20240808112013.166621-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808112013.166621-3-arkadiusz.kubalewski@intel.com>

Thu, Aug 08, 2024 at 01:20:13PM CEST, arkadiusz.kubalewski@intel.com wrote:
>Allow the user to get and set configuration of Embedded SYNC feature
>on the ice driver dpll pins.
>
>Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>---
> drivers/net/ethernet/intel/ice/ice_dpll.c | 241 +++++++++++++++++++++-
> drivers/net/ethernet/intel/ice/ice_dpll.h |   1 +
> 2 files changed, 239 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
>index e92be6f130a3..0664bbe98769 100644
>--- a/drivers/net/ethernet/intel/ice/ice_dpll.c
>+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
>@@ -394,8 +394,8 @@ ice_dpll_pin_state_update(struct ice_pf *pf, struct ice_dpll_pin *pin,
> 
> 	switch (pin_type) {
> 	case ICE_DPLL_PIN_TYPE_INPUT:
>-		ret = ice_aq_get_input_pin_cfg(&pf->hw, pin->idx, NULL, NULL,
>-					       NULL, &pin->flags[0],
>+		ret = ice_aq_get_input_pin_cfg(&pf->hw, pin->idx, &pin->status,
>+					       NULL, NULL, &pin->flags[0],
> 					       &pin->freq, &pin->phase_adjust);
> 		if (ret)
> 			goto err;
>@@ -430,7 +430,7 @@ ice_dpll_pin_state_update(struct ice_pf *pf, struct ice_dpll_pin *pin,
> 			goto err;
> 
> 		parent &= ICE_AQC_GET_CGU_OUT_CFG_DPLL_SRC_SEL;
>-		if (ICE_AQC_SET_CGU_OUT_CFG_OUT_EN & pin->flags[0]) {
>+		if (ICE_AQC_GET_CGU_OUT_CFG_OUT_EN & pin->flags[0]) {
> 			pin->state[pf->dplls.eec.dpll_idx] =
> 				parent == pf->dplls.eec.dpll_idx ?
> 				DPLL_PIN_STATE_CONNECTED :
>@@ -1098,6 +1098,237 @@ ice_dpll_phase_offset_get(const struct dpll_pin *pin, void *pin_priv,
> 	return 0;
> }
> 
>+/**
>+ * ice_dpll_output_e_sync_set - callback for setting embedded sync
>+ * @pin: pointer to a pin
>+ * @pin_priv: private data pointer passed on pin registration
>+ * @dpll: registered dpll pointer
>+ * @dpll_priv: private data pointer passed on dpll registration
>+ * @e_sync_freq: requested embedded sync frequency
>+ * @extack: error reporting
>+ *
>+ * Dpll subsystem callback. Handler for setting embedded sync frequency value
>+ * on output pin.
>+ *
>+ * Context: Acquires pf->dplls.lock
>+ * Return:
>+ * * 0 - success
>+ * * negative - error
>+ */
>+static int
>+ice_dpll_output_e_sync_set(const struct dpll_pin *pin, void *pin_priv,
>+			   const struct dpll_device *dpll, void *dpll_priv,
>+			   u64 e_sync_freq, struct netlink_ext_ack *extack)
>+{
>+	struct ice_dpll_pin *p = pin_priv;
>+	struct ice_dpll *d = dpll_priv;
>+	struct ice_pf *pf = d->pf;
>+	u8 flags = 0;
>+	int ret;
>+
>+	if (ice_dpll_is_reset(pf, extack))
>+		return -EBUSY;
>+	mutex_lock(&pf->dplls.lock);
>+	if (p->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_OUT_EN)
>+		flags = ICE_AQC_SET_CGU_OUT_CFG_OUT_EN;
>+	if (e_sync_freq == DPLL_PIN_FREQUENCY_1_HZ) {
>+		if (p->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_ESYNC_EN) {
>+			ret = 0;
>+		} else {
>+			flags |= ICE_AQC_SET_CGU_OUT_CFG_ESYNC_EN;
>+			ret = ice_aq_set_output_pin_cfg(&pf->hw, p->idx, flags,
>+							0, 0, 0);
>+		}
>+	} else {
>+		if (!(p->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_ESYNC_EN)) {
>+			ret = 0;
>+		} else {
>+			flags &= ~ICE_AQC_SET_CGU_OUT_CFG_ESYNC_EN;
>+			ret = ice_aq_set_output_pin_cfg(&pf->hw, p->idx, flags,
>+							0, 0, 0);
>+		}
>+	}
>+	mutex_unlock(&pf->dplls.lock);
>+	if (ret)
>+		NL_SET_ERR_MSG_FMT(extack,
>+				   "err:%d %s failed to set e-sync freq\n",

Odd. Ret is pass all the way up to the userspace. Putting it to message
does not make any sense to me.


>+				   ret,
>+				   ice_aq_str(pf->hw.adminq.sq_last_status));
>+	return ret;
>+}
>+
>+/**
>+ * ice_dpll_output_e_sync_get - callback for getting embedded sync config
>+ * @pin: pointer to a pin
>+ * @pin_priv: private data pointer passed on pin registration
>+ * @dpll: registered dpll pointer
>+ * @dpll_priv: private data pointer passed on dpll registration
>+ * @e_sync_freq: on success holds embedded sync frequency of a pin
>+ * @e_sync_range: on success holds embedded sync frequency range for a pin
>+ * @pulse: on success holds embedded sync pulse type
>+ * @extack: error reporting
>+ *
>+ * Dpll subsystem callback. Handler for getting embedded sync frequency value
>+ * and capabilities on output pin.
>+ *
>+ * Context: Acquires pf->dplls.lock
>+ * Return:
>+ * * 0 - success
>+ * * negative - error
>+ */
>+static int
>+ice_dpll_output_e_sync_get(const struct dpll_pin *pin, void *pin_priv,
>+			   const struct dpll_device *dpll, void *dpll_priv,
>+			   u64 *e_sync_freq,
>+			   struct dpll_pin_frequency *e_sync_range,
>+			   enum dpll_pin_e_sync_pulse *pulse,
>+			   struct netlink_ext_ack *extack)
>+{
>+	struct ice_dpll_pin *p = pin_priv;
>+	struct ice_dpll *d = dpll_priv;
>+	struct ice_pf *pf = d->pf;
>+
>+	if (ice_dpll_is_reset(pf, extack))
>+		return -EBUSY;
>+	mutex_lock(&pf->dplls.lock);
>+	if (!(p->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_ESYNC_ABILITY)) {
>+		mutex_unlock(&pf->dplls.lock);
>+		return -EOPNOTSUPP;
>+	}
>+	*pulse = DPLL_PIN_E_SYNC_PULSE_NONE;
>+	e_sync_range->min = 0;
>+	if (p->freq == DPLL_PIN_FREQUENCY_10_MHZ) {
>+		e_sync_range->max = DPLL_PIN_FREQUENCY_1_HZ;
>+		if (p->flags[0] & ICE_AQC_GET_CGU_OUT_CFG_ESYNC_EN) {
>+			*e_sync_freq = DPLL_PIN_FREQUENCY_1_HZ;
>+			*pulse = DPLL_PIN_E_SYNC_PULSE_25_75;
>+		} else {
>+			*e_sync_freq = 0;
>+		}
>+	} else {
>+		e_sync_range->max = 0;
>+		*e_sync_freq = 0;
>+	}
>+	mutex_unlock(&pf->dplls.lock);
>+	return 0;
>+}
>+
>+/**
>+ * ice_dpll_input_e_sync_set - callback for setting embedded sync
>+ * @pin: pointer to a pin
>+ * @pin_priv: private data pointer passed on pin registration
>+ * @dpll: registered dpll pointer
>+ * @dpll_priv: private data pointer passed on dpll registration
>+ * @e_sync_freq: requested embedded sync frequency
>+ * @extack: error reporting
>+ *
>+ * Dpll subsystem callback. Handler for setting embedded sync frequency value
>+ * on input pin.
>+ *
>+ * Context: Acquires pf->dplls.lock
>+ * Return:
>+ * * 0 - success
>+ * * negative - error
>+ */
>+static int
>+ice_dpll_input_e_sync_set(const struct dpll_pin *pin, void *pin_priv,
>+			  const struct dpll_device *dpll, void *dpll_priv,
>+			  u64 e_sync_freq, struct netlink_ext_ack *extack)
>+{
>+	struct ice_dpll_pin *p = pin_priv;
>+	struct ice_dpll *d = dpll_priv;
>+	struct ice_pf *pf = d->pf;
>+	u8 flags_en = 0;
>+	int ret;
>+
>+	if (ice_dpll_is_reset(pf, extack))
>+		return -EBUSY;
>+	mutex_lock(&pf->dplls.lock);
>+	if (p->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN)
>+		flags_en = ICE_AQC_SET_CGU_IN_CFG_FLG2_INPUT_EN;
>+	if (e_sync_freq == DPLL_PIN_FREQUENCY_1_HZ) {
>+		if (p->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_ESYNC_EN) {
>+			ret = 0;
>+		} else {
>+			flags_en |= ICE_AQC_SET_CGU_IN_CFG_FLG2_ESYNC_EN;
>+			ret = ice_aq_set_input_pin_cfg(&pf->hw, p->idx, 0,
>+						       flags_en, 0, 0);
>+		}
>+	} else {
>+		if (!(p->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_ESYNC_EN)) {
>+			ret = 0;
>+		} else {
>+			flags_en &= ~ICE_AQC_SET_CGU_IN_CFG_FLG2_ESYNC_EN;
>+			ret = ice_aq_set_input_pin_cfg(&pf->hw, p->idx, 0,
>+						       flags_en, 0, 0);
>+		}
>+	}
>+	mutex_unlock(&pf->dplls.lock);
>+	if (ret)
>+		NL_SET_ERR_MSG_FMT(extack,
>+				   "err:%d %s failed to set e-sync freq\n",

Same here.


>+				   ret,
>+				   ice_aq_str(pf->hw.adminq.sq_last_status));
>+
>+	return ret;
>+}
>+
>+/**
>+ * ice_dpll_input_e_sync_get - callback for getting embedded sync config
>+ * @pin: pointer to a pin
>+ * @pin_priv: private data pointer passed on pin registration
>+ * @dpll: registered dpll pointer
>+ * @dpll_priv: private data pointer passed on dpll registration
>+ * @e_sync_freq: on success holds embedded sync frequency of a pin
>+ * @e_sync_range: on success holds embedded sync frequency range for a pin
>+ * @pulse: on success holds embedded sync pulse type
>+ * @extack: error reporting
>+ *
>+ * Dpll subsystem callback. Handler for getting embedded sync frequency value
>+ * and capabilities on input pin.
>+ *
>+ * Context: Acquires pf->dplls.lock
>+ * Return:
>+ * * 0 - success
>+ * * negative - error
>+ */
>+static int
>+ice_dpll_input_e_sync_get(const struct dpll_pin *pin, void *pin_priv,
>+			  const struct dpll_device *dpll, void *dpll_priv,
>+			  u64 *e_sync_freq,
>+			  struct dpll_pin_frequency *e_sync_range,
>+			  enum dpll_pin_e_sync_pulse *pulse,
>+			  struct netlink_ext_ack *extack)
>+{
>+	struct ice_dpll_pin *p = pin_priv;
>+	struct ice_dpll *d = dpll_priv;
>+	struct ice_pf *pf = d->pf;
>+
>+	if (ice_dpll_is_reset(pf, extack))
>+		return -EBUSY;
>+	mutex_lock(&pf->dplls.lock);
>+	if (!(p->status & ICE_AQC_GET_CGU_IN_CFG_STATUS_ESYNC_CAP)) {
>+		mutex_unlock(&pf->dplls.lock);
>+		return -EOPNOTSUPP;
>+	}
>+	*pulse = DPLL_PIN_E_SYNC_PULSE_NONE;
>+	e_sync_range->min = 0;
>+	if (p->freq == DPLL_PIN_FREQUENCY_10_MHZ) {
>+		e_sync_range->max = DPLL_PIN_FREQUENCY_1_HZ;
>+		if (p->flags[0] & ICE_AQC_GET_CGU_IN_CFG_FLG2_ESYNC_EN) {
>+			*e_sync_freq = DPLL_PIN_FREQUENCY_1_HZ;
>+			*pulse = DPLL_PIN_E_SYNC_PULSE_25_75;
>+		} else {
>+			*e_sync_freq = 0;
>+		}
>+	} else {
>+		e_sync_range->max = 0;
>+		*e_sync_freq = 0;
>+	}
>+	mutex_unlock(&pf->dplls.lock);
>+	return 0;
>+}
>+
> /**
>  * ice_dpll_rclk_state_on_pin_set - set a state on rclk pin
>  * @pin: pointer to a pin
>@@ -1222,6 +1453,8 @@ static const struct dpll_pin_ops ice_dpll_input_ops = {
> 	.phase_adjust_get = ice_dpll_pin_phase_adjust_get,
> 	.phase_adjust_set = ice_dpll_input_phase_adjust_set,
> 	.phase_offset_get = ice_dpll_phase_offset_get,
>+	.e_sync_set = ice_dpll_input_e_sync_set,
>+	.e_sync_get = ice_dpll_input_e_sync_get,
> };
> 
> static const struct dpll_pin_ops ice_dpll_output_ops = {
>@@ -1232,6 +1465,8 @@ static const struct dpll_pin_ops ice_dpll_output_ops = {
> 	.direction_get = ice_dpll_output_direction,
> 	.phase_adjust_get = ice_dpll_pin_phase_adjust_get,
> 	.phase_adjust_set = ice_dpll_output_phase_adjust_set,
>+	.e_sync_set = ice_dpll_output_e_sync_set,
>+	.e_sync_get = ice_dpll_output_e_sync_get,
> };
> 
> static const struct dpll_device_ops ice_dpll_ops = {
>diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.h b/drivers/net/ethernet/intel/ice/ice_dpll.h
>index 93172e93995b..c320f1bf7d6d 100644
>--- a/drivers/net/ethernet/intel/ice/ice_dpll.h
>+++ b/drivers/net/ethernet/intel/ice/ice_dpll.h
>@@ -31,6 +31,7 @@ struct ice_dpll_pin {
> 	struct dpll_pin_properties prop;
> 	u32 freq;
> 	s32 phase_adjust;
>+	u8 status;
> };
> 
> /** ice_dpll - store info required for DPLL control
>-- 
>2.38.1
>
