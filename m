Return-Path: <SRS0=1Ifr=ZV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F17BC432C0
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 20:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC2F42158A
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 20:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xn5WL/5f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfK2UAD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Nov 2019 15:00:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46667 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727182AbfK2T7v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 14:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575057590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yNq9Cl1u8a4Res9gMqZVglO/lwiENzme0qL73M9MY10=;
        b=Xn5WL/5fcfHfHYGqaCb56Nms5mGTDrFImjM5lMm9SPXQiMR8avov3MQm2U377R69ly1Wy9
        MdemmGd+QMX7FJ0PDFZXUte1tfpdJIyVAQA55VJxFVRlm6gKm+RWhumSwxDngartSAHXsA
        7ngXgIAdFVzheLr4v9LmUhyKoV3PdIU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-gntmA8q3Mpmt9vvyufy6bw-1; Fri, 29 Nov 2019 14:59:49 -0500
Received: by mail-pg1-f200.google.com with SMTP id p188so17081381pgp.15
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 11:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EGXp9xk2iujKm5hWzUI7x5fii/ZV0bMMwslmLu+YaOk=;
        b=h23cwuQAUQKCCGvvu+czCyqi4nhLqOuZxohoQ8IVWeD+UZ4JNl18pV33l75T019SFf
         +StEfDY2QgBSf9INhXPS3QBYzLScVardKPKXwZdkKTr7pNMn/tUZziA/tlJnLqZaegTf
         QRDijr3SEVH+lKZxTF0Gl2sQT4p0TrRShgiw49mZKiN1Dy4936zg3QjfOkk0YrgPcpB9
         Wcz3XhihGcvhoMGM0M3OCgumR3Wk+an9ym5qSA3y8NKMg4oNMTaWhBVfsMmOMjl66vVq
         9FsYV5i476akMonBDqWUpI6nuPYvoIORgyy4nxhhaxtFhEY+pB3PeTbFDYBLFRK0PJDA
         dvDQ==
X-Gm-Message-State: APjAAAV4nk3xA0biPvlYJhjqXNYpkwjfIxUitXqFhwofdiR23SxY+kj0
        aGBg7bbTyrzc0lKcIyA4E95P5tJSS7kN/q3F4T6HFhMdRV/Oc/HGuEyOs9n6JxtQLV6pCOcSLGi
        iGOnVDbA5vLPHgMHrpHqD
X-Received: by 2002:a17:90a:dc81:: with SMTP id j1mr3729522pjv.29.1575057588119;
        Fri, 29 Nov 2019 11:59:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPVcE/XW8sUFbfhtiOj/O3Z62tRbLgdRo5GLkRP1HykyImTD8scVfMGcKn/WmLBQBtuJQ40Q==
X-Received: by 2002:a17:90a:dc81:: with SMTP id j1mr3729508pjv.29.1575057587944;
        Fri, 29 Nov 2019 11:59:47 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id 67sm15725516pfw.82.2019.11.29.11.59.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 11:59:47 -0800 (PST)
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
Subject: [RESEND PATCH v5 4/5] Documentation/vmcoreinfo: Add documentation for 'MAX_PHYSMEM_BITS'
Date:   Sat, 30 Nov 2019 01:29:18 +0530
Message-Id: <1575057559-25496-5-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: gntmA8q3Mpmt9vvyufy6bw-1
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

