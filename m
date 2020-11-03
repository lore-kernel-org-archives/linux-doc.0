Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7B5C2D0A3
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 08:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EBFC22275
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604392403;
	bh=deF+fK72tiaXqpNY2MrAivUNgrfVThGfY/QMTaLUbEs=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=QRsa+LAFty5kAWOC4Zd3PLMqUSiFGMAmCuUltOoRGZXfkzhlp5yksfYEjgr3rtouu
	 l3kKc6v1SaW4P7NNThRxS3nu8UJJoVIVd+jq50YJMm3DX7k/kcwMN0S8gjsLBL1DkD
	 OHzKFToiBe38eF42zwlftQoYBDQ8W3UeINPOwTfs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgKCIdR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 03:33:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:40824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgKCIdQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Nov 2020 03:33:16 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D58E822264;
        Tue,  3 Nov 2020 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604392395;
        bh=deF+fK72tiaXqpNY2MrAivUNgrfVThGfY/QMTaLUbEs=;
        h=Date:From:To:Cc:Subject:From;
        b=HaWItFiUHwtH0HLRS9x1z0XhNFDfclO7tBgO0EHEWynBVvbbevgYENVL5pCqWxjGq
         5Pfpbz5j1m4pZkyc6hj8hzYsF6iVQ5oh5CvXeiapVLK+dNNQDcQZOmLLezIeMP0nnt
         zqgIsdpld3QRkXA2fxuC1KT6TK50KFOGvcyYk4CI=
Date:   Tue, 3 Nov 2020 09:34:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Sudeep Dutt <sudeep.dutt@intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: remove mic/index from misc-devices/index.rst
Message-ID: <20201103083408.GA2511903@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the recent removal of the misc/mic/ directory, the documentation
build now warns because we forgot about this index file.

Fix that up so that there are no more warnings here.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---

I'll just take this in my tree as I have a bunch of other documentation
fixups to get to Linus soon, if no one objects, as the breakage came
from my tree in the first place.


diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 46072ce3d7ef..64420b3314fe 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -24,7 +24,6 @@ fit into other categories.
    isl29003
    lis3lv02d
    max6875
-   mic/index
    pci-endpoint-test
    spear-pcie-gadget
    uacce
