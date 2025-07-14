Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B752594BD
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505785; cv=none; b=BRqmWC+Ubq+Rfzk542NY0Tjyt6Do2dgsePn3F18v4YHATYskfigbEAbnj+ZKCR/AmEbfIcJ4/H9JrYuaNS2zMmX1DRt+dWeDMtfTIQVP/R/XxklllrfDOs+RUoEozZdBq1Q+9zabn4BrElRUIgQVRGuGszGFvR4NlBdyUxqN+jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505785; c=relaxed/simple;
	bh=Uok6DILoPOvZp+Qs77VyjaNIdhcdWjtHXCSGgyLUUqw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qr/vMvQ8A4T+G+e2NL7sQpmwD+8szq5eBze3KNOjtbA/GWxQkXbQ5UWfTpz9RyfoFIf+9GsnslXYaHjwZFOQKM9XrZblmygFqTAVPAeyXT+1LWf6rSuiKlkzvM+ttNob7k008HHO6vtM8JgeRiubtQl1SKFqJTEJAW1p435c288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D0RIjovo; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D0RIjovo"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-4139102c7f9so3815548b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505782; x=1753110582; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rBfnI0Cc6NSdPSEAHn85ghZ26F1kZSQkAMZb6beNyPo=;
        b=D0RIjovoTWsLvZ6ucQVwnBtJjl7jW+3oNpwWcgE3P+1+BAnoWl3Cu4/ZpelQNaTb0i
         zx2LjeMbXcawKJNkt/fQhpZSh3o4N5qlXOCSC7w1F98cQlQlQaKgy0nSceDxmeIarcHE
         Yqb6BjWr5a+YCocW8htZ3QcWjbBMivGjiZxt+fyPt0K/qIs11m8Du0FGhunT5nRo961n
         USzZTQ4tUAggAFWdueTuYzsGuU8hv+mIJqF0XGssRunA3mEQf24UXtj5Gtsp9zND92DU
         MacBzQq0Zho+Yaip38+tqbZjS7BirP9liXZmQcnfvQW+aiXfvn1lb9LGCGPH4DlVacON
         afOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505782; x=1753110582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBfnI0Cc6NSdPSEAHn85ghZ26F1kZSQkAMZb6beNyPo=;
        b=g+eFuOMuVShHo+YObpbGbl37Qdvn+ncIqSodubtYpkqdPWD9upASzFLgE5GuoeI5d0
         H6t0Ed9cmhQn/hhoRk4AieGjoPWMyFITT5Iifg+xaPyXo/3/+Ry/7PKbcbXNPvz0CRjO
         b3sa1AAYSq9/U8NcvpumD37RV2YejgoeexGxhUJ+FuWYbvKj+jaf5ULSTjEZBKZ/gQw/
         s/vlK+aRkKJ7qY3FvDHrCVzDc+1adq6E/GVM7hnEDGjUyg8rmvRGzI+Bs4/eOgwuuTRD
         ySREjJByk187bMa1SKIWHJkOre5G5etOEmNWGH1ZsiWuK5APgC7jylQDcoY0dm/N0FIL
         Tf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWP9HeRq3ebw2iEVBjFhS2xBde3q9M0oiVMq34SqjHLYMxDeH8KTB1gyk2N5zW0fkIN9ql/bj68XSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CJQgc4iJ/c9AzHckikQpd923dHZfdyUFsPU14Q0QIn7Z5PPI
	XKV6OMSx1wx9kZ6FMGNwguIxtyuU6A9EmLm8wH5zW7WsbcjHM1UPOSwHcyjjh8dXYzUZOqyI6pm
	YHO0T3RhTrQ==
X-Google-Smtp-Source: AGHT+IFeQhPP+MSpH+mhTXBJwOZLGuJglj/5F4ZUR92EYeytZhgKDlZN+rECrspde6vsI5uHjJK1ZcUvOl+k
X-Received: from oibki2.prod.google.com ([2002:a05:6808:6782:b0:404:e160:ecd8])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:690c:b0:40b:711:377d
 with SMTP id 5614622812f47-415393d60b3mr8755441b6e.18.1752505782144; Mon, 14
 Jul 2025 08:09:42 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:37 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-4-71c7c05748c9@google.com>
Subject: [PATCH 04/11] HID: haptic: introduce hid_haptic_device
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Define a new structure that contains simple haptic device configuration
as well as current state.
Add functions that recognize auto trigger and manual trigger reports
as well as save their addresses.
Verify that the pressure unit is either grams or newtons.
Mark the input device as a haptic touchpad if the unit is correct and
the reports are found.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/Kconfig      |  9 ++++++
 drivers/hid/Makefile     |  1 +
 drivers/hid/hid-haptic.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-haptic.h | 74 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 43859fc757470caf6ad43bd5f72f119e9c36aea7..ad6bcc4248cc111705d7cfde2b1481b46353e2d7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -92,6 +92,15 @@ config HID_GENERIC
 
 	If unsure, say Y.
 
+config HID_HAPTIC
+	bool "Haptic touchpad support"
+	default n
+	help
+	Support for touchpads with force sensors and haptic actuators instead of a
+	traditional button.
+
+	If unsure, say N.
+
 menu "Special HID drivers"
 
 config HID_A4TECH
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 10ae5dedbd84708d988ea1f594d409ccebd85ebb..361a7daedeb85454114def8afb5f58caeab58a00 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -4,6 +4,7 @@
 #
 hid-y			:= hid-core.o hid-input.o hid-quirks.o
 hid-$(CONFIG_DEBUG_FS)		+= hid-debug.o
+hid-$(CONFIG_HID_HAPTIC)	+= hid-haptic.o
 
 obj-$(CONFIG_HID_BPF)		+= bpf/
 
diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
new file mode 100644
index 0000000000000000000000000000000000000000..d659a430c1a6b06ded31d49efe4bded909671cb6
--- /dev/null
+++ b/drivers/hid/hid-haptic.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID Haptic support for Linux
+ *
+ *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
+ */
+
+#include "hid-haptic.h"
+
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage *usage)
+{
+	if (usage->hid == HID_HP_AUTOTRIGGER) {
+		if (usage->usage_index >= field->report_count) {
+			dev_err(&hdev->dev,
+				"HID_HP_AUTOTRIGGER out of range\n");
+			return;
+		}
+
+		hid_device_io_start(hdev);
+		hid_hw_request(hdev, field->report, HID_REQ_GET_REPORT);
+		hid_hw_wait(hdev);
+		hid_device_io_stop(hdev);
+		haptic->default_auto_trigger =
+			field->value[usage->usage_index];
+		haptic->auto_trigger_report = field->report;
+	}
+}
+EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
+
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+		return true;
+	return false;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
+
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	if (usage->hid == HID_HP_MANUALTRIGGER) {
+		haptic->manual_trigger_report = field->report;
+		/* we don't really want to map these fields */
+		return -1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_input_mapping);
+
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+
+	if (hi->application == HID_DG_TOUCHPAD) {
+		if (haptic->auto_trigger_report &&
+		    haptic->manual_trigger_report) {
+			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
+			return 1;
+		}
+		return 0;
+	}
+	return -1;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_input_configured);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
new file mode 100644
index 0000000000000000000000000000000000000000..fc8979772d00e8b3238b26060c5541065a61811d
--- /dev/null
+++ b/drivers/hid/hid-haptic.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  HID Haptic support for Linux
+ *
+ *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
+ */
+
+/*
+ */
+
+
+#include <linux/hid.h>
+
+#define HID_HAPTIC_ORDINAL_WAVEFORMNONE 1
+#define HID_HAPTIC_ORDINAL_WAVEFORMSTOP 2
+
+#define HID_HAPTIC_MODE_DEVICE 0
+#define HID_HAPTIC_MODE_HOST 1
+
+struct hid_haptic_effect {
+	u8 *report_buf;
+	struct input_dev *input_dev;
+	struct work_struct work;
+	struct list_head control;
+	struct mutex control_mutex;
+};
+
+struct hid_haptic_effect_node {
+	struct list_head node;
+	struct file *file;
+};
+
+struct hid_haptic_device {
+	struct input_dev *input_dev;
+	struct hid_device *hdev;
+	struct hid_report *auto_trigger_report;
+	struct mutex auto_trigger_mutex;
+	struct workqueue_struct *wq;
+	struct hid_report *manual_trigger_report;
+	struct mutex manual_trigger_mutex;
+	size_t manual_trigger_report_len;
+	int pressed_state;
+	s32 pressure_sum;
+	s32 force_logical_minimum;
+	s32 force_physical_minimum;
+	s32 force_resolution;
+	u32 mode;
+	u32 default_auto_trigger;
+	u32 vendor_page;
+	u32 vendor_id;
+	u32 max_waveform_id;
+	u32 max_duration_id;
+	u16 *hid_usage_map;
+	u32 *duration_map;
+	u16 press_ordinal;
+	u16 release_ordinal;
+	struct hid_haptic_effect *effect;
+	struct hid_haptic_effect stop_effect;
+};
+
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage);
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field);
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max);
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi);

-- 
2.50.0.727.gbf7dc18ff4-goog

