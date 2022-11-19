Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C978C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 19 Nov 2022 08:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiKSI5m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Nov 2022 03:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiKSI5j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Nov 2022 03:57:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81809E086
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668848203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mH+aNM2CVMwH3fEpJlA6Odig9WHLu4rdFuKDTlmn9xw=;
        b=L3QTLpmlYzgqA0rH6bQNF2uRYhGycwoEvwAVAC0vvcKi11gvATQDWdvIZsXEuq/DrK5UfM
        VTN59vVcMuRpAOd8OlzVDklaEn+e7ODTu49C1sFwDhwNzpIBMnyV3xFL8MLhgTWO+f4oo3
        ZBdvL7TOQC7AMAWg1PgdnyPFkLDvFA4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-iil2zpqTNbizPpRhMpve7w-1; Sat, 19 Nov 2022 03:56:41 -0500
X-MC-Unique: iil2zpqTNbizPpRhMpve7w-1
Received: by mail-wr1-f72.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso2074566wra.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH+aNM2CVMwH3fEpJlA6Odig9WHLu4rdFuKDTlmn9xw=;
        b=dwIaLvvw7m9GA6qaUCH/uzbJs0m0eeW2Yyyb0H0Q+rmjgEY5OwedqxjWNAcrE/hauV
         w6uEMuZB0toBn5fP0UsNSgUF4+n9dYx1cBzFSNLjURv00uHo5fStjflW3QEfS2Spl0pz
         G09qf0ZdDrrnXkTr/wArZWOkAIOBDHFhPzVpKtXNuIBUMRniBMvtfp5wsulCWV6cWs/9
         dUNPOHhK8itBb2djvo1v2dsK4Ayx7szdZZc6kvKXBgSY+mVkJk2UAsYUcqGuOxf3mCaL
         vmTRIrO4x8mAFgym/Vu1nMWRjp3jI2Y1mBchmUd2+SS3zOhcimMxT75BBakuLCj47/qH
         U7PQ==
X-Gm-Message-State: ANoB5pnxLwsUTU8AmJqzl+gxx8+kN+Cc6QSNa2pqmG/goOcZFubT0vK8
        Bh4jtJkLvSgUjqWuFYD7QA7FvJpmre6w7lhnfywX3zewK5lGcB5WdXUWSjvHck7pHIj2i8sMRtY
        BFXi9Bf9jXZQzNucfQ3G/
X-Received: by 2002:a05:600c:688:b0:3cf:a18d:39a4 with SMTP id a8-20020a05600c068800b003cfa18d39a4mr6918238wmn.125.1668848200569;
        Sat, 19 Nov 2022 00:56:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qupPcZoq50xJgdSZoP+qL0pA/oAKL+yADqU3RoWWkP/e/BZHdbrcFH9iAJ2xEEvIoj2TvWg==
X-Received: by 2002:a05:600c:688:b0:3cf:a18d:39a4 with SMTP id a8-20020a05600c068800b003cfa18d39a4mr6918229wmn.125.1668848200359;
        Sat, 19 Nov 2022 00:56:40 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id fc10-20020a05600c524a00b003cf9bf5208esm12708160wmb.19.2022.11.19.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 00:56:39 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Sergio Lopez Pascual <slp@redhat.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 1/2] KVM: Mark KVM_SET_MEMORY_REGION and KVM_SET_MEMORY_ALIAS as obsoleted
Date:   Sat, 19 Nov 2022 09:56:31 +0100
Message-Id: <20221119085632.1018994-1-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Other ioctl such as KVM_ARM_SET_DEVICE_ADDR have a (deprecated) next to it
which makes it easier to determine that is deprecated. Do the same for the
ioctls that have been obsoleted.

Suggested-by: Sergio Lopez Pascual <slp@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/virt/kvm/api.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index eee9f857a986..c17bac32d25c 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -272,7 +272,7 @@ the VCPU file descriptor can be mmap-ed, including:
   KVM_CAP_DIRTY_LOG_RING, see section 8.3.
 
 
-4.6 KVM_SET_MEMORY_REGION
+4.6 KVM_SET_MEMORY_REGION (obsoleted)
 -------------------------
 
 :Capability: basic
@@ -368,7 +368,7 @@ see the description of the capability.
 Note that the Xen shared info page, if configured, shall always be assumed
 to be dirty. KVM will not explicitly mark it such.
 
-4.9 KVM_SET_MEMORY_ALIAS
+4.9 KVM_SET_MEMORY_ALIAS (obsoleted)
 ------------------------
 
 :Capability: basic
-- 
2.38.1

