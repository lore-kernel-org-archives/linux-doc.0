Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40235893
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785372534; cv=none; b=DgmbfPWSd01gRWszs75Rb56XBtWZVdZ+I0HFR9IybrZNikPepv2+DRqK2Sa8/sCEq5FO2hFLEJNqpkwo/Y83e5PIItOiGF6LOVp/bWyUlU1GDtYWiA17N68UmcDKfHAD8SG4VsLdKfZpzJWYjxje0ZQdjIF0ivESMmweuBq19y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785372534; c=relaxed/simple;
	bh=sfBkuWG7cp9oC7rWjia696a5/wki/gR86QMS5y8V1LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUgRtk+AK4kAu+J4FTQM5arKXhVsH1PAoPU8s+KCcBWPHckts0bAip1lR75oP+FwXLxloPTQKOeBdbkDMMyDaN7vDba+CT5eZnyjdrBs/dL23lj5KDMBkVBZ7lveQJ3YsqjUSIozjKCop2ksn7udq2caJv5gnCHzhHBC7idIKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92edb12cdf2so117016285a.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 17:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785372530; x=1785977330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amG5+bslRdnIMjojUGahI0L8Zbj6b4FQtBhaxO9WyM8=;
        b=QSXX3K0haIVE2s2bxLrcPHQUFNlFEIs3xDAbnVlR+kwHExNL/4YDgCb/gYIujSKNmy
         ApCmjXs/oQGaQ37YQ+oI3rW21Ab8TyXE0udLLz2dcV7+xBH9Z14KoF//jWhOJybQfWpq
         6xut60AezuEvWnYXN1elSJU+BhugKvXeFh5UCshsMK1OFrSB7I6vItKon3x3YGErm9CE
         ajXFqIRJQNdFASKFZfaoIJJSdtdVu9kfzt3VSJAS8UgQ4DkrNVSTun73upvTyGruKpbz
         /GCUxtMAO/maNnHxJZ4hQRUSKtIaw9Trppe1ZJP43kDGloI5JfFe2llNAxrrh+0NEQ6r
         Mbjg==
X-Forwarded-Encrypted: i=1; AHgh+RoQbUNyI21FcNTV3WhOnbOfZ+MAdKACZQ6z/gGTjsj6xih1Rm553w64gmDbhIHU+BXLfK4CMfQfRP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhzsefMcnCGtjQjmyy82JrNnTgY2F7YenswCk+77QlsWw35q1X
	/FTjtLlHlir++saLE+posHrAiUODIbCiI8TDL7n/bf1t6NfOE4VkyZKI
X-Gm-Gg: AR+sD12/bZsVpjhHdUvHlBb+q2cfhUZPAnyYi/WI9CBy5+csRAj/3bmHP0Wul9aN+SP
	UQ18XEvIfgOe4s0YyQiG64gpepMMw25PhlQ4HC5Ix06cqnhPZoITzEEljlXt6dO10mn89lrE6xV
	GoHsnrvoIz62Clw9b8Mpf8L6OmAoYFFUVLYEwU0YjrWMjqureQcQuEnn1H2k779Yj8iGDc/sNXL
	kaGSwBNp2WRv91AJKj53aAR0bnvaPDxbZdO0M8SkyEISKLqktsCRxI4rImgDhfbfFtZYMDYu4YT
	SNbIQFq5o8XtVxl8gVxl5Wjlow54/BpcwRG3G9zfWv4tWge/7/1n1SkB4Z9bGqzS7DnFjDI0PwO
	w7IeaV5ghRDtuFTEk+YugAp5AZuz4dQ/epJtn8N8ntrtKZmq15Iz7rCc9Qdkk7GwAzRFlzJ9uP1
	Ntqt4JxfwRS4iHxAsqGoz9rhuaF/aeS+sE4uq07ZGyGMIWk+WVdcrD4EEI+YXs57xY1rlxe4uu7
	kB/HWjytsJL9+NHhofNiY5fe3hIUCYCftf6hcjDd80ukXn4wuSstKb9L+xQRzyIjqMcTtx4OwRh
	LNBpyPoM1gy0bWgT8X0Zt5F6Bg==
X-Received: by 2002:a05:620a:a40b:10b0:928:f440:2dc7 with SMTP id af79cd13be357-93485fd24edmr41612585a.35.1785372530378;
        Wed, 29 Jul 2026 17:48:50 -0700 (PDT)
Received: from Skuld-Framework.tail03774.ts.net ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3225b17sm290329985a.8.2026.07.29.17.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:48:49 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: Danilo Krummrich <dakr@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>
Cc: asahi@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple ARM platforms
Date: Wed, 29 Jul 2026 20:42:58 -0400
Message-ID: <20260730004759.3089449-1-neal@gompa.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Apple ARM machines (branded Apple Silicon Macs), there is
non-redistributable firmware provided in macOS that is required
for Linux to leverage the hardware to run properly.

The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
touchscreen, and the trackpad.

In order to ensure this firmware can be installed without messing
with firmware provided by linux-firmware and other packages that
put things in the tree, the empty "vendor" subdirectory was created
to serve this purpose. This directory is used by the asahi dracut
module as part of the Asahi Linux installation process to transfer
firmware from macOS to the newly installed Linux system.

This is based on the patch originally written by Hector Martin
for Asahi Linux.

Link: https://asahilinux.org/docs/platform/introduction/
Signed-off-by: Neal Gompa <neal@gompa.dev>
---
 Documentation/driver-api/firmware/fw_search_path.rst | 2 ++
 drivers/base/firmware_loader/main.c                  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/driver-api/firmware/fw_search_path.rst b/Documentation/driver-api/firmware/fw_search_path.rst
index d7cb1e8f0076..ddd945a47fed 100644
--- a/Documentation/driver-api/firmware/fw_search_path.rst
+++ b/Documentation/driver-api/firmware/fw_search_path.rst
@@ -6,6 +6,8 @@ The following search paths are used to look for firmware on your
 root filesystem.
 
 * fw_path_para - module parameter - default is empty so this is ignored
+* /lib/firmware/vendor/UTS_RELEASE/
+* /lib/firmware/vendor/
 * /lib/firmware/updates/UTS_RELEASE/
 * /lib/firmware/updates/
 * /lib/firmware/UTS_RELEASE/
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea831..1acc5842fb24 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -471,6 +471,8 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
 static char fw_path_para[256];
 static const char * const fw_path[] = {
 	fw_path_para,
+	"/lib/firmware/vendor/" UTS_RELEASE,
+	"/lib/firmware/vendor",
 	"/lib/firmware/updates/" UTS_RELEASE,
 	"/lib/firmware/updates",
 	"/lib/firmware/" UTS_RELEASE,
-- 
2.55.0

