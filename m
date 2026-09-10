Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C45366054
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003980; cv=none; b=nC+B9/u5na0Y4kYFv0nqPpJKi+D3d7RxhmliQ0jP+x2KdFP6kkIa4IvwAmOrOO34P/Of7C2vWO/mwORi+FAt9cQt73UcPLEbepO+cp1fEexd+OzC0mAqXDtsHcECwHMxMR2ilzKlzckK+HO4B4QfHyYw93mOwbf5mLVPk1Zn1f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003980; c=relaxed/simple;
	bh=5npIdaapraypBrumlWXF26qNLLXzmRV667k+YLJkaDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CP4BEx96Jy5xbWXEbTXuAm7UP1UYUFP3hkDM2K9qQ261GcGzbiwiXXe1zV3isoBw/qbEjAGeXwL+XZpDx7UmyED2OY3O6k6Ry+Fa3GRwxwgG/tFNf33N3jlspcPwyh9EFsFqOZoDzvbYtG8L+av7+DHZCh3Ie1c7yXdKKosx9tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTBYOs9h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTBYOs9h"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so81382795e9.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003975; x=1789608775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=oTBYOs9hrQ1g2s7H1bO9ogdhbix+86v1yKFtfKCQWjR2iRiM0lteprlG6Tn3bvnNeW
         RDnjU23cFSUweUOo/dO+YQs57po24Vf3jckqzJ7ygXrMBi2RX2UeRHj+//bkJ8Eiqukq
         6dmbafTfGj8ObvjKL3mFBCqDa/6+bq4N4jT/jPNvy3dFG8CMTQtFozbVCsxKjxzetMNJ
         wxRIGzrC4KOjnhjl9GxsScP+rj5w9qgsm2euP4SfZ9sVImxRy5fXrI15ETNA5Ppcuua2
         NtIxDrLqswMf+z5hVSRi8PvnlqC7QVtXzpLkpX1wHIxIC88GSFYtxvHmgyuubyqaolzO
         KxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003976; x=1789608776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=iRH9vWtV/PAgFOY3Ff/XO5hB06ffVP14m6rrwmIOvJu4ec1iRXP0vFbWaQOLr3Al3g
         0Atl5ubr9FN4RKFdKSb6DYcAX1jT7J/14X94jr4gSpa1F9n2uGsfcbB1ul+p2j+lSqF4
         mJlGeXKtMwyfOhjftszD6bhW3B70U/QzIxJ/pPo9bLWcYeQTQtHFJrYnVOrsqa0KAHFP
         b49hCnJQspWJOzih9kBjJhc2x+mqHf8J6Hg2NFoX9/vmqUajP+ZTaCB549UJe6wsTsS3
         UT50mDyRXNkXoT1fZiNbbJt7Q8XQLPdEaFH9pOZ3ukOPt0RXeUi2o0rSz64YqJk+6gCR
         1VBQ==
X-Forwarded-Encrypted: i=1; AKwUvByjjlyLf9N716XLMsAt5/FS2isHsTVbtogXhHtjy3OksUPXALE8bMQxsCPfW+eVMIhnSCv66uzaD+U=@vger.kernel.org
X-Gm-Message-State: AFuF++nR1Wc5aDKOCeCCqr/7OmCc+TBP4/e4PXPHnXQxG2XqQiIzIUjR
	3m/MUfvDtsFkS7aR0D4lFazLqbWZJpqd+yMzBBaNX7xSeRpHAIZ63Y/q
X-Gm-Gg: AYBFou3jRMwSEeGmP7oIQ6ATe7UNZQ4w0LaasOMpdOhpTfPgY5ySlOQJXp+PXIhDB/x
	iKGgL1/gzq2A5wS86LviD6u2soBH2eSqseLbnxG9xzUppImXTU7y07UXAhFPBYXVh093aOtQz5K
	xYRA9uucECvE0gmioEsUgiKsWu5N3wHFakstPo0OPgzft5xYOOf00Nzhh6SV9kNinWwumDCTzsl
	FZEGNm21yZOUed9zvID6FXcMeKwqUs7T9eOJqZtJQ1d58YFiF3fqxbfTDatcVhvw4OkTY0FWcrl
	WyCX4kVjpo4wK377AEXgAOLeAhuwSZU4pkqL1Jx3g76edOAP1KQaVVgjE99n2LRs33l8/18Q94J
	EU4DpvG8dNPiU8Nlr+qdm+sv9Dv5AO4PAW95arpuYoq1Z2gbxYJSdW9HNSlJqoJPdHPJoTstvlI
	C3c0h7BgF5V1iqz+3bX/yBQ2EoILZmn30SDV1k4xq0KC5BMIbrCpbCfwvRlPqL9ZgyLA8FOERg6
	mX45YehE+fpvbkPFnY72+2iQIDl2fU+HzWbywggyKqiNsvURnJg82QO1xZCc9TF7ZQd5RRTuhvl
	eSelm7vP0/MDMjSQZ6kTcFlFhQXLcPX5e3YjY0buw0/Fh96UDJp2gavXzwnzPxhNMwjpciDVGMB
	B9g==
X-Received: by 2002:a05:600d:849c:20b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49cfe467228mr261724915e9.20.1789003975492;
        Wed, 09 Sep 2026 18:32:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/8] docs: kernel-parameters: Drop the bau= entry
Date: Thu, 10 Sep 2026 03:32:39 +0200
Message-Id: <20260910013245.8619-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0
