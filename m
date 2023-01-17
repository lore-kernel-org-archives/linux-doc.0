Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C87C678D8
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 10:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236738AbjAQKcE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 05:32:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236719AbjAQKav (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 05:30:51 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5791A30EBC
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 02:29:41 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so30072835wrv.7
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 02:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goLYN8wqlsD2nf6BsyoWezQkBOY9czu46tASmcKkV+U=;
        b=LW9v+FShzNaYNEA1fCcvsuL+gmKoaNWBCzkVb4IqUJxu1VFQQzmE7D5c17K+jU4E58
         k1nFdkZWgTq1OLh4PWwMAjMkTCyGqAyQm557fme7cOxRFBoSDzU7std4+dXQykp0Jadc
         4ZHR482J2vcLi190UZzizoeaz9p8YaeZJUC5mEV59GPwotY2dZO7HWCS2njWJnDhhl2O
         6nskecHf7DR8Ln5Y1lQS9KhhAJTiEvb0U0q6Fq++VnLONiICwidHPQYzKqA/u3Dqn1fx
         2EpcFw/uSRGraDNCs2I2Zw/1PizGqcB7GLAJJs3HIk6fzt2V1+zbJ96Sx2kk1u3VO6c7
         znOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goLYN8wqlsD2nf6BsyoWezQkBOY9czu46tASmcKkV+U=;
        b=HOPVHbDjC5wd6422sV8vjjJJ0eskC+V01ddiracpUmSPYnvrcIeU6ae78bVHHPClzg
         1MNUpAAhqXtfTT9YsiArVvOXJXYz+pofFXsrZRKcdz8+yRohfDftvFzt12v2/+7uUdI3
         39sZDxd9oYN4HQq1s1ZEmtrzT8zmPPOBJXvpvcayxkYrmSkcspTiN68z4Iu0T95Yj36y
         DuKbgmTKpjIXNTF+lcCNiCA+6kuC7XTXTVGla75y5DpVotSeKZr02/b9Awk/bTkgEKtL
         d36D0QtYWuxeWPI/nM2jGC8fHI8ya4RXzd06ax7TRYYPWuQKpZlh8/2d88kQNRsJtK9j
         sowA==
X-Gm-Message-State: AFqh2kplEHtJHP4aWGBiHWHW4a5/eSYdc4dfiu3pTx+Ye3Y4EHvW9Iib
        D7DOnc8uudGZLolJd10U5I3N0g==
X-Google-Smtp-Source: AMrXdXurfVHLX2R/w9Bx0+prj2t86B4Ij/RI/DY/QDVmyV0Y50rPY/OXqoWqGE+G0b4juSfiLjfEdA==
X-Received: by 2002:adf:edd1:0:b0:2bd:c6ce:7bfc with SMTP id v17-20020adfedd1000000b002bdc6ce7bfcmr2267011wro.42.1673951380954;
        Tue, 17 Jan 2023 02:29:40 -0800 (PST)
Received: from usaari01.cust.communityfibre.co.uk ([2a02:6b6a:b566:0:17d8:e5ec:f870:7b46])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d452f000000b0028f9132e9ddsm28389844wra.39.2023.01.17.02.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 02:29:40 -0800 (PST)
From:   Usama Arif <usama.arif@bytedance.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com,
        bagasdotme@gmail.com, pbonzini@redhat.com
Cc:     fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com, Usama Arif <usama.arif@bytedance.com>
Subject: [v3 6/6] KVM: selftests: add tests for PV time specific hypercall
Date:   Tue, 17 Jan 2023 10:29:30 +0000
Message-Id: <20230117102930.1053337-7-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117102930.1053337-1-usama.arif@bytedance.com>
References: <20230117102930.1053337-1-usama.arif@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a vendor specific hypercall.

Signed-off-by: Usama Arif <usama.arif@bytedance.com>
---
 tools/testing/selftests/kvm/aarch64/hypercalls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/aarch64/hypercalls.c b/tools/testing/selftests/kvm/aarch64/hypercalls.c
index bef1499fb465..375bcc4126d5 100644
--- a/tools/testing/selftests/kvm/aarch64/hypercalls.c
+++ b/tools/testing/selftests/kvm/aarch64/hypercalls.c
@@ -78,6 +78,8 @@ static const struct test_hvc_info hvc_info[] = {
 	TEST_HVC_INFO(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID,
 			ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID),
 	TEST_HVC_INFO(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, 0),
+	TEST_HVC_INFO(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID,
+			ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID),
 	TEST_HVC_INFO(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID, KVM_PTP_VIRT_COUNTER),
 };
 
-- 
2.25.1

