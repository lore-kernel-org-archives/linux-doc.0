Return-Path: <SRS0=sBCo=3S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C84EC33CB7
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32D3E20702
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoP4u8MV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgA2Etk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jan 2020 23:49:40 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43910 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA2Etk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 23:49:40 -0500
Received: by mail-qt1-f196.google.com with SMTP id d18so12283195qtj.10
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2020 20:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31Aj6+KBPh1bOjE08uzZPSEk81edXgSHdm2y9/BE59U=;
        b=UoP4u8MVYaHSh0lQ0CToFR7wVs5l9FMNIYG+EoJ2TjZlj5rMx8DlCblQ0fG45jt+bt
         XTDyg1wpki8RokPl1Gyp4SqjQ/6seMnTH9tS83IwNTRvJxCMg49aQI7kyxYu+5SBq1g4
         h2me12E039PowgbZqxNFWkpIUfGWgi6ynqX4urRZAplZSttCT20LKLOqAE8BYCPXZbav
         +rmH/KmiobzLERmCdcAN+8pExiOVr5ldXQrEgAJUNNIB1r4FiozAXCTUTD2m3yJo4dAL
         LLMtSOAJEczi7AKimv975xcpdcZWlHAK2KfShFgmqh6TjA5pyj4FXyOh/7xALdTevYsg
         2DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31Aj6+KBPh1bOjE08uzZPSEk81edXgSHdm2y9/BE59U=;
        b=t06Mi/wsTclk+h2ewoi0VP1JIjaPHVqpREcZ6rHmiQVlsc99CwACnQNjHOYKmaxYDc
         K830wcVIrEgzuhCvW+NxAQIACKKIpT3qcso+ScvnDXllRT9YaJ0XklEb35WA0tz8e1Ih
         TpYqEV/cImTutwb+SN2aeAEfIUrHKX89kmpqKYFw3iGL07ezVobIFB3aLRkQSBQ/CtSe
         t8dhXWMfbn9fbG1tWjFHJDKENHsVsYmLK/E+JVQljXvMooqhE2mlFmzpt5pi3SrgAjlg
         +7arYAyUmp46bQsNTvt+o4z9TrnrlWkHazznmTtpb8N7QK6n2qPiexCo7Ux/v1dOSwcm
         mu1g==
X-Gm-Message-State: APjAAAVQhpVyK7m+N3pZmBBEgua13wqdSSnMf0su7YU13iXl9tzrjqxD
        URD5k3ZPJvO6GgpxGW+86i0=
X-Google-Smtp-Source: APXvYqySEOvpOfPwuPAFigyoMeaNy8kB5ev0eFWXmvpgdh/4wtngluVayTjmQ0BWfvkogWWUwPnO/g==
X-Received: by 2002:ac8:4890:: with SMTP id i16mr24359522qtq.211.1580273379691;
        Tue, 28 Jan 2020 20:49:39 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 20:49:39 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     corbet@lwn.net, mchehab+samsung@kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 5/5] Documentation: nfs: knfsd-stats: convert to ReST
Date:   Wed, 29 Jan 2020 01:49:17 -0300
Message-Id: <20200129044917.566906-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert knfsd-stats.txt to ReST. Content remains mostly the same.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst         |  1 +
 .../nfs/{knfsd-stats.txt => knfsd-stats.rst}    | 17 ++++++++---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename Documentation/filesystems/nfs/{knfsd-stats.txt => knfsd-stats.rst} (95%)

diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
index a0a678af921b..65805624e39b 100644
--- a/Documentation/filesystems/nfs/index.rst
+++ b/Documentation/filesystems/nfs/index.rst
@@ -10,3 +10,4 @@ NFS
    rpc-cache
    rpc-server-gss
    nfs41-server
+   knfsd-stats
diff --git a/Documentation/filesystems/nfs/knfsd-stats.txt b/Documentation/filesystems/nfs/knfsd-stats.rst
similarity index 95%
rename from Documentation/filesystems/nfs/knfsd-stats.txt
rename to Documentation/filesystems/nfs/knfsd-stats.rst
index 1a5d82180b84..80bcf13550de 100644
--- a/Documentation/filesystems/nfs/knfsd-stats.txt
+++ b/Documentation/filesystems/nfs/knfsd-stats.rst
@@ -1,7 +1,9 @@
-
+============================
 Kernel NFS Server Statistics
 ============================
 
+:Authors: Greg Banks <gnb@sgi.com> - 26 Mar 2009
+
 This document describes the format and semantics of the statistics
 which the kernel NFS server makes available to userspace.  These
 statistics are available in several text form pseudo files, each of
@@ -18,7 +20,7 @@ by parsing routines.  All other lines contain a sequence of fields
 separated by whitespace.
 
 /proc/fs/nfsd/pool_stats
-------------------------
+========================
 
 This file is available in kernels from 2.6.30 onwards, if the
 /proc/fs/nfsd filesystem is mounted (it almost always should be).
@@ -109,15 +111,12 @@ this case), or the transport can be enqueued for later attention
 (sockets-enqueued counts this case), or the packet can be temporarily
 deferred because the transport is currently being used by an nfsd
 thread.  This last case is not very interesting and is not explicitly
-counted, but can be inferred from the other counters thus:
+counted, but can be inferred from the other counters thus::
 
-packets-deferred = packets-arrived - ( sockets-enqueued + threads-woken )
+	packets-deferred = packets-arrived - ( sockets-enqueued + threads-woken )
 
 
 More
-----
-Descriptions of the other statistics file should go here.
-
+====
 
-Greg Banks <gnb@sgi.com>
-26 Mar 2009
+Descriptions of the other statistics file should go here.
-- 
2.25.0

