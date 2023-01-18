Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032CBC004D4
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjARG2Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjARG0I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:26:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CC154B0C
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=arClRUS1jAAdkcFM0OKNg8mvWVVAlTJxmoO3YVnMeNE=;
        b=gTlHuCKe8kzhTdtVTJsOsJGAARoAYEsyZ4lLgWxr0s7BAvi6xVrhYPxvNJNrAIc/9gwaZG
        qYmAjgGNMPGesQ+dI5taifqgn99SRKwhzsBp9CrAKTc8+/WDfl19/bTLXSSMFUt3tiooIh
        QdrOi7+cf+mxdGnWVKTLPAHsneg//7g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-LwAaPeATOmOjqmDY0SXO7g-1; Wed, 18 Jan 2023 01:14:06 -0500
X-MC-Unique: LwAaPeATOmOjqmDY0SXO7g-1
Received: by mail-ej1-f72.google.com with SMTP id nc27-20020a1709071c1b00b0086dae705676so6919935ejc.12
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arClRUS1jAAdkcFM0OKNg8mvWVVAlTJxmoO3YVnMeNE=;
        b=Ejxh69iIQVmnfldWU/x7ljl4H89TOk7+sbsiOglwmcVlF84xgbXWdyCAnjlPrqZAFd
         bQAV78Us34G6pyE+AA9E8rBpDX567Us0775PPO+ZaTL1wVmcMPF08hbmMMCi4DUq+x6H
         NImSjHqs5kzqQczxoElS0z2tpqLKIrxnAuDA/2c2ysvMljaXeqcfITf+euWRyhYP2oW+
         gcDD9a57TVGgael4IHD/2IPf4cWsOHJJDFZjjbcDWKJNPRrO7zuXPAHAjJ4Pul8iNSQw
         uUUT7Y3JAPiR4q7QA0ULPYJFdY06qtUNMWiQdTxScSu3alatxXZXtSInDhhTXNaQSBWT
         Braw==
X-Gm-Message-State: AFqh2konFE/rzihFtG3poYDlyzVtn9W4ggm/k+yF28vwJXbc4GjyWfU9
        P9zIWzO/ancuBJGdK+r3YNIZUcswhuSH6VHBrWnc7dnR/U6crTBVUaN1OtsKgSxrlwVSDSvFteK
        pQVQbeXgxK5vw5SSh/T3F
X-Received: by 2002:a17:906:d971:b0:870:7e7d:97a7 with SMTP id rp17-20020a170906d97100b008707e7d97a7mr5281480ejb.72.1674022445709;
        Tue, 17 Jan 2023 22:14:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvpsASk83uq4IIpUYeM6NlUZGHTvMFacGsEyh3xonT5oiC/C+OajcLwYQPPr8OmFy9NfpFhjQ==
X-Received: by 2002:a17:906:d971:b0:870:7e7d:97a7 with SMTP id rp17-20020a170906d97100b008707e7d97a7mr5281469ejb.72.1674022445535;
        Tue, 17 Jan 2023 22:14:05 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14066480ejf.62.2023.01.17.22.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:14:05 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 10/14] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Wed, 18 Jan 2023 07:12:52 +0100
Message-Id: <20230118061256.2689-11-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
index 1068abe41024..6f47e997d9cf 100644
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
2.39.0

