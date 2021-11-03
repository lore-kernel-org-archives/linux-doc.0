Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017A3C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 19:35:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB3CE611C1
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 19:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhKCThn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Nov 2021 15:37:43 -0400
Received: from o2.lv1nn.shared.sendgrid.net ([167.89.100.176]:39126 "EHLO
        o2.lv1nn.shared.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231343AbhKCThm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Nov 2021 15:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wasin.io;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=s1; bh=qNBGXlLMnPhrJq5G4++xZYyQ0CDuclAGDf2//H9A8Jw=;
        b=ATVwlzXPw6ucJT7y90v3tOD8+WcmUwa6p3KUrJcBgBwJCfUasDWzO6o+yKsla0vrNh5T
        KdSqEAm8tZYLaCDSlMbuvlnNGR/gTXgTai+tum1kJVcvkMJa7QVzdk3Wzxj7EJ8dNHCwbF
        /APUeRwyz35IRsUN6rZWXbcxq7sE6OQbya4o4kCdVhKFSZ9PUykIXH3W4RBUXsgxiv3QQV
        nWFS+l0i/k+ClIUZOtk4kHqRnddSdujm0iMyIAA1n6wvgSpcDLcYrcaK/dPh92UfiuzRR5
        xhsv0EQZUgh6BSDNkt+CWI8PAUiGgSI5hMnK/o/S4eHcASTx2MoqGVeIFkJPrlOQ==
Received: by filterdrecv-7bc86b958d-qrvxl with SMTP id filterdrecv-7bc86b958d-qrvxl-1-6182E468-7F
        2021-11-03 19:35:04.696267255 +0000 UTC m=+5433270.059343460
Received: from mail.wasin.io (unknown)
        by geopod-ismtpd-canary-0 (SG)
        with ESMTP id Bsi0x6GJRTSMUtBPATxNfg
        for <linux-doc@vger.kernel.org>;
        Wed, 03 Nov 2021 19:35:04.114 +0000 (UTC)
Received: from mail.wasin.io (localhost.localdomain [127.0.0.1])
        by mail.wasin.io (Postfix) with ESMTP id E2886A79D9
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 02:39:16 +0800 (SGT)
X-Virus-Scanned: Debian amavisd-new at mail.wasin.io
Received: from mail.wasin.io ([127.0.0.1])
        by mail.wasin.io (mail.wasin.io [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IaRuNgh6wzH6 for <linux-doc@vger.kernel.org>;
        Thu,  4 Nov 2021 02:38:54 +0800 (SGT)
Received: from haxpor-desktop.fritz.box (unknown [185.134.6.138])
        by mail.wasin.io (Postfix) with ESMTPSA id 5BA4BA79D5;
        Thu,  4 Nov 2021 02:38:47 +0800 (SGT)
From:   Wasin Thonkaew <wasin@wasin.io>
Subject: [PATCH RESEND] docs: filesystems: Fix grammatical error "with" to
 "which"
Date:   Wed, 03 Nov 2021 19:35:04 +0000 (UTC)
Message-Id: <20211103193354.185647-1-wasin@wasin.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?zTXXJmbXDq374aSgSvBccBfxYYlnkEq2csSLV7s2zvJ+VzBfif=2FVK=2F1r3dRlUa?=
 =?us-ascii?Q?HKdShZ1bg6oUZY4XHrArWueQ4x5+vTrTfV0U8Ma?=
 =?us-ascii?Q?xvxo01JVn0N6hFhJdED0MHCtCiCCvdOyEsqegVw?=
 =?us-ascii?Q?k4K57hcVqmnkuONbc337dK1mZ4hFYfnLGug9mub?=
 =?us-ascii?Q?Yw0Lf7AnCV5yNw+0tNqhcaDndQ98V6JRaeiQ52m?=
 =?us-ascii?Q?raUKQHCHeBiKJUydpL49x22mldjKBkCMady6=2F1?=
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

