Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C11C4321E
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A69061186
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235704AbhIPJB1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:01:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:36138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235406AbhIPJBX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:01:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 928CE61279;
        Thu, 16 Sep 2021 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631782802;
        bh=EITKoccU4E1iR3VkhTp48668Q3t6P/4e5dWQsfbYlJU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iiygUvf74DSL19wkTEc1Ow6H3enAEgU8vwdCY4xiacEFT0bnizl11B3kO9Eei5n/4
         h1AaDMN8J/areAONuBZATL1YFoaazDlhqDFYf5hP9s1H5uFg/5hW8MZlplblHfhtIh
         /QrVd65AXhZGIdk3Y4+75kfyMwyfv/Etoy6YRuUgi2ga2kqiuVUyMqI4jBlZylLolJ
         4dwtl1B05ChDH4DhehYq4F34jH9dD6dK//B4dJK4VC+h6zUZ2Oj2gf9h9S4CzcONor
         k7+V88UuK1yL5x5Q0svMlKEEpD0qp7BH7f96t2LGTh4Y+py4R8H1fWEBhAnr5ZdJBi
         js2vsmgNNbFTA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnFQ-001qkJ-Qk; Thu, 16 Sep 2021 11:00:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/30] ABI: sysfs-ata: use a proper wildcard for ata_*
Date:   Thu, 16 Sep 2021 10:59:39 +0200
Message-Id: <72f783bc0287411f11d6640368926f8a357c002d.1631782432.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631782432.git.mchehab+huawei@kernel.org>
References: <cover.1631782432.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to let script/get_abi.pl to convert it into a Regex,
replace the three "..." at the end, meaning a wildcard to
a real filesystem wildcard.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-ata | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-ata b/Documentation/ABI/testing/sysfs-ata
index 9ab0ef1dd1c7..2f726c914752 100644
--- a/Documentation/ABI/testing/sysfs-ata
+++ b/Documentation/ABI/testing/sysfs-ata
@@ -1,4 +1,4 @@
-What:		/sys/class/ata_...
+What:		/sys/class/ata_*
 Description:
 		Provide a place in sysfs for storing the ATA topology of the
 		system. This allows retrieving various information about ATA
-- 
2.31.1

