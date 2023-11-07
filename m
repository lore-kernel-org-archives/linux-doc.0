Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B228E06;
	Tue,  7 Nov 2023 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from TWMBX03.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A34EB6;
	Tue,  7 Nov 2023 02:50:30 -0800 (PST)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 7 Nov
 2023 18:50:27 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Nov 2023 18:50:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<corbet@lwn.net>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <p.zabel@pengutronix.de>,
	<billy_tsai@aspeedtech.com>, <naresh.solanki@9elements.com>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <BMC-SW@aspeedtech.com>, <patrick@stwcx.xyz>
Subject: [PATCH RESEND v10 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date: Tue, 7 Nov 2023 18:50:23 +0800
Message-ID: <20231107105025.1480561-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
References: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Naresh Solanki <naresh.solanki@9elements.com>

Add common fan properties bindings to a schema.

Bindings for fan controllers can reference the common schema for the
fan

child nodes:

  patternProperties:
    "^fan@[0-2]":
      type: object
      $ref: fan-common.yaml#
      unevaluatedProperties: false

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..be4ce3bd7f22
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Fan Properties
+
+maintainers:
+  - Naresh Solanki <naresh.solanki@9elements.com>
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+properties:
+  max-rpm:
+    description:
+      Max RPM supported by fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 100000
+
+  min-rpm:
+    description:
+      Min RPM supported by fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 1000
+
+  pulses-per-revolution:
+    description:
+      The number of pulse from fan sensor per revolution.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 4
+
+  tach-div:
+    description:
+      Divisor for the tach sampling clock, which determines the sensitivity of the tach pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  target-rpm:
+    description:
+      The default desired fan speed in RPM.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  fan-driving-mode:
+    description:
+      Select the driving mode of the fan.(DC, PWM and so on)
+    $ref: /schemas/types.yaml#/definitions/string
+
+  pwms:
+    description:
+      PWM provider.
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+
+  cooling-levels:
+    description:
+      The control value which correspond to thermal cooling states.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  tach-ch:
+    description:
+      The tach channel used for the fan.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
+  label:
+    description:
+      Optional fan label
+
+  fan-supply:
+    description:
+      Power supply for fan.
+
+  reg:
+    maxItems: 1
+
+additionalProperties: true
+
+...
-- 
2.25.1

