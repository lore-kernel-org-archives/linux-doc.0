Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD2FD7D917
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Nov 2019 08:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKKIBj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Nov 2019 03:01:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44846 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726791AbfKKIBj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Nov 2019 03:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573459297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=OpacTWmtO+iXMlkdZbS1mGwj9+49jp5N3bMgW5F1YzI=;
        b=RNRIkNQIB5M3IgzHiyrNjph0aF9mE5MiYyHbHSTeWLqp+AcvVBjb7sHCVWiLrePe3OD739
        PvE9VaBCjLLhstN7aIbx5GabFgpVB2MLo1sLoe7Y2NcUIfR4picXNC4IJ7BN5h3jicrRyU
        k1oOQYIwFLIDdA0q9zl0Qd1Mw0Vvv0Y=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-tLTlZfnAP3eZYvSsiiBYng-1; Mon, 11 Nov 2019 03:01:36 -0500
Received: by mail-pl1-f198.google.com with SMTP id k8so10109728plt.7
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2019 00:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=F5//BPblZoTPMZJjED7koP1nkziC7XQdUgBg/9snEjY=;
        b=IF+qggO5Covlw5F8hrfeMFNTxYyA4UsViQC5W1N/KwbfHPfiDHsOzKKBICELT6Rd8C
         LwW/7ATAh1NcA4mjLm/kpnPtWl1ljIheNO+rFIX7zFtkEK40pwwoLZYyHbNnWH3lMo1W
         L4wCAMtNjMLj/xusxQ5iW231Lp92BjaxH0AlseczyC53wcC8yQjQYTk8lMYlb3XW7/t5
         KNQ6UhpG1YMTg0kKeTd4one0q/AVl+flqX4Jtk28V6+BIro9ytTTvdpE56WlJsZdiJDb
         p1/Vzl5LuuTemuzBnIRwGYCZkLuDkWOI0Fyli1pE4LuyTY1axgr2mvWh8diTcj9NAAqA
         pesQ==
X-Gm-Message-State: APjAAAU5d7erZvddUdS6JK9oFId2t4sJslfkNkXSJxCU6zwMhyBK32I2
        QA6RkvF9bMsAOCkQWR7nS7kZOCWOBqAvfX2wB2xib2nlTbgdVmfG/8JZiv/azfwunJZFDGIkcq1
        zEWposDfFShCuFIK43dmX
X-Received: by 2002:a17:90b:d93:: with SMTP id bg19mr32020890pjb.81.1573459295072;
        Mon, 11 Nov 2019 00:01:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8usKKEjYAYwE1du2nBk2kWvDHi2IvPtGckrHHcwJEKDXcLeUgfkse/tWZ8nOIlyzPDEk0gQ==
X-Received: by 2002:a17:90b:d93:: with SMTP id bg19mr32020851pjb.81.1573459294770;
        Mon, 11 Nov 2019 00:01:34 -0800 (PST)
Received: from localhost ([122.177.0.15])
        by smtp.gmail.com with ESMTPSA id e17sm14079598pgg.5.2019.11.11.00.01.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 00:01:33 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com,
        Boris Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org
Subject: [PATCH v4 0/3] Append new variables to vmcoreinfo (TCR_EL1.T1SZ for arm64 and MAX_PHYSMEM_BITS for all archs)
Date:   Mon, 11 Nov 2019 13:31:19 +0530
Message-Id: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
X-MC-Unique: tLTlZfnAP3eZYvSsiiBYng-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changes since v3:
----------------
- v3 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
- Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
  instead of PTRS_PER_PGD.
- Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
  'Documentation/arm64/memory.rst'

Changes since v2:
----------------
- v2 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
- Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
  ifdef sections, as suggested by Kazu.
- Updated vmcoreinfo documentation to add description about
  'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).

Changes since v1:
----------------
- v1 was sent out as a single patch which can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-February/022411.html

- v2 breaks the single patch into two independent patches:
  [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
  [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code =
(all archs)

This patchset primarily fixes the regression reported in user-space
utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
with the availability of 52-bit address space feature in underlying
kernel. These regressions have been reported both on CPUs which don't
support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
and also on prototype platforms (like ARMv8 FVP simulator model) which
support ARMv8.2 extensions and are running newer kernels.

The reason for these regressions is that right now user-space tools
have no direct access to these values (since these are not exported
from the kernel) and hence need to rely on a best-guess method of
determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
by underlying kernel.

Exporting these values via vmcoreinfo will help user-land in such cases.
In addition, as per suggestion from makedumpfile maintainer (Kazu),
it makes more sense to append 'MAX_PHYSMEM_BITS' to
vmcoreinfo in the core code itself rather than in arm64 arch-specific
code, so that the user-space code for other archs can also benefit from
this addition to the vmcoreinfo and use it as a standard way of
determining 'SECTIONS_SHIFT' value in user-land.

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>
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
Cc: linux-doc@vger.kernel.org
Cc: kexec@lists.infradead.org

Bhupesh Sharma (3):
  crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
  arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
  Documentation/arm64: Fix a simple typo in memory.rst

 Documentation/arm64/memory.rst         | 2 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/kernel/crash_core.c         | 9 +++++++++
 kernel/crash_core.c                    | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

--=20
2.7.4

