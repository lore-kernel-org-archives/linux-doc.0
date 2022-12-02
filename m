Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1704C47088
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 10:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbiLBKvd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 05:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233122AbiLBKv0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 05:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22C4CF7A4
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 02:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669978226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Xns7M6Diybr7dzy3wYbJXBXTTPyGOV7tjq20IdAiq6U=;
        b=ZcbbznjWgB6XtOZrGLMvzCeM7Dc009RurupEURCb+aw8wpx7NBhRM1CxU8j99MOJkqdIfp
        cXKyw3ginre53xQhtqXsMoEFX115k5i11LWbbKraBuDp+q68CS54qC4bFA233XvNVRpgEc
        3raWWx53+7wMu1ekpvhe6d+9niSjVq8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-3nh2xYcnP1-ICGGJcArFTA-1; Fri, 02 Dec 2022 05:50:25 -0500
X-MC-Unique: 3nh2xYcnP1-ICGGJcArFTA-1
Received: by mail-wm1-f70.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso2322848wmb.4
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 02:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xns7M6Diybr7dzy3wYbJXBXTTPyGOV7tjq20IdAiq6U=;
        b=AFXVTwiuxlwMLaoMafk4rDFxDDNRpR+yx8jhVi99+OXcT42XEUDVRR8v9zPOLN1fyT
         4I14OhOGYRo7R6z8CJM1ombG0UjkIr4rWzgmLyX4ALl6WE6PUq+aKLQCofxxGfFyZiYe
         9e4rOvG+O7sZhb3m4mBvyaV7jHH7fKMqt90nmUWUKKDuHWs4ZA0ro96GwPMVpX7g7v8W
         KgqsLUwSbhn0A6ITTTiPFscElMkAFens85LNrAE3DWI6JK1oL27lUR/Pm7s7wOs3aX0o
         apageVBM27VFV7wadCFiuoTqF9AkhRdocehhClKpAZRoC9UZF0pt8o4gk8KhcohSXsV9
         +4wA==
X-Gm-Message-State: ANoB5pnTOr0SKfjLIGdXr14EOsqCotn8qMOB4AVIj5qtg1GU3eV0S9D2
        rowx1r0GoiwgGM6nP/zYM1dSeExfjNiosrcZae4ReNLuPkDVfCtd2kd13yO6FTzERdGywmVtcFC
        Eql3bQ/bY2gTdMBBKYoc/
X-Received: by 2002:a05:6000:1707:b0:242:271f:d2c3 with SMTP id n7-20020a056000170700b00242271fd2c3mr8077361wrc.335.1669978224321;
        Fri, 02 Dec 2022 02:50:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5KVbheYS9+aIJHNe8ulgIHTKGDlnF1XXTtDUssVMgRTABBeui6psvy+mx/A5EvFLuKYkRu9g==
X-Received: by 2002:a05:6000:1707:b0:242:271f:d2c3 with SMTP id n7-20020a056000170700b00242271fd2c3mr8077349wrc.335.1669978224064;
        Fri, 02 Dec 2022 02:50:24 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003a3170a7af9sm9728818wmb.4.2022.12.02.02.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:50:23 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sergio Lopez Pascual <slp@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Guang Zeng <guang.zeng@intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jing Liu <jing2.liu@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wei Wang <wei.w.wang@intel.com>,
        Yang Zhong <yang.zhong@intel.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, x86@kernel.org
Subject: [PATCH v2 0/4] KVM: Delete all references to removed ioctls
Date:   Fri,  2 Dec 2022 11:50:07 +0100
Message-Id: <20221202105011.185147-1-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

This series contains patches that cleanups KVM headers and documentation,
by removing left overs of ioctls that were already removed.

This is a v2 that instead of marking these ioctls as "obsoleted", remove
any mentions to them. This was suggested by Sean Christopherson in v1.

Best regards,
Javier

Changes in v2:
- Delete all references to removed ioctls instead of marking them as
  deprecated (Sean Christopherson).

Javier Martinez Canillas (4):
  KVM: Delete all references to removed KVM_SET_MEMORY_REGION ioctl
  KVM: Delete all references to removed KVM_SET_MEMORY_ALIAS ioctl
  KVM: Reference to kvm_userspace_memory_region in doc and comments
  KVM: Add missing arch for KVM_CREATE_DEVICE and
    KVM_{SET,GET}_DEVICE_ATTR

 Documentation/virt/kvm/api.rst        | 31 +++------------------------
 arch/x86/include/uapi/asm/kvm.h       |  8 -------
 include/linux/kvm_host.h              |  4 ++--
 include/uapi/linux/kvm.h              | 20 +++--------------
 tools/arch/x86/include/uapi/asm/kvm.h |  8 -------
 tools/include/uapi/linux/kvm.h        | 20 +++--------------
 6 files changed, 11 insertions(+), 80 deletions(-)

-- 
2.38.1

