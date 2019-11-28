Return-Path: <SRS0=ox8w=ZU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58AFC432C0
	for <linux-doc@archiver.kernel.org>; Thu, 28 Nov 2019 20:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CE18216F4
	for <linux-doc@archiver.kernel.org>; Thu, 28 Nov 2019 20:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGfa3lcM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfK1UZl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Nov 2019 15:25:41 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29996 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726800AbfK1UZl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Nov 2019 15:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574972740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yNq9Cl1u8a4Res9gMqZVglO/lwiENzme0qL73M9MY10=;
        b=iGfa3lcM+x4ZdaCCNlh9J0QKx8CfIQaMWmsreOv1wzDUPyQvJIROUzQZngJy8YJ4lLIbQU
        +K3kAwICKk8CPxWeTSvZ2dc9oaHWS3h8ohFVVJ3twZ+d2ZDKaiN6N2Lowt0sD1sfTbBO01
        1mlrqy7NpVb+FSHX7w+c4j27dMcSJvo=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-pnvmSJokOSuHFTnqhSAEzw-1; Thu, 28 Nov 2019 15:25:38 -0500
Received: by mail-pg1-f197.google.com with SMTP id e16so15195514pgi.22
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2019 12:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EGXp9xk2iujKm5hWzUI7x5fii/ZV0bMMwslmLu+YaOk=;
        b=IsU2IcKplK8xrJMundx/FgpmPsD9ZrnucuHcuWuEu5iCFWuhzXcXnjVMHK7NU3qqZa
         kS6c3DIUv1ffxtgVpEP0by5yNIHF0A5hRUIXBoSKqsPzfM4mUXchdjQox28Nmp/Azwz6
         MwkuF3Cm93vhea8cJ6SrJaUEgHmDgtC1p5xRKkcx0fq+CAaY2+2Izu295EuM2AqdGZ4F
         MF9etXO8yNye3nPcXmJHGo8uXr9tFTG7fD0BjhhRZiB0b4pISjUbtLGTUm/2tX2XwDEC
         0LBgtmEdVB3L3rGa4GCVYKEgW31+zwy9xfXwb1n2DAolmPmx4/1rg9pwrSCGzWUW6V5W
         pong==
X-Gm-Message-State: APjAAAWmmBtNePuVUY2k9RtPerSSz+wC0n9Kx8evnY0Sh3cclp5ZTkOr
        tAodlyoFc3xIUN8l7+XUX74B3t1N1cyFAkpDshpZtxqKOs/Sx6YrKaJv2rjP062GDy7Mj20AYMN
        bKF9RA8ZxAVbMimg+GdeI
X-Received: by 2002:aa7:9f08:: with SMTP id g8mr55602054pfr.59.1574972737769;
        Thu, 28 Nov 2019 12:25:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZd0aFye0vSy1NxsGtsRRJBkuncMDWAD+zRH7F+esJn7Za4gqNzi7+zhDEogE6OWw66etLDg==
X-Received: by 2002:aa7:9f08:: with SMTP id g8mr55602046pfr.59.1574972737583;
        Thu, 28 Nov 2019 12:25:37 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id 21sm22106551pfy.67.2019.11.28.12.25.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 12:25:36 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, Boris Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        James Morse <james.morse@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Subject: [PATCH v5 4/5] Documentation/vmcoreinfo: Add documentation for 'MAX_PHYSMEM_BITS'
Date:   Fri, 29 Nov 2019 01:55:15 +0530
Message-Id: <1574972716-25858-3-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
References: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: pnvmSJokOSuHFTnqhSAEzw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for 'MAX_PHYSMEM_BITS' variable being added to
vmcoreinfo.

'MAX_PHYSMEM_BITS' defines the maximum supported physical address
space memory.

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: James Morse <james.morse@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation=
/admin-guide/kdump/vmcoreinfo.rst
index 007a6b86e0ee..447b64314f56 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -93,6 +93,11 @@ It exists in the sparse memory mapping model, and it is =
also somewhat
 similar to the mem_map variable, both of them are used to translate an
 address.
=20
+MAX_PHYSMEM_BITS
+----------------
+
+Defines the maximum supported physical address space memory.
+
 page
 ----
=20
--=20
2.7.4

