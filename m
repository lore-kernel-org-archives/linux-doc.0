Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A51C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 15:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348309AbiC3Pkc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Mar 2022 11:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348318AbiC3PkY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Mar 2022 11:40:24 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97671BC18
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 08:38:37 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id i11so9471302plg.12
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VeiakI6ZdfDqy26wAEKtPtiKSfYNO4Hqsr8Ua8hMV6s=;
        b=nrS6qOjHi3EhirqIG6pDj0g4N09YKZLwksyGxAsNeS5zL69Y2hwg/RfRuCxzrUtxYl
         v7jQN4L85S48zZt4kac2+icIhFRUUxt7mMBo1eL+aynzkPZtu/RdgQkVfX6e1FT5rbk0
         qbCzDVoGSMEsX2SgJ0bM2JCSlsPYBypGz/DZLvhCFT6uOPlbNB1yIi8S//burANkm550
         iP1jWXu0vst/oHtGxCzZUjgDpC0OOlqglIlFR3wWARtJQ1KSAVOpYTv1tK2TNUOx3kvI
         xQuzHjcx3IdHCGQJ4FJ2eBVgrthM2ZABheWSIccFndfxGfNeE+1uV2UiV3xa1hSIA56t
         bGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VeiakI6ZdfDqy26wAEKtPtiKSfYNO4Hqsr8Ua8hMV6s=;
        b=g7H75c932ABG0f5uWdC7QKVjWx7awF8DXpcyysDDkhmAcrqhjKr32q9xzzfoWxZwhI
         vThkC/ROT9zJUeYUnU896pLONd/jxgQEBCwUocYD91LCB19Qvw3/YhfpsXku+/bQlHva
         beIHla2eh2/LaBeLbe0bXK5hZXKBK3GzTsKpjVxj0cDO7iVrikVnjr656GSh8Ywfa8Si
         fStPiAICSqCnwMMGdzOzZivgWMALrWSwjXr8ubCmkNPn7H9H51hnSJcLkhnzbYoFsF9g
         b3KZ/LQZQiBUQk+yIE0NwGnIHi3c851KpmeoOOYScV5jjDKRYiCXqD2eM9IdiOafcUKU
         d7Ow==
X-Gm-Message-State: AOAM530nhxiXwzx3pPc41HlZeCkYgocY6MUlZvF41Kg4UntlwMHtl64K
        sefsmv12OOQDFezheBVoHbTirQ==
X-Google-Smtp-Source: ABdhPJxYsUVAVVFAUKw0isQyNo9pKj3eD+47hgdFaTL8oWHpFu17OySjpRL49cBEu4QmAaAEKUAozQ==
X-Received: by 2002:a17:90b:504:b0:1c7:3095:fd78 with SMTP id r4-20020a17090b050400b001c73095fd78mr6449pjz.142.1648654717088;
        Wed, 30 Mar 2022 08:38:37 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090aa40800b001c6ccb2c395sm6686039pjp.9.2022.03.30.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 08:38:36 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v6 3/4] sysctl: allow to set extra1 to SYSCTL_ONE
Date:   Wed, 30 Mar 2022 23:37:44 +0800
Message-Id: <20220330153745.20465-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220330153745.20465-1-songmuchun@bytedance.com>
References: <20220330153745.20465-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

proc_do_static_key() does not consider the situation where a sysctl is only
allowed to be enabled and cannot be disabled under certain circumstances
since it set "->extra1" to SYSCTL_ZERO unconditionally.  This patch add the
functionality to set "->extra1" accordingly.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 kernel/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 770d5f7c7ae4..1e89c3e428ad 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1638,7 +1638,7 @@ int proc_do_static_key(struct ctl_table *table, int write,
 		.data   = &val,
 		.maxlen = sizeof(val),
 		.mode   = table->mode,
-		.extra1 = SYSCTL_ZERO,
+		.extra1 = table->extra1 == SYSCTL_ONE ? SYSCTL_ONE : SYSCTL_ZERO,
 		.extra2 = SYSCTL_ONE,
 	};
 
-- 
2.11.0

