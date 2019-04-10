Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C6E17D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 11:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731331AbfDJLMQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 07:12:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44430 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfDJLMQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 07:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ifG45tSFXLTwXJb1h6jD264H1aDH2yrbOS4N926T3HM=; b=MEznhMUi68dAY2gC5NZWGvxOOH
        +3X6ZbxOS4cXYlPgjk8OITTzmZUjk/GJy3fhzDNDj1ZN7b8C5FHL59SPtOV0p23fqtzGUanY0jAkv
        uD0NxB2uBEhKvmkWraLb9cAQCa38ZlxB6Jn0zYN3xTTj7afWAQeoIzPGK1BQcION1jN+HiDZaiGZj
        0r4lUw3lbMH9YxeRRrf6ZzmJEud7pS74vPtb0ZlT3eS6kxXxj0c6J11Znt3MdGCtiCsddr9MNkcJj
        2O9ihzHikCyjVEshAJEvK8HCCsJA4FhsFDJQsc81BaTn4OrbkzSGsdoKG1KEdV6WI6erEJ6vjjRsA
        ny7H/OZA==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hEB9L-0006mu-JK; Wed, 10 Apr 2019 11:12:15 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hEB9J-0007SZ-A8; Wed, 10 Apr 2019 08:12:13 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH 04/21] docs: hwmon: sch5627: convert to ReST format
Date:   Wed, 10 Apr 2019 08:11:54 -0300
Message-Id: <e3fb7e218af49e4e6132757d6610278f7409df8c.1554893882.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1554893881.git.mchehab+samsung@kernel.org>
References: <cover.1554893881.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert sch5627 to ReST format, in order to allow it to
be parsed by Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/hwmon/sch5627 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/hwmon/sch5627 b/Documentation/hwmon/sch5627
index 0551d266c51c..187682e99114 100644
--- a/Documentation/hwmon/sch5627
+++ b/Documentation/hwmon/sch5627
@@ -2,9 +2,13 @@ Kernel driver sch5627
 =====================
 
 Supported chips:
+
   * SMSC SCH5627
+
     Prefix: 'sch5627'
+
     Addresses scanned: none, address read from Super I/O config space
+
     Datasheet: Application Note available upon request
 
 Author: Hans de Goede <hdegoede@redhat.com>
-- 
2.20.1

