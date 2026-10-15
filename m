Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC9560AAA
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084712; cv=none; b=VYHE5t/kVbNdbttUFx1Ux48U7841/3pwMjDFer+ab3XOflvUNF86Rfd7g2Y3d/JQ0DOwDJXJWsKfeCd9CH+ourwOE9Ybpycl5N1C3hRGwhZqiE8Lop5ruT09VQGMcbpxwvCKsYklC0kZOqoWpBpbRurgYwgSV1Il6fxk/CwofvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084712; c=relaxed/simple;
	bh=I5Ur39HsqT6WeE3BnrxrMW7SOD/vom+1FTMZtowBYM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PWAA+7TRmY+kR2k6VVxKtHh7f8hLEuuQpt+uW2bBzrTtVoNgZzMAUpI4WUrkIib9a+licp0tRvuTpw/THWAqlnvHY6HxQWzfHoVdNwbS1p3NHipXx1bxOdO7aT7uDEZdueJTlTj6ydB0IiDEJ9Rj623F4z2HPuBJXGY3KoX2X2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS05rIck; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS05rIck"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6eb11e9cso9148025e9.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084700; x=1792689500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpuLMD6iQzc1bzNNihjv73gE3OjQ/PX0ITyufY5za8=;
        b=XS05rIckQK5HnuIE2EK4slHSDEgo/FSPmnqCMi6M9Rtys7FIEuoy88Dp6VHULu2pWt
         1yw4F5X/VwlJL4vuMATyiLlL92mB6lnrBNMvF3RZRMOTQYxpp4W1JsGx6/zmox6oD2dK
         9eSRGTjasU+VN+e4+rGSCMLC0qQmGU6KAk+Cg8VMOh6EBI5tSfYzl0H/m66HsEGHW0/Q
         NDixzerrQ68hlCkVmXZzq2vYDoO2lKkYQ47TrqJMRAM4sGvuQ0nFG5YHyygAhwYH/ex3
         Dv7EMgHcJ0D5jsL7JJ///Hd3z4VgCdMuLD7FkM0/gbpm1rlw1u8j4X+D883DmrxO2Yyv
         3b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084700; x=1792689500;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUpuLMD6iQzc1bzNNihjv73gE3OjQ/PX0ITyufY5za8=;
        b=lsMdC3+vKbLspndm6CLsTIgsdu+xAUF1r1agrf49bSPiKBs5PpC489PVIFRoiMGNju
         L5HomrhQZRUz1l79GH9xLWY/J1+UfMvznPqK+N/AiwL3qKIFDsM9TVmxlV2K2L/qxWXU
         HxaPUcTDvV9Bwoqbi2yb7EhWHGT/RQWDGqvnmhxOc3dxzwo/TMXeKLppnZas1HwXbjJ+
         1t/drt15IQlIXaEutnWrYyOqMi8I8b1kl0P41B/4JpKojda/qWlxob/4NNRm8air2reH
         HN07n10bndDnH3kFgB4vfRCRogkUieMrQ/3xRD6zCbbcHtgcrdrUXK6xO+fRpBSWv8lW
         FB6Q==
X-Forwarded-Encrypted: i=1; AKwUvBySFGb2O89f2ltS0wrDEY/dE9IO3aP+HE7onpNz1YuZSZh8KVY0j5x5E99JQubgD+/absm5z2L6VCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYILDc0aQEcvkqy1wKQOJ7TiLDBWTRMHfC+jBp4cS1s6pMqZpOje
	MkbisNDQ87ivgRoLpYuVZYWFGNUCMoSlY5AWwV+OJLQ+ogiUXJR9bHFR
X-Gm-Gg: AYBFou3xb97GXnM+EbTSx3+IWg863o2ngPcQMUFILigKw0wP6nV7j2arWfLbp4Iyw/w
	1f6kE6+OzZL2NPrqbr7PITdE4K4zr43YxJHbwjelzhys06c2jW03ELcGE0Iciw+PyGkmKMjXZbb
	RcSTjYSoezrqBf/48xnC/VHhIF50enubXUj6FRbSUsfo5HJ1/6BakYpDwIxC7IIBnedODTJIn/d
	bfGG5VR13hyiQcGs7qmBPQ8XfG2RV4jHa9x2fBjTO5aPIKFPETHAryBzzdEhDmQE4CjgYzBM6S/
	DIExA1FelToVbOASI3Ku9az8iDgT3DJZ4YX7WzDsBgV8QSNk6lNJXnYULAYqot51ecxOpjcpbXj
	dkYXIarHjknsXZbJVBWDJpz9qX6kfHLs1cfLXixkqnjBLFRkyAbH1WwqF48A2re9RWaigsTVwAn
	eBmopg/gTKs1afn/BbPOrbkt6gMZJdm3p5TZzGF+oJrWZqygTd8tOzNqsC3UPvrZs=
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr387691725e9.8.1792084700107;
        Thu, 15 Oct 2026 10:18:20 -0700 (PDT)
Received: from CachyOS ([176.88.124.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm123820185e9.10.2026.10.15.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:18:19 -0700 (PDT)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Subject: [PATCH] hwmon: (coretemp) Document sysfs numbering and label meaning
Date: Thu, 15 Oct 2026 20:17:59 +0300
Message-ID: <20261015171759.704526-1-ycistak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The documentation says that all sysfs entries are named with their
core_id, and that the "Core X" label contains the processor number.
Neither is accurate. create_core_attrs() numbers the per-core
attributes core_id + 2 and always uses temp1 for the package sensor,
and show_label() prints topology_core_id(), not the logical CPU
number.

The difference is easy to see on hybrid CPUs. On an i7-14700F, the
"Core 4" label is on temp6 and belongs to CPUs 2 and 3, and the
E-cores report core IDs 32 to 43.

Describe the actual numbering.

The mismatch was found by an LLM comparing the documentation with the
code, and verified on the i7-14700F above.

Assisted-by: LLM
Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
---

Notes:
    The LLM (Claude) also drafted the documentation change and this
    changelog. Values checked on my machine: temp6_label is "Core 4",
    cpu2 and cpu3 have core_id 4, temp1_label is "Package id 0".

 Documentation/hwmon/coretemp.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 34930168338..95b0a578c4d 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -46,7 +46,8 @@ mechanism will perform actions to forcibly cool down the processor. Alarm
 may be raised, if the temperature grows enough (more than TjMax) to trigger
 the Out-Of-Spec bit. The following table summarizes the exported sysfs files:
 
-All sysfs entries are named with their core_id (represented here by 'X').
+Per-core sysfs entries are numbered core_id + 2 (represented here by 'X').
+The package entries, if available, are always temp1_*.
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
@@ -55,9 +56,12 @@ tempX_max	  Maximum recommended operating temperature (Tcontrol).
 tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
 tempX_crit_alarm  Set when Out-of-spec bit is set, never clears.
 		  Correct CPU operation is no longer guaranteed.
-tempX_label	  Contains string "Core X", where X is processor
-		  number. For Package temp, this will be "Package id Y",
-		  where Y is the package number.
+tempX_label	  Contains string "Core N", where N is the core_id
+		  (X - 2), as shown in
+		  /sys/devices/system/cpu/cpu*/topology/core_id. This
+		  is not the logical CPU number, and core_id values
+		  may be sparse. For Package temp, this will be
+		  "Package id Y", where Y is the package number.
 ================= ========================================================
 
 On modern CPUs (Nehalem and newer), TjMax is read from the
-- 
2.56.0

