Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31225C05027
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 13:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjBQNpn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 08:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjBQNp2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 08:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982AB13519
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676641479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7uKZrgGFJpURUNNqYPRQvVp3RBdWsUReZR9Qa+W+o5s=;
        b=BNUcM6POrJG74JL6p38XolGt+ycNnXKd0YIX+BflxiyUJ3YHnbPI8+pLq6T2z0bmii5OSu
        T+hYxR683U+lcnetgEsI2gROjRggvDErFRMaT0KALxjGqjvqV/BrIfQ2Ig4oNxlASf04HY
        xwaXCUgL9iYyPSl4ZN1CfA/4A3ITdcY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-vpzYIFF_M7G_mNhpp6x4GA-1; Fri, 17 Feb 2023 08:44:38 -0500
X-MC-Unique: vpzYIFF_M7G_mNhpp6x4GA-1
Received: by mail-ed1-f69.google.com with SMTP id w11-20020a056402268b00b004accf30f6d3so1841520edd.14
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uKZrgGFJpURUNNqYPRQvVp3RBdWsUReZR9Qa+W+o5s=;
        b=fxo2xq/dSe3mPGLbg1u74jQnJvs/PEt5Poo1OWXooHe3yh363PwAGE7/X2EMXiq9kq
         /vRS1YRcobS89B5FUXr0dA0Rk7bpuu71aCtNZoj0bTJMJtd6b63flij3fJPnmo+cNDF7
         UnyjJXmKiH8pPchN0Kr85tfAaj9QnkwQUZ7e+WN/3IjfroGrukKMYt1vzVihCY/2+d5v
         mKKYHxMm/oYNFXL4cudayfRLs+/yJDtK6Wg1/DDaw72GIcxXe7CSS7IBNPrPsiVE2joP
         Wh/l9r31z25oX8SJv7T5ySdCF3fzHSl5cte0aKYKD0InxwhTNVdIrpVfu3jP3CADgIUH
         WGFg==
X-Gm-Message-State: AO0yUKUyk4qwnM5mB5T/3q7khXpgh3qMgzT+97p+Svij8u2EacNH2C8c
        4X9h88JxXOESx+FiqTG+UfykKg8kHnS0jg+2q265hZFeyBqU0z9zJjLJE3XGMblykrNHxiB1A7A
        JuRHBTZ4ziolSFlAf6Lzx
X-Received: by 2002:aa7:c9c6:0:b0:4ae:e51e:9e3e with SMTP id i6-20020aa7c9c6000000b004aee51e9e3emr348798edt.24.1676641477313;
        Fri, 17 Feb 2023 05:44:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9IRUJksGLLW/RDiXSfuPpHSO6kl3p0Lri0OcDeobF/5J+q0ZakgTJZKlO0HFr6pr+zDCdPAg==
X-Received: by 2002:aa7:c9c6:0:b0:4ae:e51e:9e3e with SMTP id i6-20020aa7c9c6000000b004aee51e9e3emr348775edt.24.1676641477173;
        Fri, 17 Feb 2023 05:44:37 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id u8-20020a509508000000b004ad61135698sm1948004eda.13.2023.02.17.05.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 05:44:36 -0800 (PST)
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
Subject: [PATCH drm-next v2 02/16] drm/exec: fix memory leak in drm_exec_prepare_obj()
Date:   Fri, 17 Feb 2023 14:44:08 +0100
Message-Id: <20230217134422.14116-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Don't call drm_gem_object_get() unconditionally.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index ed2106c22786..5713a589a6a3 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
 			goto error_unlock;
 	}
 
-	drm_gem_object_get(obj);
 	return 0;
 
 error_unlock:
-- 
2.39.1

