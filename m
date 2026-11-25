Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633670;
	b=nRIQ66gGiDE/KArtxlWwB051n9mxIT9V1M282IefsyeX00heJX2h+WRy5elsIaPmGlWG
	 VlfENX8UTBcn5PAjGxv69fAs1VORfhQIiuvwznb9h9ryB2ljSd3EIU4Ks+QgGUcHrAErV
	 WIjIE6J2/PIxyJ0YinS6BlQHDqC3ak06i4BciWL2Gk2DKsu89l6QJz/4zWcGHdcqzwQKL
	 pgU2dsxFyxoXwPyyQeK6nXbQuW4MW98Ffepnh7CYqUiP3UhXH7ybyseAzE5fGwR+Mb50C
	 fdR4LS2BbpNJUXxWxnG1sfHXrfj+zu3S3XCH2Kpg81KhkhFNkvEPLBc6uT1CELaBusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
	b=GMhd3FxVpMDdcCSi2G7M4TjbJNbPflbPerkOsV6C8K22IoSSJR9iK8wRNp80PZHcY0Xr
	 9fH5zs+Af7TEKuZk6glSbcoLuNqUJKOGBcE3PAqHaZipukHzK4GKCXCWg//3bByz8IK1p
	 2Fga3nhmNevxTU8HtyFA8Eh++e9orx47lw5uLBZv+qIZQ34ylFHV9dVvX1dvEnEa7TwV6
	 E6pUni/QCn1wPWLGlXyLFS23e+Ji+TN8DowRUKC/WBTolVnXtlBQxI88xDmdN5+O9JPgy
	 33ghrBz45ovp25VfESUOhmOmL1Sey7diF8mI3MJGRKdq7Maox909FxP9YWCF5+0u+Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x5RI60/M";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA684606A32E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 19:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA684606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5RI60/M
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso3145509c88.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633669; x=1796238469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
        b=x5RI60/MzFExmOQJVqzH9dvtf9/5lpQ5aEuFTCyldPxwdRHMWReCZiM66m5mQevnOC
         24p9Ye7iBrEJ8KQK39KIzPq5dIHWgKtvq2ZnBi8cPgFm04uy38keKwpG5GvuzQ3bwyAJ
         6acVwshjCzHd4fvWMq1+0yts0TF4McBIGvmIpTZm1qKhUXf2AlOl83pNfwD4UonhQDzt
         qWqa49LV0UMkbStyt8cWxbbQkJvFqHvOd0x8gU43WRPJgfoSiqpcaDHeUO/Jt1Q1yCSx
         GDUaRHjSy5wfPzmETe/Ogh6STqW4g/OgRfIW7EXwK5iLBFw7Z56qh0wnalg7RdHrbaU2
         YTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633669; x=1796238469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
        b=EAzt1VsICTFchnWuIP2e+EM8GyVgHXE27xxNRHjAhsqd8fX2eB8bD4uYyq65xcV6Om
         kodl+BoV9V8WXDjYw+aVd2aERgTJlmKa73IGbRRm0ClG1cA40GjtuNUVwv7cLeaR9mRs
         FS4+8OvZ5eqdRJI8Wfjuu+U316k7lkqum7YxD4ZqJ8ZxwY3ixaEuLxu9gZfurvdTEMeg
         ET4SIMiQ14T26erAXeiAa8RmXeJLWqcevUxZCb6mg2MKXVCYwt2TrAubB8aJrowi1RvF
         qs0H/z52nZRddn1WByWbsjRRxT62CieOlYY0gHuAWJvkhWs+oNm1V6+pHSB9LuwIqc4/
         kPzw==
X-Forwarded-Encrypted: i=1; AL+hErGXPF4PhACq19965+dVzK0Fw6vKWXgnF71PVHXqXugeysGAqnKOMeGFLLa1h7HgUiN5Bt0zO3hrXdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nPqaFLZXlK5zqrE4wOHJx+5sVT2s/oXnupKALYG0Lrp1a+mjd
	ujbz5EPMUgdecYo4rMlXTBRTrl1/WAabQ6cwgSSW4mlcC94hEWGFPOqF
X-Gm-Gg: AZFdTZdUvRfAybk16prGfHW6BTYuo/aNZsoUFxizVV4EurOZHLNTwosyEhVKOl9TFrq
	/v0RtsCUiXV9Jp3spRKbPe1fYswMl1AoxbKT1JYz5EMUoh9CDSeXnTircU1Q+utt6a+Zjh8Td8P
	fgdxw2tHPtax5smb7EA+JMXLi2bju8KCl4hD81JEr5engDJS1fC/03RRVP7KcQfemKo77nUNuH6
	4Noy1xwrJ5AGAHaSUA2biZQeHJHW1pFSSkfBsGbYK0DQ6VN+1+7kuGRO80pw3dWXyfIlIHTnrYN
	b9w1TrPo1sstWfP1uOawByLwqY+KQhz7mb7MTGDe391iLw611XNGo+gajZ5LJi2D4huEj/jtNwb
	zOSOmyxiry986DxAhsMIKnXyUh7TdkhktvR4crSp0vPZUaqNGawKyu/dXclzkEBGKk0GNHU6FUx
	HL//9Sp22pUQdCdQWF09LpcxF19KeizfJdg3v6UORCDpWfMKb9hHapTxXuFlxN/cW5WH/kPK0gB
	GTguHYoxB5LJwLPqox45rVciUvE0YBGvQN0QQjKmu1ngdyqXGjYAhfNPdk6IX/AQOvV+OqOGpv3
	vCKIjwvViLzBhvZ3QEmu
X-Received: by 2002:a05:701b:4213:10b0:185:6c8c:d860 with SMTP id a92af1059eb24-1b5568aac8emr18988658c88.5.1795633668803;
        Wed, 25 Nov 2026 11:07:48 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:48 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/3] docs: ABI: hid-lenovo-go: Point one entry at the version group
Date: Wed, 25 Nov 2026 19:07:41 +0000
Message-ID: <20261125190742.2420486-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125190742.2420486-1-takano32@gmail.com>
References: <20261125190742.2420486-1-takano32@gmail.com>
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

The protocol version of the internal MCU is exposed through the
"version" attribute group, but two entries claim
right_handle/protocol_version: the one that describes the internal MCU
and the one that describes the right removable controller.

The "version" group has no entry at all.  Point the internal MCU entry
at version/protocol_version, which matches the description it already
carries and the group hid-lenovo-go.c puts it in:

  LEGO_DEVICE_ATTR_RO(version_protocol_mcu, "protocol_version",
                      USB_MCU, version);

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports right_handle/protocol_version twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..ed8d9a35b8ca 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -386,7 +386,7 @@ Description:	This displays the product version of the internal MCU.
 
 		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/version/protocol_version
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
 Description:	This displays the protocol version of the internal MCU.
-- 
2.53.0

