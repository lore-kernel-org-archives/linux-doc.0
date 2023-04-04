Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667A5C76188
	for <linux-doc@archiver.kernel.org>; Tue,  4 Apr 2023 01:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbjDDB2t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 21:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbjDDB2p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 21:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5207AB8
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 18:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680571676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qy5D/ZZ0dwag1BT8hM3evEqOdQXhrzVTN7mL8aXSMGo=;
        b=bUxs+PFGo4AlzpQjpN8Wql3VNehMvI6WPQLFoa+Wyc1AyjN9TtIS4O3X9JCei27gYG2lao
        2IKQlC9v3Ha3bTLUrBb4WvH2ukgB2KvTPj7q/hj0hBOwQhmVOgYbw9a+9DBtHWFGcCH2K8
        l5rb2yfpk7C2KOp06wvXtdcvebZoQK4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-LxvHABNEOGS1aPoSdT1FEQ-1; Mon, 03 Apr 2023 21:27:55 -0400
X-MC-Unique: LxvHABNEOGS1aPoSdT1FEQ-1
Received: by mail-ed1-f70.google.com with SMTP id v1-20020a50d581000000b0050291cda08aso10028378edi.15
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 18:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680571674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy5D/ZZ0dwag1BT8hM3evEqOdQXhrzVTN7mL8aXSMGo=;
        b=0e+NbQB7U2bDQ0OTK2xCAw+bZr5JVxZQsAPD1cnrmhsVoRvDmbN7OkQuN9Doaq/lTV
         3Mo3S8qDNBJOJJvTgvKoQZwzv0AqSHSyyMzsI09jOwDDyaXsf7PpiG0Hh18ny9IaQQr+
         tOCrtEYQZCkAamdxOe7b3e3Xo3he7Ze5IG7xi0cd9IlthsTucXWucEPNdwkBBNGtzbPN
         RJcL07KszprDLVZGDDh6zEgIU4bdJRjVY2skVG9E9ge/zYikHeNoyeHc7OPm/K5Fs9uj
         lo82c/zLxFzkIAdgIfvsyqbEoeuYgkS3FW0qFB6NuljWUaIrxjV1BszQaVp/bhuMnOiK
         CV7Q==
X-Gm-Message-State: AAQBX9eEfk5fhTuYKxfZXYLvDvFHrGid5xccoKdLe33hvFZ/ahjAdC1r
        h417jZ1qIgzUR7kMlcvpXMSHciONVOLwp0jUmGLoywhSGRO2mUCql+mhuImUBnl2qJwWUToM2Up
        7ue4mEe4nF+nRhUTiRoIk
X-Received: by 2002:a17:906:4dc1:b0:8b0:ad0b:7ab8 with SMTP id f1-20020a1709064dc100b008b0ad0b7ab8mr537812ejw.14.1680571674351;
        Mon, 03 Apr 2023 18:27:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYg00eHiyswbtoLlF56sjeND5GW8MPldJF2FDkJFmQJWCtDChMw3C466wihCFb4E1/7woEmA==
X-Received: by 2002:a17:906:4dc1:b0:8b0:ad0b:7ab8 with SMTP id f1-20020a1709064dc100b008b0ad0b7ab8mr537795ejw.14.1680571674124;
        Mon, 03 Apr 2023 18:27:54 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id mh13-20020a170906eb8d00b00931024e96c5sm5222682ejb.99.2023.04.03.18.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 18:27:53 -0700 (PDT)
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
Subject: [PATCH drm-next v3 02/15] drm_exec: fix double dma_resv unlock
Date:   Tue,  4 Apr 2023 03:27:28 +0200
Message-Id: <20230404012741.116502-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index df546cc5a227..f645d22a0863 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -62,7 +62,6 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	}
 
 	if (exec->prelocked) {
-		dma_resv_unlock(exec->prelocked->resv);
 		drm_gem_object_put(exec->prelocked);
 		exec->prelocked = NULL;
 	}
-- 
2.39.2

