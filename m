Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A275BEB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjFSJ32 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjFSJ2y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 05:28:54 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03771997
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 02:28:13 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f90bff0f27so8775835e9.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687166892; x=1689758892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA34cT4O/DXGv9/GJqnDQidBqlMmaRaNZTidmNryGbQ=;
        b=w1lMpVnzGPEeaVoIe3PsoD5fTjDDyaHreFR7Forr8A4oYjlT1wyEkhpK++erSgJmsD
         YwutxvLhitQEhSImbwzmKqIsux+0pLklHXfw3XNftBpEd+rbwb9MR26+tyEi9fFprn6v
         Bwl0YL/nZIsYHPK5TzjhhoE98dYebqQ/s2pGujy5EjS1yFntMKKjonm/L8TOcdsdvNub
         C77gCrjY4W9Gz/J/hVOK7JafXsgCaXImpSlW5SHGh8EmWsKEgnPR6gZd1ZKjGjU585e8
         9udrPVPdIpwzslq8TPpDRh9c97VMMghUBVlezwYricz7zfG2u0sKoC9q5bQT3I5FCC2A
         ggLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166892; x=1689758892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MA34cT4O/DXGv9/GJqnDQidBqlMmaRaNZTidmNryGbQ=;
        b=FscoAshCk9RigopGQKgt4eJ2SMGwidLlrcJ40pi6sCr8aKM018LrZzYr0R2E5h8lVU
         cfAowR2nNFr3MkNCpepYZngkbpp4ji0m0A0/BklABthPRbzEFy8e2CD66nE/Rv5k/t0r
         W38boe7g0WEAR0FrYfgjE+ewBKKr+h+TE5JdqhzTuTMqnOM4DgDlMvlYDhavpyH9Ex+Z
         dIdaEK2EIIWGKU+aMTRidb2+mERQiaMCovVhRjcLqNLP2/xgZKcc8KFsOEJPBGBUWUR/
         km8pI+LzTH7bSY/chk1yea0Hlsoh4IJBzu8TT7IYtuMxNoSbXm2OeaaNwYJjbDFuz4fN
         eM0w==
X-Gm-Message-State: AC+VfDyeHISUjCX/ZRIrN+i5I3sxt7JGQfr/CzCbeyCEBqps77f8SM3F
        bs4yWpVVutdIgvAkZbZj3ArpFQ==
X-Google-Smtp-Source: ACHHUZ5PIbm8h7cKrZMFoFsbGK9F8BONiHNOCufZZkdH5bY/DzzunLcti36p+dvVlrUIB6I+pn8RAw==
X-Received: by 2002:a7b:c449:0:b0:3f4:a09f:1877 with SMTP id l9-20020a7bc449000000b003f4a09f1877mr5725214wmi.23.1687166892067;
        Mon, 19 Jun 2023 02:28:12 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003f908ee3091sm5453846wmi.3.2023.06.19.02.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:28:11 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com
Cc:     corbet@lwn.net, alsa-devel@alsa-project.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_plai@quicinc.com, quic_mohs@quicinc.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3] ALSA: compress: allow setting codec params after next track
Date:   Mon, 19 Jun 2023 10:28:05 +0100
Message-Id: <20230619092805.21649-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For gapless playback it is possible that each track can have different
codec profile with same decoder, for example we have WMA album,
we may have different tracks as WMA v9, WMA v10 and so on

Or if DSP's like QDSP have abililty to switch decoders on single stream
for each track, then this call could be used to set new codec parameters.

Existing code does not allow to change this profile while doing gapless
playback.

Reuse existing SNDRV_COMPRESS_SET_PARAMS to set this new track params along
some additional checks to enforce proper state machine.

With this new changes now the user can call SNDRV_COMPRESS_SET_PARAMS
anytime after setting next track and additional check in write should
also ensure that params are set before writing new data.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v2:
 simplified the logic to allow set_params and udated the documentation accordingly

 Documentation/sound/designs/compress-offload.rst | 11 ++++++-----
 sound/core/compress_offload.c                    |  5 ++++-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index 935f325dbc77..655624f77092 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -268,11 +268,12 @@ with setting of meta_data and signalling for next track ::
               |                              |
               |                              V
               |                         +----------+
-              |                         |          |
-              |                         |NEXT_TRACK|
-              |                         |          |
-              |                         +----------+
-              |                              |
+              |    compr_set_params()   |          |
+              |             +-----------|NEXT_TRACK|
+              |             |           |          |
+              |             |           +--+-------+
+              |             |              | |
+              |             +--------------+ |
               |                              |
               |                              | compr_partial_drain()
               |                              |
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 243acad89fd3..30f73097447b 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -589,7 +589,7 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_params *params;
 	int retval;
 
-	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN) {
+	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || stream->next_track) {
 		/*
 		 * we should allow parameter change only when stream has been
 		 * opened not in other cases
@@ -612,6 +612,9 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		if (retval)
 			goto out;
 
+		if (stream->next_track)
+			goto out;
+
 		stream->metadata_set = false;
 		stream->next_track = false;
 
-- 
2.21.0

