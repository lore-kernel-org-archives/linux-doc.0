Return-Path: <SRS0=pmrK=ZP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE2DC43215
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 02:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62DFD20721
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 02:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aBHRxzwc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfKWCoo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Nov 2019 21:44:44 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:42620 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfKWCoo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Nov 2019 21:44:44 -0500
Received: by mail-il1-f196.google.com with SMTP id f6so5045365ilh.9
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2019 18:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:message-id:user-agent:mime-version;
        bh=7g/Y3wR5gVZOwog74zMjqNNgFW5KdBsIY/ptyys6DJE=;
        b=aBHRxzwcxFQNrfM9pZLRT4ER5wxGCxmHVr4QWLCAj0lXXyLePykza3DWEfRn2xTjtb
         DbzrSsje9VHZpAfkiZBKWJ6rg2zn+5ujIq3RxemUuIzVN832GWoXfPeJj/JePleSXGZW
         BwzmjDsqiWOyYwXaQuTbSNok8IL/qPFuHXHeJQ3UiEgOd4h7iWn3zarnNLQwgTw92RSV
         hC2069cqB57RCKP3Z8vg7rw5QIYdXwMhWIxSuznScJCJWoS9y0eE+FzU0UKZXq5Tk94Z
         1dTUEgBLtqwoRIgKcmEKpru0HVAPe0Q3x73efiQ+7Wkbpkvo25iYguHhLGem8et3HB5E
         H1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=7g/Y3wR5gVZOwog74zMjqNNgFW5KdBsIY/ptyys6DJE=;
        b=GB+bwCzGM9FpmtlOFdwapLnPHFutl1n1EX+EzCfnUHkcDOPyJOz6d3Jd5tFhsK2Ze1
         z/dKDZCIYjHS5RqRuhpn/x/wnuikcoAxzQ1yDNq0kNEVsfeHp4XAPkRkb26qAuVhZ45r
         XXeAoPgDxLUAE9oEzDVzKTizPPlhkrPIg/P2sr1Fzc4IrRxK1DvzYWZUGwt7ZDSqvpG2
         r5qAQFE8+MM2ftNYuYGT3n5MmYidRmDa3E1Pq3z0lOl7yzhphuCzpLuY0wgDNZXAo720
         bw/ie7Xw5W7V3ATt7FS8087MSNY/7ou6ETtgHkvm9/d8YExpFlBe3/bz0cSdjAB1Qm/J
         6WXg==
X-Gm-Message-State: APjAAAXsBoaFCY2CMwO4EL6Iwll8Xw98NV18FDxiele0XQkV2e3NTkRf
        A1MN02YRnkVpAEb4kUXiz0xepg==
X-Google-Smtp-Source: APXvYqx+rLljVRhSTLXDzWQSdfPi1a0ZZ07AY/mQyuSP3TF8FbIDJWJeh1aiWBGMfCOa4b4vzbLGMw==
X-Received: by 2002:a02:94e9:: with SMTP id x96mr2440290jah.68.1574477081696;
        Fri, 22 Nov 2019 18:44:41 -0800 (PST)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id l63sm2783843ioa.19.2019.11.22.18.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 18:44:41 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:44:39 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     linux-riscv@lists.infradead.org
cc:     palmer@dabbelt.com, aou@eecs.berkeley.edu, krste@berkeley.edu,
        waterman@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: riscv: add patch acceptance guidelines
Message-ID: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Formalize, in kernel documentation, the patch acceptance policy for 
arch/riscv.  In summary, it states that as maintainers, we plan to only 
accept patches for new modules or extensions that have been frozen or 
ratified by the RISC-V Foundation.

We've been following these guidelines for the past few months.  In the
meantime, we've received quite a bit of feedback that it would be
helpful to have these guidelines formally documented.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Krste Asanovic <krste@berkeley.edu>
Cc: Andrew Waterman <waterman@eecs.berkeley.edu>
---
 Documentation/riscv/patch-acceptance.rst | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/riscv/patch-acceptance.rst

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
new file mode 100644
index 000000000000..2e658353b53c
--- /dev/null
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================================
+arch/riscv maintenance and the RISC-V specifications
+====================================================
+
+The RISC-V instruction set architecture is developed in the open:
+in-progress drafts are available for all to review and to experiment
+with implementations.  New module or extension drafts can change
+during the development process - sometimes in ways that are
+incompatible with previous drafts.  This flexibility can present a
+challenge for RISC-V Linux maintenance.  Linux maintainers disapprove
+of churn, and the Linux development process prefers well-reviewed and
+tested code over experimental code.  We wish to extend these same
+principles to the RISC-V-related code that will be accepted for
+inclusion in the kernel.
+
+Therefore, as maintainers, we'll only accept patches for new modules
+or extensions if the specifications for those modules or extensions
+are listed as being "Frozen" or "Ratified" by the RISC-V Foundation.
+(Developers may, of course, maintain their own Linux kernel trees that
+contain code for any draft extensions that they wish.)
+
+Additionally, the RISC-V specification allows implementors to create
+their own custom extensions.  These custom extensions aren't required
+to go through any review or ratification process by the RISC-V
+Foundation.  To avoid the maintenance complexity and potential
+performance impact of adding kernel code for implementor-specific
+RISC-V extensions, we'll only to accept patches for extensions that
+have been officially frozen or ratified by the RISC-V Foundation.
+(Implementors, may, of course, maintain their own Linux kernel trees
+containing code for any custom extensions that they wish.)
-- 
2.24.0.rc0

