Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527622FFDD6
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 04:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778214062; cv=none; b=P/Bhg6hk1g1Ys4T6aJqRR3q69xGEoAmoXE/NSGiA0nnvhsqXqAud9ybH1TmhzaruXi+q7NNhjzethgtDU1IuZWoe/erz4291xr35zQgpOltlXTdqzZk5YP71P4XlZyOOfWYZ4mNavs/+ek/rTW7fCOEQgAc51XqcilVcWfo0r/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778214062; c=relaxed/simple;
	bh=dqJkYv/yCgsVfNT+/DbfGwhL+eLTj0E+2M/petsk2JQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SaVkX0OosX+MtPP0BvAGB9I0FdZ4w7ZJxdnUc+IL7U7zaRat08We7e7s8f3GfHwN58RW3rtuPnEO6/opEKccLNonjRuNU21oVZBPMiQTTmKUtIvLbeZEJ+NFEZXXrGg+9YBeIgdqrFMa1vwdPJsZxMfq9HSFbxwTrDP9T/Aeae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i605/4qi; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i605/4qi"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0ad52830cso2400784eec.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 21:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778214058; x=1778818858; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FyTs3raz5d5xhnuAreVROw1KNyyIcIXqGuqG5VovwW4=;
        b=i605/4qisVeeijqvzEUJ72e0rZQgiu4tIoFS072/IS4F4O8lHVN5AOb6/1lUedQWb6
         QsPs4QyFrXbfeMzM2sVlu9sI+Hvk8YQZNyGIqbUpLAGHQBNdFhZUokDrasbTbsdR2RWP
         eB0vz+SVYpFbANeD+oztOp6Dmc1PhT/2zl56SwLGXOduyia5gpn9ovsO7sTPFA4rW+xB
         25iNagTPe3b0wTotLSQRooxKbjYe9hu87nvy1eWa11D3h/3b4+oneKg0ZR6VM5eUSR6o
         TdgEEaUS51/QnMcClv96voHeVPmL16SraS+XrHzykwwl8kGPVatcGmKyXmQBVUYl4etD
         bHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778214058; x=1778818858;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyTs3raz5d5xhnuAreVROw1KNyyIcIXqGuqG5VovwW4=;
        b=noDOk73z1VvOuXPgV3xb5mShhYqEJVRnd3cdDsqTxJXvE4t04x9cTCh5JfwU4s9LxZ
         6i+mPXq/Kyp6aCygdfspHMdKF4WMbkuSgFJ+pjyYf+SqC0USFFZPL9Op9t8ndtAy9kEk
         h2Wq0AcvGxU5XXZ6JGFDWh5eEf7pTjFDzBqKsZ41nqK3EqNL5XWMtdxiuUkZKmaleYw/
         xJFQWg07DkdCEJlh7VlRfOTP92e+TGPI0E36b3YBHz3jqZkVEftU8LBx7mJDZNiQjA35
         QTNs6uQYkd37zOg+76JZmh4wtwB6VT+HHuVF5kid+40nBDm9QS0CaY+PL06X6XGHp4WS
         CV/g==
X-Forwarded-Encrypted: i=1; AFNElJ+VCUemMgLV0npNza6sjYjMQT51PfjEyeCkfDgGGpwWrsHURzRkGwwdWiKddL6L/S+9k2jQYlRfhoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YySwbNDdQLpBBoS9vnqBko6xRgu9++/dyPKI2SmAhz+os+F5xcj
	5CJQVCw73zjwYUlGnqOOhCy4RcUUbzi5ia+2lPRmw/8QdWYaujiQ+sG+
X-Gm-Gg: Acq92OFmVLQuU9RIl/ddcrnUxpOnGhWBuslC2zJrxMN5xbCzXGMh8z99DuQjvg6RQCt
	+Fp0Oh1dIOrJNPJVPZJpc1itpD8lzIGPGmgdqA2TIfdOa84/9Wlg6jDtOHtyDtvWhsElrmy/nbO
	7SnW+1lhINSEqsqOnL2vo5aQcpaoU32c56dUbMPUVX8pmVSyzxMb0xBHRkC1jL8XPCqqYJxQVe+
	JBH2dhx6H8TZt8u8aZsOIp+kPCOt9+ZxmaHMdSbg7P+gkVXWaKz5udT76E8GZfWpxMJxEayGdp/
	JnM5wz2qP819bbTzyXxx0LgoQhajoA4wXXMTwv0Oc83t80iNZaM1wsK1izfMAgB+k/2TelqLC1w
	gYTQv9OEugFj/q6xafW8tva1dyYAdojV3rjPBj/zCZ+kjLk/N0g6r5S7nmT8yl5fLWWr2tG/mG9
	IE/0bEcVtW27fwhosa4CwckHV86FhlePJ3UiAjh03WWGKsMvVU9X6dG/PcrV2X76d1mM/6NVBFp
	Q==
X-Received: by 2002:a05:7300:a199:b0:2ed:a64:a457 with SMTP id 5a478bee46e88-2f54a77f54fmr5269441eec.20.1778214058042;
        Thu, 07 May 2026 21:20:58 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847504dsm676455eec.15.2026.05.07.21.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:20:57 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 08 May 2026 01:20:50 -0300
Subject: [PATCH] ASoC: docs: Fix stale and misspelled references
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260508-asoc-doc-fixes-v1-1-b53eec42e340@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ5AQAxFryJdm2QQgquIRWcUtUCmiETcXbH4i
 5ef9y4QCkwCdXRBoIOFl1khiSPwI84DGe6UIbVpYXNbGpTFm07X80liKupdhmWOmDlQaQ30Heo
 07c+yu4n89lbgvh8tFD4BcgAAAA==
X-Change-ID: 20260508-asoc-doc-fixes-9efb3a85aa3b
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=dqJkYv/yCgsVfNT+/DbfGwhL+eLTj0E+2M/petsk2JQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl/U5a5nuEIELruuftI1qey1jcSzNwN0fxMWkwBx64sL
 UtUrNnfUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABPRqWL4H5c/2/LC30iN07NW
 R2lXbM5Yfu7t4X1i1tHMX4OMvI+XiDL8U5rq+0t7rQmjU1iw5sOkvqUPljgv1RFkymP2iDH5u12
 dCwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

While reading some docs, I have found some minor
misspelled words and some parts that could be improved.

The ASoC USB documentation refers to the USB DPCM backend link as DCPM
in two places. The ASoC platform documentation still points readers to
the old DPCM.txt name. The ALSA configuration guide also has two
references that omit their current subdirectory.

Fix a few stale and misspelled references in the ALSA and ASoC
documentation and update the references and fix a typo in the ASoC index.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 Documentation/sound/alsa-configuration.rst | 4 ++--
 Documentation/sound/soc/index.rst          | 2 +-
 Documentation/sound/soc/platform.rst       | 2 +-
 Documentation/sound/soc/usb.rst            | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index f75f08763941..394cf87f340b 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -1097,7 +1097,7 @@ output (with ``--no-upload`` option) to kernel bugzilla or alsa-devel
 ML (see the section `Links and Addresses`_).
 
 ``power_save`` and ``power_save_controller`` options are for power-saving
-mode.  See powersave.rst for details.
+mode.  See Documentation/sound/designs/powersave.rst for details.
 
 Note 2: If you get click noises on output, try the module option
 ``position_fix=1`` or ``2``.  ``position_fix=1`` will use the SD_LPIB
@@ -1168,7 +1168,7 @@ line_outs_monitor
 enable_monitor
     Enable Analog Out on Channel 63/64 by default.
 
-See hdspm.rst for details.
+See Documentation/sound/cards/hdspm.rst for details.
 
 Module snd-ice1712
 ------------------
diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
index 8bed8f8f48da..22878d73f7a5 100644
--- a/Documentation/sound/soc/index.rst
+++ b/Documentation/sound/soc/index.rst
@@ -2,7 +2,7 @@
 ALSA SoC Layer
 ==============
 
-The documentation is spilt into the following sections:-
+The documentation is split into the following sections:-
 
 .. toctree::
    :maxdepth: 2
diff --git a/Documentation/sound/soc/platform.rst b/Documentation/sound/soc/platform.rst
index bd21d0a4dd9b..53caba6ce4ce 100644
--- a/Documentation/sound/soc/platform.rst
+++ b/Documentation/sound/soc/platform.rst
@@ -75,4 +75,4 @@ Each SoC DSP driver usually supplies the following features :-
 3. DMA IO to/from DSP buffers (if applicable)
 4. Definition of DSP front end (FE) PCM devices.
 
-Please see DPCM.txt for a description of item 4.
+Please see dpcm.rst for a description of item 4.
diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
index 94c12f9d9dd1..9cb860547f22 100644
--- a/Documentation/sound/soc/usb.rst
+++ b/Documentation/sound/soc/usb.rst
@@ -103,7 +103,7 @@ Returns 0 on success, and -EOPNOTSUPP on failure.
   - ``usbdev``: the usb device that was discovered
   - ``sdev``: capabilities of the device
 
-**snd_soc_usb_connect()** notifies the ASoC USB DCPM BE DAI link of a USB
+**snd_soc_usb_connect()** notifies the ASoC USB DPCM BE DAI link of a USB
 audio device detection.  This can be utilized in the BE DAI
 driver to keep track of available USB audio devices.  This is intended
 to be called by the USB offload driver residing in USB SND.
@@ -118,7 +118,7 @@ Returns 0 on success, negative error code on failure.
   - ``usbdev``: the usb device that was removed
   - ``sdev``: capabilities to free
 
-**snd_soc_usb_disconnect()** notifies the ASoC USB DCPM BE DAI link of a USB
+**snd_soc_usb_disconnect()** notifies the ASoC USB DPCM BE DAI link of a USB
 audio device removal.  This is intended to be called by the USB offload
 driver that resides in USB SND.
 

---
base-commit: b8dc547edf9e41474d8ce2dcf344e8e75b17781a
change-id: 20260508-asoc-doc-fixes-9efb3a85aa3b

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

