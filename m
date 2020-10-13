Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A36C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 096B12080A
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590369;
	bh=LCf87qwfRfVquJSMBSLMadZoYFzd1py4QT5QAhXaufg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=LEutcyq9uw8aUOAib6bm2PzHKSckKncB7AhjdKjHuKyTbe+qLU4C7MHfIqDJ7XrBG
	 gefDvco2VQe9s6KYglLR9I81r5qb59hJYe5FFgzPS9QTGcOjLirrh3whlfCFUwiZpK
	 3bYu3qPmPIuHbFIX7hUyOGcZF8s5zs9gqHplmp6M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgJML71 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:59:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727519AbgJMLyn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:43 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDFE02237B;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=LCf87qwfRfVquJSMBSLMadZoYFzd1py4QT5QAhXaufg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JyHH9QCeB8AXRiKhLf5T0okefLPKawlctsELk2byhCQhFbhreY7avPbvXcqz7SAbd
         CAkVeoUSHS0632g8d59QsZUrIDk6q2WZ6F0ZVZzbHKfAokPnspSnkpVOjxziHS0qF1
         Eic2Kwbet0jM+7a+fBbVxrXsfCNdxBkQlS1SiFso=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt4-006CUU-EW; Tue, 13 Oct 2020 13:54:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Harald Seiler <hws@denx.de>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Pragat Pandya <pragat.pandya@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v6 29/80] docs: remove sound API duplication
Date:   Tue, 13 Oct 2020 13:53:44 +0200
Message-Id: <135fc08ee65363ee7a916705487cfdf928a3673b.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The sound API is documented on two different parts:
under Documentation/driver-api/sound.rst and under
Documentation/sound/kernel-api/alsa-driver-api.rst.

The alsa-driver-api.rst seems more complete, and APIs
are split per type. There's just one missing kernel-doc
markup there.

Add it and drop the duplicated one.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/index.rst            |  1 -
 Documentation/driver-api/sound.rst            | 54 -------------------
 .../sound/kernel-api/alsa-driver-api.rst      |  1 +
 3 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 Documentation/driver-api/sound.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 5ef2cfe3a16b..90d02c5fb155 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -28,7 +28,6 @@ available subsections can be seen below.
    component
    message-based
    infiniband
-   sound
    frame-buffer
    regulator
    iio/index
diff --git a/Documentation/driver-api/sound.rst b/Documentation/driver-api/sound.rst
deleted file mode 100644
index afef6eabc073..000000000000
--- a/Documentation/driver-api/sound.rst
+++ /dev/null
@@ -1,54 +0,0 @@
-Sound Devices
-=============
-
-.. kernel-doc:: include/sound/core.h
-   :internal:
-
-.. kernel-doc:: sound/sound_core.c
-   :export:
-
-.. kernel-doc:: include/sound/pcm.h
-   :internal:
-
-.. kernel-doc:: sound/core/pcm.c
-   :export:
-
-.. kernel-doc:: sound/core/device.c
-   :export:
-
-.. kernel-doc:: sound/core/info.c
-   :export:
-
-.. kernel-doc:: sound/core/rawmidi.c
-   :export:
-
-.. kernel-doc:: sound/core/sound.c
-   :export:
-
-.. kernel-doc:: sound/core/memory.c
-   :export:
-
-.. kernel-doc:: sound/core/pcm_memory.c
-   :export:
-
-.. kernel-doc:: sound/core/init.c
-   :export:
-
-.. kernel-doc:: sound/core/isadma.c
-   :export:
-
-.. kernel-doc:: sound/core/control.c
-   :export:
-
-.. kernel-doc:: sound/core/pcm_lib.c
-   :export:
-
-.. kernel-doc:: sound/core/hwdep.c
-   :export:
-
-.. kernel-doc:: sound/core/pcm_native.c
-   :export:
-
-.. kernel-doc:: sound/core/memalloc.c
-   :export:
-
diff --git a/Documentation/sound/kernel-api/alsa-driver-api.rst b/Documentation/sound/kernel-api/alsa-driver-api.rst
index c8cc651eccf7..d24c64df7069 100644
--- a/Documentation/sound/kernel-api/alsa-driver-api.rst
+++ b/Documentation/sound/kernel-api/alsa-driver-api.rst
@@ -132,3 +132,4 @@ ISA DMA Helpers
 Other Helper Macros
 -------------------
 .. kernel-doc:: include/sound/core.h
+.. kernel-doc:: sound/sound_core.c
-- 
2.26.2

