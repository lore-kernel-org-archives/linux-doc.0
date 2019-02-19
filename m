Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 392597D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Feb 2019 03:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725772AbfBSDXM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Feb 2019 22:23:12 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36114 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfBSDXM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Feb 2019 22:23:12 -0500
Received: by mail-qt1-f196.google.com with SMTP id p25so21342720qtb.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Feb 2019 19:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to:organization;
        bh=M3mDF7+MGTo3bSsCVkoVEabOOM0zDeZ0gqyHpZOLnDE=;
        b=pnYbq6DuS6clbVwOur8Ij6lXaR+OdF9lVIarm86beJAoG1drr+38BFU2kQRvrv+YZr
         5sp4xr8PnbWYbKIMlCAhHU8OV8rgmfoJZMHAfeZhSkdb6vsusK6JiH1y2zNecZS92ujw
         DcdUGOPNkgw4pT8b9GHlAtc6Q3mHIhWJQCXlCnWvJtEc+HIl71SUL9P6JkaYrjDzqZoV
         fii5wrAU0zH6/DPyv5iGLqcD6wqAuazaqWVhoqGkpKjiLSuHVHoT7pg6FsMat1dAzO4Z
         CpbBEcLxYTmSqXFf2NsFG7UOlphnCaNlAP6qkxUosABBsKMpfj04/pRY5bAzD/ddXG32
         yJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to:organization;
        bh=M3mDF7+MGTo3bSsCVkoVEabOOM0zDeZ0gqyHpZOLnDE=;
        b=Nd2usvty7vuzKMDZFvyEnTs2rGG+N6/lSS1joqx80eyZ5+YySkfR1yRLyXf1surASZ
         WCN2HQlS45u9SohvAWzLyrFmzoXgW9zfpYdZcVkqtTv5+6pXlUoATz75fqOWU8VSiOa3
         m2+pcWy4VvJz5RymRaYQKItwxiGGRc7/lgJadt6oYVmzT3coM48qUsDHtzD4XdLWfamr
         qRRbvl8szLN9W5IRbBESclOQRRtG+X/t0dfzCPLuPi+V7u6C32bkEsODsQu2l8PJ4Nkr
         +jKzWAFTRpRYi2RbcTREUF2DZhEOWn9Q9qRxutRyh514R2VtLc5VawmL95wBzyCq3C/5
         Gmxw==
X-Gm-Message-State: AHQUAuayZTrRmMCPgLLsU1jTOl+IRqzW8WNSD4XMVMUPiVIp3fpt/nvY
        Gtq43pkYNanQnmnZx3kUYi9qJGHD
X-Google-Smtp-Source: AHgI3Ia1KSsINXrfm/U4hXA29XQMOld8k1QDsDzcUM8fG4ZHfMhRYiOaxyTFpsanRa43eHY+ekkodg==
X-Received: by 2002:a0c:b788:: with SMTP id l8mr19505864qve.4.1550546591832;
        Mon, 18 Feb 2019 19:23:11 -0800 (PST)
Received: from kbl.fios-router.home (pool-96-233-42-17.bstnma.fios.verizon.net. [96.233.42.17])
        by smtp.gmail.com with ESMTPSA id l31sm205282qtb.20.2019.02.18.19.23.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 19:23:11 -0800 (PST)
From:   Len Brown <lenb@kernel.org>
X-Google-Original-From: Len Brown <len.brown@intel.com>
To:     linux-drivers-review@linux.intel.com
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH 01/11] x86 topology: fix doc typo
Date:   Mon, 18 Feb 2019 22:22:49 -0500
Message-Id: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
X-Mailer: git-send-email 2.18.0-rc0
In-Reply-To: <20190219032259.12237-1-len.brown@intel.com>
References: <20190219032259.12237-1-len.brown@intel.com>
Reply-To: Len Brown <lenb@kernel.org>
Organization: Intel Open Source Technology Center
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

reflect actual cpuinfo_x86 field name:

s/logical_id/logical_proc_id/

Signed-off-by: Len Brown <len.brown@intel.com>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Len Brown <len.brown@intel.com>
---
 Documentation/x86/topology.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/x86/topology.txt b/Documentation/x86/topology.txt
index 2953e3ec9a02..06b3cdbc4048 100644
--- a/Documentation/x86/topology.txt
+++ b/Documentation/x86/topology.txt
@@ -51,7 +51,7 @@ The topology of a system is described in the units of:
     The physical ID of the package. This information is retrieved via CPUID
     and deduced from the APIC IDs of the cores in the package.
 
-  - cpuinfo_x86.logical_id:
+  - cpuinfo_x86.logical_proc_id:
 
     The logical ID of the package. As we do not trust BIOSes to enumerate the
     packages in a consistent way, we introduced the concept of logical package
-- 
2.18.0-rc0

