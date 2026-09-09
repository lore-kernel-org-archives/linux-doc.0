Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14B423A85
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966341; cv=pass; b=F2Sy/8Zd1ertVi3niodVe+e7dowMRtH0Emkp/AOlmhIFVE+UQxLpGhkIbtKM6tS0Nb/RLm10lnbHWyRjrbrgmeurxnOEo71pDPL2f5mtaDM3hQfi7GEB2sX12WVmeUwOOK855iRVYBxYaEfXOOtS6S4aae6NVIR8aK4OwKBtNrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966341; c=relaxed/simple;
	bh=CdSWv/WiURR6Acy7P/4aVQQtslC45I4dSTkhDw1BvgI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDbXOOrNlus2SSb0FY9yoYk2UrMlDVtlYzerV2FbuyHXRaAAATUU4oH7RLT19KsDu8jVJmFlewBTNWn9jyUs0B5PuM/xooXydmL+CLswU8U4e2PiPi/B9NIloXoYv5JZzXM1RXtnGN8LhuGHrajklq1SKX6tVKJ0+QOtLWAfiJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MffD7ozd; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MffD7ozd"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-475920b9ca2so1952711fac.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788966339; cv=none;
        d=google.com; s=arc-20260327;
        b=k/3N9bEYPdDlSgDWQvP93At7DwlnsiBQSJHaCb1QqO3Im/sekCNqdHkoFWQoGXqBkr
         4jsbh7vA4zQe+AhEbTPHEO7yPP2BPHjLOYrtEq41R814/1X8ngV/9diiFas9c24MpJE1
         HErA/YFsvf9jPmiN2fXwL2bsshK+uhgbX1NEA7u7yz7OpaWxqYCWp6ggte+P5Z0wOVAB
         9M7TcUyaTYW8e2bAAwWUyZ9JrCTgu+hjza/vMrKPG2OnMg8G9xTDv4iJxjPf2gDtYuy9
         DahmJ8fKjW+rWCYVHrlQJVXMR7PvIXqnQPfYWEARr5Lj91Ymq3k6NNB9M8ON9SVIRm0a
         5nYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=bPifW9Smu+tKBLdTNDc9b+YeXLJbZl3BP3bUtreOS1w=;
        fh=Tpo4uIjnWP46Ryw7T2XGCKSzP1EAANxzxeCVy/OKizQ=;
        b=Hv0dE/7SzYk4LHKtW5jtI5PvtrvFhUOzX8kIxm3jh48IkPJuC70Ni8Pb6n3yYAGriN
         lwQlg8FK2fhFARKbJUjZTckaT6o055ZsSit2HiNLXs3sj154Y/DJD8hHwpxXwiZSYNIq
         Kjhm1MejKQS0+2Ogv9h6LFJG4ycZsY/N//XNizSo9rcCr9aNM15L8M2Lz/flxo8548sy
         PR/qQzoFZs7+My1NGEZOjPHUuqXTqJnXVfWH2ukRdeXm+9u3o/G5gFBSrtMNr89DtUv6
         uOZ6P3f0WZLbPMGx+M9mlSgWWzZ62OdU4nwAPUzRREJLL9a8/Rfg2CBFHY0hxRWhZ8RP
         z6UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966339; x=1789571139; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPifW9Smu+tKBLdTNDc9b+YeXLJbZl3BP3bUtreOS1w=;
        b=MffD7ozdMsfGj8F4DamnIZ+7kNFrlvGiu1toNtJyONjoc3+nDY9xgXfFQRt/+ou3Cn
         T0LQE4bSPGK/mW3OcN7SL/NXMEHBcXLahoxXFiGsjUICJvxz9jv1Wf0VQAa1Ar6trJa0
         HO5uNBADKgUgIVu8Gz3x6lrFfENkOW0r1ZSNFdZKZ77hE/QDK2OaqMWwHhdaiKbLV2kW
         yjCTNnfsCBBvuyQOflwe7r2YaTruWLxs4CkaawZErJLiJFnd2zeUn62SrAL1hkOzcKBx
         D7W39vBhTkjAF7SFL6vyMIbUsNJry+bILMutzBH0omCg4WibewZ0bb5XzPUeMu1Z5kHD
         8YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966339; x=1789571139;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bPifW9Smu+tKBLdTNDc9b+YeXLJbZl3BP3bUtreOS1w=;
        b=JfPAspgJ5uKmsrw06wlVX13501aON16RVfSLQq4ndraPhH10i0BrO+H/EW2GWI8zUb
         AddtkYfcVgaG15EsF+w6f2VKvgYDvuNttbW8bnXt/cPboEZOh5U7nWWHfGMAJv6FqSj7
         BBJ7vGH2hbffB/CM6mrtvMqzTV4aVT9J5Ix31GuAAkOwmswMoiQ1OjaZSjKvYia6c/+U
         kaWobeNvgG2z6aIuAiNRi9OPzA1B5fN41XtsOIn9FIv0dkitIC9GtpEAkzf7LPCLajrT
         lgHqDyscjrBerfI/3nNEb4PDpJRLHEOwyFSa+HpUkcx8fnDFi7lZPbdZVcsJ+LrCQfYd
         UqNg==
X-Forwarded-Encrypted: i=1; AKwUvBz3LVqwCU0yGgQG9a/OsO0ErkgUjOrx9btpTcGDXmlzeWDGiDpCzHDW03PVjGzP2p1dWRTIfJKjpOk=@vger.kernel.org
X-Gm-Message-State: AFuF++l4QJVZtgTigg/0fvP0rMSj4cVyweYe8o0iZqqpEnxh9k/8yKiX
	WlgiiBvJYmIdj+oYgsAlz7TkyElvQ3jGJVcjV3jXAihnFPOOXAtJ/chx7QURnLO4OaJ+VqoaV3k
	iRCLpCQD7c4H04mpRvNLf5TwtfaHzNbg=
X-Gm-Gg: AYBFou3t8DPwvvM5fpSx/2ZPiLqzF+HMnX6YvChfQm/83MkBx/yzonBSdKnJ9sNX0ao
	Zrlhq1Dqxj8/CExHHwv45/zF75svMJRufVpLI5rjaElq3Ddid6c2pwLVduBjqe8Z/3Jc7oWRO1N
	dft8E3gNuHbYod7U3WiW+UZ2l7nQpu9YDH/DAwMqn7ZyWLCwipscer1k3FAH//j6+EAJUfBK2Eq
	DInIXQkk9hCN3snuH7qbp5YZdz5GYdTLL1kdCKng4y1akYqEZ7sEOSY9LWxMjdi28rs8/Kofzly
	07ZeRYeGAflnNtbvY8i/GHjQ44PVi/b/5ivfe+FBHZRdkqPPmRG3bBWA9oqVn5sNNnxeSx1efMr
	hkNu9fqtmqYQzU6USucMaPuWy7vohWEbnAwn0AA==
X-Received: by 2002:a4a:e847:0:b0:6b7:46e9:9700 with SMTP id
 006d021491bc7-6b746e9a360mr19044134eaf.48.1788966338598; Wed, 09 Sep 2026
 08:05:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:05:36 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:05:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jinseob Kim <kimjinseob88@gmail.com>
In-Reply-To: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
References: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:05:36 -0700
X-Gm-Features: AcwNN1XXvx0UutbQz3C8pC-IVMf-p4wSoPFQaanIGZK3T3vTnj6LaeC92XUpPTI
Message-ID: <CALMSewK17jG3MXTHv4Rj+tFVriw9+tqNuAMcX4KGQGy5NQP_MQ@mail.gmail.com>
Subject: [PATCH v9 2/5] Documentation: iio: add Open Sensor Fusion driver overview
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, joshua.crofts1@gmail.com, 
	u.kleine-koenig@baylibre.com, julianbraha@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document the Linux IIO mapping for Open Sensor Fusion devices.

The overview explains that sensor channels are discovered at runtime
from mandatory capability reports. It also documents that OSF0 is a
wire-format detail and that protocol_major and protocol_minor carry
protocol compatibility information.

Assisted-by: LLM
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst              |  1 +
 Documentation/iio/open-sensor-fusion.rst | 84 ++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 86 insertions(+)
 create mode 100644 Documentation/iio/open-sensor-fusion.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index b02b879b053a..c2b7963348fd 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -40,4 +40,5 @@ Industrial I/O Kernel Drivers
    adxl345
    bno055
    ep93xx_adc
+   open-sensor-fusion
    opt4060
diff --git a/Documentation/iio/open-sensor-fusion.rst
b/Documentation/iio/open-sensor-fusion.rst
new file mode 100644
index 000000000000..15d41202eb66
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Open Sensor Fusion
+==================
+
+Open Sensor Fusion is a sensor aggregation hub interface. The Linux IIO driver
+receives OSF protocol frames from an attached device and registers matching IIO
+devices for the sensor classes supported by the driver. The actual sensor
+channels are discovered at runtime from mandatory OSF capability reports.
+
+This document is a driver-facing overview for the Linux IIO mapping. The full
+wire protocol, firmware behavior, and hardware model details belong in the Open
+Sensor Fusion project documentation.
+
+Device Model
+------------
+
+An OSF device sends binary frames from the device to the host.
Devices using the
+``opensensorfusion,osf`` compatible are expected to provide
+``CAPABILITY_REPORT`` messages so the host can discover which sensor
streams are
+available. Device Tree describes the attached OSF sensor aggregation
hub; it does
+not enumerate the individual sensors discovered at runtime.
+
+The currently supported Linux subset exposes:
+
+* accelerometer samples as ``IIO_ACCEL`` X/Y/Z channels,
+* gyroscope samples as ``IIO_ANGL_VEL`` X/Y/Z channels,
+* magnetometer samples as ``IIO_MAGN`` X/Y/Z channels, and
+* temperature samples as ``IIO_TEMP``.
+
+Protocol Scope
+---------------
+
+The driver supports OSF protocol major version 0 for the IIO receive path.
+The current wire magic is ``OSF0``; that string is a wire-format detail and is
+not the Linux driver identity. Device Tree keeps the generic
+``opensensorfusion,osf`` compatible rather than naming a product such as OSF
+GREEN or a wire magic value.
+
+Protocol versioning is carried by the ``protocol_major`` and ``protocol_minor``
+fields at fixed offsets in the OSF frame header. The driver currently
+supports ``protocol_major`` 0. ``protocol_minor`` changes within major version
+0 are intended to remain backward-compatible within the fixed header layout.
+Incompatible wire-format changes require a new ``protocol_major``. A future
+device that cannot expose compatible version discovery through that fixed
+header layout would need a different Device Tree compatible.
+
+The Linux driver handles device-to-host frames for:
+
+* ``SENSOR_SAMPLE`` buffered and direct-mode sample data,
+* ``CAPABILITY_REPORT`` based IIO device registration, and
+* ``DEVICE_STATUS`` cache updates.
+
+Vendor-private message types are ignored. Command transport, calibration
+control ABI, fusion output ABI, and runtime capability removal are outside the
+Linux IIO receive path.
+
+Timestamps
+----------
+
+OSF frames include a device-side ``timestamp_us`` field. Buffered IIO
samples use
+an IIO timestamp captured on the host when samples are pushed to IIO buffers.
+The driver does not correlate the device timestamp with the host IIO
+clock.
+
+Compatibility Notes
+-------------------
+
+This overview describes the implemented receive path, not a normative wire
+specification. A publicly versioned specification covering reserved fields,
+extensions and physical scale units remains needed for interoperability review.
+
+The decoder requires the fixed header size and the exact payload lengths of
+known messages. It ignores unsupported protocol majors, unknown message types
+and frames with nonzero header reserved fields. Unsupported capability entries
+are skipped individually; malformed known payloads are rejected. Appending data
+to an existing known message is therefore not a compatible extension for this
+receiver.
+
+IIO scale is taken from the initial capability report and is not updated by
+sample frames. Devices must supply scales in the units required by each IIO
+channel type, including gauss for magnetometers. Historical OSF draft documents
+differ on reserved-field handling, trailing extensions and magnetometer units;
+those drafts do not establish a canonical specification for this driver.
diff --git a/MAINTAINERS b/MAINTAINERS
index ff09899bd645..0c9c322162b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20515,6 +20515,7 @@ OPEN SENSOR FUSION
 M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+F:	Documentation/iio/open-sensor-fusion.rst
 K:	opensensorfusion

 OPENCOMPUTE PTP CLOCK DRIVER
-- 
2.43.0
