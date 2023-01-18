Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6842C32793
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjARG3P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjARG0i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:26:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74228552AE
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VHl/4diKtyJnEE11WWdgE7GtYAgDLsei1RwmYtZIKRg=;
        b=WQ0V9+KW6VMn0ifr33bQKJq0glGdLjCYvkPabaE/d7GNcdXQ5nT1+NKBwDABRTO7v1Ev7J
        bmVNrtwFkj9BkXTcy77wUZk7N80I66VbWGLi5OOznpVCV9PDIAPg0fFezzVIIHwjYxuryf
        wksqYH568um1VSSvhkXW/UEmZSrKpdU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193--V7DL1q4PpOBzYA3EGlLnA-1; Wed, 18 Jan 2023 01:14:24 -0500
X-MC-Unique: -V7DL1q4PpOBzYA3EGlLnA-1
Received: by mail-ed1-f71.google.com with SMTP id w18-20020a05640234d200b0048cc3aa4993so22764025edc.7
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHl/4diKtyJnEE11WWdgE7GtYAgDLsei1RwmYtZIKRg=;
        b=vD5feRQJAMU2CyYe1rI/DHvE5DFVLc3LJlVXrz/7bcocFCMXVKOT2AeUlwukiyVhYj
         Shv4mKJ5x7ijaY2QbTtanTWzmsEuG15Xt8Nz8tnTVPlrjVL9Ysi2C75uyjLDM6nmdbOc
         no4BFQuF4OT2QUWkIiKQq4CtBh2gJv9IkkDjSOnwMITJIgimnzZZ/4EtKxfXyMbpNWDU
         55fpt0O0K7JPrdFHVSJGU+8SR9VAFpXGxEVw8CYCoFNObv7OjTdTEiCY7WBY2rcz0U3L
         Pt1eq/XOF3jWUecf4uWB45xTVgkABXEnbzfU0qo7fpxqf/VroVoMVWV/3pwj0L+DsQMY
         nrhg==
X-Gm-Message-State: AFqh2kqfHhoZObs3apBd6lzgiOP4imLeqKH0nlqL1nZPSOx/m1oRlSjq
        Ob7AqewfJotp+lhq4pk2XSCrboO+d84zQT8VsjFsgEd1inRmuC/VuOSkUnY1IIvMB6Ghci+gech
        WkkHRbXbKOhUizpx/PW4m
X-Received: by 2002:aa7:c1ce:0:b0:49e:89e:3b36 with SMTP id d14-20020aa7c1ce000000b0049e089e3b36mr5877843edp.30.1674022462952;
        Tue, 17 Jan 2023 22:14:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRQZOK3N/r5iyFAQ3K40aM3jSUaK6Mlg89vmZUZhLYBBDqIPzyzq48oNYdtZTi8SPf5PDyyg==
X-Received: by 2002:aa7:c1ce:0:b0:49e:89e:3b36 with SMTP id d14-20020aa7c1ce000000b0049e089e3b36mr5877825edp.30.1674022462771;
        Tue, 17 Jan 2023 22:14:22 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14105071ejh.0.2023.01.17.22.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:14:22 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 14/14] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Wed, 18 Jan 2023 07:12:56 +0100
Message-Id: <20230118061256.2689-15-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide the driver indirection iterating over all DRM GPU VA spaces to
enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 2a36d1ca8fda..7f6ccc5d1d86 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -202,6 +202,29 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
 	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
 }
 
+static int
+nouveau_debugfs_gpuva(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_cli *cli;
+
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry(cli, &drm->clients, head) {
+		struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+
+		if (!uvmm)
+			continue;
+
+		nouveau_uvmm_lock(uvmm);
+		drm_debugfs_gpuva_info(m, &uvmm->umgr);
+		nouveau_uvmm_unlock(uvmm);
+	}
+	mutex_unlock(&drm->clients_lock);
+
+	return 0;
+}
+
 static const struct file_operations nouveau_pstate_fops = {
 	.owner = THIS_MODULE,
 	.open = nouveau_debugfs_pstate_open,
@@ -213,6 +236,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.39.0

