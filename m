Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CBADF7DBD4
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 18:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbfGISd3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 14:33:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56730 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbfGISd3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 14:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jU46nPFGpBcyqb30Zk67VYs5JcFdJlitkqyISRTJIR8=; b=kdCctTTm6GLl0LS6Mel91M04G0
        84DtC9k8ZUuY0g1ksPmbytcriGvhJ2Rz6RIdrLKw/8rHoWhSeaAulZRO69gdzs/P6rNpbfyNsIS7S
        bIkl3VFAkD7PE6XzT5rRQa9KDkAsHvQcjssgDoWLZOqb46bRbWn8zY0bqPwRO5J5Gv5deH9T7GT5m
        sET9YJk2X3poSpY5PZRzIZdidKc7vV9Sg8jkHXYzl9Efrr0ZoqSTHkxueW/NPvjVluPJcolbuj2YR
        mUtSicLvsax2rtE6EeFxMmL6qvgdcneV8mqgcoXc/i37mivuRllDPngcapNauEmi5zFll5vglKOAz
        tP/A+lyA==;
Received: from 177.43.30.58.dynamic.adsl.gvt.net.br ([177.43.30.58] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hkuvf-0007As-BB; Tue, 09 Jul 2019 18:33:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hkuvd-0005Pp-5K; Tue, 09 Jul 2019 15:33:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 2/5] docs: arm: fix a breakage with pdf output
Date:   Tue,  9 Jul 2019 15:33:20 -0300
Message-Id: <7150e6eadf29dca6ad7c8c7e4ee2781b99119265.1562696797.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1562696797.git.mchehab+samsung@kernel.org>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an extra blank line, as otherwise XeLaTex will complain with:

	! LaTeX Error: Too deeply nested.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/arm/spear/overview.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arm/spear/overview.rst b/Documentation/arm/spear/overview.rst
index 8a1a87aca427..1a77f6b213b6 100644
--- a/Documentation/arm/spear/overview.rst
+++ b/Documentation/arm/spear/overview.rst
@@ -15,6 +15,7 @@ Introduction
   Hierarchy in SPEAr is as follows:
 
   SPEAr (Platform)
+
 	- SPEAr3XX (3XX SOC series, based on ARM9)
 		- SPEAr300 (SOC)
 			- SPEAr300 Evaluation Board
-- 
2.21.0

