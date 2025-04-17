Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EC6218EB8
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881949; cv=none; b=sXFjxtZkKuNXhBK4KDFwwDNkHQ4Jy/PoOB6fn+MRKe2ZA43LutQ2N80n2X2GBHofebv+mrq7MobKLcGblihLIg7c6rKF00N8wHzu6AUbn39HKXaep02SqoY4EJIz5wH3kbStvUxoxUr1OlHKUKIs431QZJwHOjakgxnUFljs7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881949; c=relaxed/simple;
	bh=e/oRy53W5i+7IG/wMwBVb4X925eCUkKPvvLvpxZ9kOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UtJKzY2sS1dv+sDXlo4Eg1dAxnrLb2Qhne0VrqoOeCwk6rzJCVCMUteLyemocqiFbNZwiBT5BJGInLgZq/5+/4mpvuBeyY2yITlVZH3KcxAbTX5LWJXRJlYgQlFnQrVqTNzAgcD7wPaRZGn7fpIukFZlBVXD5lLe0G+vsW8hF6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mKVZJQjH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mKVZJQjH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f4c30f8570so1185793a12.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744881945; x=1745486745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QrSfDTj8BEF3kjwsmuGGuGpkcd9XmrYmUx8LIf1Kk9Y=;
        b=mKVZJQjHI9jVHF2r0oeEP4XJRDPWTnY2w8GDwdiEUrVf7N0GEJvXXnzJYhYEQFaGm3
         hGTaAuUqtuOj9c6yv4Ptjhe/yLcw3urtl8erhpXhJ5mGJwMaErVGxi2NPBqKQnPtU+7g
         OkvT8IqPZW6ozLkaDKxDxo8LY+UYq9Ny0ApDSGFH2Rjf74h+FfXHjzvathqo2ejJTAT8
         P72sH4e61yJhBb2mSI0pCP7o8Y23xK6AqHSiOle/BsqqgWwCoMNcd5cyUqoXTiPHVTK2
         3i4WyP0aDBj0boZi4csRBumWZEgbx5BlqABiBon3eKN9veuyteqEFEbnSh5P7iSfKT+Z
         Nxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881945; x=1745486745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrSfDTj8BEF3kjwsmuGGuGpkcd9XmrYmUx8LIf1Kk9Y=;
        b=tgByB45lebIU5EnuGSQK7nq080tV1c2qLQVBSibZDDlegA1o2xx4HBzWAsuLG4JEmy
         KTvFSxfy7U2N4fJKnxsLeTFzFzlsX9m5Xa/r80/AVABH2DPQh8KOmgqJpSpUeiU80pv1
         FHZ2BIOpmaVn/3Yc1PXkhgj5loH6NwH0UEyMht/4KwwN7YD0xzmIpkL7p+1yCjtYa781
         FuWJVrDxJByf/PyiRSWoCKDgR2hi3daHlrZuK2tCaMQeijqgSeCx/9GRlp+xetKJCzLM
         GOAWIjGQoQwhOR1YI+oWtXEMyKAfUTdAavlE81eydlABLvlHJaH/W5UUMu4p1RCjfsBx
         McWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvoundbUKOBABP4pvut9vWOoeZ2EGDCi93UnEYlavBUCNdHMJoWai4QI5YY0Rveq/Wv58wRcf9Vjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtIWdzkl/u/P06t0JFRFks4U1CqKSI8E72PcK7xCyHzuI1Vn8
	YWGhLJlHbu3vEj0MLU7TMI7viBHofUeEuH8+1pduFsDQVtG+uY+MRHBRhuGZgII=
X-Gm-Gg: ASbGncswbu4xYF/xN2laZOvRMFih0CZXVAcZYPM8/jkkmyB9oRl8YN0/UlAmFQjPwNh
	FbKl+3hM4bLVrfe+Jl5SecYe1IwcOLoxGR1qCNlvqc6DeSC6c3KIAXldjWp0hYb2T0RSdbn+6+K
	6RiURMB93Ze6/xM46yDId166NOTQyS7MIFGowLre004dClcdluCZP+V5tI0k3BocLnU4JblmI5D
	/DcjsV263CpIVgtBAJTZ1VhkcGJfCwWP3yvS663gFoe69M87zWxuHNSCGqMWD/4+O9RyVLmN6cC
	u7j1C/AJkPCRZ6IstuIPiHl0lcmSf68aYn4GzqvqUgSz45EXb1hQSWNbU04vwiZFAMCNAzV6lg3
	QmOSdo3g=
X-Google-Smtp-Source: AGHT+IHyMvSRKBCCa4SYcTzYCD71vauhiKEz3DIVlJPHPwMSp9FaDUkQ+4RwVXm4gSqRx6WK9VUjWQ==
X-Received: by 2002:a05:6402:3490:b0:5ec:cc79:84f5 with SMTP id 4fb4d7f45d1cf-5f4b71e7b0fmr4913234a12.7.1744881945063;
        Thu, 17 Apr 2025 02:25:45 -0700 (PDT)
Received: from localhost (p200300f65f13aa0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:aa04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36f06b244sm10008358a12.45.2025.04.17.02.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:25:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] pwm: Fix various formatting issues in kernel-doc
Date: Thu, 17 Apr 2025 11:25:34 +0200
Message-ID: <20250417092535.2669166-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6030; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=e/oRy53W5i+7IG/wMwBVb4X925eCUkKPvvLvpxZ9kOI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoAMkP8pZPT8sLqgGKRckugfZ4OMwoSMLdJOm+P fR6AMHJEy6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaADJDwAKCRCPgPtYfRL+ TqmDB/90UyPHpS30gIML7SfaHGqM9OXo0YTRJ8FQrbDzXkPAfa5TbafL2V23dpPOir96dsp6RlM ckHUGC7fRgbVUHUECMGPr0RqHGAHBXXpIfOpG5/xTp+5tIf4dm1XL1HP22XwFzXgMLnveihsSWc BdSCXD6QnTZJZI8TGz3LaDtDCWZquOdmJBCGXDg9rhBGktYZM9ZWW53JlnCFeCsx34swTZBOVtO QlKJcSINcVzMVkyMaaKTW7EGvM4szHloBuvGz++STjOMIsghorlrCrZTjv7+jZS9PqRC+W7Z7mq q6j+g9A4FPPhqvxe3+AnLxo2f90LHhGW2TgF2lib2eH+QdzE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Add Return and (where interesting) Context sections, fix some formatting
and drop documenting the internal function __pwm_apply().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello Jonathan,

while looking into the warning that Stephen reported in
https://lore.kernel.org/linux-next/20250417162700.728e14e5@canb.auug.org.au,
I found a few more issues fixed here.

I intend to merge this via my pwm tree, but getting a confirmation (or critic)
from someone who knows kernel-doc better than me would be great.

Best regards
Uwe

 drivers/pwm/core.c  | 30 ++++++++++++++++++++++--------
 include/linux/pwm.h |  8 +++++---
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 079964961bd8..447077776bce 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -222,8 +222,10 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
  * Note however that the world doesn't stop turning when you call it, so when
  * doing
  *
- * 	pwm_round_waveform_might_sleep(mypwm, &wf);
- * 	pwm_set_waveform_might_sleep(mypwm, &wf, true);
+ * .. code-block:: C
+ *
+ *   pwm_round_waveform_might_sleep(mypwm, &wf);
+ *   pwm_set_waveform_might_sleep(mypwm, &wf, true);
  *
  * the latter might fail, e.g. because an input clock changed its rate between
  * these two calls and the waveform determined by
@@ -233,8 +235,9 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
  * value (in the order period_length_ns, duty_length_ns and then
  * duty_offset_ns). Only if this isn't possible, a value might grow.
  *
- * Returns 0 on success, 1 if at least one value had to be rounded up or a
+ * Returns: 0 on success, 1 if at least one value had to be rounded up or a
  * negative errno.
+ * Context: May sleep.
  */
 int pwm_round_waveform_might_sleep(struct pwm_device *pwm, struct pwm_waveform *wf)
 {
@@ -291,6 +294,9 @@ EXPORT_SYMBOL_GPL(pwm_round_waveform_might_sleep);
  *
  * Stores the current configuration of the PWM in @wf. Note this is the
  * equivalent of pwm_get_state_hw() (and not pwm_get_state()) for pwm_waveform.
+ *
+ * Returns: 0 on success or a negative errno
+ * Context: May sleep.
  */
 int pwm_get_waveform_might_sleep(struct pwm_device *pwm, struct pwm_waveform *wf)
 {
@@ -406,6 +412,10 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
  * Note that even with exact = true, some rounding by less than 1 is
  * possible/needed. In the above example requesting .period_length_ns = 94 and
  * exact = true, you get the hardware configured with period = 93.5 ns.
+ *
+ * Returns: 0 on succes, 1 if was rounded up (if !@exact) or no perfect match was
+ * possible (if @exact), or a negative errno
+ * Context: May sleep.
  */
 int pwm_set_waveform_might_sleep(struct pwm_device *pwm,
 				 const struct pwm_waveform *wf, bool exact)
@@ -565,11 +575,6 @@ static bool pwm_state_valid(const struct pwm_state *state)
 	return true;
 }
 
-/**
- * __pwm_apply() - atomically apply a new state to a PWM device
- * @pwm: PWM device
- * @state: new state to apply
- */
 static int __pwm_apply(struct pwm_device *pwm, const struct pwm_state *state)
 {
 	struct pwm_chip *chip;
@@ -678,6 +683,9 @@ static int __pwm_apply(struct pwm_device *pwm, const struct pwm_state *state)
  * Cannot be used in atomic context.
  * @pwm: PWM device
  * @state: new state to apply
+ *
+ * Returns: 0 on success, or a negative errno
+ * Context: May sleep.
  */
 int pwm_apply_might_sleep(struct pwm_device *pwm, const struct pwm_state *state)
 {
@@ -719,6 +727,9 @@ EXPORT_SYMBOL_GPL(pwm_apply_might_sleep);
  * Not all PWM devices support this function, check with pwm_might_sleep().
  * @pwm: PWM device
  * @state: new state to apply
+ *
+ * Returns: 0 on success, or a negative errno
+ * Context: Any
  */
 int pwm_apply_atomic(struct pwm_device *pwm, const struct pwm_state *state)
 {
@@ -792,6 +803,9 @@ EXPORT_SYMBOL_GPL(pwm_get_state_hw);
  * This function will adjust the PWM config to the PWM arguments provided
  * by the DT or PWM lookup table. This is particularly useful to adapt
  * the bootloader config to the Linux one.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ * Context: May sleep.
  */
 int pwm_adjust_config(struct pwm_device *pwm)
 {
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index bf0469b2201d..63a17d2b4ec8 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -218,6 +218,8 @@ static inline void pwm_init_state(const struct pwm_device *pwm,
  *
  * pwm_get_state(pwm, &state);
  * duty = pwm_get_relative_duty_cycle(&state, 100);
+ *
+ * Returns: rounded relative duty cycle multiplied by @scale
  */
 static inline unsigned int
 pwm_get_relative_duty_cycle(const struct pwm_state *state, unsigned int scale)
@@ -244,8 +246,8 @@ pwm_get_relative_duty_cycle(const struct pwm_state *state, unsigned int scale)
  * pwm_set_relative_duty_cycle(&state, 50, 100);
  * pwm_apply_might_sleep(pwm, &state);
  *
- * This functions returns -EINVAL if @duty_cycle and/or @scale are
- * inconsistent (@scale == 0 or @duty_cycle > @scale).
+ * Returns: 0 on success or ``-EINVAL`` if @duty_cycle and/or @scale are
+ * inconsistent (@scale == 0 or @duty_cycle > @scale)
  */
 static inline int
 pwm_set_relative_duty_cycle(struct pwm_state *state, unsigned int duty_cycle,
@@ -351,7 +353,7 @@ struct pwm_chip {
  * pwmchip_supports_waveform() - checks if the given chip supports waveform callbacks
  * @chip: The pwm_chip to test
  *
- * Returns true iff the pwm chip support the waveform functions like
+ * Returns: true iff the pwm chip support the waveform functions like
  * pwm_set_waveform_might_sleep() and pwm_round_waveform_might_sleep()
  */
 static inline bool pwmchip_supports_waveform(struct pwm_chip *chip)

base-commit: fbf1880bada00ad44bffcc8b4f5fed95b47891dd
-- 
2.47.2

