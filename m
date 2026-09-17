Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0ED22FE0E
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626355; cv=none; b=LI3KKP+n8ocWR1p3Gj1EaIQZH8Ca8GJjKqzzPvi+JtZIqp0BYdrSayUgBMiZsoB4vPUWpHk+9/sckgm8iyK8qVVg198WUjHLvyo127JK+3xh2pYXrvJC20QrMSttcTaANpI3N5wrnCLBDYAywNNaOYF4LhqKqu38TGEcBjJx8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626355; c=relaxed/simple;
	bh=nCqjXs0qiz0F6e0kKhfQjdMGLU2hzlzq71MRbkYP0c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h8aTSEUaR2+MRNt4dT0GfnRfeAR1wXphcrbPFzhvHxCE+WBULCQQ/tHUoyA+0S7dutsiI7B8Pwo8rvCSEiHSla9t8uWv59fTGJXniRPRzK3ohTA9mdO5JXtx/j0WUR83E/M5V3+ctc8WZoOKXKlghB4n15RACeNJeXzjiBGX6X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GKXWeyCy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GKXWeyCy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so5845055e9.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789626350; x=1790231150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTzr2PS56pB9oIMjh38Rw2y10FQepTrU7TuGcerh19M=;
        b=GKXWeyCyHujb1/69o9GGd+D2MYLBtdFSk4rLVsWHMqSg+DRw/PCSF/g1eMje/TqzYS
         2m8TsTPxVJ0lwklbLJIQ5atMWZJnqAcDctK+0gMsYLbeCg0fCWHdWd1nz9O//cg8LHMM
         eB4ZIuZTDcfujKpuE+SKi0xEQFIA06bQZLrjPqrjxDNpW/UFhKhZyQZXueI1b+zNlhHD
         JQmd1dbpBlWKukPE7EesTIGooCkiup8TzsW8xujn6jmuDM9JV5XWzr1o+DPz4RZ4LMGm
         bhjlrmNEvQ8mHUhHZjUP84wSIsG2M5e1QlYEWUAZKsakBbZX++Pq32Gfq8NpG80GU/3T
         teZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789626350; x=1790231150;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LTzr2PS56pB9oIMjh38Rw2y10FQepTrU7TuGcerh19M=;
        b=IBKPWSl13E9VxQv/NNUKkB3fDkhi+p4FkDJtSJyeyQ+MzrWu0qastyl5XAVP/aSV3w
         cSPj/KMFHTlf7oMKKDDfb4xZlAjPse4EtL+Gd7zLDokXVoXwg9dzrN1mKqNgoyl91cq/
         JAVid+AOoW/jLiqwgkVsjpCFvN5jhSeRpbJZ9cO8c1NvuTgDv/rGP7LXHjQ/YVkDkJcI
         +rRZCi4ceWMSSTsZ3lYa6a87Ox1f3J71+VphlKPn7Byf7MU/971zxgWgWLlo2nElFOYl
         AiT1DmREmPb40/i0JGMg1RAxUYjhEwQeALHGfMLLLeX/Pnw2GuVtJ1JooT9RPJvqIA5Z
         zRtQ==
X-Forwarded-Encrypted: i=1; AKwUvByb5jB3oMq39GEwET5XqSrwb02y9d71dKJQ8nRwzdUoi6ufy+da/+wYLMcb1UmTxzd2iqiqAQAKjCA=@vger.kernel.org
X-Gm-Message-State: AFuF++mKS/dGUotEaj40wnbwoQ7poGXln0invMU6LtdU5Me1ngbjLJRA
	AY+bYoiPalxxVrZXiRX8QG8XLGL71kFUrg9Jm9e1GCVDi1WKrZR/M4CZq6X4CQENsxk=
X-Gm-Gg: AYBFou0OhyF/1W+R4p6zTohB/KoPdW4RuMqTfhdnHTTgpYtrUcVmLKVnJJMAX34xxHc
	AvrKWFOaGn+P8H3C3lwnxqChR0i7FaWaJMOww1+WaP46c7h3btEBlgRkqaNd5mUcRn9A+xBgciF
	K9kmi9xZZs8J6YkRT9nyPl1vYUEQvc9tGb+BonJ5lT+mKToV/cONfyAJ6iosbjSOy4wpLWM8d8b
	ax6JoOYQ5jS56uoW9ua2YwuLrFQFaiTKUPVJh/HvUxkSGVTcfMp0Gp3Y5LBGwx16wRs0lx00F0p
	TaiBnkwOWNBt3NWT0Ze+WRFmRxr3FokS9Wxlmf9whOBC57b29fFS1R/xHEb63jSavNm1NzGG++n
	NpVdnzHaga4bXrbr8mf/3InZMlFF0qslVIHhbrUGiKpG5QDOYdkKdomSMAt7FwRjCTjAmDBm/4j
	HoteEFon4EuvRmMVpTCUUOsFrQ2RKhNKU65VwPJFXMeteEiWb/n8dJ4/2srROfFpVtUw8dvOkrQ
	q3rvGF8ht+ro44=
X-Received: by 2002:a05:600c:4e48:b0:49e:663c:c67e with SMTP id 5b1f17b1804b1-49ebe991792mr68477175e9.25.1789626350235;
        Wed, 16 Sep 2026 23:25:50 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e847eab65sm77377045e9.2.2026.09.16.23.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:25:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: pcmcia: Update location of PCMCIA_DEV_ID_MATCH_* constants
Date: Thu, 17 Sep 2026 08:25:36 +0200
Message-ID: <20260917062537.112663-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=nCqjXs0qiz0F6e0kKhfQjdMGLU2hzlzq71MRbkYP0c8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqq4fh2cLfpgpwwkKf4XZu9s6qS//Z74mDcLmfs lPxQlOE58yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaquH4QAKCRCPgPtYfRL+ TpjNB/9w2qCDlGYD6j5cMcOO6TOQGEPcSMXsSgvDpcc/LC6I8FzLRb2Jt6QwFvM2pO1WfhL9F+G ccftR9lpwyVf72/OQ7EOlkxC4+o421byU+7ubps5ooqgCyMZuQU1dox9TXVJGTUIL8rcfpkMNYc G2aPg3TiA7DXuNXNNy1tLGruMh8WxSbl2iKMOMULOnCNzZR+iFeZ0T7iwoIh2MzyV7ryA1WXyay NfAYg9aZNYl1MgTNA5HfnHgKwMcx4DwhCWB8GzpX/4hcdDo+X5QNWU5lFYViF5BKhqxtZhNJZLR fpiXVZP3feAkzo0THqapQSF3EaT+JbgP+fvO6ahh33DDNsh+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Recently <linux/mod_devicetable.h> was split into per-bus headers in
commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem
headers"). Update the pcmcia documentation to refer to the new location
of the mentioned #defines.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/pcmcia/driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/pcmcia/driver.rst b/Documentation/pcmcia/driver.rst
index 5c4fe84d51c1..b91e5c14cb87 100644
--- a/Documentation/pcmcia/driver.rst
+++ b/Documentation/pcmcia/driver.rst
@@ -15,7 +15,7 @@ runtime as shown below::
 All fields are passed in as hexadecimal values (no leading 0x).
 The meaning is described in the PCMCIA specification, the match_flags is
 a bitwise or-ed combination from PCMCIA_DEV_ID_MATCH_* constants
-defined in include/linux/mod_devicetable.h.
+defined in include/linux/device-id/pcmcia.h.
 
 Once added, the driver probe routine will be invoked for any unclaimed
 PCMCIA device listed in its (newly updated) pcmcia_device_id list.

base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
-- 
2.55.0.11.g153666a7d9bb

