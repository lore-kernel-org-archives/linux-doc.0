Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941F9C56201
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44D6320790
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603932910;
	bh=QYXEW51InXf48wJvUBaFJEGYALLp3gU+2JUgNOAT8yA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=h2zLCvyu4ia5Cm+KLn4vNx0lMbZToxzO96NQMwG7GRWIx+28/2Hq7DX5lRyZoNYzF
	 /fiplhnNDhCzf/WSu80WTuWJotWqL841hsH245IV/zEg4zlAVgsmyisdPRNYT/HRfQ
	 5KPutlNtkMYOx2b8MzZFscWERbWMvoUEKomFMxBs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgJ1WSB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:18:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:60532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731692AbgJ1WRl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:41 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3434247C8;
        Wed, 28 Oct 2020 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895015;
        bh=QYXEW51InXf48wJvUBaFJEGYALLp3gU+2JUgNOAT8yA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m8VriC6QlwfR1G91OTyOA/e4enbszR5HPGyxvj+6HCinT66wejgI7Cgm6HzdGm2Uf
         e+1LSue1P/gMOHb/Jku+Se7+ahkSqGW8kSIL9Ax64QrZs/dSkwD286dShRwB1cqmIj
         Oh52t+ZjvN8MTw/zp+rlWN0BjFXE42AUSXKgAf8Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMP-003hm4-MS; Wed, 28 Oct 2020 15:23:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 29/33] docs: ABI: sysfs-bus-nvdimm: use the right format for ABI
Date:   Wed, 28 Oct 2020 15:23:27 +0100
Message-Id: <24108a8232af23328198a6a6a5314a6d4f1b5e4f.1603893146.git.mchehab+huawei@kernel.org>
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
and using the current e-mail from Dan.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-bus-nvdimm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-nvdimm b/Documentation/ABI/testing/sysfs-bus-nvdimm
index d64380262be8..bff84a16812a 100644
--- a/Documentation/ABI/testing/sysfs-bus-nvdimm
+++ b/Documentation/ABI/testing/sysfs-bus-nvdimm
@@ -1,2 +1,8 @@
+What:          nvdimm
+Date:          July 2020
+KernelVersion: 5.8
+Contact:       Dan Williams <dan.j.williams@intel.com>
+Description:
+
 The libnvdimm sub-system implements a common sysfs interface for
 platform nvdimm resources. See Documentation/driver-api/nvdimm/.
-- 
2.26.2

