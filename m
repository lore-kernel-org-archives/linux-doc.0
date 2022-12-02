Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CFEC4167B
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 10:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbiLBKvg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 05:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbiLBKv2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 05:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71962D0392
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 02:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669978233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=01EVu86F03ZVkaisaIA8aOhxapK6bD5iJUUbcQRNmys=;
        b=gRBpVn4XFihIn5sMWZ7vHPj7PrTqcPk7f3MON2lpeIUdwZDH/iz1Zp1x2Rx6qagylD8apH
        jj/4jxKXIM+n0hu4onVD7EoxT0wcrykZ2IOaLze5fo44iNwf4gLwW6ziBSjZpN/MB/+yz7
        gi/YUlstB6B/dNnINKtWBpK/A9f8Bvk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-m4Zu7OjJPDuVGc79gXUykQ-1; Fri, 02 Dec 2022 05:50:31 -0500
X-MC-Unique: m4Zu7OjJPDuVGc79gXUykQ-1
Received: by mail-wm1-f69.google.com with SMTP id ay19-20020a05600c1e1300b003cf758f1617so3947915wmb.5
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 02:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01EVu86F03ZVkaisaIA8aOhxapK6bD5iJUUbcQRNmys=;
        b=SzSpUzBYXQM9nHvAZeE6QcXKGyLR1kA7J+EkMDPceRp5gWLW3pgn9cnmb9ArYDqqfk
         nYBMaDP5iDkZk6YwC2/A9ZqHPCvB24JbbYjAhoplikP+CIQ0j7U/8n/ua7xM9wibiVA1
         IEk5zZnGRu5Fq5lkvHJ26R2Hux5X88RdVktOKDtH/IAPCdwwpjoj+vUy+JAoTr1tAZza
         HfEq80v39ccWS+Dd289ETanBqIZOd6a+S9Vhbzm0bxvc5dqRoToSKjvWK4SIA50g654U
         6s9GkT2GmSqTHHba4DkKdBNXS8a+1jIF55cJlpaoVMyrkB3+2QUpWrpSk63kgaP9fINR
         QptQ==
X-Gm-Message-State: ANoB5plgcZTIECip65odgdBrTCzJH5vUsl7LGsZphJHDUPkCuyWG6lf+
        6McTvwj1FKS5im3+oRy9U0mEFO4Bjwe18DGvU3ZKM8l1201XRyvt6GuS3T3bIDPA1LEjkZcZKvL
        y0t8MJmyULuo6YAwdOoeo
X-Received: by 2002:adf:e105:0:b0:236:73af:f9ad with SMTP id t5-20020adfe105000000b0023673aff9admr42046592wrz.225.1669978230868;
        Fri, 02 Dec 2022 02:50:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5gKhowvqyk/ROz6Tub/sMJPyTW0HCi4czVL2HWfKAPTpnGRqZYvsKYMG8CpBMMwJo8CzalVg==
X-Received: by 2002:adf:e105:0:b0:236:73af:f9ad with SMTP id t5-20020adfe105000000b0023673aff9admr42046575wrz.225.1669978230635;
        Fri, 02 Dec 2022 02:50:30 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003a3170a7af9sm9728818wmb.4.2022.12.02.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:50:29 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sergio Lopez Pascual <slp@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 4/4] KVM: Add missing arch for KVM_CREATE_DEVICE and KVM_{SET,GET}_DEVICE_ATTR
Date:   Fri,  2 Dec 2022 11:50:11 +0100
Message-Id: <20221202105011.185147-5-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202105011.185147-1-javierm@redhat.com>
References: <20221202105011.185147-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ioctls are missing an architecture property that is present in others.

Suggested-by: Sergio Lopez Pascual <slp@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 Documentation/virt/kvm/api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index b15ea129f9cf..1db60cd9e1ba 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3266,6 +3266,7 @@ valid entries found.
 ----------------------
 
 :Capability: KVM_CAP_DEVICE_CTRL
+:Architectures: all
 :Type: vm ioctl
 :Parameters: struct kvm_create_device (in/out)
 :Returns: 0 on success, -1 on error
@@ -3306,6 +3307,7 @@ number.
 :Capability: KVM_CAP_DEVICE_CTRL, KVM_CAP_VM_ATTRIBUTES for vm device,
              KVM_CAP_VCPU_ATTRIBUTES for vcpu device
              KVM_CAP_SYS_ATTRIBUTES for system (/dev/kvm) device (no set)
+:Architectures: x86, arm64, s390
 :Type: device ioctl, vm ioctl, vcpu ioctl
 :Parameters: struct kvm_device_attr
 :Returns: 0 on success, -1 on error
-- 
2.38.1

