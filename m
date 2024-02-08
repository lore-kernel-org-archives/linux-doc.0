Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DB33F9F8
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707425926; cv=none; b=W820t412rdzT1UqMIqu0JHD0Tlfz2lC2bW+MsRUtVAqm7ykbo7qC5ypBQmAqFSNTiSwNrLqaO1DSYdF9obugN2sCY5t6H2uocmUUeAQW8DnP6TpAGzSxQE2pj0heiiJGC2OoS2fYL5r37gmRdkkbWyfjy/GMJdN47H/Al1vxM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707425926; c=relaxed/simple;
	bh=e4x8s2vq5KE3tjwGiTEDVUMIN4XccFGXeubsbMX6Q10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HvqOnhss2HVoCKpd9Nv/u3EScrKeV0BXlLPHH2fHpIe7I6qTLXB+67nG9lXQdkSJwcNLAnWvaD+SH3w4e9yzCRItzTfIAyUdsEz2ybA8gwbXmbUnCRylE/1s/S8+BCgsuggeWlUoqRPvh4SihGfsx4Xa1VVuSmmxWQsChucjiEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=wb4+siUb; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="wb4+siUb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so527069a12.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Feb 2024 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707425923; x=1708030723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh0/SSQbryhTyPsEnw0NTqJHbn4oA+/xslZpcTTvvbk=;
        b=wb4+siUbnrPnf6GvSv0dlhzU7T+ZRvQgyqonY9iZeJbg89adzWlvQoD8UaIdddb8jp
         YK7msf7mKZIsFdPrjB9ijfNw/m0pdjcr3FJTS8sv7Wtv1Qm04vL8yb5Q6aRGcRr9Meu7
         92hL9UUzEsQJmnFdvwPe4/stoX5GKQAmV0G1UtqRbyD/ghY0ffZHEJ4UXz5TL3MU3Kay
         GfnBhuUoOuebM8UcaPpDsq1/766MDevOI06xWZJ6pBEsBEYwkbQxXT68e3sNj0JlPxgD
         V30EbRT5RzVeJl66AIecRcI5TI0GPLc0hxKPYLxkRjsalvFD/R57sA6YUW49o3Fw8nXG
         eSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707425923; x=1708030723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rh0/SSQbryhTyPsEnw0NTqJHbn4oA+/xslZpcTTvvbk=;
        b=bPeN8boQWEOdJn7hpOeF8T5m/t1TNj47GA02bqQtjBSPOp+Bw/0jSuRT6J9ATdSmgy
         BqzdI73YV2VxQvW7M293mQ/YFUyNKWPtm4qaJrVeg5Fx+Mq+f9oubWiMpuvwPJW4dMoJ
         Pt30bwl/BgtGD6vAh1iXIuXdK6Shako1xuaxdDqcR5Fwb3JyNalUc+P/1MEwCpxGgbSa
         RakhKU8UNdC70UZLhbi12+dqwghb6lhu5uhHHxmEFNWAvvLys/dORBhpUPzzt5dk1hVs
         6a6IkA7CNpwt8KAxit92ccPSyJpCMmVewI7xl1MYuJibxoQKJdwDL6D62evldU0/6Amh
         1KkQ==
X-Gm-Message-State: AOJu0YwRMesjcCMxECwd4GaI+oKxezBL8+Aa3anqv73i3gcGtOXO1fug
	vthd31c8Z0KGDsqacHiogavKFnfigsO+a5lMPfn1Ch+rdlQ/6dXxI9ILWpmE+Dc=
X-Google-Smtp-Source: AGHT+IGnjsO/HQ+adVUZ8qaCgNjU0tUTH1fyVyLhCxmQ+plbar/MgANb+APLmdnJ7jgvJvsodCgmng==
X-Received: by 2002:aa7:d0d6:0:b0:560:5f1e:f420 with SMTP id u22-20020aa7d0d6000000b005605f1ef420mr291084edo.0.1707425923471;
        Thu, 08 Feb 2024 12:58:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0Va/BM7rgZ59qsnz+o58yVnLS5n7em3Hm6fyi97lloawcwZwVz0zCmMPg+IHbPmNhdnf5uTWO4Z/3xPZlW8IpKCy9oytAlvhpKnEs3Wx0HtRedaWrqBTSRp/ox7qJEWsHpSg1/k4/eCpgOxdkMbTVuFzMKE2CYL/Mpasu2nHjTTSUrnlDRlWQxZXfNRc6HDCu2hlY
Received: from debian.fritz.box (aftr-82-135-80-180.dynamic.mnet-online.de. [82.135.80.180])
        by smtp.gmail.com with ESMTPSA id k24-20020aa7d8d8000000b00560e72d22b8sm112068eds.2.2024.02.08.12.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 12:58:43 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: corbet@lwn.net,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vegard.nossum@oracle.com,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH v3] docs: scripts: sphinx-pre-install: Fix building docs with pyyaml package
Date: Thu,  8 Feb 2024 21:55:51 +0100
Message-Id: <20240208205550.984-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ED5D37EF-B353-4EA3-8AC9-7368BDD2CFD9@toblux.com>
References: <ED5D37EF-B353-4EA3-8AC9-7368BDD2CFD9@toblux.com>
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

Add pyyaml as an optional package for multiple distros to fix building the
docs if you prefer to install Sphinx as a package.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
Reviewed-by: Vegard Nossum <vegard.nossum@oracle.com>
Tested-by: Vegard Nossum <vegard.nossum@oracle.com>
---
Changes in v2:
- s/pyyaml/yaml/ as suggested by Vegard Nossum
- Make the check require the Python module; was optional

Changes in v3:
- Preserve Reviewed-by: and Tested-by: tags
- Add pyyaml to openSUSE as suggested by Vegard Nossum
---
 scripts/sphinx-pre-install | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 25aefbb35377..88ae75887476 100755
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
@@ -472,6 +474,7 @@ sub give_opensuse_hints()
 {
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
+		"yaml"			=> "python3-pyyaml",
 		"virtualenv"		=> "python3-virtualenv",
 		"dot"			=> "graphviz",
 		"convert"		=> "ImageMagick",
@@ -951,6 +954,7 @@ sub check_needs()
 
 	# Check for needed programs/tools
 	check_perl_module("Pod::Usage", 0);
+	check_python_module("yaml", 0);
 	check_program("make", 0);
 	check_program("gcc", 0);
 	check_program("dot", 1);
-- 
2.39.2

