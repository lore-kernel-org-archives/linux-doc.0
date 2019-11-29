Return-Path: <SRS0=1Ifr=ZV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53921C43215
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 19:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27503217AB
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 19:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TLwAYx7+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfK2T74 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Nov 2019 14:59:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55568 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727208AbfK2T7z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 14:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575057594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=41xNMejmkDpiENDKO7RxAxz9cPSeln8z2A1ifqUYAvQ=;
        b=TLwAYx7+GwsQy5Nsbfp3upNO524Vr513dsISkCP5sFAIpOjVX3xYGVJx8DlEg3wHBbRJ2i
        VSviOXx2OioZt8KY7Bg/ieyxg82CXLqhHiDzKbZfUJjtegssz7ojtVfCV5yOszy2Rh97/U
        0JRO05Qjbdfvmept4lM37ZvfPvwktHA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-AvJCGMFIPiCOseli7Y2sbg-1; Fri, 29 Nov 2019 14:59:53 -0500
Received: by mail-pl1-f197.google.com with SMTP id q19so6156188pll.13
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 11:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TnU1CF4ydXp0Re/7xQPqByhi17OoIqWu96aUm7ilAL8=;
        b=ApzkKYlbl/lblzCQSPAuRVHKktS15VxdRSDQ0J3CcU6X8eDCD5Qv+T8q3brPkPdPbd
         R1YwciTFHe6dER2RzK9nCJMMX6gxsnoTz/PnHq76M+llswyFPJtkEkc9Po5UTpWP3ZMD
         kIMw/agiGAfrtjkFxMIDR/FJ9bQErWfEMAXRrlInrg27wCpqrQ9wp1RQFCLfSSo3IZzC
         LnVMFin0UKRZVmG5Mi+tLMdPm299M6m9n+GfpWhFjZoTcVYTWATs4xbivVlSUMrGzmeP
         pql+y4M7tPOLS99537mEUMzAywEBA8fWu7bL6qAH2/Jg9Cq5z9re54VXJzUNnV7vipOj
         Rdlw==
X-Gm-Message-State: APjAAAX1anYAy7LcaZ74DnBN18qM67wdH1HvzkWAps+MEEF2m1soGdGP
        c+Xe/V2rAJTma8QgoLUOjMDlSm/3jYv9OeYr2hEQudNETFct72IGNM46u9cPoYj/I2qaS3i8P+3
        LRn2MJdAD3BoeZ4nDm2kZ
X-Received: by 2002:a17:90a:1a8a:: with SMTP id p10mr19841459pjp.6.1575057592018;
        Fri, 29 Nov 2019 11:59:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSY3AQtQ2n98lr5W53/GVJZRJxpVnInAVeYWNmyeuMXseeTDPCBIIN9JR01+Ft/5q0+acg9Q==
X-Received: by 2002:a17:90a:1a8a:: with SMTP id p10mr19841443pjp.6.1575057591861;
        Fri, 29 Nov 2019 11:59:51 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id v10sm23928968pgr.37.2019.11.29.11.59.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 11:59:51 -0800 (PST)
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
Subject: [RESEND PATCH v5 5/5] Documentation/vmcoreinfo: Add documentation for 'TCR_EL1.T1SZ'
Date:   Sat, 30 Nov 2019 01:29:19 +0530
Message-Id: <1575057559-25496-6-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: AvJCGMFIPiCOseli7Y2sbg-1
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

