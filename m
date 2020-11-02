Return-Path: <SRS0=BR+k=EI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0788C00A89
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 10:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A105C21D40
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604313165;
	bh=u6tn5XkZLf2YkKiLn1gMnLV+nXRXZfmtnLltid++hzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=UOBlBg7d3FoFKB/anou4iqPoKc7HwbZXHLrgrGo9iCpHcSVmJ5h5KoPobifoyhwz0
	 ETlJzWUMC6nsNN7L0vPbDzlubRDGh9Xx4HgGkMi2vmNKLClYlEkcSjj7axt5GdHwpA
	 gnJrDsiSkIBMkTiR6EN3+rqpPy2tuxKKVVi+HHQI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgKBKcl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 05:32:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:57436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgKBKcZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Nov 2020 05:32:25 -0500
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A618C20760;
        Mon,  2 Nov 2020 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604313144;
        bh=u6tn5XkZLf2YkKiLn1gMnLV+nXRXZfmtnLltid++hzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GoBzoCNybsUWa2Pq9p6+Q6Im5u4NXhFBXhE6FRYixYALNZ7APvhaVQqpu20Q+0vfA
         Sj62WpHkLjORPH/aN57f+EE/He1FYXDwaKlHDHdXOD8Ng904uclBMYgtGKE3RjY+g9
         SQpW4L7BSzz7z1WdJE2xETFT4uWivnanVGFAa0k4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kZX8P-005tuZ-Qx; Mon, 02 Nov 2020 11:32:21 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linus Torvalds" <torvalds@linux-foundation.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Randy Dunlap" <rdunlap@infradead.org>
Subject: [PATCH 1/5] docs: ABI: sysfs-driver-dma-ioatdma: what starts with /sys
Date:   Mon,  2 Nov 2020 11:32:12 +0100
Message-Id: <f4c53fff9696a61ff0e144fee237a9527982626d.1604312590.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604312590.git.mchehab+huawei@kernel.org>
References: <cover.1604312590.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the only file where the /sys doesn't start with
a /.

So, rename them to:

	sys -> /sys

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/stable/sysfs-driver-dma-ioatdma | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-dma-ioatdma b/Documentation/ABI/stable/sysfs-driver-dma-ioatdma
index 420c1d09e42f..3a4e2cd0ddcc 100644
--- a/Documentation/ABI/stable/sysfs-driver-dma-ioatdma
+++ b/Documentation/ABI/stable/sysfs-driver-dma-ioatdma
@@ -1,29 +1,29 @@
-What:           sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/cap
+What:           /sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/cap
 Date:           December 3, 2009
 KernelVersion:  2.6.32
 Contact:        dmaengine@vger.kernel.org
 Description:	Capabilities the DMA supports.Currently there are DMA_PQ, DMA_PQ_VAL,
 		DMA_XOR,DMA_XOR_VAL,DMA_INTERRUPT.
 
-What:           sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/ring_active
+What:           /sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/ring_active
 Date:           December 3, 2009
 KernelVersion:  2.6.32
 Contact:        dmaengine@vger.kernel.org
 Description:	The number of descriptors active in the ring.
 
-What:           sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/ring_size
+What:           /sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/ring_size
 Date:           December 3, 2009
 KernelVersion:  2.6.32
 Contact:        dmaengine@vger.kernel.org
 Description:	Descriptor ring size, total number of descriptors available.
 
-What:           sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/version
+What:           /sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/version
 Date:           December 3, 2009
 KernelVersion:  2.6.32
 Contact:        dmaengine@vger.kernel.org
 Description:	Version of ioatdma device.
 
-What:           sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/intr_coalesce
+What:           /sys/devices/pciXXXX:XX/0000:XX:XX.X/dma/dma<n>chan<n>/quickdata/intr_coalesce
 Date:           August 8, 2017
 KernelVersion:  4.14
 Contact:        dmaengine@vger.kernel.org
-- 
2.26.2

