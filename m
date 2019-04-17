Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 412897D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Apr 2019 09:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbfDQJqh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Apr 2019 05:46:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44488 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731633AbfDQJqg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Apr 2019 05:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xCuR65PtwgJBAPxgpGGXq1ybGkxNyklHVSry7KBSYD4=; b=R5Ffh4/pikYIASKx80VMTLv9F7
        WSBnPADcZllhXk5C6NFIUjAvFZMjIJR+3lvWcOIvGpnM8waYcp/s1RnpuNY8n4vLEdpx32n1bqydA
        8r5sRndbFT/CJbYMy5f+urdoh4TpYo7XEOLk+NXh5nvhowuHDCWjVVhUIdWz469vQ7PH+eB/sW7j8
        n6ZdFlM6KGjW39ef+nl7/d/U3Njz5l+2NAcwpZpC05nTxgyb1lpeLCY3ZbOP/PSpm1jeNpf5JKleq
        qa07n0DhcFFwMh6BQjux6bnfjL/36In4j6fAt1sSi4DuLkj1YM92ysY/mc8AKOk3B/T3liow2Qo03
        71MgdDXg==;
Received: from 177.132.233.55.dynamic.adsl.gvt.net.br ([177.132.233.55] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hGh9G-0000a6-JK; Wed, 17 Apr 2019 09:46:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hGh9C-0003uK-S5; Wed, 17 Apr 2019 06:46:30 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 04/21] docs: hwmon: sch5627: convert to ReST format
Date:   Wed, 17 Apr 2019 06:46:12 -0300
Message-Id: <849c7881be62a68274f57d9cc58ee93194f695cb.1555494108.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555494108.git.mchehab+samsung@kernel.org>
References: <cover.1555494108.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert sch5627 to ReST format, in order to allow it to
be parsed by Sphinx.

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

