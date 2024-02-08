Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDFC7D40E
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707398153; cv=none; b=UT9sPB49V8l1F+F9ZygImdIcdqMSUHJAgma0FQyFovd9MOkbjfiDdSCQ9NpwEazco7hlOkBNXvGjVBRc4+1Z5nT9JjCVO73QGgEudT2KDuduokxX7+K+z0Ghy9KukBeUUnNYfuiD2+g+9xFZ1Z1Ndixoo/sB/g/aSbpaJ8i+iVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707398153; c=relaxed/simple;
	bh=SEyLV8EA3UDikWXZ2JGORmUmCOCr2Fe68O2kEh9Su9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HHVcOC4dTtL3G5fAtLHCZpyWSTakM+xc5dEKmBgbFz2X68CNqqutmnwlu7UmnH5DniqB/qimwnzgRSC5szKTqj8ClJvUPB2kxKPZfHfMXzox0JvwR6i5gpP7MfiCUXAedmD1MfSmr7cEvVFaUtCTyE+rK2VgOHpK3QJjv5UZEs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=letYUnSD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="letYUnSD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51168572090so2974216e87.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Feb 2024 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707398150; x=1708002950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN5AQ/TNx9xhXcl1uoql+eElOXefKNcD2qx18n9oR4A=;
        b=letYUnSDAswX+eIl9SWuqGBNebhGdqr8qZrLQcjn0N53+mIgGZt0/YJ97n6iKHtz7b
         WAjdJJOdp7tJ/20miuKxZV3R+RiSkQe057C9KksptxtS4P4iVyP9L/dxO/tqUHZozlu5
         aslVwWP2EYoo2rLnUicxJqloTrjxQzNbIeDImkb66AufAKjYREZgSWQzc2Hp3UaUAHMk
         O9Za8hGyFBaNEzmrPrS0rQ5ZM/FHg0rhiGF4GSILUTdqcOgi94Hexl2yYWXwr2orCjIN
         vVpwkX3WSyHZMoaAis04f9aDSYeFlVnKHUlaujmk/a5R77DyqSEAOeXSKVs9KkWuZzX6
         ARjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707398150; x=1708002950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tN5AQ/TNx9xhXcl1uoql+eElOXefKNcD2qx18n9oR4A=;
        b=n2qigrIUYwknNmUSoaRznB1GDRKvnJ41xab5WEP6aF8Ss8AAr96qA6vodWj4+vgcKs
         n6DeRVyyTva/nA9yIswqFAg0RX41ZeMKxhxxS9XDFZX6cg7WxGWt//5LnTuW7+KH1Ltk
         9z/obf0pTZsTnwhh3wxD82Emb1pc0N18Kx/IdShJC3PWOE2zvH+35IIqj17hCe4w+9ki
         +Otbjn2fDmUJ3692srcfV+xBEa2uWD4iY2pXflakN/j/Oa+RXMOTGb0QyH0v8AJU+jUP
         sQ43j7hzWnw6/n0e2Ooc1R9QS4jYa8n9oE8fJV5r4FvHEtRz+o28XRb20izpokHHM/2v
         nYGw==
X-Gm-Message-State: AOJu0YzsNSHkqlfxo8WJSTaEzXnYlPRposOHjNtbempYgQYerZ+8ef00
	V/CPo3oZhmCG2bLcSwzDvdBgPoLFgKiBjuCbpxBYmnf2NIrE6E7JLq2pnVJI94fUT7JWmlQywLj
	ozAgHyA==
X-Google-Smtp-Source: AGHT+IGAqOf4DQcqfONgGpO02Y92fts42fxxYssdJfsFXf7d88iLObcv18TXvK28nb5eSZyikxSilg==
X-Received: by 2002:a05:651c:220d:b0:2d0:ccc4:4f8e with SMTP id y13-20020a05651c220d00b002d0ccc44f8emr3465928ljq.44.1707398149935;
        Thu, 08 Feb 2024 05:15:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLw0HIQIivXh67dDbUpoRHuOQ86nOXfOYUIkSo73l5AQU7Cw1UcYIanz/UxfwMufn4QhhtDx8YoyVOVIgMF6wLc3pYqAdkZy5ijpyQQyhPf50BiLqUAv1MlwCAIc9BQeNXFBydILe+kEbx/Uo7/TwTE1YhcqlI/blk1KHjV/HYVq+lQwPw4pZx3vwybO5JKEZliytsIg==
Received: from debian.fritz.box (aftr-82-135-80-180.dynamic.mnet-online.de. [82.135.80.180])
        by smtp.gmail.com with ESMTPSA id k10-20020a056402340a00b00560651808a6sm776678edc.67.2024.02.08.05.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:15:49 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: vegard.nossum@oracle.com
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	thorsten.blum@toblux.com
Subject: [PATCH v2] docs: scripts: sphinx-pre-install: Fix building docs with pyyaml package
Date: Thu,  8 Feb 2024 14:13:06 +0100
Message-Id: <20240208131305.52577-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <c6555e01-1945-410e-9950-53c40052626a@oracle.com>
References: <c6555e01-1945-410e-9950-53c40052626a@oracle.com>
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
Changes in v2:
- s/pyyaml/yaml/ as suggested by Vegard Nossum <vegard.nossum@oracle.com>
- Make the check require the Python module; was optional
---
 scripts/sphinx-pre-install | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 25aefbb35377..7e49a020c25e 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -361,6 +361,7 @@ sub give_debian_hints()
 {
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
+		"yaml"			=> "python3-yaml",
 		"ensurepip"		=> "python3-venv",
 		"virtualenv"		=> "virtualenv",
 		"dot"			=> "graphviz",
@@ -395,6 +396,7 @@ sub give_redhat_hints()
 {
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
+		"yaml"			=> "python3-pyyaml",
 		"virtualenv"		=> "python3-virtualenv",
 		"dot"			=> "graphviz",
 		"convert"		=> "ImageMagick",
@@ -951,6 +953,7 @@ sub check_needs()
 
 	# Check for needed programs/tools
 	check_perl_module("Pod::Usage", 0);
+	check_python_module("yaml", 0);
 	check_program("make", 0);
 	check_program("gcc", 0);
 	check_program("dot", 1);
-- 
2.39.2

