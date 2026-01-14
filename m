Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FA2F290A
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355962; cv=none; b=Kmy+xqM9rTXwJEt3+BMv78MuyD44U3kUxoY9UTqnyThROQgeG6iXWrVvcTcUdlmhG+/uMwimd4NOtbjxjHSk55GVrk/W2eVnoEzTxEU6PaPa11lvRW9uP3HFby5ORCxhb/KiPmZmTZL+DuX0gGXwiJd+isMc55ItfQfQwj/4PGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355962; c=relaxed/simple;
	bh=By5iwCjaEqa2McMnoS7WlZkqnzNV5abBOXrSsH3vz5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omhowYbKDncqnFvIIsarlua6MMfmRGzPPHIyV76dx7I9OuLkxP2SRM8sB1vreDAkHnwmXS7zm9VhiedgIcE4rFDvbQh9fwdB2OEL9YzTDLlioVp9Qg7ZgAmXPoj80BUxWAjc91IBiEMI+1qaqBFps9pCxm6t2y2DukMJfmpc9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNszZ/Z9; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNszZ/Z9"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45c719bb855so184309b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355960; x=1768960760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
        b=TNszZ/Z9Nx1s5K9dcthILJt169iBdyEToIngxOMGk4g3HAJQpNIolnMSDuCO9mcmvx
         tc1RAZps1GBOEmQ7C5JdtWr6wYQpwfytZCilrtWw1wDkmsw8dGKrrIqDe1mimkc7+jtx
         4tUMGTdhvY2pqbvk45KL+TGyVPrmppoaB6pygalvXV3mr01g+dv/4Q6vB0LP9fYrZ2nL
         UtlFMCzD4ukUSJ9WKweGvicjGbNTZZ4C2Zciw0H4p4O+ILP1kr0igv5fVWKqxinyB4SW
         AQ1+DlQcbR0kuXPF9OTjw1JrHQE58YDcKDiF/XzvCAoy0uWJYKE8OSKUdKCXLRdZDbQA
         p1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355960; x=1768960760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
        b=KTxzxWlVkPZwZnl0sYMOOKfd4x8fJxwGa37AiitSgO4sOElM6Fxd3iQ5Z/M2+1BFqX
         71mH1MEcqlsGIhfMWhQ6xVsrrqhXlBLzrwyJATBjx97EpP1yXmcYmaQwzefsnceqNRsW
         QFVrWfEO7lg9cKrJDRvdB7tlH88aC1ItzuceW3W4D5150owDp/UELr25DigYtxIfuZ2Q
         mQDar2JuM5tG3rPgWrv3ETd8rbjb32zq6Yo5eJ5Z12bwWPuEp50ixi1Vce4zCmIEHT+W
         +ebgCudLr5XaVgt9Rx8uetpYBXYyGdviAJAaTCJui/xaxvWhVEvV+4ue7AeFhq1D9jjn
         0BLg==
X-Forwarded-Encrypted: i=1; AJvYcCUsgkTBDOsm77dAY1i1DwZ11HNxW/wmA9yrJYkY41vTNGRVghwtOJfCTuh+SAIBDzex+7gPUA+w5so=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGAFaEstxYc2/a8ikO24o5mE5XvpihZgDxI8DDueVK2EB2lEg
	+MB/rzffhPOTyLJ4+rEVDJ8J73SiSNSL2z0k5pFEtwsE0x9bodgLjlHy
X-Gm-Gg: AY/fxX4yoLWXFVeWSBeqM+ZzlC+Q0/W6onGk4BbFPDn+Opf2RvOoOKvb+LXmLuKcD5M
	cBOAEkVe3XeIUbWZvEubMZkLPsXd58Kw3MRwRcOuVxNQCcA4ww89GVDBGXZnwixFRRvZ1eepHX3
	MhTLT56IzwKPkKAKBVm6dEFMr5ezIA2nJ1toBFEDW/WfII2QY8qmIuQuwUjn2sb8URIreSyDAx8
	t9Xlyw7/bGFkrsYbcQLiRSKemPqQ9dQS2o+9HcQJl2XSULyfrF9bSoKhczsYM55gsMyY3ImB4xj
	iuVR3DgLt5CFtOaE8tNIC2uE5nR8Z8JhxPJ28DQCOjXsNL20VVtgBqPlEjdP0jL17oHCTuPmUZe
	9Ol0gZiyFDsN3TGt2Z+j3Wf5cxs1Ic/bc9w2RoB+gSddFUAYkFEpgIS0/ZouExP+dXQixTzg3/o
	x0Xhph01EX0QbynVHJgNZAjQUyaAbLUIAyjXap
X-Received: by 2002:a05:6808:f88:b0:43f:7287:a5e3 with SMTP id 5614622812f47-45c7144e90fmr760158b6e.28.1768355959868;
        Tue, 13 Jan 2026 17:59:19 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478d9c2esm17510187a34.21.2026.01.13.17.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:19 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 09/31] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Tue, 13 Jan 2026 18:57:25 -0700
Message-ID: <20260114015815.1565725-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d2ff203d0873..21c1db7e8705 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0

