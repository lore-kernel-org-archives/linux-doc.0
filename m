Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83BBA3D
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 01:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056579; cv=none; b=fWTjATz2Xc3bsRwADRVLydmhPWLV1KLI8K8dOh2MpAQqLnZ6MtNyMefYpt2Oii/kDKs6Vg8LgniFhUjYP0Xc8ETStdSNPAVZwvVCVxf+ROFJP9vIRe59DUiSPx36JvRafvl2Spp52l5halxSsdp/92iE+uXdI+I4PRd/eQqqsQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056579; c=relaxed/simple;
	bh=dqH9cDlBuMXBoZ3HqMA68EZSucgLQFDS0EJW9TLzHpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGRZk3w+xLtknm9E6P+3dyfVVpTAf3kJs61fY1T9GraY7SO3rEzb81ooQePpwX3zqEsvxCQkfm0R1G5Ml/KPm55mbZkwLha8pue0QBgRum1qKR2NFqtOi1xsvDJHRioFtEUem5hjQjX5p6beFlSCZjtKz5wvDYU1hF3Z8H94J8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQYlERpf; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQYlERpf"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1370417c01cso8215173c88.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781056578; x=1781661378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7CKpOtIEJX6VF9+gm1XQKFtxQTKoIy2N2bjbhGxBG8=;
        b=RQYlERpf4qksD1ESWcxbYBF3aOEF75gcm9SXY/5DGakC/kPPEROLder8ZISKvDDczB
         fhO/dEQ4fz7P9lEjisn1wCqBUeiPS5mMjz6qInyyA1K3VH6onnxTPgnmSbbDVPW57ayk
         g/2R1oz/DVrjRpX+shWB7cW1PtMJV+7cbu11fUu7XBReVaS8924wm8avu0lf6MNI5hBY
         Dv/L3ACTY/Bg/c4VmMzWH73PXb+WC+oGDQrs3X9yE8JCQhfFa/J50oEPHg6IYW/Gqi7A
         HrfOnoMwSIDDQcf38fqneUpgsCKPpPdFaHmWcCZojI2HbF2HvDoI8vlETMb6jG49N1zn
         qpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781056578; x=1781661378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7CKpOtIEJX6VF9+gm1XQKFtxQTKoIy2N2bjbhGxBG8=;
        b=WaRojRKNSvgrUw05rRxB+Lf1Ujxwa2X5F+k9s3Gg2g/aK/TtWadDDgncUNdYDJfrXB
         y6oz32rIqt81pGNBhIefmvykf6cKVnp3HmLprL0XFvAB+oEfbAl/S7HDrQKIraauX4jV
         ynmORkTCkRY5qVgl1Z8K31ZbKKTjgJejOaT5om3PWWEjukchSB/wY+8AdkQmOcTaJ+C4
         aSDkZQ+vf+tHHFxMX28TIBdA3D5GzspYelzYdaMRH//BmgCyvcMo9cGZe4Vnz2rkGt8y
         FZhcY4IoG3XR0NCniZQjXqmNpJS/M1pX34LWOBfk0InFRRDBNqLqxCEEwV4AYwf0BoUN
         3jbA==
X-Forwarded-Encrypted: i=1; AFNElJ81Vo5ZGnhjyqX1FTRQiLXoV3F0wT8ksX6spLicR1THbLuKaUxcEkH3J89HYg+eEWXrEnD1hsqQ9po=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyeXoEEqznUj/j6rPq34JyufqIrQ4kDMUqZDXgeMCIQ0s/vF6
	7yx2hqk/ZhbB893DDm/CSBYTB4HYjeDhqMpjltcMADZW9kTVHaVXTjCZ
X-Gm-Gg: Acq92OHPjaU8di7OiFO8WV4ohcq60vmcOwaTG67R7g0c2rT9FQzJJn38pv86FkFhM55
	Ottzp8afevkNDMJsgDKiO5ahmmaybldkIS0el1M8lD5ZGfmb0wq9SFOYSQIr8Zg7HhvUSIhcAMB
	Nq3uS8iKjcw4IVn9O7+i3BLKZxXZnXNf8ZohSiTp7f2DxHU2RGMxo8UKvollmiIeDmrjsaZMpPI
	IaVLi4FiNsTYTaEeHJLiELUwMtPBCERvtnjvE2+mmIHL2JcsungIoWlLvjX8/avyM2u34z6QIip
	OLMV0SsVfdke4UBWT4k82HIlljEuJPXXbAy0eX1KRA55JpjE0rm3jcnP5Pi1hVyFmwWPdICmfu0
	9ZpUygXekeGSzy73OR/JYcry9w6VO8rskKsQUm3ZUJKFdUz29JNTaK1nBh65XgoOs3KTALh/mft
	9AkPqJJGImtLu6ag5v8DRA6M6gRMHPTgHk8Z1WLWFoQKjXkByO3x/cRRMMCcDYZrSDWV63wPdhR
	lVQ10mb4bnT5fl6IUUcQ5UpNDkiLljSd/HJvmUpmk8vyCdmk2NbNMMR0R7yPbueYkrfMjNZkcaF
	aWqGs031yW+0yzGHHnn/0xR6VuA6
X-Received: by 2002:a05:7022:e997:b0:138:3742:fe5d with SMTP id a92af1059eb24-1383742ff6fmr1158962c88.18.1781056577445;
        Tue, 09 Jun 2026 18:56:17 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f53f06c4sm16508829c88.0.2026.06.09.18.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:56:16 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] ALSA: docs: remove references to removed CONFIG_SND_HDA_POWER_SAVE
Date: Tue,  9 Jun 2026 18:56:09 -0700
Message-ID: <20260610015614.41530-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CONFIG_SND_HDA_POWER_SAVE option was removed in commit 83012a7ccbb9
("ALSA: hda - Clean up CONFIG_SND_HDA_POWER_SAVE"), but references to
it remained in documentation. Remove them.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/sound/designs/powersave.rst | 5 +++--
 Documentation/sound/hd-audio/notes.rst    | 3 ---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/designs/powersave.rst b/Documentation/sound/designs/powersave.rst
index ca7d1e838b4d..4b9d6d0b0d98 100644
--- a/Documentation/sound/designs/powersave.rst
+++ b/Documentation/sound/designs/powersave.rst
@@ -3,8 +3,9 @@ Notes on Power-Saving Mode
 ==========================
 
 AC97 and HD-audio drivers have the automatic power-saving mode.
-This feature is enabled via Kconfig ``CONFIG_SND_AC97_POWER_SAVE``
-and ``CONFIG_SND_HDA_POWER_SAVE`` options, respectively.
+For HD-audio devices, this feature is enabled if ``CONFIG_PM`` is
+enabled. For AC97 devices, it is enabled via the Kconfig
+``CONFIG_SND_AC97_POWER_SAVE`` option.
 
 With the automatic power-saving, the driver turns off the codec power
 appropriately when no operation is required.  When no applications use
diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index 6993bfa159b4..1412a8eabfa8 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -341,9 +341,6 @@ hwdep option above.  When enabled, you'll have some sysfs files under
 the corresponding hwdep directory.  See "HD-audio reconfiguration"
 section below.
 
-``CONFIG_SND_HDA_POWER_SAVE`` option enables the power-saving feature.
-See "Power-saving" section below.
-
 
 Codec Proc-File
 ---------------
-- 
2.43.0

