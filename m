Return-Path: <SRS0=+hQT=3T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403A8C33CB3
	for <linux-doc@archiver.kernel.org>; Thu, 30 Jan 2020 19:10:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 159D1206D3
	for <linux-doc@archiver.kernel.org>; Thu, 30 Jan 2020 19:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fg92RMsb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgA3TKi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Jan 2020 14:10:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49558 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727682AbgA3TKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 14:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580411436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=SUtSFdT+kYmI8Bo8IponmuE6vaTB5AiudIIi8xyUiPM=;
        b=fg92RMsbHHLhjkNsqU9PHB9FpdCywI6BBx8dTxZp1OJHIiwh6oVcoUthiHpF3gau63jCbx
        vLmaoH/SHMC5CYZHkd1/z+ma7bYzwVlDniAz7aim+dUxJWKMvnee1Qi6Eh/8hcQoXb5R3J
        udS41RkK4PRZt7zadQowf8ffb9EFdg8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-ghWjxde4ORGhMnZzSquDWA-1; Thu, 30 Jan 2020 14:10:34 -0500
X-MC-Unique: ghWjxde4ORGhMnZzSquDWA-1
Received: by mail-wr1-f72.google.com with SMTP id z15so2179185wrw.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 11:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUtSFdT+kYmI8Bo8IponmuE6vaTB5AiudIIi8xyUiPM=;
        b=DRNhvFGrvnAXxQnnyBzF7a6x7LOwm6es2KJj2ZUNU/nVcWHF8vODotB2gNtyIlejU4
         Y9S5uuuNA4RcQOBGM97YWvs60EF6IZ1BtpTGdE84/u9ums6Q5Q7hsUsyzosN9F57aHZ3
         Emggs+5719/dA38Y81bOChnspdnH5xUP4Et70H4Thab9H4MM0fMGfduvryrhj4+jOf/g
         F/cPMPp3WIWZQijRWwM7A5xTzmxs/qvPaRZ79FVPLlwuVxyaMB26Unhb/LtSVaFpCG9l
         C3RSYB+Sug0ufNPcrfh4OV3H0nJ5kjIEQwg0fyuuictp7YNlBaDGbYuFaZD+qNoH4ou8
         3wiw==
X-Gm-Message-State: APjAAAW+eIJhoYcBFGgSNIMjQbbjiFOJMMCwiUuSIdfxMwA3Yso6o/on
        mo3rlnDLWWr08vYeaHkxL0Sg+nJCDkBi0jfXoCJqjZfB09r9aZhz7pF9gtHJjZ5zfrz0obcAWy9
        WZk7s78L22XqnctRy8KDZ
X-Received: by 2002:a5d:6708:: with SMTP id o8mr7467574wru.296.1580411433122;
        Thu, 30 Jan 2020 11:10:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwd2K5FNDKGZYqIaB7n3fgbnyN9C2V+AsRZ0esnHsarDmz4aw6MjM7UxxTdj8JoUalHG+ySGg==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr7467555wru.296.1580411432866;
        Thu, 30 Jan 2020 11:10:32 -0800 (PST)
Received: from turbo.redhat.com (net-2-36-173-233.cust.vodafonedsl.it. [2.36.173.233])
        by smtp.gmail.com with ESMTPSA id s139sm7794275wme.35.2020.01.30.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 11:10:32 -0800 (PST)
From:   Matteo Croce <mcroce@redhat.com>
To:     netdev@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org
Subject: [PATCH net] netfilter: nf_flowtable: fix documentation
Date:   Thu, 30 Jan 2020 20:10:19 +0100
Message-Id: <20200130191019.19440-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the flowtable documentation there is a missing semicolon, the command
as is would give this error:

    nftables.conf:5:27-33: Error: syntax error, unexpected devices, expecting newline or semicolon
                    hook ingress priority 0 devices = { br0, pppoe-data };
                                            ^^^^^^^
    nftables.conf:4:12-13: Error: invalid hook (null)
            flowtable ft {
                      ^^

Fixes: 19b351f16fd9 ("netfilter: add flowtable documentation")
Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 Documentation/networking/nf_flowtable.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/nf_flowtable.txt b/Documentation/networking/nf_flowtable.txt
index ca2136c76042..0bf32d1121be 100644
--- a/Documentation/networking/nf_flowtable.txt
+++ b/Documentation/networking/nf_flowtable.txt
@@ -76,7 +76,7 @@ flowtable and add one rule to your forward chain.
 
         table inet x {
 		flowtable f {
-			hook ingress priority 0 devices = { eth0, eth1 };
+			hook ingress priority 0; devices = { eth0, eth1 };
 		}
                 chain y {
                         type filter hook forward priority 0; policy accept;
-- 
2.24.1

