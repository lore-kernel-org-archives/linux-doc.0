Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF125C001E0
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 19:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjGJTuB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjGJTt7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 15:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC28118D
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689018552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a28aXvRJ7amV1kNyaLXIB+aU7kYRY1GTXEf8SQiQifs=;
        b=S141/EcGxWrGmykJr4kEn4jFl/626Pzqt71D6GB5vsQiWeCe9vBkf9XQvEcAosX2oZ1Dkl
        xVaAhyn5T1rvHWgkYr+ewj4O8yR/G934rJsf6WOgv9QqMxIOJIJ03SwPdkOwW4wG3+JFTu
        0DyAyyQTBJC+/KTzrDYtMyj37C57mL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-GDihBXQ8Otyp4A0BaShv8g-1; Mon, 10 Jul 2023 15:49:10 -0400
X-MC-Unique: GDihBXQ8Otyp4A0BaShv8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08004800193;
        Mon, 10 Jul 2023 19:49:10 +0000 (UTC)
Received: from llong.com (unknown [10.22.18.171])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2A1A9111E3E6;
        Mon, 10 Jul 2023 19:49:09 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        x86@kernel.org, linux-pm@vger.kernel.org,
        Robin Jarry <rjarry@redhat.com>, Joe Mario <jmario@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v5 3/4] intel_idle: Use __update_spec_ctrl() in intel_idle_ibrs()
Date:   Mon, 10 Jul 2023 15:48:56 -0400
Message-Id: <20230710194857.2898284-4-longman@redhat.com>
In-Reply-To: <20230710194857.2898284-1-longman@redhat.com>
References: <20230710194857.2898284-1-longman@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When intel_idle_ibrs() is called, it modifies the SPEC_CTRL MSR to 0
in order disable IBRS. However, the new MSR value isn't reflected in
x86_spec_ctrl_current which is at odd with the other code that keep track
of its state in that percpu variable.  Use the new __update_spec_ctrl()
to have the x86_spec_ctrl_current percpu value properly updated.

Signed-off-by: Waiman Long <longman@redhat.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/idle/intel_idle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index b930036edbbe..c9479f089037 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -182,12 +182,12 @@ static __cpuidle int intel_idle_ibrs(struct cpuidle_device *dev,
 	int ret;
 
 	if (smt_active)
-		native_wrmsrl(MSR_IA32_SPEC_CTRL, 0);
+		__update_spec_ctrl(0);
 
 	ret = __intel_idle(dev, drv, index);
 
 	if (smt_active)
-		native_wrmsrl(MSR_IA32_SPEC_CTRL, spec_ctrl);
+		__update_spec_ctrl(spec_ctrl);
 
 	return ret;
 }
-- 
2.31.1

