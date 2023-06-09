Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF71C83005
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jun 2023 15:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240896AbjFIPFA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jun 2023 11:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241762AbjFIPEw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jun 2023 11:04:52 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB9E35A3
        for <linux-doc@vger.kernel.org>; Fri,  9 Jun 2023 08:04:26 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f7fc9014fdso14224175e9.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jun 2023 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686323065; x=1688915065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WGZ/ed2vrJ5KRXftei7L+b/a8JlbJSLWIRO6uJ+BPA=;
        b=mgm79aK5ZEyzsjL4fshBGIDqime5sfPSyhoXjr89GPPJML5PZXLCSy2RCsJHtbQVoc
         joZsRl99ZwtTpryeLpdTql1KIdb+cwSF7FLYE8E1ut+OeiHO0XFgsLoco3dSKa/guzRq
         +wSB5yi8UNqipIlEeUxnBtX2vpoUqwzYukPP9U2CA/OJFz8PoJ83g6D6hAk48fdjjn7W
         uPw8t8MMAsNb0OInvMc3lssBS93yN+0IwT06zsZALOCy3cbFC9l4zDMIQnKSb65UvTtN
         wq1TCSzd09ftW4qrg7rGlqfc37FNB0gWeTIsCq3Oz+t1ke8Uat1SrJevfsMmUA1fnAPh
         6NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323065; x=1688915065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WGZ/ed2vrJ5KRXftei7L+b/a8JlbJSLWIRO6uJ+BPA=;
        b=BrajidNp3Msx6YOAS4lpTZkCPyMNNg3jAvvoq2yZlfm/6ake7A4PtzUM0ngiD2rHbj
         vizjE72w1JUz+njb+x79bNU9Io6gcacKOf9nyDkZRc/s3HQQYBV29Ydx+I32DzXCzMU2
         h1FEcITMnH3FsLkRvtoD+gz1lOGxS5zeclUPHczcoxyJ22D9XbXa9fS5kDvDTjHYL42C
         jCnh7Ry7WVjPNHFLa5KsaRFVi//xuKpGZlAezSkwWgfvJK8J2OT2SRRr7XRYNpwYlHOG
         C1vWA8PStZEJXLjoPTUNIhthhRdfka5WW9UaoKVDbqTqTtyeMf9aSDsRm5yCGqX3pcQq
         a9zg==
X-Gm-Message-State: AC+VfDwoqfpIOtn3n4AMC+aW41DoqHtmDDZPmLbYEjRV2v1N6P75H4rp
        O2Go5QbsHKIvPOXv6tVmTxHiXg==
X-Google-Smtp-Source: ACHHUZ7eaW16qzdTf8udY5wHHza5lq/L2Y9Nr39LRq/YBL3Qd2LXZ9BnBUzkteeXGvdPFEbRzMo11A==
X-Received: by 2002:a05:600c:2212:b0:3f4:23b9:eed2 with SMTP id z18-20020a05600c221200b003f423b9eed2mr1198999wml.38.1686323064766;
        Fri, 09 Jun 2023 08:04:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bce0e000000b003f602e2b653sm2905098wmc.28.2023.06.09.08.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:04:23 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com
Cc:     corbet@lwn.net, alsa-devel@alsa-project.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_plai@quicinc.com, quic_mohs@quicinc.com,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] ALSA: compress: allow setting codec params after next track
Date:   Fri,  9 Jun 2023 16:04:16 +0100
Message-Id: <20230609150416.24525-1-srinivas.kandagatla@linaro.org>
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
Changes since v1/RFC:
	- removed introduction of new IOCTL, as suggested.
	- update the state-machine doc.

 .../sound/designs/compress-offload.rst        | 52 +++++++++----------
 sound/core/compress_offload.c                 | 10 ++--
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index 935f325dbc77..205cadcabe70 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -256,32 +256,32 @@ Gapless Playback SM
 For Gapless, we move from running state to partial drain and back, along
 with setting of meta_data and signalling for next track ::
 
-
-                                        +----------+
-                compr_drain_notify()    |          |
-              +------------------------>|  RUNNING |
-              |                         |          |
-              |                         +----------+
-              |                              |
-              |                              |
-              |                              | compr_next_track()
-              |                              |
-              |                              V
-              |                         +----------+
-              |                         |          |
-              |                         |NEXT_TRACK|
-              |                         |          |
-              |                         +----------+
-              |                              |
-              |                              |
-              |                              | compr_partial_drain()
-              |                              |
-              |                              V
-              |                         +----------+
-              |                         |          |
-              +------------------------ | PARTIAL_ |
-                                        |  DRAIN   |
-                                        +----------+
+                            +----------+
+     compr_drain_notify()   |          | compr_set_params() iff next-track set.
+  +------------------------>|  RUNNING |----------------------+
+  |                         |          |                      |
+  |                         +----------+                      |
+  |                              |                            |
+  |                              |                            |
+  |                              | compr_next_track()         |
+  |                              |                            V
+  |                              V                            |
+  |                         +----------+                      |
+  |                         |          |                      |
+  |                         |NEXT_TRACK|                      |
+  |                         |          |                      |
+  |                         +----------+                      |
+  |                              |                            |
+  |                              +----------------------------+
+  |                              |
+  |                              | compr_partial_drain()
+  |                              |
+  |                              V
+  |                         +----------+
+  |                         |          |
+  +------------------------ | PARTIAL_ |
+                            |  DRAIN   |
+                            +----------+
 
 Not supported
 =============
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 243acad89fd3..fe67228e74b3 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -294,6 +294,9 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_RUNNING:
+		/* Make sure next track params are set before writing new data */
+		if (stream->next_track)
+			return -EPERM;
 		break;
 	default:
 		mutex_unlock(&stream->device->lock);
@@ -589,7 +592,8 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_params *params;
 	int retval;
 
-	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN) {
+	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    (stream->runtime->state == SNDRV_PCM_STATE_RUNNING && stream->next_track)) {
 		/*
 		 * we should allow parameter change only when stream has been
 		 * opened not in other cases
@@ -615,7 +619,8 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		stream->metadata_set = false;
 		stream->next_track = false;
 
-		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
+		if (stream->runtime->state == SNDRV_PCM_STATE_OPEN)
+			stream->runtime->state = SNDRV_PCM_STATE_SETUP;
 	} else {
 		return -EPERM;
 	}
@@ -956,7 +961,6 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 		return retval;
 	}
 
-	stream->next_track = false;
 	return snd_compress_wait_for_drain(stream);
 }
 
-- 
2.21.0

