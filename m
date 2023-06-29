Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD363C0015E
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 22:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbjF2W3p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 18:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbjF2W3N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 18:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E2335B6
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688077661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
        b=hgXXfgEqBXToB0OXGRXAyUTiNhzjSralQLysO0xqL5rcbbwai1Zth/K1O85HUI+IxCw2/K
        h/GbSpo/5TcObxiKVqssgbf2rTKktAqAOyfVWNx++O/BwrP2uUYwRvhAvV+4ZXh4WKIObp
        k0kLp1BsPExLhZvlA4xK4wq37KUnWOA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-UXVIifYYOde1omBOytdjZQ-1; Thu, 29 Jun 2023 18:27:40 -0400
X-MC-Unique: UXVIifYYOde1omBOytdjZQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-313ded95aeaso1510960f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688077659; x=1690669659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
        b=jfjAeLJeTwit6Rzji6NiHOs78GAddy7ytKhQGJYyOyGUF3aAnuiecliFo8iXMK7hLi
         TtwC02Smh/MQY0HjISFVOh/VkEEM91FttCXzQVMwd0IEGxbWZlkcpFXWgChSkeHy3J4o
         zgvPQtIHbzNbboR96n0oFf9wnz26PkntjXZM1DpS2PyuvqZlmOTRn+Pvqx1OSOTPD5bt
         VGTBPxTNLJjKbp3Apq+mYCe7dt8nJDYzrsrUxDwin/63kt7zQ4xCYy4gNda/WLRPVRAH
         1UMdwBUJ5knVzw9ZLGLoaR6OtS/dL1Vj7b4A8ruDgxzq4IS4s6lELu1BVqP/G4+ClAmT
         Cudg==
X-Gm-Message-State: ABy/qLZ5NckHiuJhr+eiWorJAbj9tdpeju3Zkc0tWjSssdi/6WMLOR8I
        SRO2r2HCqB8S0I633A2HYZP7BWzqIurnKLqTwbtVYzFMGUryV5/iyrSWAFxDF7aHZoYakwaI6JH
        XUgCTH6zRQmxnq1nkDIZz
X-Received: by 2002:adf:f28a:0:b0:311:1568:1a27 with SMTP id k10-20020adff28a000000b0031115681a27mr722429wro.58.1688077659429;
        Thu, 29 Jun 2023 15:27:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGYb5Wgg/1T3gtMJf3AhAuqKo+DOyNfQQJbukx21HHyRFpotXA0HiBkab6nrmXgZEaQvmsoDw==
X-Received: by 2002:adf:f28a:0:b0:311:1568:1a27 with SMTP id k10-20020adff28a000000b0031115681a27mr722418wro.58.1688077659167;
        Thu, 29 Jun 2023 15:27:39 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d590a000000b002fda1b12a0bsm16983121wrd.2.2023.06.29.15.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:27:38 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v6 10/13] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Fri, 30 Jun 2023 00:25:26 +0200
Message-ID: <20230629222651.3196-11-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
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
index f47c0363683c..a975f8b0e0e5 100644
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
index e06a8ffed31a..e483f4a254da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -65,6 +65,7 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+void nouveau_channel_kill(struct nouveau_channel *);
 
 extern int nouveau_vram_pushbuf;
 
-- 
2.41.0

