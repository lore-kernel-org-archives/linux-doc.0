Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E44854FA
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076848; cv=none; b=rxKhO+TB/ZWZQv3Br8IW2/Rr0EWC/QJ+VOLgA8liIwFW2mhaf2vr2bBg8aTc2Nxu3X7T8zQ054TVhfk2qDu6eDMGZgfZ2Tr3MhFkKXyDCvON4NmASaZQuMsBwrdcxFL4m9b7PerSnDAK07vJniuHJQuY+k3K/3G1lf+OWaRN1X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076848; c=relaxed/simple;
	bh=+zdtyruVipHBzua3Z+iP7K8R48j4pg2v8WT6MJyggmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wmuy5ffvg31fsQNlOlKZluVPZNRCww4KkE49SrV8oqJwpjk9KSFAt6VjMlRHgbCfI4qc57z6aP2A4LjQyP/yphcqXmyS4KFcDVJo8H1IuXB/Q49xZEiS1nUIFMQtK0lGa9zh9lca3bBtHrMYVRyC7Pw8z4gJb+xHFZsIrG1m89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCRQ4afQ; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCRQ4afQ"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97bf8f10ebfso62676241.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076845; x=1787681645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dI0skn1hMaNhZ7ScecWggo3zzn2ZDLJPo30AHcpisVQ=;
        b=kCRQ4afQY/O7bXt37iD5KZKUrIAhO+Oc9zWEKPXxk2dBVNcOFUML8aio6cpMy3nDA/
         gPRhpu1id2bD5zoZ9Gb0SNk3/a8Hj56wjfCgYwcieE1RcyukCAbiMR/Bm9rnZuWeVc6e
         rpgZo5WQDpUDQTu+E9IouTHEm5c2sbqwbcKstA1BQRWAdoIkgAdro3x8HNJ23O85Rrr2
         KGv3yHrD5O+iz/AFnRA4WLWbOM5nlf1+J5aZp7+BLYt+DupI9PhLLynuj72KZ8fh6IA2
         ZjsDXQ09l2653JWbJqV1qCyIyxjbPEGg5gbqTPce0l/3vHLfvle+aByXqogNjbhZZEmW
         TfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076845; x=1787681645;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dI0skn1hMaNhZ7ScecWggo3zzn2ZDLJPo30AHcpisVQ=;
        b=DH3AROeNdzMgBjK5Kmd9x4NCa3dqLBaEpL+PCeMx+DYRosE/Oi/ulynP/Sh2il2see
         izcOvDTPD54EvZ+qsgJhyjuumbPOJPbpdUaQdPdDgllDbjLaAQCBeE+Otie65KoeKbZk
         9efeocXbxbjikz5JwVCbSNc8wLl+LVvq8n5kmm8qmCI8NZkx6L2FMMzA6U4CZAetiLgV
         iE8njJXOOlRyMv8VcHs4XKXWY97SbrppZFwntIQ5j6pVJIqCuUARxE2KWWxPDU6rNj5M
         Kjx7wXVOWZie3zJagVS1U1tdMV++sRGuSUV4H1HBNwzHzutKWE89ws1d15RVNvdHqH5z
         aVNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLAA86Vz1yY6Km7WyL0a1bO2mboSgg1tXk6kKFj9z+Bz2mu/lHPEL8u7STQ40KPyuZTHfGKuAAcYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCjiQr0dvEU6RPkXfHBgxZ+3SNrAqmDj8NmV3IzxyU7Cv211X
	nJ4mJv0mmb/fEqoEg21lnQYRZkJEkcgsYl+360FQx3qWoz0CQZ33LM+q
X-Gm-Gg: AR+sD12tYQjrXd/eroePn8iGUBNLbVmx8IYRZggTR2XfJZVfiAyGZt309HnvqOwxLSh
	aSNflt6WnCg0Cw0LwmzO6NRIip79r9zhWk8+diiH1v9z7wLzE72ixUW8YQ01/Em0XnsPhDqWo4R
	gnq+JSIgmH3xgTcsOfqo5aVG7eH/XeHak9XHYStCs6EHqjrflx3t/70f4fLn/BvNbbpuz815NfU
	tXbbx9UcNdUoWUfOWOfVZMqgxv8oc65ai+g5BpNuKk2BlF2ZEcuFR53GcMsRdQgC1DujzeIb5b2
	fgJnJp21RbOmwO20A5XC/lOvENRszMTAyeSwY42bSTACpzGLhhv8ussJ+XCDwu6JUUXDnL/gY33
	mVe8Lja5hnHz8J6Dbtgj6fcT2GWlnLPYUIyVQqWDm0j25QvkP9XKOsLzQiHgp0T1nVEnbwQ5IS5
	PTiPEapvH9kmKPRxwYJ4jDjkdmK4+eNFlMxFTcXezZSzIQYiqPWkVYZ3CNPfu02+S+
X-Received: by 2002:a05:6122:6c15:b0:5c5:a01f:aeff with SMTP id 71dfb90a1353d-5c5a01fdb13mr8760102e0c.9.1787076844361;
        Tue, 18 Aug 2026 11:14:04 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:6f62:ea1f:22cc:4407])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4533ef8dsm1496530241.1.2026.08.18.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:14:03 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Tue, 18 Aug 2026 15:13:44 -0300
Message-ID: <20260818181345.203295-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DMI-gated hwmon driver for both fans on the Minisforum UM780 XTX. The
EC is an ITE IT5571E, but its register layout and OEM commands are defined
by machine-specific firmware, so the driver only binds to the exact board
revision and BIOS version on which it was tested.

The driver exposes both fan-control temperatures and tachometers, two OEM
automatic CPU fan profiles, and two writable system-fan transition
temperatures. It preserves the selected settings across s2idle.

Tested on the target system with concurrent RPM reads, OEM profile changes,
system-fan threshold changes, unload/reload stress, and s2idle resume. The
settings were correct from the first userspace sample after resume and
remained stable for 15 seconds.

OpenAI Codex assisted with reverse-engineering review, code editing, test
orchestration, and patch and email preparation across a long interactive
session. I reviewed every change, ran the live tests on the target
hardware, and take responsibility for the submission.

Link: https://lore.kernel.org/r/20260807003842.249957-1-speyrott@gmail.com

Sebastián Peyrott (1):
  hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

---
Changes in v2:
- use standard hwmon callbacks for pwm1_enable and the hwmon lock for extra
  attributes and PM operations;
- remove constant pwm2 attributes;
- align CPU/SYS temperature and fan channels and simplify their labels;
- round and clamp system-fan threshold writes, and cache the fixed limit;
- replace delayed work with suspend/save and synchronous resume/restore;
- simplify callback dispatch and error handling.

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  68 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 509 ++++++++++++++++++++
 6 files changed, 602 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c


base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.54.0
