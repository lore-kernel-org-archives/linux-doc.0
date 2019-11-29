Return-Path: <SRS0=1Ifr=ZV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D266AC43215
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 19:29:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D66A20869
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 19:29:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLW3sGDh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfK2T3U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Nov 2019 14:29:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40108 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726926AbfK2T3U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 14:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575055758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/y8p7TWJ4+9dx0qZYntYI0vqqca78jHSFlqFEn+6Y9I=;
        b=RLW3sGDhjZCB2O/NoGDeNtQ/lDyLeNCw/BCb6SjVWtkXCoSchoilblR+aNcGuWgiNXEGRH
        p9C5eATpvZmpMnSkg0RpkYxlAYIDUcH6QYEmIc+Cd7H+zXvUO9SphuHYJXtGClX37FaaKi
        44JV9CosYCAWYJgqqZUa9z06tgGAI90=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-2WIM8kHROaOyq2jJRZdjcQ-1; Fri, 29 Nov 2019 14:29:17 -0500
Received: by mail-pg1-f200.google.com with SMTP id f18so17022873pgh.18
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 11:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D7Q1sNAJK7KGCeC1/osi4u/yd8LMbojW2DcAg7eyhwk=;
        b=c3Frpl8phDnnBQjbagGdGaB2Znz5oRGF+voJllrq1fFBuA/KjpB3utY0S+jOfWxhwu
         K7CmJt9HHKHrD4iGe6r9AiaFhdcRHk/sNx2ocoz5ozmIvEG/9SmOXIRuPw3fJ8qME+wF
         ov+NIPmc9vZQp872J6I/N+sz8fq3qqy7CgMwYk4JnNSOiDlELsotkrw9T4IqiEzwoSX0
         MRI9ETqSTmXSBCpNziMriDh2V51pjUouLWzlCPmBNcTZUa/cHeOHenqKWMqGUGZNavXI
         nkNXf2kjAjoDuWEVC0ZfKrSqLXA4/7u0JKAopK5cXFrYjp1Yr1BUTGdYj25Rs86SLHnE
         B11g==
X-Gm-Message-State: APjAAAVq/1bqNZhQPs9aDTjNwbbRVZhk4EehZ5SPMObC0MfAhboZlUqu
        cGd/JYDbF/k4faU3TKCkQnSw4YF/S8+H8523p4q1wv0V1tq+o0A8zpwNJSI2v8Iloze4Ncf9pAP
        5RiNVWLHktTPITlEQw0EC
X-Received: by 2002:a62:e811:: with SMTP id c17mr59017414pfi.136.1575055755722;
        Fri, 29 Nov 2019 11:29:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmbfojhLeBaMJ+LMS9xhgE2Ea/t4NGJd82NYLWuOeIYvKi0ET6gSLJo8cMWL7LovPsMdHq4A==
X-Received: by 2002:a62:e811:: with SMTP id c17mr59017393pfi.136.1575055755409;
        Fri, 29 Nov 2019 11:29:15 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id p5sm871469pgs.28.2019.11.29.11.29.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 11:29:14 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, Boris Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Subject: [RESEND PATCH v5 1/5] crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
Date:   Sat, 30 Nov 2019 00:58:42 +0530
Message-Id: <1575055726-23464-2-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575055726-23464-1-git-send-email-bhsharma@redhat.com>
References: <1575055726-23464-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: 2WIM8kHROaOyq2jJRZdjcQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now user-space tools like 'makedumpfile' and 'crash' need to rely
on a best-guess method of determining value of 'MAX_PHYSMEM_BITS'
supported by underlying kernel.

This value is used in user-space code to calculate the bit-space
required to store a section for SPARESMEM (similar to the existing
calculation method used in the kernel implementation):

  #define SECTIONS_SHIFT    (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)

Now, regressions have been reported in user-space utilities
like 'makedumpfile' and 'crash' on arm64, with the recently added
kernel support for 52-bit physical address space, as there is
no clear method of determining this value in user-space
(other than reading kernel CONFIG flags).

As per suggestion from makedumpfile maintainer (Kazu), it makes more
sense to append 'MAX_PHYSMEM_BITS' to vmcoreinfo in the core code itself
rather than in arch-specific code, so that the user-space code for other
archs can also benefit from this addition to the vmcoreinfo and use it
as a standard way of determining 'SECTIONS_SHIFT' value in user-land.

A reference 'makedumpfile' implementation which reads the
'MAX_PHYSMEM_BITS' value from vmcoreinfo in a arch-independent fashion
is available here:

[0]. https://github.com/bhupesh-sharma/makedumpfile/blob/remove-max-phys-me=
m-bit-v1/arch/ppc64.c#L471

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
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
 kernel/crash_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 9f1557b98468..18175687133a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -413,6 +413,7 @@ static int __init crash_save_vmcoreinfo_init(void)
 =09VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
 =09VMCOREINFO_STRUCT_SIZE(mem_section);
 =09VMCOREINFO_OFFSET(mem_section, section_mem_map);
+=09VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
 #endif
 =09VMCOREINFO_STRUCT_SIZE(page);
 =09VMCOREINFO_STRUCT_SIZE(pglist_data);
--=20
2.7.4

