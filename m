Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8CFC4321E
	for <linux-doc@archiver.kernel.org>; Thu, 30 Sep 2021 09:45:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4282361980
	for <linux-doc@archiver.kernel.org>; Thu, 30 Sep 2021 09:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349530AbhI3Jqp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Sep 2021 05:46:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:46490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349501AbhI3Jqo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 30 Sep 2021 05:46:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C2576162E;
        Thu, 30 Sep 2021 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632995101;
        bh=DYJ89rzqXUfh3umerN+N9lcNJrbws55CV6Gd6bZuYy0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y769Xp/jdERhqy3tlgR+DeHkyoQWoi7JEP8ckVUuewVxIvPxb+f9bJuiHJJS64y7i
         dRdIsJPRRZL2A1pc9dptk7LSkVg+CxjAPA7T3liImQgQKw61fNbhUoRVx50/TJK539
         Jjv5hNPjkBeS6N9U6bHnx1fhfYeFUmLre4TIoeJk2tOT+bCGepn1cIFhkVxkFV1OUn
         X8pMS8BXGBIcwNj6kCbDadh07eAXAepmQv3lOvDYV6/GxMekUCbux50YeG0/VZK2xp
         ayIfTH4zUcnmUs2nfarZ0lpW3buac3+Su/t4sU50RRmZZHqYO4Wcitos/tYWpXt0Cj
         zMwpW9OQuIvXQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mVscd-002ATO-QD; Thu, 30 Sep 2021 11:44:59 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Oded Gabbay <oded.gabbay@gmail.com>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] ABI: sysfs-class-extcon: use uppercase X for wildcards
Date:   Thu, 30 Sep 2021 11:44:53 +0200
Message-Id: <2dfd3f80cea2d0501f6451f2e66000b00fda3346.1632994837.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632994837.git.mchehab+huawei@kernel.org>
References: <cover.1632994837.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Uppercase letters X, Y and Z are handled as wildcards by
scripts/get_abi.pl.

We can't do that with lowercase letters, as they're used
everywhere.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH v2 0/7] at: https://lore.kernel.org/all/cover.1632994837.git.mchehab+huawei@kernel.org/

 Documentation/ABI/testing/sysfs-class-extcon | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-extcon b/Documentation/ABI/testing/sysfs-class-extcon
index fde0fecd5de9..f8e705375b24 100644
--- a/Documentation/ABI/testing/sysfs-class-extcon
+++ b/Documentation/ABI/testing/sysfs-class-extcon
@@ -65,19 +65,19 @@ Description:
 		interface associated with each cable cannot update
 		multiple cable states of an extcon device simultaneously.
 
-What:		/sys/class/extcon/.../cable.x/name
+What:		/sys/class/extcon/.../cable.X/name
 Date:		February 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
 Description:
-		The /sys/class/extcon/.../cable.x/name shows the name of cable
-		"x" (integer between 0 and 31) of an extcon device.
+		The /sys/class/extcon/.../cable.X/name shows the name of cable
+		"X" (integer between 0 and 31) of an extcon device.
 
-What:		/sys/class/extcon/.../cable.x/state
+What:		/sys/class/extcon/.../cable.X/state
 Date:		February 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
 Description:
-		The /sys/class/extcon/.../cable.x/state shows and stores the
-		state of cable "x" (integer between 0 and 31) of an extcon
+		The /sys/class/extcon/.../cable.X/state shows and stores the
+		state of cable "X" (integer between 0 and 31) of an extcon
 		device. The state value is either 0 (detached) or 1
 		(attached).
 
-- 
2.31.1

