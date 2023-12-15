Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7A13FE1
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0lx2l5I"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5e302b65cc7so2306927b3.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 23:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702625972; x=1703230772; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d4MXXH5cbPxzFQMx+eKCBMLxcs0KvqjK2kPkW0nLFkA=;
        b=G0lx2l5I+vav3thN3cKmD1WWSs6NF6uQsEFdCIAH7M3r0whgeoX1BdfWBCcFBIg8+q
         xJzQPxnh05VFerTIyBUweR48mVScGreqo6WDxM5INYStE7T2Y0SdupOba1AkSMKpTcE+
         oLdp3cg0yZLyDmyRLP5J/3WCUkFE1cRbAmI040dr7WOwn0xtzqponnIzdVLIQ3a05xrZ
         I77xdlKl0CO4+KPcdkR33lnEEEzCZ44LQKjmcyw+Bft8K7tg1De6NOhpl4c4W+SXNxpC
         IKdxyaBDMivHmwaI5XgX9wfcqHFkjyptHj8Ju3kepZvEeNWzVTIT8J+Y+09DYdjiXiyX
         cTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702625972; x=1703230772;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4MXXH5cbPxzFQMx+eKCBMLxcs0KvqjK2kPkW0nLFkA=;
        b=mwkZGyZBAlnCAFhjxkSa54xdAgyHRUoPIcRe2vBSsrzHS9q1TxTQm2TXEptpuxYnzW
         7InLBpOT61kVzy5/1zHTwRQYuOX7V+abNSo9JDFpJSwDVOsCapkkOvuMb1iMn46H4AVd
         Nu9nT/vadKBOaNLBIfgBXNN45gQAYeKSKUXoX6ncogmB6eHVBXWDG+Iu8LHqzGT4ItU2
         G35W0Zd5Ext8ihvIFRFIZ5tILg9THc1DS9OEF0SjtCcfuEQTXlD+6Nwed1IT/kC0lM+/
         VlLHUne+5xwbG74AXfPJiesR2Vx7Z9Zn1DYpbXXz2jve03zRuEE08tLWq+Aef/V5UQ7i
         kHUw==
X-Gm-Message-State: AOJu0Yx1DHJUfT0sWE3kJC2YN8dXrbSp4ofZ33XdhXKPvtH71gurQQ/r
	zsB5AeUwL21N6uvgU+4Er+x5teyTquVICQ==
X-Google-Smtp-Source: AGHT+IHFhhWMR/kJRqTx6WHoW1Cw50Apf42JCOhF6MR/ULXu4wBRUQj91kJR8wij5MUTOYH+2REhYsHY7wVTEg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:ab8c:0:b0:dbc:c82d:7f0a with SMTP id
 v12-20020a25ab8c000000b00dbcc82d7f0amr53140ybi.9.1702625972472; Thu, 14 Dec
 2023 23:39:32 -0800 (PST)
Date: Fri, 15 Dec 2023 15:39:11 +0800
In-Reply-To: <20231215-kunit_bus-v4-0-4f5160e2f95e@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231215-kunit_bus-v4-0-4f5160e2f95e@google.com>
X-Mailer: b4 0.13-dev-099c9
Message-ID: <20231215-kunit_bus-v4-4-4f5160e2f95e@google.com>
Subject: [PATCH v4 4/5] ASoC: topology: Replace fake root_device with
 kunit_device in tests
From: davidgow@google.com
To: Rae Moar <rmoar@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org, 
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="utf-8"

Using struct root_device to create fake devices for tests is something
of a hack. The new struct kunit_device is meant for this purpose, so use
it instead.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: David Gow <davidgow@google.com>
---
 sound/soc/soc-topology-test.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 2cd3540cec04..70cbccc42a42 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -9,6 +9,7 @@
 #include <sound/core.h>
 #include <sound/soc.h>
 #include <sound/soc-topology.h>
+#include <kunit/device.h>
 #include <kunit/test.h>
 
 /* ===== HELPER FUNCTIONS =================================================== */
@@ -21,26 +22,19 @@
  */
 static struct device *test_dev;
 
-static struct device_driver test_drv = {
-	.name = "sound-soc-topology-test-driver",
-};
-
 static int snd_soc_tplg_test_init(struct kunit *test)
 {
-	test_dev = root_device_register("sound-soc-topology-test");
+	test_dev = kunit_device_register(test, "sound-soc-topology-test");
 	test_dev = get_device(test_dev);
 	if (!test_dev)
 		return -ENODEV;
 
-	test_dev->driver = &test_drv;
-
 	return 0;
 }
 
 static void snd_soc_tplg_test_exit(struct kunit *test)
 {
 	put_device(test_dev);
-	root_device_unregister(test_dev);
 }
 
 /*

-- 
2.43.0.472.g3155946c3a-goog

