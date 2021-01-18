Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D2EC433E6
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 17:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B61B62222F
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 17:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406911AbhARRvO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 12:51:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:46174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436776AbhARRrI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jan 2021 12:47:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94E19223E8
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610991987;
        bh=LyPDRuU3UPZhcSSl9mMoTdV/L94Icx6ItI0GSHQV708=;
        h=Resent-From:Resent-Date:Resent-To:From:To:Cc:Date:In-Reply-To:
         References:Subject:From;
        b=ld69LIE9OZhrfQb6Auq4fS68kDEQ3v8roFbuqspCosx7f+X8jU4/fpHY5lNSJPc8n
         CiBR98wj3pfMoerUT6e3odIrQSh/KqpI9DAqDi09cj+9/xBQFhKnzvt689+r+7yS7Z
         k9ZRpHmJiqQA3woxKzYFZC3Ueg6LMK8sIALt1+MPJB23fJWZcCNvvD5hEAeeiyTNaM
         LyztWvw2nT/htymzU7mwa4tkc6j6kYt115bz++uNp3Wan8gw4OgtKq24ZRiZ6SBzFC
         3/ABJUJu499w3yHcAWuxWklKEbekZgTtXGMhrWNfqmz0Ggci08Qs1afKdGnf2wUzI2
         Htd7deEbtXRZQ==
Envelope-to: broonie@sirena.co.uk
Delivery-date: Mon, 18 Jan 2021 17:42:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
        by cassiel.sirena.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@kernel.org>)
        id 1l1YYK-000586-MR
        for broonie@sirena.co.uk; Mon, 18 Jan 2021 17:42:58 +0000
Received: by mail.kernel.org (Postfix)
        id 7AFB122CB1; Mon, 18 Jan 2021 17:42:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEA7122CA1;
        Mon, 18 Jan 2021 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610991775;
        bh=LyPDRuU3UPZhcSSl9mMoTdV/L94Icx6ItI0GSHQV708=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mag3o+7S3+GY79W7Ifa6l1s2MVfXEdfqWoQC8bxL7VfSMo5K6qcC2nE6N0aui5SqE
         3vLly3XJ+7TNcgdEY0egb37qwqUhmX0bKbxL1pGQVBUkrPmu2ga6eAdWsv4XmBOSte
         lg1yg7vDPIvPDg0QhsmqBWTa0fCChFpVUbxClxACwOp0PSfUJfN9ik3lO0n8IliIYV
         XmE0w1Tc/eS7dwiBzw096aKOWvTJUY5AHTLWb2pyl0hU9znln/tOZMvfnhsMorhdb5
         31iWV7r/3UwDIKz8ujFVGFJ9jOolYCQf/EsOroNJJXm1LlFsztzffRvtowBANwd4ED
         SNWaSrR+dIAhg==
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        linux-doc@vgert.kernel.org, live-patching@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Date:   Mon, 18 Jan 2021 17:39:53 +0000
Message-Id: <20210118173954.36577-2-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210118173954.36577-1-broonie@kernel.org>
References: <20210118173954.36577-1-broonie@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=B41P/NyBiZr52ZgLMD1EC67DEBuJtlCAf6fQniGZ1yU=; m=nqsLKlThM/W+vzeMqXV5WYNF/9hoOR8pCeQ1bYoHfZI=; p=2MUKXici6S/sAj84vYSavNtcg2sj4YeMK0QGWULmAu0=; g=119515872595811257e582bba7d8323e2f1210c3
X-Patch-Sig: m=pgp; i=broonie@kernel.org; s=0xC3F436CA30F5D8EB; b=iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFx+cACgkQJNaLcl1Uh9AnFwf9Ffq 7SwXDF75cYktqlnCIbP1u8pSqklL3LduBhpSFSnU84qwVdAuBqEYcFSVBWTvwOqPeeUG7owWFWt4p bkQjysxb19m+FyU5+bpGGE92PXdSDobzQy4YPUh1Tp6IvmI5fq6OVlDnPNGRo3KzkH7kOtyFo0tbm F4/VpNr2fXTC22fzsVOPQzdl7xWFUBbNP08pHF9T6Mpw8EdXp98gUTNh9i0joaXKX8EU/eEriTMoM 68V0UATdTl0y+ipqZqWKtLZq+ZHppQqhEQW3WSn4U0V0Ec9d3s/mpxXMS2EqmaVVPvYiTQQ8SiIGY bnZGrXQcjuqQ03TCFlu7AWNJTyPrJbA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: broonie@kernel.org
Subject: [PATCH v5 1/2] Documentation: livepatch: Convert to automatically generated contents
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: QMHHutA+qhMD
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Automatically generate the tables of contents for livepatch documentation
files that have tables of contents rather than open coding them so things
are a little easier to maintain.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/livepatch/livepatch.rst         | 15 +--------------
 Documentation/livepatch/module-elf-format.rst | 10 ++--------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/Documentation/livepatch/livepatch.rst b/Documentation/livepatch/livepatch.rst
index c2c598c4ead8..68e3651e8af9 100644
--- a/Documentation/livepatch/livepatch.rst
+++ b/Documentation/livepatch/livepatch.rst
@@ -6,20 +6,7 @@ This document outlines basic information about kernel livepatching.
 
 .. Table of Contents:
 
-    1. Motivation
-    2. Kprobes, Ftrace, Livepatching
-    3. Consistency model
-    4. Livepatch module
-       4.1. New functions
-       4.2. Metadata
-    5. Livepatch life-cycle
-       5.1. Loading
-       5.2. Enabling
-       5.3. Replacing
-       5.4. Disabling
-       5.5. Removing
-    6. Sysfs
-    7. Limitations
+.. contents:: :local:
 
 
 1. Motivation
diff --git a/Documentation/livepatch/module-elf-format.rst b/Documentation/livepatch/module-elf-format.rst
index 8c6b894c4661..dbe9b400e39f 100644
--- a/Documentation/livepatch/module-elf-format.rst
+++ b/Documentation/livepatch/module-elf-format.rst
@@ -7,14 +7,8 @@ This document outlines the Elf format requirements that livepatch modules must f
 
 .. Table of Contents
 
-   1. Background and motivation
-   2. Livepatch modinfo field
-   3. Livepatch relocation sections
-      3.1 Livepatch relocation section format
-   4. Livepatch symbols
-      4.1 A livepatch module's symbol table
-      4.2 Livepatch symbol format
-   5. Symbol table and Elf section access
+.. contents:: :local:
+
 
 1. Background and motivation
 ============================
-- 
2.20.1

