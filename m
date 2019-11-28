Return-Path: <SRS0=ox8w=ZU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353AEC432C0
	for <linux-doc@archiver.kernel.org>; Thu, 28 Nov 2019 20:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D51EA216F4
	for <linux-doc@archiver.kernel.org>; Thu, 28 Nov 2019 20:25:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eq4dJpBy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfK1UZq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Nov 2019 15:25:46 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40329 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726917AbfK1UZq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Nov 2019 15:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574972745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=41xNMejmkDpiENDKO7RxAxz9cPSeln8z2A1ifqUYAvQ=;
        b=Eq4dJpByok4mJzG+h1bcOLUTz+teMeIXm2JNaseXdSZJWmFmmCzUgJQKzCwByKThiCRWzw
        oMGvwW6AIVNMdMUgjQ5XgWFEO+l+HS253aa0v4kA4fa9SKksa/Kg45uKMdVwAqvltMu+BH
        4D0/kxIiV3Mz9dGkwtR07uRNeurqY24=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-o9DdFaZ1MZWCgVnazTZMDw-1; Thu, 28 Nov 2019 15:25:42 -0500
Received: by mail-pf1-f197.google.com with SMTP id h67so16725800pfb.7
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2019 12:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TnU1CF4ydXp0Re/7xQPqByhi17OoIqWu96aUm7ilAL8=;
        b=AcxaVRjUr1WdZdJpy2FV1gkUMcgjqV4n+TYjSqkgpPIXvRvKTPpTAR3Jo6Y5Kd1xtT
         XI84vJnxnrZrIl/0eX/QhLcszHVD5wxx+7LXRJoG+Tf3k9jYiv5bJCEnx01BVsfUkrs1
         zzU051pCvWDeY8k2cEizipTit9mAxL6T4VQujgEznKSU8tT03CAIFcEXjCsnT/N6Wpaa
         APEgn6MxRyYEXqZEDFIE6UFfKM5QDStbPXvihHmiD5qr6c9grX+3O8Joh8N/qOWFxz1O
         K99KeB/hM0RqlKKDPXU2HaOu1t+t72A6ce/l1RJdPRUkzX35oTIbO/iq2DbRBZojkhaJ
         7ckQ==
X-Gm-Message-State: APjAAAV1yYng6aZiQ5Vh+DtHgGDsExtaZc/6QYHdk3f3I+jSQLLiYpUR
        s5XzcTgPb2veVlDtzSFPSLMJze0VXij+4jpxTRZqNa4nX+zUzuuGhcXNxpYGnePHOcMktBL4JZi
        vVMUMzsYAnYeUJSVhZlwv
X-Received: by 2002:a17:90a:3463:: with SMTP id o90mr14440663pjb.4.1574972741160;
        Thu, 28 Nov 2019 12:25:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1994kyjpL8nA7jbNA2MDbvleaYMa6ZgrsQMiMtjPLDmyjZ21lIhTP8RXhXz67xc7yDAqxlg==
X-Received: by 2002:a17:90a:3463:: with SMTP id o90mr14440628pjb.4.1574972740900;
        Thu, 28 Nov 2019 12:25:40 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id c184sm22569924pfc.159.2019.11.28.12.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 12:25:40 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Subject: [PATCH v5 5/5] Documentation/vmcoreinfo: Add documentation for 'TCR_EL1.T1SZ'
Date:   Fri, 29 Nov 2019 01:55:16 +0530
Message-Id: <1574972716-25858-4-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
References: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: o9DdFaZ1MZWCgVnazTZMDw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for TCR_EL1.T1SZ variable being added to
vmcoreinfo.

It indicates the size offset of the memory region addressed by TTBR1_EL1
and hence can be used for determining the vabits_actual value.

Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation=
/admin-guide/kdump/vmcoreinfo.rst
index 447b64314f56..f9349f9d3345 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -398,6 +398,12 @@ KERNELOFFSET
 The kernel randomization offset. Used to compute the page offset. If
 KASLR is disabled, this value is zero.
=20
+TCR_EL1.T1SZ
+------------
+
+Indicates the size offset of the memory region addressed by TTBR1_EL1
+and hence can be used for determining the vabits_actual value.
+
 arm
 =3D=3D=3D
=20
--=20
2.7.4

