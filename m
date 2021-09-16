Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9A3C43217
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC7DA6120D
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbhIPJBb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:01:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235521AbhIPJBY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:01:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AEC36137F;
        Thu, 16 Sep 2021 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631782803;
        bh=mQWncG+nkMNDW24ydsD02ptTFMcYE2iljRDwZ4M8aHA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rOn2JGyIOlH1ulM9t94j/OChAKPPVyfQrV9Zh+ybQ3Py23o+G5F9N/ze9FGt4OgKN
         ABPBrS6fsJnr5LSpHlzjPvDJhEPvp7YCatdBhLbHhyRuOB+c8mKhTY4FxJ8CIN5gdr
         NvArnM5lrOiqKLMZtJglF6YjOi0zBrBQEur39AeAgup3thNOHUTF4rbFFkZ5bfel9I
         tZsdlLrFoF1dUeP1MVpYBuF2ev1KRUiZgHDg+A/Nut2nBLdxdu+AmoxfWuyF6V5Urc
         /1mJKU4tMSeNwkfb6cRsulagB+DYQOScFWJ5D/SvoD7/WHuvKSoqkjHUqA/iU9fQPe
         ytVw04UeoxqOA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnFR-001qlP-JO; Thu, 16 Sep 2021 11:00:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 28/30] ABI: sysfs-platform-sst-atom: use wildcards on What definitions
Date:   Thu, 16 Sep 2021 10:59:55 +0200
Message-Id: <ca1f384f1e77210e2807f97abe77a36ac5fa284a.1631782432.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631782432.git.mchehab+huawei@kernel.org>
References: <cover.1631782432.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

%x is not a valid wildcard. Use <x> instead, as this allows
script/get_abi.pl to convert it into a regex.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-platform-sst-atom | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-sst-atom b/Documentation/ABI/testing/sysfs-platform-sst-atom
index d5f6e21f0e42..0154b0fba759 100644
--- a/Documentation/ABI/testing/sysfs-platform-sst-atom
+++ b/Documentation/ABI/testing/sysfs-platform-sst-atom
@@ -1,4 +1,4 @@
-What:		/sys/devices/platform/8086%x:00/firmware_version
+What:		/sys/devices/platform/8086<x>:00/firmware_version
 Date:		November 2016
 KernelVersion:	4.10
 Contact:	"Sebastien Guiriec" <sebastien.guiriec@intel.com>
-- 
2.31.1

