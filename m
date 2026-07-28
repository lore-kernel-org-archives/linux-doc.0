Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE604657CD
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268326; cv=none; b=cWegDewGKZgwDU7m2AusiYtGxzVGokn9ABIS/mjWu5EzTKwRbGwDYyrlz5Mtl3x2sk+lUlGPSjCMzdgftjR/k/EAaRrwZUWmcojjoxGfIAF6lZbWA4PpfCxWX7gMJFhgbrjAasPpe+FRgJFxRdwwyJTm4PFZjMgVkbOK1a8QVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268326; c=relaxed/simple;
	bh=SFt5E9GYZueOjVBG9UTzsLKlJFq03wyncP/bQf0SmVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdNXw9nF1QYs3xFn+X9diw+AxNcxFHg8jE4C3frRSkqSWr5tadR+BkQBQsgYJGtWmrWTL7qr0A+W9ekg2+OEcs7yjO/gZRO/zA6WccNci6DRSupArN0mkykUq821b3A0FWv/7hh7m59ScayGoojNJ7YdqWhIDic10lx4EnsOV1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYqct8Lv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYqct8Lv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8484f229529so177029b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785268325; x=1785873125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8h2awYrl/UTrjaNT3VD/E+4YhtMvmOlxPVKjv3wgHvI=;
        b=HYqct8LvdLJlv0HhQzAQsokQmMoge13YB9kX51JsQhbqJo3yq8PqfDQT8JBmhTUQw2
         wQyhZP+76EMbISaerUu4iUeEvhN+VBCy90g6sH+fmztxuEtfzvE/xasWgp7ffHm7bbLn
         gdqteMBqilXc3H5E8hrEmeX7okFHzEcoaPZnxjuAoyKDqAIbz1Z/pkOK8ocG3bWzlo7Q
         JxMAN8IdHFF0Jj51p64i8XWpzBUHgbEDiZ+/MwZTiSBkH31rpyJfI8ih3PV9aDOXbmGY
         2AVKTFr1QoZFOvdRt2v1mstZWqctME41+rTeajxKnAh7uJ/lfGGRmdXpSqjZB953cRht
         S1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268325; x=1785873125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8h2awYrl/UTrjaNT3VD/E+4YhtMvmOlxPVKjv3wgHvI=;
        b=TNnEq1rRoyCjel/2GEBFVkddP6Q0oimD/ksdl0Y7xlTJtaFoUbzN3df2jHg94e8L3w
         468B19DJ8YKJkHCaF234KgBTmz1DSU7bc0wM+DG2+0XhRHW9s7lp5lgrLgs7KxVI5Pjw
         wuZxbuh/ksi/usdMHg0wXjozx3cn7tKHlEtr8pE5z6kDJ6VFG8tfLyg+99VlpIshvQha
         ObJKpN5x8mrODYIfFif8DBLxEACWBMR2C2Ab3zGdkVwJBrOJKFKTe2WL3UmF0p0LFxKY
         hTX2F/QWUXLHz4BqviAI/VYp1ijlyKF3BCKdvhugHeOb2KlJqOun5+HED88dhEK29qJ1
         vuFA==
X-Forwarded-Encrypted: i=1; AHgh+RoQJWEDOxRpQpMp6MnNW0yAg/IOKozyQVEpgRl3H0Oe95Mr7y1tEy7/m9McxKKU3kQMu6eYCl1c5NE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK7aD7R4FjVf+EF6/WNp9PKF1Y8xDf8YQ438IE7Ts0jNSHj14Q
	IRWXdSsg9jtct2Q5NDHuDqE5wM+faBU0LByCrN51ZA5QNki/LMdz2ef+
X-Gm-Gg: AR+sD102DLPwhrMWQ2nYvMMQ4Y1aSH9BDon/twKXfINiHpTiUc9mGCwdSGpY6wqu3rg
	i6IcpNDH+4L/CkgKVatJagCYTioiw1vuAlfYK2qf0fznQGwM9kn+HRY3BM4e3K/aTUXabHn+0Js
	CfJHoXXYtbTT9LYEEhGSdfRCGh0dchLfkuPJpQUiENFUm3KVYRBAN/vgI16G3uiqpIUf7jTQ3iv
	5c1faRR1/t4mgnEa6hw20uV2vAu2nIwE1YdHqDxNsaeIsRIyRneGC3kly3dYD+xg+yD9rFqiPh2
	m503fl2FEGTH5v8ab72LZFLuM2CDIZAqEadUm/QrIerlW7/9ChMFZJmewZESn/9jFNw74x8keVZ
	xE8Qtod1QqDLPppoa6m6WXQkpgcVrUZp0EnO8KusPMvCVpjJag3ZL2IsAHUMOl3YUk8FnbPqkAi
	wvQV9UxtCLiNe03BRxjQAmKSOYerjq/tspRbUFAlb6D5f7/4OHG8lhjxrVs0slBNYyjw==
X-Received: by 2002:a05:6a21:398d:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c8ba618024mr4552080637.55.1785268324823;
        Tue, 28 Jul 2026 12:52:04 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504bb29b2sm1613295eec.13.2026.07.28.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:52:04 -0700 (PDT)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-doc@vger.kernel.org,
	ishaan.dandekar@gmail.com,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v5 0/2] usb: core: Add quirk for 255-byte initial config read
Date: Wed, 29 Jul 2026 01:21:56 +0530
Message-ID: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a quirk for USB devices that fail enumeration when
the initial GET_DESCRIPTOR(CONFIGURATION) request uses wLength=9.

Patch 1 adds USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE which causes
usb_get_configuration() to use wLength=255 for the initial config
descriptor request, mirroring long-standing Windows behavior.

Patch 2 splits announce_device() to log device identity before
enumeration, improving failure diagnosis.

Nikhil Solanke (2):
  usb: core: Add quirk for 255-bytes initial config read
  usb: hub: Split announce_device() to log device identity before
    enumeration

Changes in v5:
- Updated Patch description

 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/usb/core/config.c                     | 32 ++++++++++++++-----
 drivers/usb/core/hub.c                        | 16 +++++++---
 drivers/usb/core/quirks.c                     |  4 +++
 include/linux/usb/quirks.h                    |  3 ++
 5 files changed, 48 insertions(+), 12 deletions(-)

-- 
2.54.0

