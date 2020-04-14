Return-Path: <SRS0=PpzG=56=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809B7C2BA19
	for <linux-doc@archiver.kernel.org>; Tue, 14 Apr 2020 16:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 549A32074D
	for <linux-doc@archiver.kernel.org>; Tue, 14 Apr 2020 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586883252;
	bh=kEy4QClsDKqYpuy6jSsVkkfgbzM9x8NxA08DUYZUD4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=WFchTqWu9//o1KDbbXAaiO8u8PKVFFLSVd15N4WvzHw/EBb6SaqpsG7YnNyAwPGYD
	 yacg/rVTjCOqhxLesg1WUOG3kK4h1HBoO5trnKvqZpBvULG01LY0hAq6pAP8PGsZGJ
	 xU3CuWQsHfMNChcCOs633MQ72AozLRvObViglGZ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391142AbgDNQxw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:53:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440337AbgDNQtQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Apr 2020 12:49:16 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CAA7221ED;
        Tue, 14 Apr 2020 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586882943;
        bh=kEy4QClsDKqYpuy6jSsVkkfgbzM9x8NxA08DUYZUD4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J0x85DR/GN5i6ltb3aDBHGUVJS/R58au7KZ/t3BGbddVS/LY0PWBI3wX9RBFvNO9+
         TispshdXtRWp9yKm94/VAFBm/equLxIz7D5hF38cvMGadD8O2aeeo6sreuUJ8WhvGg
         b3DnD/bENQOMZbnuTcv3jHXVdUt+6a2cIOmqKYXE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOOk9-0068nI-Gp; Tue, 14 Apr 2020 18:49:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        linux1394-devel@lists.sourceforge.net
Subject: [PATCH v2 30/33] firewire: firewire-cdev.hL get rid of a docs warning
Date:   Tue, 14 Apr 2020 18:48:56 +0200
Message-Id: <9b2501a41eba27ccdd4603cac2353c0efba7a90a.1586881715.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586881715.git.mchehab+huawei@kernel.org>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This warning:

	./include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.

is because %FOO doesn't work if there's a parenthesis at the
string (as a parenthesis may indicate a function). So, mark
the literal block using the alternate ``FOO`` syntax.

Acked-by: Stefan Richter <stefanr@s5r6.in-berlin.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/uapi/linux/firewire-cdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/firewire-cdev.h b/include/uapi/linux/firewire-cdev.h
index 1acd2b179aef..7e5b5c10a49c 100644
--- a/include/uapi/linux/firewire-cdev.h
+++ b/include/uapi/linux/firewire-cdev.h
@@ -308,7 +308,7 @@ struct fw_cdev_event_iso_interrupt_mc {
 /**
  * struct fw_cdev_event_iso_resource - Iso resources were allocated or freed
  * @closure:	See &fw_cdev_event_common;
- *		set by %FW_CDEV_IOC_(DE)ALLOCATE_ISO_RESOURCE(_ONCE) ioctl
+ *		set by``FW_CDEV_IOC_(DE)ALLOCATE_ISO_RESOURCE(_ONCE)`` ioctl
  * @type:	%FW_CDEV_EVENT_ISO_RESOURCE_ALLOCATED or
  *		%FW_CDEV_EVENT_ISO_RESOURCE_DEALLOCATED
  * @handle:	Reference by which an allocated resource can be deallocated
-- 
2.25.2

