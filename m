Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93245136358
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108606; cv=none; b=bLD9T20q6i3kRRcM5Jl2hg5t5rqIXuLluZ/zqxCxdsNgI4s5vqYiu5QFFpMzUmHTGhPK6EB8hclfLZQ0ySmq0RPGly5OrX1qGk+MLnj8y/8OWZ23MnXNssjWXLeOk1IL2zu6zSmyZmP+0cUen9hPxycLy5CHHNptZKVvNt38MII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108606; c=relaxed/simple;
	bh=rf2528MAQI0SWjfQ2N2eH8l7992Txi+rx3ktL0H7dPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6yp8iBUK24sky6lqJ8sRD2n6q+WfU4js27Ndv+jsV7y6ZSMo4wTDRlPUGzs0E9lOVWQZJ/9H9PPOEXH7H1cJtarHgyDLAzvf5lV/34SZJDmAD7pPJs0DiUXp/cFGhJmEe63xG0dhXEPX3uM/I/Osyj8UxNVTKSUXrscKrSlTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBceuS1I; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBceuS1I"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so3630954a12.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750108604; x=1750713404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjB2AvHvP/l5fSBXrpAm9tdfGAHdUE2jUdUZTcZ29zc=;
        b=aBceuS1Ig4ex+ei3+b5oLVoCBvM7quJ/YpqEFAlX4olK3rqiOker6t7Fw6JtnSUeFO
         6QvdCucrkwBi6T4qNja2mIYsjAVF2lf7fiQi5GYMCIWa2hy4PJ3zofsZOjrJEEN1Wjna
         PI9NBdwSj2dhsWWNGcFxr01toteVkEbEmzyD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108604; x=1750713404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjB2AvHvP/l5fSBXrpAm9tdfGAHdUE2jUdUZTcZ29zc=;
        b=rrg4XcACtDHi1I4c9H+cpOJHB3EpdWrXcgdbQzBCX35q7nqpKIXZfF59rRWKR72Ffp
         rWIrjWPe++XUdXOhqMPXHjW3DmBdwcHTWfwsDULXa8Gqi3TZeYR74cyRQJGtwEkRwDb9
         FF9nqLnelNZEPR5viyyzOKHdgYRX7tHszUfJZFimGVjQ2LvBfghanwN/wfZ5GI13xBhh
         PP+u2DVMChVuek0XF2ZmGB9mg4vgiZ2v9xY/uK73V3sCI1MigYehDh3OnnJAmqsPWLJj
         Ql575dPp9HB/k8lAaie/0AUxq4eyyyi0u/POzyTnx7E4b6TYAUviljvmzr8bgpHQ63xu
         AB0Q==
X-Gm-Message-State: AOJu0Yyg+1YOjN/x/GS1/kbrEYx01RKqcpyWhQV+1yLpgU7w/VYRUvVZ
	dDntcSpOSLQTae9kfT5xmVVhSOan6jXMPXZmJzAvhaQYEqEvEtw+I5hS8xfvCroakMEccAUFDIc
	JfIs=
X-Gm-Gg: ASbGnctIwCtgnaqEaS+1t03MZmbzFlz/AfP+Gp/8K+VhTCbEXjaIrvtxcp35cA/9B8J
	o1u9TMchSx1SikW5AJD1j5PjYA4txsQVqtyaPK/73IdG1F5e7AgAVkwRXd1Pccq/T83oRYgjb9E
	sTzpOPopZKu5HekaGWz0P96GwpRTzlOy9F1ghMiQQALTimtoUfenMsPdFoyHSNT0gGTmmj1v+Ik
	0iyinRspsQ7ENjB6jaygsSX6uIRLwjWFB2HCaRXokbkoZDH5glfHt6lj9Jg9pvyXkaftL/DYJnf
	+IAuOVRcwCtoarJzzsUm61AtOfATtfWaB5mdNOD9YMj4RKQeWCk0S9WJ3qyJ8XPgkUUZ3ZUqtpA
	G6R0Ui3Ga+rU5m16+1LbW+GeZ
X-Google-Smtp-Source: AGHT+IGe1ufxDgVDGZOcSm8F8WWBMKf/NVeCmCDL4jeI8CLDLMqKlTjQVroioLV9TyiCAOtjfQpatg==
X-Received: by 2002:a05:6a21:2d04:b0:21a:df04:3285 with SMTP id adf61e73a8af0-21fbd5f20c7mr16177374637.22.1750108603884;
        Mon, 16 Jun 2025 14:16:43 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:aa5e:e3d3:2ccb:2f3e])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe164400dsm7419675a12.30.2025.06.16.14.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:16:43 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: linux-doc@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Rae Moar <rmoar@google.com>,
	linux-kselftest@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] Documentation: kunit: Correct MODULE_IMPORT_NS() syntax
Date: Mon, 16 Jun 2025 14:16:33 -0700
Message-ID: <20250616211637.111358-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The argument should be the string "EXPORTED_FOR_KUNIT_TESTING", not a
bare identifier.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 Documentation/dev-tools/kunit/usage.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 038f480074fd..066ecda1dd98 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -699,7 +699,7 @@ the template below.
 	#include <kunit/visibility.h>
 	#include <my_file.h>
 	...
-	MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+	MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 	...
 	// Use do_interesting_thing() in tests
 
-- 
2.50.0.rc2.692.g299adb8693-goog

