Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB26BEB64DD
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 16:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbjHCQyk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 12:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbjHCQye (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 12:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E72A3C31
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691081606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3/Zpw+2MU6XUCAHE50I7yBNOwDhyXO7cbbEk9lEH2AQ=;
        b=R88WvvnH6evsVnJKMLz2Hgaipv8eXbrqk7xYfAhgqGU9FepvSo50ErvBwjYh65zal3eGt2
        Xy00UtIPUzGnlRy5oRoJEfeDwJURjMZwmg6x0roOOAOE2yttOy5vSQiSdS8DC1+tMPyIml
        tSnTnUXT/jmMnQGK+WyVXwMD6h5ODGw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169--3ZDb2CjMmGKYkS0XU4VQg-1; Thu, 03 Aug 2023 12:53:25 -0400
X-MC-Unique: -3ZDb2CjMmGKYkS0XU4VQg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99c03869a67so76670166b.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 09:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081604; x=1691686404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/Zpw+2MU6XUCAHE50I7yBNOwDhyXO7cbbEk9lEH2AQ=;
        b=MIMXVi15jRvB60pd8FgobcMGIu25zmYHwHz2ed9ufNO5IJMDrWoOQJtJ4ymmbzhFSm
         BlJw3etrgQVp/gT4kdAzSY/XGdNtyLuDmcpHiVECxblj5Q+cmELWfBe8sy66D2JXCYU1
         Wg1mS+Ms0Uz8neBAtUE/ni83O7Jiw09qPh3ZX9av322hXxXZ0Z7BBljiBBXCApdi/JEf
         xNpYapScbYEvTN2jB8aDySjG+fq43y7yOEB1GZ0c8lPspL5NrWNDhVRMmO36ERax0t9B
         SgTKAh+ecrwHWQeF7hB5loOVcs1aJPkQCL8mUVwczNQbZvJ6uCFg0mxeim248qsULtUS
         Rw5w==
X-Gm-Message-State: ABy/qLYh5lUK2R5wfQTQ/Yy3Xmm34JfV+Hu5cggykshOyrzDXuGzAfJZ
        dca92NHwsrhvBS5Gh/PqX7hhthZYKeaWqpUgUu0+Z4GUNNcqmSKcBM1G9X/oVdVspfpAH6l3XVu
        DSyvMh9caeS+YI7emABHe
X-Received: by 2002:a17:906:845c:b0:99b:cb7a:c16e with SMTP id e28-20020a170906845c00b0099bcb7ac16emr7448809ejy.33.1691081604097;
        Thu, 03 Aug 2023 09:53:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFZrPM/Z+NwyCEwlAbDew09S3+m62aBBypP+UWOWz3PIZn/Ob9wE8kk/J55Vhq3fgGvTHyc3w==
X-Received: by 2002:a17:906:845c:b0:99b:cb7a:c16e with SMTP id e28-20020a170906845c00b0099bcb7ac16emr7448793ejy.33.1691081603958;
        Thu, 03 Aug 2023 09:53:23 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ka21-20020a170907991500b009882e53a42csm70527ejc.81.2023.08.03.09.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:53:23 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-misc-next v9 08/11] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Thu,  3 Aug 2023 18:52:27 +0200
Message-ID: <20230803165238.8798-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting fences.

If a job times out, we need a way to recover from this situation. For
now, simply kill the channel to unblock all hung up jobs and signal
userspace that the device is dead on the next EXEC or VM_BIND ioctl.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 14 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index f69be4c8f9f2..1fd5ccf41128 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -40,6 +40,14 @@ MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
 int nouveau_vram_pushbuf;
 module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
 
+void
+nouveau_channel_kill(struct nouveau_channel *chan)
+{
+	atomic_set(&chan->killed, 1);
+	if (chan->fence)
+		nouveau_fence_context_kill(chan->fence, -ENODEV);
+}
+
 static int
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
@@ -47,9 +55,9 @@ nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 	struct nouveau_cli *cli = (void *)chan->user.client;
 
 	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
-	atomic_set(&chan->killed, 1);
-	if (chan->fence)
-		nouveau_fence_context_kill(chan->fence, -ENODEV);
+
+	if (unlikely(!atomic_read(&chan->killed)))
+		nouveau_channel_kill(chan);
 
 	return NVIF_EVENT_DROP;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index bad7466bd0d5..5de2ef4e98c2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -66,6 +66,7 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+void nouveau_channel_kill(struct nouveau_channel *);
 
 extern int nouveau_vram_pushbuf;
 
-- 
2.41.0

