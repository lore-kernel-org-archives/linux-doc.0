Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4E9C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 23 Mar 2022 12:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243873AbiCWM7E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Mar 2022 08:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243932AbiCWM7D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Mar 2022 08:59:03 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3797C7B2
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 05:57:34 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id c11so1036158pgu.11
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VeiakI6ZdfDqy26wAEKtPtiKSfYNO4Hqsr8Ua8hMV6s=;
        b=zeeWwcCD9//7csZdk9BkAb8ksK2GIgn57HPaFohCWXiiP8aYQSHKB2Hpfdb13YuOEX
         KIJ4aNjZW7yk8vagCxd46XF6rNCQ7YkPfMZ97gOgF2rlWWD8XKvcBGg0RSxWP7JyZUWY
         DFzfyXxLUFe3c+70ocA8kagHeHwgeIA5WneZCToDLSzWhq9fjq5q+/1YPv/4n/HHs5Fn
         Yx7FUpK7u7Y8o+TsJ0QitplE3fSmqJ1rqiYwmoCSHOy3wpsTfpbXUWeOvHBIArgLk837
         BZUvNuawJx/tk5w8zW96S7+aT3Ubv3REKDr6/izxMpR6qsjkj9OdlhRloavP8QytBtii
         ZsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VeiakI6ZdfDqy26wAEKtPtiKSfYNO4Hqsr8Ua8hMV6s=;
        b=Pmn8H6FfxIpnVRlWWdmZyvRCToDPkvZIyjkTcS5dFndbD50kb3CDAYU5Tn3tBOVOAm
         Ji9J35BsirV9KxqjtqmWDGZocUcXvhjgYF7+gsHqoN+j+0hTw0ltbNrdTjKAfMMqZR6E
         b/tl6P57fEK60H10NkfcmOUpM7CAiMniVHejc6lf2TpEEfanj+75+5GgqKFaXoVWWRfG
         dMXuCQJO2gYdWWCfvs9xMknNIQfh7Oi9OkH/uafvtNKd5VJgTRefBR+PWAJhVQF8vub/
         lqORHVZU5dKlbK3oAFeEQUkKxGyIoQ9PtGKNon1OrHp/OyX/NImVyt0B4U5gGMGO3QE/
         ysYQ==
X-Gm-Message-State: AOAM5316EIrJbgnhrOVnRhdB4ejyew0qXbpm+M6cJoVjuEhpsQeWOaCZ
        mYVZvJLmgvWflPTu09yoceh+dA==
X-Google-Smtp-Source: ABdhPJzfb3QxTbZHF2sE8H1JPQSnUAsBsuCcE1dCXSiB41/ce3nustfqBUnhgXYLIVEMuV9Ic1mN6A==
X-Received: by 2002:a63:475c:0:b0:381:ef1e:7099 with SMTP id w28-20020a63475c000000b00381ef1e7099mr25853767pgk.225.1648040253862;
        Wed, 23 Mar 2022 05:57:33 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id k185-20020a6384c2000000b003821dcd9020sm15716517pgd.27.2022.03.23.05.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 05:57:33 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v5 3/4] sysctl: allow to set extra1 to SYSCTL_ONE
Date:   Wed, 23 Mar 2022 20:55:22 +0800
Message-Id: <20220323125523.79254-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220323125523.79254-1-songmuchun@bytedance.com>
References: <20220323125523.79254-1-songmuchun@bytedance.com>
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

