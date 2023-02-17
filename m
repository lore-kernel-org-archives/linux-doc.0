Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4595C64EC4
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 13:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjBQNuP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 08:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjBQNuA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 08:50:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F4E604F7
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676641728;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d5/2RnRF2JWHGpr9RK4XcaUSwl3Atw4selg5mVgZ4/g=;
        b=FPTy6rOidvU//z9jhStEcDnYX/OXv5VpLvcEi7lg+IvNTBg9wKtlsZkJ+a3pqPKvu/oLDA
        6CT1H+S65eKrJw1hvUHRbP2ePMPbOqHGOL7pehW+TxvxE3kOEFpjfz4hSn0TeK8InUgUPM
        PESuhjfkCENjDXyZV3CwZcYxvC+xJZc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-PiCgLFxMN-6jaqJd3fHG0A-1; Fri, 17 Feb 2023 08:48:47 -0500
X-MC-Unique: PiCgLFxMN-6jaqJd3fHG0A-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640235d400b004a26cc7f6cbso1756650edc.4
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5/2RnRF2JWHGpr9RK4XcaUSwl3Atw4selg5mVgZ4/g=;
        b=vyCfspxOk0rxyNVCkhg51pwz5p8zI9vl0GrgvFBYcwRXDDTa3sli1kmLzKW0GdJ6zq
         40JzkbUS6IkEhT7Tp0kMSPrrEDiIdLoEYGkvan01oIGgV8MwvSxCZNRf6QDVRDNTlxQU
         4VBvc66OSuYEucCqqyDmKFldKj8gt/YOuKHVnlqFj+xiOFzI+RZIb1zTqjiXU6HOe5sd
         c9eNMxMxdo7Tx3PW2o0b0d2Q3hv4L3oc+0mQZ4BZ1KAy9XbtHz83KbJDmmGHObuzJwx3
         OGHSf+kqWHlBWx/S62dEOr/flKe8HD9C07cFkJv5Off+zMBGwcM/KUnQO4Ye2ymEaFR9
         6edw==
X-Gm-Message-State: AO0yUKXxOViJQL110qp2ztQ1FPVRNO9hISuEM5qpLury8X99XC1pV1RJ
        OihJkrrEn9tOAieCHw5n5ke4uUNFBCso5QJ+hx+N+Fb7iYB3a3hCtHxX+WUxaW15n5HmqM04ctU
        YG0QFFmbBNWTmVIrKHgdp
X-Received: by 2002:a17:907:72c1:b0:8b1:7569:ad58 with SMTP id du1-20020a17090772c100b008b17569ad58mr4848779ejc.2.1676641726460;
        Fri, 17 Feb 2023 05:48:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8dScSkWfRlq0RX8QSswoAOat82FsG+rCLCZ5wYVMw47uLr1CKX3blizMd0kItf9w+BCuGUrQ==
X-Received: by 2002:a17:907:72c1:b0:8b1:7569:ad58 with SMTP id du1-20020a17090772c100b008b17569ad58mr4848763ejc.2.1676641726232;
        Fri, 17 Feb 2023 05:48:46 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id l21-20020a50d6d5000000b004aab36ad060sm2302248edj.92.2023.02.17.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 05:48:45 -0800 (PST)
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
Subject: [PATCH drm-next v2 11/16] drm/nouveau: fence: fail to emit when fence context is killed
Date:   Fri, 17 Feb 2023 14:48:15 +0100
Message-Id: <20230217134820.14672-6-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
index ee5e9d40c166..62c70d9a32e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -226,6 +227,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
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
index 0ca2bc85adf6..00a08699bb58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -45,7 +45,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.39.1

