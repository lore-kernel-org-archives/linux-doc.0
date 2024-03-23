Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B6817583
	for <linux-doc@vger.kernel.org>; Sat, 23 Mar 2024 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711198962; cv=none; b=LSEDXWycsbd+GDOWAYwrw2J9R7T/Ta8T3+Ufh7JEY8XWJDwD9iqcf1LlIfnAbyZBv3RZM6qJZ59O0VP+Y72q2HezWeA+tPaSe2KRU47em92IChDtA/t+8Lqz2wKfx5v5nLqUDxk8T4SxazmpSR5q1Ya/QyN6GyiXAB8TmCwPDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711198962; c=relaxed/simple;
	bh=T7Mgu+MLzqWjzpi1LxLlvfVpGSX814PLr418pafoqeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/cmspts7F8EDpk4X4x5u/hFlgD3bUP1zcbn+PkfUMn/WTamzwv5a3IvOuHUSvylW9s4UZMPGNmQlX6bLfSq5cuX+RZylx05PG8kTjuY3Y9Be1IWigEhoRS5w4STSgXDaefRM0l39432wtcewXZftwB4XHxUjI2c61Jt5lQ1w3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=01f+S3IU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="01f+S3IU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56b8e4f38a2so3851742a12.3
        for <linux-doc@vger.kernel.org>; Sat, 23 Mar 2024 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1711198958; x=1711803758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4AhIBO4PzLNRqcsQH2WrtOdVm/lP2EH+zIIytq3CL4s=;
        b=01f+S3IUtYd/meYR3cu6U5xgGx7ePaekBjSrNvPs81V2H4P11JfeO4891SoJLCCWNF
         BeaLwMkEdV0fGMbaI3ix8i/UZiLysAGlFbwwYibShb5zirE1IpcMFEEvIXfHfYbqIkjU
         FVyKv04AC9H9wiEde7zhuJE78QsmCYqeEa/ygeOtgbIOYrvg6O89Y7VqIiDbenuYfvuL
         rTxGEcKAB/7fRqB+ujPRSvVOER7+z8jb2+6HSPjUYS76vO6soAL5SsM40wk3BXc0zU/I
         JLyM/6UwoGyNuGPU7idX3yGSoV/xFen84GEktx1Vql2AC4ilzxvreJMtxXsfZg4oqfYq
         FOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711198958; x=1711803758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AhIBO4PzLNRqcsQH2WrtOdVm/lP2EH+zIIytq3CL4s=;
        b=DbITZKrKxqYaffokE9est7pmhQidxYB0muEE9QSzoP6B9ywyitNJ2/EIMbnQLaJxZR
         MGDN46jBNWP1Ky6x2UCgnpPM4xvTnqqFKlQxzlTx7EwXJD06pi1fnggdzEd6ebglCizg
         Z0+Gp8oa3o7LNHJYF6Z7srigkYOXebfL9HZ0qleNVFrwlgjCl+5xl9f3OFkWRE3pqh34
         cVsk6+8a/kVkyI0z2rMmZSGHMzChdegH1COhjvv/rTgNcp7vVOl/by25KCYOhZzCSsoC
         t9umd9h9Y9KN0rOfTg74I9LsF0end4N7n5CEzEnPLrzel5wMzDMYtQQ9VzP9SoZhrU49
         GgEQ==
X-Gm-Message-State: AOJu0YytXYbMFnKSV893fz0vT716ta2hneVg94UuK0+6m3QJqSnaKHYc
	KG4BKrdjPOZYe29Q6Voe+C6Vp7T7RX8RDEdlqjSg8jRXLuN8FGy0fYDyaXRW4gQ=
X-Google-Smtp-Source: AGHT+IEJcwa9KRylcPbZWBjipR/pVElG6lPBbsxJgzVNd0Q1WdTXThMSTUZVkDL1aExm6EkwUEZ2eQ==
X-Received: by 2002:a50:8706:0:b0:566:1952:694c with SMTP id i6-20020a508706000000b005661952694cmr1382283edb.20.1711198958348;
        Sat, 23 Mar 2024 06:02:38 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de. [82.135.80.212])
        by smtp.gmail.com with ESMTPSA id v17-20020aa7d9d1000000b00569aed32c32sm865385eds.75.2024.03.23.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 06:02:37 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] scripts: sphinx-pre-install: Add pyyaml hint to other distros
Date: Sat, 23 Mar 2024 13:58:38 +0100
Message-ID: <20240323125837.2022-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend commit 84b4cc8189f2 ("docs: scripts: sphinx-pre-install: Fix
building docs with pyyaml package") and add pyyaml as an optional
package to Mageia, ArchLinux, and Gentoo.

The Python module pyyaml is required to build the docs, but it is only
listed in Documentation/sphinx/requirements.txt and is therefore missing
when Sphinx is installed as a package and not via pip/pypi.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 scripts/sphinx-pre-install | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 4c781617ffe6..d4f05216ca23 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -514,6 +514,7 @@ sub give_mageia_hints()
 {
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
+		"yaml"			=> "python3-yaml",
 		"virtualenv"		=> "python3-virtualenv",
 		"dot"			=> "graphviz",
 		"convert"		=> "ImageMagick",
@@ -557,6 +558,7 @@ sub give_mageia_hints()
 sub give_arch_linux_hints()
 {
 	my %map = (
+		"yaml"			=> "python-yaml",
 		"virtualenv"		=> "python-virtualenv",
 		"dot"			=> "graphviz",
 		"convert"		=> "imagemagick",
@@ -587,6 +589,7 @@ sub give_arch_linux_hints()
 sub give_gentoo_hints()
 {
 	my %map = (
+		"yaml"			=> "dev-python/pyyaml",
 		"virtualenv"		=> "dev-python/virtualenv",
 		"dot"			=> "media-gfx/graphviz",
 		"convert"		=> "media-gfx/imagemagick",
-- 
2.44.0

