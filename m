Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8B2CC7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 11:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752876AbeCTLF1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 07:05:27 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:43692 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752848AbeCTLFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 07:05:21 -0400
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; 
   d="scan'208";a="38002754"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Mar 2018 19:05:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
        by cn.fujitsu.com (Postfix) with ESMTP id 99A094D0EFFC;
        Tue, 20 Mar 2018 19:05:15 +0800 (CST)
Received: from localhost.localdomain (10.167.226.106) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.361.1; Tue, 20 Mar 2018 19:05:14 +0800
From:   Dou Liyang <douly.fnst@cn.fujitsu.com>
To:     <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC:     <tglx@linutronix.de>, <mingo@redhat.com>, <corbet@lwn.net>,
        <rjw@rjwysocki.net>, <lenb@kernel.org>, <hpa@zytor.com>,
        <peterz@infradead.org>, Dou Liyang <douly.fnst@cn.fujitsu.com>
Subject: [PATCH 4/5] acpi/processor: Fix the return value of acpi_processor_ids_walk()
Date:   Tue, 20 Mar 2018 19:04:31 +0800
Message-ID: <20180320110432.28127-5-douly.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.106]
X-yoursite-MailScanner-ID: 99A094D0EFFC.A2FB5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: douly.fnst@cn.fujitsu.com
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ACPI driver should make sure all the processor IDs in their ACPI Namespace
are unique for CPU hotplug. the driver performs a depth-first walk of the
namespace tree and calls the acpi_processor_ids_walk().

But, the acpi_processor_ids_walk() will return true if one processor is
checked, that cause the walk break after walking pass the first processor.

Repace the value with AE_OK which is the standard acpi_status value.

Fixes 8c8cb30f49b8 ("acpi/processor: Implement DEVICE operator for processor enumeration")

Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>
---
 drivers/acpi/acpi_processor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 449d86d39965..db5bdb59639c 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -663,11 +663,11 @@ static acpi_status __init acpi_processor_ids_walk(acpi_handle handle,
 	}
 
 	processor_validated_ids_update(uid);
-	return true;
+	return AE_OK;
 
 err:
 	acpi_handle_info(handle, "Invalid processor object\n");
-	return false;
+	return AE_OK;
 
 }
 
-- 
2.14.3



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
