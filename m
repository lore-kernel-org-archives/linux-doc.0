Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E527C43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2A662227E
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602591373;
	bh=8xmp8qJnTJi9IoID4I9CZ1SA+GyrMHFlPwDDsnJv+pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=e8A/NvPiBvu9DDf5y0faiQHs3J1bSHHoTy/vwkD4n/ssOADp/NN9+2iThKp6F8JTl
	 iEdeH/9mER1VO+CuJYScW+9UfS+GXFKFZXKbC7IahAFHkTHMEd+AtQnfo6cJLaungy
	 f5YWVn4kAfX2Qt76xPPqEw1cNQXAI/59ejbgCqO0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727293AbgJMMPf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:15:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbgJMMO5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 08:14:57 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5739F22365;
        Tue, 13 Oct 2020 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602591295;
        bh=8xmp8qJnTJi9IoID4I9CZ1SA+GyrMHFlPwDDsnJv+pc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yLViJ5h+qtaNMckfglLOmqg8/OZ5nQsss5BBveVQVd3eigXtl2CziT68OLvI8rUY8
         2dwS5lznQUO4HQeBnUqenOOziLykML1rSBR2JPPRwkRQ1vnqzA50udQAckzCTtyiVu
         PT7UuqHQeRfn+vrNIpWFiwXU2ukhPauLj35aag/Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSJCf-006Cok-Al; Tue, 13 Oct 2020 14:14:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@nvidia.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 22/24] ice: docs fix a devlink info that broke a table
Date:   Tue, 13 Oct 2020 14:14:49 +0200
Message-Id: <79d341b6be03e9ffbe489d7110348357971a5fc8.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 410d06879c01 ("ice: add the DDP Track ID to devlink info")
added description for a new devlink field, but forgot to add
one of its columns, causing it to break:

	.../Documentation/networking/devlink/ice.rst:15: WARNING: Error parsing content block for the "list-table" directive: uniform two-level bullet list expected, but row 11 does not contain the same number of items as row 1 (3 vs 4).

	.. list-table:: devlink info versions implemented
	    :widths: 5 5 5 90
...
	    * - ``fw.app.bundle_id``
	      - 0xc0000001
	      - Unique identifier for the DDP package loaded in the device. Also
	        referred to as the DDP Track ID. Can be used to uniquely identify
	        the specific DDP package.

Add the type field to the ``fw.app.bundle_id`` row.

Fixes: 410d06879c01 ("ice: add the DDP Track ID to devlink info")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/networking/devlink/ice.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/networking/devlink/ice.rst b/Documentation/networking/devlink/ice.rst
index b165181d5d4d..a432dc419fa4 100644
--- a/Documentation/networking/devlink/ice.rst
+++ b/Documentation/networking/devlink/ice.rst
@@ -70,6 +70,7 @@ The ``ice`` driver reports the following versions
         that both the name (as reported by ``fw.app.name``) and version are
         required to uniquely identify the package.
     * - ``fw.app.bundle_id``
+      - running
       - 0xc0000001
       - Unique identifier for the DDP package loaded in the device. Also
         referred to as the DDP Track ID. Can be used to uniquely identify
-- 
2.26.2

