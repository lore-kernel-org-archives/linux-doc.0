Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12D9C433FE
	for <linux-doc@archiver.kernel.org>; Sat, 19 Nov 2022 08:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbiKSI5l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Nov 2022 03:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKSI5j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Nov 2022 03:57:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E659A269
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668848205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dTnMAWMcXOaxFIQpcfG6YUPgYRs3mGJmNnh2pJlkTaQ=;
        b=ZGtVncCjD+C6ov1SM24yf80ykWk2EMw5+ymH7HKEYe+6cOihfIwVBx/vde5kNDnaT75qh+
        W/J/B9lS3aqavKKLpt+MvwjHVQjr/zZeTmZmZMUAUfQYIjaGZOKafMXcjDDpRNq12FJ9xb
        /ChvyX9z0jVybzwmsMEly8Qc0T1tkdY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-wOSFAK8nMEWMVsY9gRtjkw-1; Sat, 19 Nov 2022 03:56:43 -0500
X-MC-Unique: wOSFAK8nMEWMVsY9gRtjkw-1
Received: by mail-wm1-f72.google.com with SMTP id u9-20020a05600c00c900b003cfb12839d6so1742075wmm.5
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTnMAWMcXOaxFIQpcfG6YUPgYRs3mGJmNnh2pJlkTaQ=;
        b=Psv4NvhThvL3AFmz5dU1L4nfxULoxj6+DBrQFG2A85zFoqV2oHjLrhWI49azjQVadZ
         zyhUjLiNLj2/qmXHxuqaM2g8HwBvIUI3CGSajE3wCa90SlELF62DQcWqd9H5cuZq2c7S
         eOg9mYCnDR7ZI6vRpC3fCq2a8XHpOHEnZ2hHViiHDLYSwMs7HWV5GEhDDwwsfrAJpsaY
         mEWkRhrhT0V7oAaZtYOkN2p3YdqnsVuUqGGym015OOAupQ+JKTa4NnAENtjqhqlmjzvo
         tpCEleebm390KfPcngIbGF2Nd3YA/ifzPC4RAalxgKnMip1nVsnpLsPx2jZ7myiYP5PA
         28iA==
X-Gm-Message-State: ANoB5pkiTns6EC93AEe51O6yFsMQm0N4pFucTCn22JmJ1Q6MwVRZYgkl
        RHmPvIS++GUgVyM+NciYI02yHxA72FUpUuDLR1qK9Fvq40phxYmdv4WrKyRhjZeCCrILEMP+KTw
        9rC+1w1p4D85tLffV9dE0
X-Received: by 2002:a05:6000:1148:b0:236:71cd:1a71 with SMTP id d8-20020a056000114800b0023671cd1a71mr6301110wrx.712.1668848201915;
        Sat, 19 Nov 2022 00:56:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4iKlUjoSLuaU2OKOfUuMzVhcXhG2yCg6tTKCVerM+oZOqj7tj2WHCkqX1bb1HYERiD2HMfAA==
X-Received: by 2002:a05:6000:1148:b0:236:71cd:1a71 with SMTP id d8-20020a056000114800b0023671cd1a71mr6301094wrx.712.1668848201599;
        Sat, 19 Nov 2022 00:56:41 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id fc10-20020a05600c524a00b003cf9bf5208esm12708160wmb.19.2022.11.19.00.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 00:56:41 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Sergio Lopez Pascual <slp@redhat.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/2] KVM: Add missing arch for KVM_CREATE_DEVICE and KVM_{SET,GET}_DEVICE_ATTR
Date:   Sat, 19 Nov 2022 09:56:32 +0100
Message-Id: <20221119085632.1018994-2-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119085632.1018994-1-javierm@redhat.com>
References: <20221119085632.1018994-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ioctls are missing an architecture property that is present in others.

Suggested-by: Sergio Lopez Pascual <slp@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/virt/kvm/api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c17bac32d25c..0a99858d6d03 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3293,6 +3293,7 @@ valid entries found.
 ----------------------
 
 :Capability: KVM_CAP_DEVICE_CTRL
+:Architectures: all
 :Type: vm ioctl
 :Parameters: struct kvm_create_device (in/out)
 :Returns: 0 on success, -1 on error
@@ -3333,6 +3334,7 @@ number.
 :Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
              KVM_CAP_VCPU_ATTRIBUTES for vcpu device
              KVM_CAP_SYS_ATTRIBUTES for system (/dev/kvm) device (no set)
+:Architectures: x86, arm64, s390
 :Type: device ioctl, vm ioctl, vcpu ioctl
 :Parameters: struct kvm_device_attr
 :Returns: 0 on success, -1 on error
-- 
2.38.1

