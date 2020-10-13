Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057B8C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 09:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C68A208D5
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 09:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=euphon.net header.i=fam@euphon.net header.b="d+F6pQsz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390737AbgJMJ3Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 05:29:25 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17681 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390610AbgJMJ3Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 05:29:25 -0400
X-Greylist: delayed 905 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Oct 2020 05:29:24 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1602580451; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=SAAD8/h6oNsaAnnkvAEdGVgF8CkPyaNX+reytruBJJZyTqrj3Uf6NsTabdND4gAsL5YpXbGkt5n0nA3e6n8BPRKkaAzKYObZmCqsKpbnftBNaGVeQ16X1KUrCi8O0PvhIKzhQjtd9vXZCRgFcHZ8PbsCKazbVBttTqhMGDDrJ3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1602580451; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=VfWF0ex94HcXp8r2avWCwoZVeUv+rWL75nDheLDzqQg=; 
        b=Cg7pNCBc/OeKyPNctrMHYPY1Iz0rvZx9r+3z33KyYnSePCfl3JpQWnoWitYXVCrVrqCU46mZaPBkgWzubualf1cisDNoazz1dl8QCNNlgLlBS4qsxwa1/QqTHb0seKUqqQVvc4X4Jj/ZzbFdeazuuP+DOme5xVx/auTj9ZpM9tI=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=euphon.net;
        spf=pass  smtp.mailfrom=fam@euphon.net;
        dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1602580451;
        s=zoho; d=euphon.net; i=fam@euphon.net;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=VfWF0ex94HcXp8r2avWCwoZVeUv+rWL75nDheLDzqQg=;
        b=d+F6pQszo+1Km/sUGXJutNERSVZHZlVRrfHVU3DFNRp8LybP1/kyuojTN/3LI1uX
        3G45UeQGKTmyH6xJI6BLyDJAsadio05RZ8y0bQAuLCO8AkU01AP7IrmEpaO1MMj5TtE
        X7x7+dfyCcZJr+YWb44YFTfy4b4G8CnBXWggok3Q=
Received: from localhost (ec2-52-56-101-76.eu-west-2.compute.amazonaws.com [52.56.101.76]) by mx.zoho.com.cn
        with SMTPS id 1602580448540450.3474970169616; Tue, 13 Oct 2020 17:14:08 +0800 (CST)
From:   fam@euphon.net
To:     linux-doc@vger.kernel.org
Cc:     fam@euphon.net, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Message-ID: <20201013091404.3124178-1-fam@euphon.net>
Subject: [PATCH] docs: Add two missing entries in vm sysctl index
Date:   Tue, 13 Oct 2020 10:14:04 +0100
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Fam Zheng <famzheng@amazon.com>

Both seem overlooked while adding the section in the main content.
---
 Documentation/admin-guide/sysctl/vm.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-=
guide/sysctl/vm.rst
index 4b9d2e8e9142..f455fa00c00f 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -27,6 +27,7 @@ Currently, these files are in /proc/sys/vm:
 - admin_reserve_kbytes
 - block_dump
 - compact_memory
+- compaction_proactiveness
 - compact_unevictable_allowed
 - dirty_background_bytes
 - dirty_background_ratio
@@ -37,6 +38,7 @@ Currently, these files are in /proc/sys/vm:
 - dirty_writeback_centisecs
 - drop_caches
 - extfrag_threshold
+- highmem_is_dirtyable
 - hugetlb_shm_group
 - laptop_mode
 - legacy_va_layout
--=20
2.25.1


