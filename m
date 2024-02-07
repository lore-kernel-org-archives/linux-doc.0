Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146A1864D
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707304516; cv=none; b=Drp99xHeARHD5y5mJvnaE9ehqd53UhCXPAes7VYgyebV7Q13xyhXrJpM6yABVbs912TgFLCg2vqshHe1FIxyY6zVRoV7XQtoNzLM1XwfI/4I0vwr47lLCEod8YBh67AmCHfEjW/8fsUSwFIUKc/x2OrhKzlkcadP0zieMBIrag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707304516; c=relaxed/simple;
	bh=L4fKG0W9QCT0X2dT1SwcGIU6xeGtXimyzjeiuRERXP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cBQMuDb+lPyRXbLsVpy2DrzHX9YPVXhdcjhft3pOr7vMhJkUk5ey+BVNNSenk0QPW4S/DWfXOcy1aQrIUj3J3J3wRJW3SxtCvKzU6uVFEC2q8FIQh7CjsFci1bWonBKpTLFNVvYGrNbb67NVCvuR25ytRLYT6H2/3Mf+0Z5JDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=FGUIhpNz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="FGUIhpNz"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a30e445602cso332446866b.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Feb 2024 03:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707304512; x=1707909312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kKATkoha7MJRDxzx6S7MfwCz1BHDb7Q1gZGPDiWFQI=;
        b=FGUIhpNzNVu/nIwNrzfb4lP0WrLr7jKVajDTO4IVsrxKxdsco4lR1PyvsMXFwBCCuQ
         fOj++F5m6qIcOVbJFE0rY1PZwSIlf1d7bUQtXYuQ78uyBQFu4SrMj1ofTsUcJmlY6Tzs
         uA8Ohm/1XOkFxLKdA/+TrDs0iqfbummucUlQKv6A34nV7yLZCAeOk72ihO7w8P2sIGDv
         Rj5Kay84gjWmpX6EEO91nefdKhHWwLENRpyUS1dybZUNhBNJTqzzOORBrZHeZ54mpAL3
         GBE0IH2ueNBHiRve7lvC7ZYtkJXiGkkXrJG3cTANZ0ZpLWWqqReFXvf64eFXxxwZgi9J
         0Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707304512; x=1707909312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kKATkoha7MJRDxzx6S7MfwCz1BHDb7Q1gZGPDiWFQI=;
        b=PbojBk4WyFw7kN8pMg0qh3i35vPYWjVZeE/jvv4eDis3aLlIlXOCjQk51NPLevWQ3+
         6P8k9w7LSLnp1pcLQQGBR3nGua2vO+NT9zOZSzCpYfCws6D8XqkAT9PaKSrXOsc8zlQJ
         wJsrGJDbDmCTFCQ7MQUt7rjWy+IlpJA0zUJM2/YWYrnE9jUZK5sTDdd4mBu7Iz4usUZK
         enVlOsL53RfhAmFul1LuKBmRKUYFnyGWHwbSksJVHpU/x1sv7ZWzDjYtAKdeCVPtY9RY
         URZgG+2PBg5LOYqaWN7oM1u10SGMTu87wpYNnCagDF/WYguVmE3kH4HkelKP10lJR5/S
         CtiA==
X-Gm-Message-State: AOJu0Yw70WMs/eiChFR9U+dV+NZj/IYsPaNlzKqJbkndJbwdjEqH23Je
	duQA4bU7E7DXXOkT4+2XO2BqS3UI/wz8PZeMtsopNZXwcqZAdFUiPQbWi98z67U=
X-Google-Smtp-Source: AGHT+IELucIYpvpq6yvldLKzzMl7hr7qQWu1CVhHomilrr8FmzMLpe3QGhBXG96a/dz5LtvRPv5QDQ==
X-Received: by 2002:a17:906:168e:b0:a38:1a75:787d with SMTP id s14-20020a170906168e00b00a381a75787dmr5440517ejd.24.1707304512048;
        Wed, 07 Feb 2024 03:15:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfcOTVEdJD27+JGCOb6HJiNpAh4UIv/nTV2Whv2SEOhsaFVOroeAlbiT9JJWY5qvRb95M97X/OENJI+G2eAIN2E4eX4SHZUgotJpzkIpgRFW1y6Jwh9Are7yqozY+7dWUvVAqvANkHOOM13q6SFqrbgtyZWv50uGzpNw==
Received: from debian.fritz.box (aftr-82-135-80-180.dynamic.mnet-online.de. [82.135.80.180])
        by smtp.gmail.com with ESMTPSA id ty13-20020a170907c70d00b00a338fedb9ebsm650975ejc.54.2024.02.07.03.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 03:15:11 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] docs: scripts: sphinx-pre-install: Fix building docs with pyyaml package
Date: Wed,  7 Feb 2024 12:12:37 +0100
Message-Id: <20240207111236.7242-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Python module pyyaml is required to build the docs, but it is only
listed in Documentation/sphinx/requirements.txt and is therefore missing
when Sphinx is installed as a package and not via pip/pypi.

Add pyyaml as an optional package for Debian- and Red Hat-based distros to
fix building the docs if you prefer to install Sphinx as a package.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 scripts/sphinx-pre-install | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 25aefbb35377..7905beab3359 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -361,6 +361,7 @@ sub give_debian_hints()
 {
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
+		"pyyaml"		=> "python3-yaml",
 		"ensurepip"		=> "python3-venv",
 		"virtualenv"		=> "virtualenv",
 		"dot"			=> "graphviz",
@@ -395,6 +396,7 @@ sub give_redhat_hints()
 {
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
+		"pyyaml"		=> "python3-pyyaml",
 		"virtualenv"		=> "python3-virtualenv",
 		"dot"			=> "graphviz",
 		"convert"		=> "ImageMagick",
@@ -955,6 +957,7 @@ sub check_needs()
 	check_program("gcc", 0);
 	check_program("dot", 1);
 	check_program("convert", 1);
+	check_python_module("pyyaml", 1);
 
 	# Extra PDF files - should use 2 for is_optional
 	check_program("xelatex", 2) if ($pdf);
-- 
2.39.2

