Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 892807E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 18:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752414AbeDJSdE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 14:33:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:23474 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752386AbeDJSdB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Apr 2018 14:33:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Apr 2018 11:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,433,1517904000"; 
   d="scan'208";a="219323772"
Received: from maru.jf.intel.com ([10.54.51.80])
  by fmsmga006.fm.intel.com with ESMTP; 10 Apr 2018 11:32:59 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 07/10] Documentation: dt-bindings: Add documents for PECI hwmon client drivers
Date:   Tue, 10 Apr 2018 11:32:09 -0700
Message-Id: <20180410183212.16787-8-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit adds dt-bindings documents for PECI cputemp and dimmtemp client
drivers.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Alan Cox <alan@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Julia Cartwright <juliac@eso.teric.us>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Milton Miller II <miltonm@us.ibm.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
Cc: Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>
---
 .../devicetree/bindings/hwmon/peci-cputemp.txt     | 24 +++++++++++++++++++++
 .../devicetree/bindings/hwmon/peci-dimmtemp.txt    | 25 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
new file mode 100644
index 000000000000..d5530ef9cfd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
@@ -0,0 +1,24 @@
+Bindings for Intel PECI (Platform Environment Control Interface) cputemp driver.
+
+Required properties:
+- compatible : Should be "intel,peci-cputemp".
+- reg        : Should contain address of a client CPU. Address range of CPU
+	       clients is starting from 0x30 based on PECI specification.
+	       <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
+
+Example:
+	peci-bus@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		< more properties >
+
+		peci-cputemp@cpu0 {
+			compatible = "intel,peci-cputemp";
+			reg = <0x30>;
+		};
+
+		peci-cputemp@cpu1 {
+			compatible = "intel,peci-cputemp";
+			reg = <0x31>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
new file mode 100644
index 000000000000..56e5deb61e5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
@@ -0,0 +1,25 @@
+Bindings for Intel PECI (Platform Environment Control Interface) dimmtemp
+driver.
+
+Required properties:
+- compatible : Should be "intel,peci-dimmtemp".
+- reg        : Should contain address of a client CPU. Address range of CPU
+	       clients is starting from 0x30 based on PECI specification.
+	       <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
+
+Example:
+	peci-bus@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		< more properties >
+
+		peci-dimmtemp@cpu0 {
+			compatible = "intel,peci-dimmtemp";
+			reg = <0x30>;
+		};
+
+		peci-dimmtemp@cpu1 {
+			compatible = "intel,peci-dimmtemp";
+			reg = <0x31>;
+		};
+	};
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
