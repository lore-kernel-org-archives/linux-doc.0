Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6377C7DF8F
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 22:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752730AbeFEWuk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 18:50:40 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:25544 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932103AbeFEWuD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Jun 2018 18:50:03 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id B6BE540523;
        Wed,  6 Jun 2018 00:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        references:in-reply-to:message-id:date:date:subject:subject:from
        :from:received:received:received; s=dkim20160331; t=1528239001;
         x=1530053402; bh=9Ohwodv91z0e41m/OykB21Y41w7wzsGx/F9RC2m+3BE=; b=
        EFUuUKfP5btTULFn/QSYTX9pABqgpFwg0BC+vyKyqq9N/bBb3xtVXAgKmgk6404g
        VLXu0i+injdUXNBuOU0axOxpJgFmOgE9DL5Uhd+jtVdt0u2wgPuuPgp8wAs/2Pfm
        hmYWcSuBfKO7fdIMy+QV29za7RjWy2DH+0fX0c/XHsQ/Mud1cg8PNyVHYE4QKZHh
        zxyrmtcesbb3HaZwXm0aBt8NXdCoc6aR2UiGj0WVcp7QmjdTUtZn736K3mF/wlE9
        /rIoS5ThmsygpdYEb4kRGWlDeJ64R4tLzmyyW9aCl4cDw7RzF9c4HOebmqrFPefw
        i3iA/QOEYLsIRFInEKhk9C/1du+GLc9O65iW3Bfsi79jwI1s1f8DEOt+xL66jESf
        tMNPnuhVwze9xN+5YDhaPPY3WOyGgm+CAuNsrD6GmjSJ/Q3Sn44WMFck/U3z7zEv
        wgZGjjizoAJxtc4I/UU5AcX9JiOA1Wray7cnILwddUFYziNm5RQTLhTk656zqDYl
        nzN+qftDeDYH5CVMCsQxS6I2tgBny3fpE6IxQzkCwqdwla4g03g7THERewIiUiRS
        afa/7Ms/ca8k4wiUvdFIr8A6R+lNAMJ0AFLL/3CSNOZGsa/+XpFQilxWLKlJMmoQ
        7kwPcTy4nydn57ygwizQmNcYKdI06H3AnVyTYoQ/zwg=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FeUl7vuCHzWy; Wed,  6 Jun 2018 00:50:01 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 2C15D403A8;
        Wed,  6 Jun 2018 00:50:01 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id E645EAE6;
        Wed,  6 Jun 2018 00:50:00 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH 4/6] doc: add some chapter labels
Date:   Wed,  6 Jun 2018 00:49:01 +0200
Message-Id: <20180605224903.9483-5-federico.vaga@vaga.pv.it>
In-Reply-To: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
References: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The idea is to make it easier to create references (doc-guide does the same).
This will be used, for example but not only, in translations to point to
the main document.

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
---
 Documentation/index.rst                | 2 ++
 Documentation/kernel-hacking/index.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index f7ab4d6a281e..245ab83d0e6f 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -3,6 +3,8 @@
    You can adapt this file completely to your liking, but it should at least
    contain the root `toctree` directive.
 
+.. _linux_doc:
+
 The Linux Kernel documentation
 ==============================
 
diff --git a/Documentation/kernel-hacking/index.rst b/Documentation/kernel-hacking/index.rst
index fcb0eda3cca3..f53027652290 100644
--- a/Documentation/kernel-hacking/index.rst
+++ b/Documentation/kernel-hacking/index.rst
@@ -1,3 +1,5 @@
+.. _kernel_hacking:
+
 =====================
 Kernel Hacking Guides
 =====================
-- 
2.14.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
