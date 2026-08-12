Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D7434E28
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534680; cv=none; b=UGLrDq+z+hEhRIRWSlNNe7UbtzhaRN8CZqB5Paa+hH993w9FfO6C5NUdMdo7him+HaHbn9PltdfGi2PCXduVYTRYRbP3vysWlNRePO8N67ZEdxqqsmSyJ7O92QWLnT2RXgQUXVIzOnLm7fphS3XJtR592YuXlMivIMAUrOXWFQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534680; c=relaxed/simple;
	bh=ZACaCqxrHuvlYmnW+yEEfmS9VfnqhzGc5sDwLqfSt5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n85Swa2BdQWxzZEXIkzSL+BADsFqAyzAMzn1s09y+qqmbbd5qMj7656uL21ne5ButwMY3mqfjPrSw4+8zviZRatknfiS9pSKgx6wmf+wCGt/e9T/uUWdgpeviyG944VACSR+acP3oXBJU1iReDyBae8AKgIPJUE0SE6d+H+ZrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYcROWoJ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYcROWoJ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso8190651fa.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534675; x=1787139475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcy0V4sanVWnhAv8P2awTDxn202Hp42bIgbbeqoNGH0=;
        b=QYcROWoJ/YXxEwZiY6knZ5NUfv9BYwGVLkfTVHF69y/oBx+A/lJpdsZOR7+Lvxsv47
         JxuGybxSaCim9bGTXv6oercWAzIaVqHRqxL+Q+VnUI+dCequ53H0JfDrUalTyz96u9zW
         a0plAiU6YuCzwZE2Xln1vxiTu/Eq49Kp4ISAMi/tHg6R0aiTKbziA32GuSh0+UEuGYS5
         0vNtlqMfqT8+yZ9hQLDgmyI7X8dGrtCWPN3FDUgRu788BDS9nYdn4yZMFnQQydZTardQ
         pfEsAccCzi72uRTij/NrJwd+0skcUb1jIL1pUo1vZm635hMk7mAFWsB5+9DdmGcJEHLb
         pL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534675; x=1787139475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcy0V4sanVWnhAv8P2awTDxn202Hp42bIgbbeqoNGH0=;
        b=GM8lEyTZkgyqetsdfPAo8oUTrwkiJgSrECuLdCefAiT378OBJ8BMOloEAxGY7ILyx2
         gzF+1T3vLE9kwTJO+3hKstJq/Mmy3GEW5j8zXS2IU2+Gi+H2vX5QVLgRwRSayaeF0n1a
         SvBUOuyPBz79Y88VFfgDdZF3xuNzRad0zySU22IQyebVsK/1Ea49l3XWZaDhY7uVeIX0
         atlhLwmlH9t/r1Vgz5VDntstqVtvEyiyRNYLuJHzzLHdBgkft0hjt1DFQvpcCp2xHrwj
         xzmVxx43jZC7+5Z199OQRX4ZcFjP0R0bqB0vOOcgxj0OAeOoApjcNgLV5UuPVDO+vvBd
         Hw9A==
X-Forwarded-Encrypted: i=1; AHgh+RqObeoqceYFIUpxFyJuvMLVk59UafL/3Os9ftWn6BkKFYF1mmuCtXfizgD0Sa4B75/huQo+WaFcCsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YypODOqDZqZbOEJgp8XxWxPAus3q89ToqnO+B70nKAzB/ev4an+
	7Lfr48kPJ5UruomlYTTjOQDkG1D1ZW7u8z0GMamTuGnK/qu66wsB5Nj8
X-Gm-Gg: AR+sD110F1W5fBsITdNtrGXo+rcCAqpEvHduQxPCIereeD/N6YXB/w5TIHLI4EeA6Ty
	UOCE9YpLrxQnzdYDlIc1E3kDHLWaIAR9DsVF8ZzGzEXHXu5kAaBlLRDWyb/Uj9TH1G0w6Aa/yyd
	oYAIFHHrF+0tANZU//DDWp9dAVwB6WTiZ0p9uYFyIWEo+5BJiMu3Zj0/VDoSgav71gs6xpXZGee
	NBTnPc5jUzA3v8Vu6SN5rN7et1U2MGod2ivm60T9BxoidZi3fem3OGOxNYVnovQGhSV44oOgTR3
	vaQtGbc098ByCPHyGRAa3lMfVQSZ0E3I3FnrQ5SnxArYsJu7g0mM3C1stDBt5Tn1qHpykQOPOPn
	xejaEGuaF+MGgWdy8yyGpOgjvDtAmE0KUI1C/LjZh2S8WoKqJ7Rp4d/UThEbC87MQ8+IJ9rtdeb
	67an5IqVqIfGWM5jmNDZOG1xzZvsB5HaHqaZ/lfK1QR6ItyfQseaEOvQ4ZR+R/Z3Pz0ZfCtlG6a
	eSDRcQ=
X-Received: by 2002:a05:651c:2121:b0:3a1:476:74b3 with SMTP id 38308e7fff4ca-3a10d4aa3e3mr4393061fa.9.1786534674956;
        Wed, 12 Aug 2026 04:37:54 -0700 (PDT)
Received: from localhost ([176.210.177.198])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1082d11b9sm3881101fa.33.2026.08.12.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:37:54 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com,
	ttabi@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH 0/2] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 12 Aug 2026 18:37:50 +0700
Message-ID: <20260812113752.532537-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but the entries are
owned by the Gpu that probe() builds, and the buffers themselves are DMA
allocations that cannot outlive the device. They are therefore gone as
soon as the GPU is unbound, and in particular as soon as probe() fails -
which is the case todo.rst singled out ("even after failure to probe the
driver"), and the one where a GSP log is worth having.

Patch 1 adds CONFIG_NOVA_CORE_KEEP_GSP_LOGS: when the log buffers are
dropped, whatever the GSP wrote is copied into memory owned by the
module and exposed under a "retained" directory until the module is
unloaded. Patch 2 drops the now completed task from todo.rst.

nouveau has the same feature behind its keep_gsp_logging module
parameter. It recreates the entries under the name of the GPU that just
went away, which collides with that GPU coming back; the "retained"
directory here avoids that.

Tested on a GB203 (RTX 5080), which the driver probes successfully:

  - after an unbind, retained/<BDF>/{loginit,logintr,logrm} hold the
    contents the live entries had;
  - with a failure injected after the GSP has booted, probe() fails and
    the logs of that attempt are still readable;
  - binding the GPU again does not disturb the copies, and unbinding it
    a second time replaces them;
  - the copies are released on module unload, with nothing left behind;
  - with the option off, the entries disappear on unbind as before.

Built and checked with CLIPPY=1 and rustfmtcheck for both settings of
the new option.

The testing was done on top of e6c2c6265521 ("rust: firmware: add
request_into_buf()"), that is, before the TLV firmware series, because
the nvidia/*/gsp/*.tlv images are not in linux-firmware yet and the
driver therefore cannot load firmware at the current tip. The series
applies and builds unchanged on top of drm-rust-next.

Vladislav Zaharov (2):
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst |  12 ---
 drivers/gpu/nova-core/Kconfig        |  18 ++++
 drivers/gpu/nova-core/gsp.rs         | 146 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |  19 ++++
 4 files changed, 183 insertions(+), 12 deletions(-)

-- 
2.55.0

