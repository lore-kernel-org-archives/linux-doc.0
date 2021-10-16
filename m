Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1B0C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 20:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB7EB60F56
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 20:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbhJPUe1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Oct 2021 16:34:27 -0400
Received: from o2.lv1nn.shared.sendgrid.net ([167.89.100.176]:30124 "EHLO
        o2.lv1nn.shared.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233817AbhJPUe1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Oct 2021 16:34:27 -0400
X-Greylist: delayed 501 seconds by postgrey-1.27 at vger.kernel.org; Sat, 16 Oct 2021 16:34:27 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wasin.io;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=s1; bh=qNBGXlLMnPhrJq5G4++xZYyQ0CDuclAGDf2//H9A8Jw=;
        b=vOZiUPFv7s4UU2Qqs6qcRIpvwIdKNsdpEOPZ31ACdliidt7aC+7cDa5sV63kHcf/6Bp1
        ePrcVJieJsrBjuo7PVyFVCwUpTsrPy6r8y1pQHGfKsWchBW30Pcu703hIa7nGaCrLbprCn
        VeTLlpOrWdRq1mkVCWZmL+or4h6+lY84ZTD+cyBJhqfs1BEm/w5mL8mePvVGovIqhMLtwg
        zCM4nubETAMubzioeHWqP3q8J0xDrmqTZkHVVdd+QQrgfCOv7m8lSKgqp1p7ybvgU2aGBX
        3gichD9Ff1Ol8C/T1kkkAOkvjDx3XQY7IHfZ7k4NUaSCvhlgvOW+dAFkprgEyT5w==
Received: by filterdrecv-75ff7b5ffb-ktk29 with SMTP id filterdrecv-75ff7b5ffb-ktk29-1-616B32BC-2A
        2021-10-16 20:14:53.012529027 +0000 UTC m=+3880458.246409000
Received: from mail.wasin.io (unknown)
        by geopod-ismtpd-4-0 (SG) with ESMTP
        id 8_MvZWIGSoqTZ3NnEzhUhw
        for <linux-doc@vger.kernel.org>;
        Sat, 16 Oct 2021 20:14:52.434 +0000 (UTC)
Received: from mail.wasin.io (localhost.localdomain [127.0.0.1])
        by mail.wasin.io (Postfix) with ESMTP id 979A4A7988
        for <linux-doc@vger.kernel.org>; Sun, 17 Oct 2021 03:21:38 +0800 (SGT)
X-Virus-Scanned: Debian amavisd-new at mail.wasin.io
Received: from mail.wasin.io ([127.0.0.1])
        by mail.wasin.io (mail.wasin.io [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AmYsJ4HiYYVN for <linux-doc@vger.kernel.org>;
        Sun, 17 Oct 2021 03:21:13 +0800 (SGT)
Received: from haxpor-desktop.fritz.box (unknown [185.134.6.138])
        by mail.wasin.io (Postfix) with ESMTPSA id 3270FA7982;
        Sun, 17 Oct 2021 03:21:07 +0800 (SGT)
From:   Wasin Thonkaew <wasin@wasin.io>
Subject: [PATCH] docs: filesystems: Fix grammatical error "with" to "which"
Date:   Sat, 16 Oct 2021 20:14:53 +0000 (UTC)
Message-Id: <20211016201157.34240-1-wasin@wasin.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?zTXXJmbXDq374aSgSvBccBfxYYlnkEq2csSLV7s2zvJ+VzBfif=2FVK=2F1r3dRlUa?=
 =?us-ascii?Q?HKdShZ1bg6oUZY4XHrArWueftgMhcHLQFhZZy6b?=
 =?us-ascii?Q?atsisLdt84+guylGSTU3AV0OcG0sMCXkHHCfYK5?=
 =?us-ascii?Q?Mk710BzXcINFipmQeuvmqrdNCiynmOCWftbGoX2?=
 =?us-ascii?Q?Nnz0g97GLF3vdZIfqMY1PUwX0YHzIPdU=2FU6LUbb?=
 =?us-ascii?Q?IrEH11pHy9x2LZKI8vk4NXCjLLWNdpIYR++d2S?=
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wasin Thonkaew <wasin@wasin.io>
X-Entity-ID: 9qDajD32UCSRojGE52wDxw==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Wasin Thonkaew <wasin@wasin.io>
---
 Documentation/filesystems/autofs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/autofs.rst b/Documentation/filesystems/autofs.rst
index 681c6a492bc0..4f490278d22f 100644
--- a/Documentation/filesystems/autofs.rst
+++ b/Documentation/filesystems/autofs.rst
@@ -35,7 +35,7 @@ This document describes only the kernel module and the interactions
 required with any user-space program.  Subsequent text refers to this
 as the "automount daemon" or simply "the daemon".
 
-"autofs" is a Linux kernel module with provides the "autofs"
+"autofs" is a Linux kernel module which provides the "autofs"
 filesystem type.  Several "autofs" filesystems can be mounted and they
 can each be managed separately, or all managed by the same daemon.
 
-- 
2.25.1

