Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698801;
	b=ldwaiO8zh8uNKWXmAyfmuygcqzSZc50FRWrBMe13G+yZG2M62N60+/3MzHc8vfKLzPA2
	 l30yGgOxkoeZVmbgdtpVmcrBptNaSAx+5pC/YKi8NXXpUkxae9sqlmfqqwMlr2L9ps3hR
	 +12PdAC/okk0NeCelFQrjVscxT7KryyEVwLsIeqsPijw8KCDUEktxXHM0btSHgPnN/21o
	 ewCYMdpI0mbjhJJa0zGpiuPGrdqMZXTvjGH4fd2eI/efKnK9CeMqXAgIzTUQNm2cSSZmb
	 suv0YA7AGkMUcdf7gdJ0Z3qAfuJkagmnr0HytJ+PrRIFwjmO9eivxBPKXPAPc0gHIKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698801;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=gsfTIYG6DvjHPxbAO/LZnJxlbsOGTE8p94YdknJis+w=;
	b=SX1liGmvDe2/+O4v3NF9CTrZEvlJq5HYu22STmJlMFO67aOZ1qM5k9Y5zJT82R1EAQXv
	 cg8GTQjkgKP1lUGnR3y9jZ0yZF+gjjk4KM3qcRu8FshuSwe37nO3CSH7Pk3YAWpWH3J7E
	 lhW6O9DIfwY4WZ836U2oQIhfKN8mpH+LLQZgyzWKbe5wccVs1U/RpMn7O4zCXFBcEW5X0
	 Q+FrF1vdEPT347edbm5UszzNEUpS/wF0Y1W/EM21PES+J6+E1dm4fHpqC8QvKQXbqm58R
	 k7EgigSw+R67Psj5tLu3Y0Gwane4K+JxuW4yyAn423mSakdC5CFzb6h358TD5Euv09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dkn7tbv2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD86606D805
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 09:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD86606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dkn7tbv2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsfTIYG6DvjHPxbAO/LZnJxlbsOGTE8p94YdknJis+w=;
	b=dkn7tbv2YxN/KVH3WgVgpucMoCebKg1lapI+e50vtMYbRib7NFhgXf+M65IbNyWZHO+5Fj
	CECRPmt47yQ+fv6UwqY5owpBhCgqsGZrvSdpiRjGFlH6Tk+HbpFnxtn6AbbXOfgwEdFZ6F
	C8KPAabASrHgiryeZuect1w3GN0a8HY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-w36Vs-PzPWGiSDxopXe8OA-1; Tue,
 03 Nov 2026 04:39:58 -0500
X-MC-Unique: w36Vs-PzPWGiSDxopXe8OA-1
X-Mimecast-MFC-AGG-ID: w36Vs-PzPWGiSDxopXe8OA_1793698796
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F5141955F26;
	Tue,  3 Nov 2026 09:39:56 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B21CF26C;
	Tue,  3 Nov 2026 09:39:52 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 05/14] dpll: dpllsim: Add support to set input pin state
Date: Tue,  3 Nov 2026 10:39:01 +0100
Message-ID: <20261103093910.596225-6-poros@redhat.com>
In-Reply-To: <20261103093910.596225-1-poros@redhat.com>
References: <20261103093910.596225-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Add support for setting the state of input pins on the device.
Implement the state_on_dpll_set callback for input pins and advertise
the state-can-change capability for them, so that userspace can move a
pin between connected, disconnected and selectable. The driver stores
the requested state and reports it back unchanged, it does not act on it
yet. Output pins keep reporting their state only.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/dpll/dpllsim/dpll.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index a1d5921fb8d017..2b0c053a7b6087 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -104,10 +104,23 @@ static int dpllsim_pin_state_get(const struct dpll_pin *pin, void *pin_priv,
 	return 0;
 }
 
+static int dpllsim_pin_state_set(const struct dpll_pin *pin, void *pin_priv,
+				 const struct dpll_device *dpll,
+				 void *dpll_priv, enum dpll_pin_state state,
+				 struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	sim_pin->state = state;
+	return 0;
+}
+
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
+	.state_on_dpll_set = dpllsim_pin_state_set,
 };
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
@@ -149,6 +162,12 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
 		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_ext);
 		break;
 	}
+
+	/* Capabilities follow the ops the pin is served by */
+	if (dpllsim_pin_select_ops(pin) == &dpllsim_input_pin_ops)
+		prop->capabilities = DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
+	else
+		prop->capabilities = 0;
 }
 
 static bool dpllsim_pin_frequency_valid(struct dpllsim_pin *pin)
-- 
2.56.0

