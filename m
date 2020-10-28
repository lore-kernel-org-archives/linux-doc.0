Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707E9C56201
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FD2E207E8
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931713;
	bh=UBNZVdHq9PIvX3zxVtLZW8p3WIJ4/d404+9rOLhRsWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=VJEXz3YrXAIm+Bb2WOJdbnHjwjQg4RUmYGQzsy2pJJPFZ3afzi1qGRLpw4Tt+E5vU
	 /XS4DBD9HJZDqUYMGVicmxphx8iVPwaXZAROBjO70KYuWEePvf5SrnR22u3Auoc6HY
	 c/5WsxsAdCxiw3ef3EvxA9pHnyjKOxGIhPEBLTfI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731946AbgJ1WT2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:19:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731734AbgJ1WRn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:43 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3736247C4;
        Wed, 28 Oct 2020 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895015;
        bh=UBNZVdHq9PIvX3zxVtLZW8p3WIJ4/d404+9rOLhRsWk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j9dia3GL932woyWn6WdPwiGJMnTumg7cibL8prMLzhuKpwWUp9Wsg2HQCdp+O3E1/
         oWIltjERKu1Rxkvh7ZMXmI1hpI0TZWaLQlFC08dlVF6q60D1Zc9Kxv6vP0cLdMCO6f
         bcR/bfdowXwVRPEFBqG4Obv9h3h9uDlRo8fPkrDM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMP-003hm2-LM; Wed, 28 Oct 2020 15:23:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 28/33] docs: ABI: vdso: use the right format for ABI
Date:   Wed, 28 Oct 2020 15:23:26 +0100
Message-Id: <df71c97be37ff9397041baf4549e334701870026.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This ABI is not following the format described at ABI/README.

Use it, filling in the blanks with the git log that added it,
and using the current e-mail from Andy.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/stable/vdso | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/ABI/stable/vdso b/Documentation/ABI/stable/vdso
index 73ed1240a5c0..951838d42781 100644
--- a/Documentation/ABI/stable/vdso
+++ b/Documentation/ABI/stable/vdso
@@ -1,3 +1,9 @@
+What:		vDSO
+Date:		July 2011
+KernelVersion:	3.0
+Contact:	Andy Lutomirski <luto@kernel.org>
+Description:
+
 On some architectures, when the kernel loads any userspace program it
 maps an ELF DSO into that program's address space.  This DSO is called
 the vDSO and it often contains useful and highly-optimized alternatives
-- 
2.26.2

