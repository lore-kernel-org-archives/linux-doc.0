Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322A9C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 14:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1826A61074
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 14:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbhI0OBg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Sep 2021 10:01:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234612AbhI0OBf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 Sep 2021 10:01:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4293561074;
        Mon, 27 Sep 2021 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632751197;
        bh=kkWXosDe84Vf2OVj3fbdJjwMfsMq9K/UgZoXJLhLtXo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PheHoVUZGexj+fI7rH3a/H//eFp1EAMltu/p+zufgwmNpZoLtep5/DmuXXcNMH2Hh
         hwU55vMK7BvMuZq0kcGAwwoBU7meVuZfKIqrvTeF4Zitbq1j0Qt6jibCcRYzMeKs/e
         E2YJ9nq6e4pCKFyfVGWwkGSOw+geHoEjL0AKNy2De4Wd7ioEazErUEUrRZUlUsYDNT
         c011ElY8+6IJu4nY11hDYMYlaOuTa2/HyHB7A+Klohr8PRfa6GBIo3x0xHkRIe6seJ
         wOw20muIkd4qTnJtPpzdrQA61dhAhC33WXV2ETbmT8vDjdIwZTpvlWmpga6srhy5fr
         AXg3R/00mOmzw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mUrAh-000Atq-EJ; Mon, 27 Sep 2021 15:59:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] ABI: sysfs-devices: add /dev ABI
Date:   Mon, 27 Sep 2021 15:59:38 +0200
Message-Id: <bef678e68d1ac8ac504ed6e09f22105b787c877c.1632750608.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632750608.git.mchehab+huawei@kernel.org>
References: <cover.1632750608.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 23681e479129 ("[PATCH] Driver core: allow struct device to have a dev_t")
added a /dev ABI for /sys/devices. Document it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH 00/17] at: https://lore.kernel.org/all/cover.1632750608.git.mchehab+huawei@kernel.org/

 Documentation/ABI/stable/sysfs-devices | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-devices b/Documentation/ABI/stable/sysfs-devices
index 42bf1eab5677..98a8ef99ac5f 100644
--- a/Documentation/ABI/stable/sysfs-devices
+++ b/Documentation/ABI/stable/sysfs-devices
@@ -23,3 +23,10 @@ Contact:	Device Tree mailing list <devicetree@vger.kernel.org>
 Description:
 		If CONFIG_OF is enabled, then this file is present. When
 		read, it returns full name of the device node.
+
+What:		/sys/devices/*/dev
+Date:		Jun 2006
+Contact:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Description:
+		Major and minor numbers of the character device corresponding
+		to the device (in <major>:<minor> format).
-- 
2.31.1

