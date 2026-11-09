Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217016;
	b=Kvc23vx9rqzOC97mFiFWuyX1bINs3l/WUDCLK7KMoJ+8sMCaSyUtVM7dw0nQY6RlWYX5
	 UtuYq/Yz4DglNeOIStgZFYwCmW+2VYuDYve4uZ9h/bQ+lmSA8ySVwAHf0sLYWbBaC9Ufk
	 bAqN9zAHWmkuTPv/+3q0ZyQ13I9zKWvsWAz49reR34oM9yA/RDQVzNd2GkZHPIZ5GZgiq
	 U8QwoJm3HWqSdais8//pgX7hP5/j/EEidMkh4ye4OfEO72XCN05ebU6+0SBZMZDjo16xw
	 mp5sJOWg2f/Qaerck2qCrrfVcESW4m4Z7PAkvMO2+KoXnflupYRqDnhWOeB38n2AgXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217016;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=z0aQvDSjlQ6la332PjVwuvpMyBbJb3KzHR5SSZtlNpU=;
	b=Pv6ay+9CBj4OnWMgwwysLPZRDQId0f99w9ikkFRoIbJmzfpuAl/4s1bEmvU4dHAtwiqm
	 MtXhros8rsK/XEbQjPpo682nw9SW875cGrcTHGnd7oGA9kkm7jmVD98sf4K67PCdu5ZFi
	 p0bX5i0PjTnfOEHgJizOTiBgoGJG3Wuo6UEAR8knofbyvzb4bHt9v+dDnFfG9Ei+FO9uZ
	 fqzhu3aE7qCk8T7FR6S5wJGh+mMttsFFXLm0SWI4OpfPJuYIjiLhBjRkUCO6iE7ODG3oR
	 +Vw6QMJlJyAZVplnptOAs7txOaHNCUXbklb/+WB7524U3u47hA+QW1h3RM9mPZGcnTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LU+umP8c;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B01606D828
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 09:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B01606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LU+umP8c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794217014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0aQvDSjlQ6la332PjVwuvpMyBbJb3KzHR5SSZtlNpU=;
	b=LU+umP8caoUkPk9jYJGweqgDqwmZUMIV8iKJWM8B90uZUEAhlFbou8lJ98ywJFEC2K0NfA
	NpB4+FGiAgRj6oQS/bUIDyW3DPjPOM+tJDy6fOhBaaYseSYmcRYc0NK0MJK58RCPJ9WU0Q
	Oa9QjMir1KlZ6Qi5IECuy0tMQlk22wQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-ugitwJdxOSisVKmEJEVdMg-1; Mon,
 09 Nov 2026 04:36:49 -0500
X-MC-Unique: ugitwJdxOSisVKmEJEVdMg-1
X-Mimecast-MFC-AGG-ID: ugitwJdxOSisVKmEJEVdMg_1794217007
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0215318002A8;
	Mon,  9 Nov 2026 09:36:47 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.50])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96A491800446;
	Mon,  9 Nov 2026 09:36:42 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 11/14] dpll: dpllsim: Add support to adjust phase
Date: Mon,  9 Nov 2026 10:35:20 +0100
Message-ID: <20261109093523.931201-12-poros@redhat.com>
In-Reply-To: <20261109093523.931201-1-poros@redhat.com>
References: <20261109093523.931201-1-poros@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add support to get and set the phase adjustment of input and output
pins. The pins advertise a granularity of 100 ps and a symmetric range
whose ends are the largest multiples of the granularity that fit a
32-bit signed value, so that the advertised ends themselves are
settable, the core validates the requested value against both and the
driver stores it. The adjustment is reset to zero every time the device
goes live, so that repeated deploy cycles start from a known state. It
becomes the baseline of the simulated phase offset measurements once
those exist.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/dpll/dpllsim/dpll.c    | 40 ++++++++++++++++++++++++++++++++++
 drivers/dpll/dpllsim/dpllsim.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index 8590d2db808e45..d9a0bbedf89423 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -12,6 +12,11 @@
 
 #include "dpllsim.h"
 
+#define DPLLSIM_PHASE_ADJUST_GRAN		100	/* ps */
+/* Largest multiple of the granularity, so the range ends are settable */
+#define DPLLSIM_PHASE_ADJUST_MAX \
+	(S32_MAX - S32_MAX % DPLLSIM_PHASE_ADJUST_GRAN)
+
 static struct dpll_pin_frequency dpllsim_freq_1pps[] = {
 	DPLL_PIN_FREQUENCY_RANGE(1, 1),
 };
@@ -182,6 +187,33 @@ static int dpllsim_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
 	return 0;
 }
 
+static int dpllsim_pin_phase_adjust_get(const struct dpll_pin *pin,
+					void *pin_priv,
+					const struct dpll_device *dpll,
+					void *dpll_priv, s32 *phase_adjust,
+					struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	*phase_adjust = sim_pin->phase_adjust;
+	return 0;
+}
+
+static int dpllsim_pin_phase_adjust_set(const struct dpll_pin *pin,
+					void *pin_priv,
+					const struct dpll_device *dpll,
+					void *dpll_priv,
+					const s32 phase_adjust,
+					struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	sim_pin->phase_adjust = phase_adjust;
+	return 0;
+}
+
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
 	.frequency_set = dpllsim_pin_frequency_set,
@@ -190,6 +222,8 @@ static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.state_on_dpll_set = dpllsim_pin_state_set,
 	.prio_get = dpllsim_pin_prio_get,
 	.prio_set = dpllsim_pin_prio_set,
+	.phase_adjust_get = dpllsim_pin_phase_adjust_get,
+	.phase_adjust_set = dpllsim_pin_phase_adjust_set,
 };
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
@@ -197,6 +231,8 @@ static const struct dpll_pin_ops dpllsim_output_pin_ops = {
 	.frequency_set = dpllsim_pin_frequency_set,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
+	.phase_adjust_get = dpllsim_pin_phase_adjust_get,
+	.phase_adjust_set = dpllsim_pin_phase_adjust_set,
 };
 
 static const struct dpll_pin_ops *
@@ -212,6 +248,9 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
 {
 	prop->type = pin->type;
 	prop->board_label = config_item_name(&pin->item);
+	prop->phase_range.min = -DPLLSIM_PHASE_ADJUST_MAX;
+	prop->phase_range.max = DPLLSIM_PHASE_ADJUST_MAX;
+	prop->phase_gran = DPLLSIM_PHASE_ADJUST_GRAN;
 
 	switch (pin->type) {
 	case DPLL_PIN_TYPE_GNSS:
@@ -273,6 +312,7 @@ static void dpllsim_pin_reset(struct dpllsim_pin *pin)
 {
 	pin->ops = dpllsim_pin_select_ops(pin);
 	pin->state = DPLL_PIN_STATE_DISCONNECTED;
+	pin->phase_adjust = 0;
 }
 
 /* Build sim->pins in registration order, the order the pins were created */
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
index f59447d26a8668..886ac27f5f92d6 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -43,6 +43,7 @@ struct dpllsim_pin {
 
 	/* Simulated state, guarded by dev->lock */
 	enum dpll_pin_state state;
+	s32 phase_adjust;
 };
 
 struct dpllsim_dev {
-- 
2.56.0

