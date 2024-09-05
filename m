Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C4149013
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 05:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725513095; cv=none; b=bJ2Ek6vi1x9obcOYluyLmgJNJ2IpBgbUDP8oiF6Lgy/F43jyleAuR+5VXhNZptJw6KCtemXkx+I2oHe1amsOYC0aekIRKzOxePXdGc2/cI4wQ+lt3JcHgzpD6LL3zAYgJ3ktiKHptfO8GzgiXYEtyw4NTTfg3sMbi1S7+f12n8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725513095; c=relaxed/simple;
	bh=CnV0MNQyMfYXqrRJIuj+Svi/jQlTDoU5NYQigaPa72k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bPeivG24H5RA96TALav29yBM5KA9gFpLWj+B971fyHUz3jePMinY6whiAndmScRgPMKB6rn/ZkvlWLd6nxrTPBhqHxmLtwukuA5BVIFoxNGwqJ9srakD6c5jNpeqAwFvVMEIrv3cL4kX6CGzKRGdXubsZzJNjDZnZ+5XfEYHlto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSY15vNg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSY15vNg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc47abc040so3710135ad.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2024 22:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725513093; x=1726117893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9NPQ32iTCKbBaIL+MHUtZwE6DYWCjWjKz8ZX8dGswg=;
        b=CSY15vNgvrygj2o4+BfSkTv1vheeiqiht+kWu/VD80oxv6IcxapKWUQ9jRRUgU7yEE
         3k6r9/fmljWvOUYfIT6Eo1VRCMmiDKFT/ESwG3/B/P7sGn5r4oS3FAFT+ya6atRvojfd
         RA5B/1VV7myM5Pe8ZUyGQkOHzJhc3bEX/qk+utRYXbg4Q1+1WbUKFKFC1cgQVAh/AiT+
         jzeAqkKRXU+lL0V3VIns3DypKZcQm9LaJ7tI9bY93Kuzh/5u8T4GQekpO4nsnlFDxj8P
         PS2p1E0iTfjOc9K6BtHvXIzDKu9eGI4U3ObZEcxtT+rVUMe0SCRPE4wa2gp07qdMv1KS
         jMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725513093; x=1726117893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9NPQ32iTCKbBaIL+MHUtZwE6DYWCjWjKz8ZX8dGswg=;
        b=VAYAudQQIGh6LmeA3gzMO8kNtPhN2qZDWOiht3YK/C4W0ZUvvIrH1nMJUa8rc3NqgX
         ggN4DrZz8nMB8xTjPbi9wgP2ZZdXjUnMiQgA9ypJYb6FgyV1GMHHxPqV/IA1rOC1qJqz
         r54ibm/w7afJXimXUfR2JfUxgIEdWhH77peKd1g3U9grk67bQS/qjWkU6VTT1iHY6AJ8
         VRZB4PribEVMsjVNhAWiMK/G6JUvdI3dY66nIAlG7dJZKm5Xl+oGA4XjS2EbEgI+qXuq
         B0GnjTk8ddTXgWrXCd4M5V+ePuxYSxq02a9pBeQowPwJlXNeZeH+n7mHGD2rN71+1Xqw
         vQAQ==
X-Gm-Message-State: AOJu0YwZWCvorMU6oH24U/VLdcl7+0et7vXapCBuOM9B3p44yTa0bOKb
	jqBjQAp+pYivJsVlnyi4gSlWNCvQZorfUx8Humkp6YwEy9we1HlM
X-Google-Smtp-Source: AGHT+IEQmW7EGRtiuRO5hI9A7r+jeN7bTUyagiG6C3QArhp9/5Xn8MbeYg+HsrK9SqAGHTEZL/DeNQ==
X-Received: by 2002:a17:903:234b:b0:206:90ac:4412 with SMTP id d9443c01a7336-20690ac4594mr86135485ad.2.1725513093211;
        Wed, 04 Sep 2024 22:11:33 -0700 (PDT)
Received: from ubuntu-2204.. (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea6898dsm21213965ad.284.2024.09.04.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:11:32 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: kerneldoc-preamble.sty: Suppress extra spaces in CJK literal blocks
Date: Thu,  5 Sep 2024 14:09:41 +0900
Message-Id: <20240905050941.31439-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In zh_CN part of translations.pdf, there are several ASCII-art
diagrams whose vertical lines look sometimes jagged.
This is due to the interference between default settings of xeCJK
and fancyvrb (employed in sphinxVerbatim env), where extra space
is inserted between a latin char and a non-latin char when they
are next to each other (i.e., no explicit white space).

This issue can be suppressed by invoking \CJKsetecglue{} at the
beginning of every sphinxVerbatim enviornment.

\AtBeginEnvironment, provided by the etoolbox package, is useful in
this case.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
The issue can be seen in, e.g., an ASCII-art diagram in section
"ACRN 超级管理器介绍" in the zh_CN translation.

Note for Jon:
  Current docs-next won't complete full "make htmldocs".
  If you'd like to see the effect of this change, please use
  "SPHINXDIRS=translations" option.

  Fix to the build issue was merged as of v6.11-rc2 as:
  commit 914f8961879d ("media: v4l: Fix missing tabular column hint
  for Y14P format").

        Thanks, Akira
---
 Documentation/sphinx/kerneldoc-preamble.sty | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/sphinx/kerneldoc-preamble.sty b/Documentation/sphinx/kerneldoc-preamble.sty
index d479cfa73658..5d68395539fe 100644
--- a/Documentation/sphinx/kerneldoc-preamble.sty
+++ b/Documentation/sphinx/kerneldoc-preamble.sty
@@ -199,6 +199,8 @@
     % Inactivate CJK after tableofcontents
     \apptocmd{\sphinxtableofcontents}{\kerneldocCJKoff}{}{}
     \xeCJKsetup{CJKspace = true}% For inter-phrase space of Korean TOC
+    % Suppress extra white space at latin .. non-latin in literal blocks
+    \AtBeginEnvironment{sphinxVerbatim}{\CJKsetecglue{}}
 }{ % Don't enable CJK
     % Custom macros to on/off CJK and switch CJK fonts (Dummy)
     \newcommand{\kerneldocCJKon}{}

base-commit: f92a24ae7c953263600fc7ea3f0594676ea82138
-- 
2.34.1

