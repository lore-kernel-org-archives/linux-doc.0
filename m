Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D72C7EE45
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 22:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239954AbjFFWdZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 18:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239921AbjFFWdK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 18:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CDD173C
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 15:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686090744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
        b=QGIuLAXzCtm4dFIs3Y/6XTe4FxZMBf6q6yQMirblpoWxxgI0wIfOgT8vqFaf50y5zXLOpV
        6RNA0MH9p+iYp+qWzNy/f57rB2OMXDk/577UTic4+MoLXVx69DUOgevWwc199o4okC99tJ
        gHncqov+inNErrjF48kaQkUH/dlEMzc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-1y1B1M-fPCqjLZZHOfOrSA-1; Tue, 06 Jun 2023 18:32:21 -0400
X-MC-Unique: 1y1B1M-fPCqjLZZHOfOrSA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-977cb73efe8so298689266b.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jun 2023 15:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090740; x=1688682740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
        b=CUMP0PFp6DD/qSsTvMklH7at7HEpW4e5LBSQWsCpQ/MsIoYGg/8WfY/54idXLGxuPp
         sdJkU3Z1vjGxxyHbxl8czYffBSXpF0jb4ilI79daRcknPldCovwjSI2H2WHKsIN2fA/p
         l+nlTM9iwx2msyUaV/RkxtYMwxS7M47ftsH4pdlemRqQ00zUaLtMSh+Fj+FSQO7/4qLc
         qX1JC42h0FCni8Bwcnv/SnrfuinKUOnjOyLSrn+sRAexUpulZZgSsukLxsnzsY3F41mD
         TVpwE/FTt2nI2XGpdMGEob/931tZ45FjSXREjxTCyPz+3Xn84tQKhP1Ojs8HZWaYdBqg
         3qKQ==
X-Gm-Message-State: AC+VfDwjmzgYviRab3aHPoOBLWqGNSrayqNw+2J30CYL7CchCi33WBTu
        ObgK3/jDmgDYUezmcyEDyIcx/QYBslVrtEkTg2L0uhmm2Bx+6n3ubtLnuT9Taa0b4Ub9+YSFd5r
        tqBLR5b6/tMWsIwMgmzOd
X-Received: by 2002:a17:907:d1a:b0:974:419d:7847 with SMTP id gn26-20020a1709070d1a00b00974419d7847mr3616089ejc.71.1686090740773;
        Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4c77MVfNEYeE8GhdIDJycSs/OSi0sKY1h3c6R7iuE+ANA00tKPgkq6qTOt3RlMI31QUCDJhQ==
X-Received: by 2002:a17:907:d1a:b0:974:419d:7847 with SMTP id gn26-20020a1709070d1a00b00974419d7847mr3616072ejc.71.1686090740566;
        Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id bg11-20020a170906a04b00b0094f282fc29asm6060829ejb.207.2023.06.06.15.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v4 10/14] drm/nouveau: fence: fail to emit when fence context is killed
Date:   Wed,  7 Jun 2023 00:31:26 +0200
Message-Id: <20230606223130.6132-11-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting
fences.

If a fence context is killed, e.g. due to a channel fault, jobs which
are already queued for execution might still emit new fences. In such a
case a job would hang forever.

To fix that, fail to emit a new fence on a killed fence context with
-ENODEV to unblock the job.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 7 +++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index e946408f945b..77c739a55b19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -229,6 +230,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 		dma_fence_get(&fence->base);
 		spin_lock_irq(&fctx->lock);
 
+		if (unlikely(fctx->killed)) {
+			spin_unlock_irq(&fctx->lock);
+			dma_fence_put(&fence->base);
+			return -ENODEV;
+		}
+
 		if (nouveau_fence_update(chan, fctx))
 			nvif_event_block(&fctx->event);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 7c73c7c9834a..2c72d96ef17d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -44,7 +44,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.40.1

