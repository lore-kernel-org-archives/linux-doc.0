Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CA37AA81
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221515; cv=none; b=l/hf5R84spmMClzJk3RjwN5jIT/DWWrAcJIWwsJ1kt4vg9GugZXSGIPJjDZue9TUBpo60aCbjN78TNo7Ql6J3/cvuEreXP5VySMjNBVrcXm+1boQ799CWxohrtpcF3GI3AgxyVgZMfcl9pQ3KzCFRqmneZb6sbX2qkC6qlaAUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221515; c=relaxed/simple;
	bh=UI0xjgQJRvAoa59/OcrNBMSxM4PXDer91jntNEu7BgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=npbDlQBfISqv0ltE4wCvYK9XtKFLoQyyNSPIoIbUGEQ+mBtStDURq8B3utbI0ZkDsLbSYb+OhaSgyofiUydpQxkhus1Oj75Z/9c9+Via2prmwI5a53LpOsEbSmJDYZVrocJgUqfLHGaeN6VmX5n3Rhi0xKTNvN20imquqafLqY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5ke51P+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fadhgIFl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5ke51P+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fadhgIFl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B2QKp982191
	for <linux-doc@vger.kernel.org>; Fri, 3 Apr 2026 13:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hzbNjz7s83d1n/RewTAsaz
	iotGeaKoaGJzKT+pCY3f4=; b=O5ke51P+/Zwt8BcUFQQ/YqyKoQC1cgPsQ+CQtp
	d0iRvRDz15mKBrwVNczVrfUlFuja2DTWptkUgS5M0Ksr/5qeDNSv5ZY0muRjAgLx
	fMF8E1DwOgn52N0vQWxurbvMdahRLk18O/PfVYBj+AwPvfsP8yA0ONwUhqU1eeWR
	PXEYg7efSP9DUbk3c2N1c4rnNuBXXqEcT3qMgUtZojeVT5Svdna6fL/dv2cxH3Sn
	s8qfv2KM4+HAqucoVaIP9tgxEp3mqwAVcpxcS0Nam83GOMZG7uRE1cbL8+r4ha6u
	XiaVVljxpX9jXz+8RH07+5jEzEPAnNYDg3SPKU3JgPQg2Fag==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupujvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 13:05:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953c062b2bdso3027611241.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775221510; x=1775826310; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzbNjz7s83d1n/RewTAsaziotGeaKoaGJzKT+pCY3f4=;
        b=fadhgIFllBk3OYVJ2/grB1Bg0z66R7MNrvjgXoAXRw54zH5gA3q9wl34gH9CdXaeZQ
         Ks92oPkGkRel3Q2leIYSLKvIibWbxFJK7MW6hsz9MKtkp1p3wtOVkQz2KVO68xcjLb/r
         84PwmiHO54NUlLQ6PpJp1fPsYdJqBaIAFNrTTGsVKbXR0vE+t4fSpioWAm1FJSqn72gi
         g612P2UOYrBkDajnyyjGTfnI951PC73ZVkb7pf/xaTz/eMF4d1chULIFfYx6XSHmCOw/
         Y0EsTLOHnaimdzl/IvdmsiLRzungQB7HbzF1X+4qFU56jC4/67LxXoUUwhHdngmq1s0N
         6rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775221510; x=1775826310;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzbNjz7s83d1n/RewTAsaziotGeaKoaGJzKT+pCY3f4=;
        b=B3nbnGyQPfctR7EMMiwaJ++2IF3zX1YXQj8WpuyWAwQP5JHls9axfUzJFUhlmWFloJ
         9l6EEZBm1aHWCH/0sO8m6OLZQA1ZnJ6YODgUIaMKG9/Kk/CVl/of2NrJHYZl6hX8NnV7
         eNh6wmnpnT2LAH1cjCcbEBLp6Wm1jQGX97AtmvPSjPckjg2GTnXSuYtlQcj8eZyHPHxS
         29ZJC4vthX6cCYEZWt7nDdGh7PBqVMicbcal6tyAY8HzZL3rsA0bfsYi+D3Pz3GgsVom
         A4d/xdiXWytyDKKJtE5ucXb2iqraVp9Uk0J85b/c9CqGnd7UhS5wHF8Iv9KyCyvuzhNc
         kn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8SWoQhevTY2bZ33Nsc5+yAimHu8nXLJe5Ds52ecKEwJJ24VBW3idx/vhJawbmdDGph3hfcivvK4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0nzJ4aiG3uZVfNIcHbMHsxU0JvQEeSMuzmebe2vfA/6s1Cst
	P33SD81mlG2INWK4Pp8SR3MP6808XmkZJhbzrjhghY/Q6K8pwwxYBhw4yZ6BJJs4KNhhmmhMlQ0
	WTKuYaAflKDf4bluiJBdvvr0HWKAsNWojqJWgClZSbbEUWqTYJxeRYkkEd80/LFA=
X-Gm-Gg: AeBDiesmhNDNe3UO0taKLKhKad/0fzPPCo2yIy8rjVfj/tLVRCsdgcckGpsPGEykHT6
	Bs87fWh+1Uzod/T6G89BynA7wVPfe0oLZuM9u60TeWWr8cFwxS19LQfcmnVfInY6IAAanKyR769
	6AkcHEEuUUY65o9v49dTDtZ2cbTVYnuNqA+xPsf3s9zQHWsajsosxqzTSZdEmm0f/OdFzPDnLNj
	C/g3enOs9Jx4kUK1x/vEUf35ANs+6I2Q5+QeDYUPNkHHZTXIZs/zRXWErmhvRn4r3ecAtOoiw01
	JvzES7cOMf1DWJHwFwL4XqWHcib4UoMGnZfyDDlyUq70w9z7jU5gqIapZWG6Qm/AKJL7KJxoOSu
	Rbui3Kj+QU9b43tUFGvaddw5Xa2BT58YDS4SW3UI7gDdE7zG6S1k=
X-Received: by 2002:a05:6102:5cc1:b0:602:813c:1b24 with SMTP id ada2fe7eead31-605a4d35185mr1252611137.7.1775221509685;
        Fri, 03 Apr 2026 06:05:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc1:b0:602:813c:1b24 with SMTP id ada2fe7eead31-605a4d35185mr1252551137.7.1775221509125;
        Fri, 03 Apr 2026 06:05:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e491afsm18712055e9.17.2026.04.03.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:05:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:04:55 +0200
Subject: [PATCH v2] Documentation: gpio: update the preferred method for
 using software node lookup
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPa6z2kC/32NTQ6CMBCFr0JmbQltlVBX3sOwgP7AJMJgR1FDe
 ncrB3Dzku8l73sbsI/oGc7FBtGvyEhzBnUowI7dPHiBLjOoStWV1lI4smJYkAS/ZnKeRbDauXA
 yfeMs5NkSfcD3rry2mUfkB8XP/rDKX/tHtkohhQ7N0aq6Mcb0F2Iu78/uZmmayhzQppS+f2QYX
 7cAAAA=
X-Change-ID: 20260331-doc-gpio-swnodes-fc3ddf59b8dc
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7564;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UI0xjgQJRvAoa59/OcrNBMSxM4PXDer91jntNEu7BgE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz7r+0nNvSKseR5LPXVC3YVpQBmBpVV5rZuqgI
 Zo6FkrMuLCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac+6/gAKCRAFnS7L/zaE
 w/y3EACaUFBplHvkdlLuWxQQEuRJPLQQJtYokvcsnLcpPAW9rTd83B1N8zvYAy6Ge0Qmjkr+Bkn
 4qE92WreU3dtJvQCBHpk+B+GgHrqCOdqEQtJzh6imbwSnQOkvNGlWmtpmnd5BJOQiXq2dJUdAkK
 ZcSh8mZ7K/iOvt3oBvhZUhDJlvE5P2eNs/OrBw6ktODR18t1L8b7uG/i4Jge/IJxEuaUZ6MJToF
 epYE4iOBRsRi29crVT6BLE7H/4Y8+/WCYFisSgQkiZL8Hjo0KqRdHFc0PZrRSOyyuwWJeyOL3xc
 VQ6N2c06mqN+jFnaZzo/7EEmlbau0szidOjse8wkteszva7hUJSk/wqqh81Es6Zjv3acAc5OJDR
 w9lMG8/S/dIQorMaFk/yU6jnywKgNDN2qLOI1mvupaZZzgUoRbKOAIXfTHdlkSzWsnDVF5JD0vY
 fJPyivTbCc5fLD7b+OnpbnV5FwweOhrN/VVioxDeK5dFDsniYUCk875OWmAgqyg0g++dGiXIaml
 Mfs9b9P8gfbDJXDB8iZXKyfELH2KE5Flbo/5HlUiqQ3Pz/2W06s2xp5N1A8Q1ws5CLTIrZQDFW7
 f7oFVUnnrg+8jS4UwYygSQLyGTv0xqu8s1Tf7tdJ1gy6GeUGNCisOXaCiAV5U1/+iZ9ZB2TEP1B
 iq+7MXtTdvp7UVQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDExNiBTYWx0ZWRfX81ANNBYIOkIl
 GLqy/9dUkW/0Loskk7XQScK6liPMiiP3lK9s1DFyfiHDRFFZ72HfAtZMq198zUPmB6CUtRqbKZn
 vWejNZJk5u08el+3xHCcQKCpvx3i4GED3wzxgW77CX4XLzmueIecEifd7FbVNVdWkZB6bbYG2Di
 mFUn3a4QJUoouLHe7C2DWmyP1R0t9U4cdztHK9c5kc/VZt8eh5R9zgzdYeGC4Wa4cAXH/jco46E
 V3tqXcx/+5vjJyVBkfW4Tjv52EgeStGXENxvCN+GfdKzHZheAl5buZ5iHWwL4hHxMZz9jmUjqa+
 oXdUHr51sBTH/namz5Ilp9HxvtRVfGBdFHJQdMDEquFsOu/7cuMTjYukoin7oW5TCjtibdfGci5
 qsMEGX+eh+JzBP0QWYZnftf8OR57Zg1iwvz1XSvgWDrcXwFmjJA+BUPLFY91tm0ugUv0ddMP0Y/
 0SoI9Uy7tCBW4wU9KGA==
X-Proofpoint-ORIG-GUID: 6DWpBBFuoi8aNEPEVTUCfX4ov9u6UTFK
X-Proofpoint-GUID: 6DWpBBFuoi8aNEPEVTUCfX4ov9u6UTFK
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cfbb06 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=VHV1bxSRZQlKidfD:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jsnql4ADa7X_hVeABskA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030116

In its current version, the manual for converting of board files from
using GPIO lookup tables to software nodes recommends leaving the
software nodes representing GPIO controllers as "free-floating", not
attached objects and relying on the matching of their names against the
GPIO controller's name. This is an abuse of the software node API and
makes it impossible to create fw_devlinks between GPIO suppliers and
consumers in this case. We want to remove this behavior from GPIOLIB and
to this end, work on converting all existing drivers to using "attached"
software nodes.

Except for a few corner-cases where board files define consumers
depending on GPIO controllers described in firmware - where we need to
reference a real firmware node from a software node - which requires a
more complex approach, most board files can easily be converted to using
propert firmware node lookup.

Update the documentation to recommend attaching the GPIO chip's software
nodes to the actual platform devices and show how to do it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use the new .swnode field of struct platform_device_info in examples
- Fix whitespaces
- Link to v1: https://patch.msgid.link/20260331-doc-gpio-swnodes-v1-1-3f84c268999b@oss.qualcomm.com
---
 Documentation/driver-api/gpio/board.rst         | 20 +++++++++++---
 Documentation/driver-api/gpio/legacy-boards.rst | 36 ++++++++++++++++++-------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 0993cac891fb5e4887a1aee6deae273197c6aae1..b306c21481d7c191201d81d228a290a908cc82ab 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -108,9 +108,8 @@ macro, which ties a software node representing the GPIO controller with
 consumer device. It allows consumers to use regular gpiolib APIs, such as
 gpiod_get(), gpiod_get_optional().
 
-The software node representing a GPIO controller need not be attached to the
-GPIO controller device. The only requirement is that the node must be
-registered and its name must match the GPIO controller's label.
+The software node representing a GPIO controller must be attached to the
+GPIO controller device - either as the primary or the secondary firmware node.
 
 For example, here is how to describe a single GPIO-connected LED. This is an
 alternative to using platform_data on legacy systems.
@@ -153,6 +152,21 @@ alternative to using platform_data on legacy systems.
 	};
 	software_node_register_node_group(swnodes);
 
+	/*
+	 * 5. Attach the GPIO controller's software node to the device and
+	 *    register it.
+	 */
+	 static void gpio_foo_register(void)
+	 {
+		struct platform_device_info pdev_info = {
+			.name = "gpio-foo",
+			.id = PLATFORM_DEVID_NONE,
+			.swnode = &gpio_controller_node
+		};
+
+		platform_device_register_full(&pdev_info);
+	 }
+
 	// Then register a platform_device for "leds-gpio" and associate
 	// it with &led_device_swnode via .fwnode.
 
diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
index 46e3a26dba772e5e5117866b5d202e76c8e2adf2..a9d33bcbb176b5df99838bd03e43ec2ebf4d9db6 100644
--- a/Documentation/driver-api/gpio/legacy-boards.rst
+++ b/Documentation/driver-api/gpio/legacy-boards.rst
@@ -36,12 +36,10 @@ Requirements for GPIO Properties
 When using software nodes to describe GPIO connections, the following
 requirements must be met for the GPIO core to correctly resolve the reference:
 
-1.  **The GPIO controller's software node "name" must match the controller's
-    "label".** The gpiolib core uses this name to find the corresponding
-    struct gpio_chip at runtime.
-    This software node has to be registered, but need not be attached to the
-    device representing the GPIO controller that is providing the GPIO in
-    question. It may be left as a "free floating" node.
+1.  **The GPIO controller's software node must be registered and attached to
+    the controller's ``struct device`` either as its primary or secondary
+    firmware node.** The gpiolib core uses the address of the firmware node to
+    find the corresponding ``struct gpio_chip`` at runtime.
 
 2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
     macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
@@ -121,13 +119,21 @@ A typical legacy board file might look like this:
   /* Device registration */
   static int __init myboard_init(void)
   {
+  	struct platform_device_info pdev_info = {
+  		.name = MYBOARD_GPIO_CONTROLLER,
+  		.id = PLATFORM_DEVID_NONE,
+  		.swnode = &gpio_controller_node
+  	};
+
   	gpiod_add_lookup_table(&myboard_leds_gpios);
   	gpiod_add_lookup_table(&myboard_buttons_gpios);
 
+  	platform_device_register_full(&pdev_info);
   	platform_device_register_data(NULL, "leds-gpio", -1,
   				      &myboard_leds_pdata, sizeof(myboard_leds_pdata));
   	platform_device_register_data(NULL, "gpio-keys", -1,
-  				      &myboard_buttons_pdata, sizeof(myboard_buttons_pdata));
+  				      &myboard_buttons_pdata,
+  				      sizeof(myboard_buttons_pdata));
 
   	return 0;
   }
@@ -141,8 +147,7 @@ Step 1: Define the GPIO Controller Node
 ***************************************
 
 First, define a software node that represents the GPIO controller that the
-LEDs and buttons are connected to. The ``name`` of this node must match the
-name of the driver for the GPIO controller (e.g., "gpio-foo").
+LEDs and buttons are connected to. The ``name`` of this node is optional.
 
 .. code-block:: c
 
@@ -257,6 +262,16 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	if (error)
   		return error;
 
+  	memset(&pdev_info, 0, sizeof(pdev_info));
+  	pdev_info.name = MYBOARD_GPIO_CONTROLLER;
+  	pdev_info.id = PLATFORM_DEVID_NONE;
+  	pdev_info.swnode = &myboard_gpio_controller_node;
+  	gpio_pdev = platform_device_register_full(&pdev_info);
+  	if (IS_ERR(gpio_pdev)) {
+  		error = PTR_ERR(gpio_pdev);
+  		goto err_unregister_nodes;
+  	}
+
   	memset(&pdev_info, 0, sizeof(pdev_info));
   	pdev_info.name = "leds-gpio";
   	pdev_info.id = PLATFORM_DEVID_NONE;
@@ -264,6 +279,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	leds_pdev = platform_device_register_full(&pdev_info);
   	if (IS_ERR(leds_pdev)) {
   		error = PTR_ERR(leds_pdev);
+  		platform_device_unregister(gpio_pdev);
   		goto err_unregister_nodes;
   	}
 
@@ -274,6 +290,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   	keys_pdev = platform_device_register_full(&pdev_info);
   	if (IS_ERR(keys_pdev)) {
   		error = PTR_ERR(keys_pdev);
+  		platform_device_unregister(gpio_pdev);
   		platform_device_unregister(leds_pdev);
   		goto err_unregister_nodes;
   	}
@@ -289,6 +306,7 @@ software nodes using the ``fwnode`` field in struct platform_device_info.
   {
   	platform_device_unregister(keys_pdev);
   	platform_device_unregister(leds_pdev);
+  	platform_device_unregister(gpio_pdev);
   	software_node_unregister_node_group(myboard_swnodes);
   }
 

---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260331-doc-gpio-swnodes-fc3ddf59b8dc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

