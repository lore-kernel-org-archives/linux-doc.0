Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C931FC48BCF
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6AEB613AC
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbhFHV0H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 17:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42567 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234206AbhFHV0E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/gBbRADva2K8JIEOGXkU5f6gFIRmDnT9Lnnhh5Tc3WE=;
        b=Wbl+uJV3h1hZBqGjKu+EiIz/TmSuvMXHgWOK6yz2DpzIjASInITgTnHpaZ3eGrROTVKpj9
        K91fk7O/PLUuO6QtFo4RuT8aWQoAriFehx+obibZWnNATTSohohRzq8yCbBqvRmh7Gc9rm
        pG7e0bPijdVes2twrID+5BbYybUGgDc=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-NB_AMNAKOgCo0ySrTaNvZw-1; Tue, 08 Jun 2021 17:24:07 -0400
X-MC-Unique: NB_AMNAKOgCo0ySrTaNvZw-1
Received: by mail-oi1-f199.google.com with SMTP id p5-20020acabf050000b02901eed1481b82so8935444oif.20
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gBbRADva2K8JIEOGXkU5f6gFIRmDnT9Lnnhh5Tc3WE=;
        b=i2yoSI4cdiO53Q1nl5ggyMjD7qeC/NaTI6MmbP31yPh3LK32w3zO7V6u2dKuSPQFJ1
         IVGiQgEVy6heHhJAyzbUSVhUBKdMW5BTCrzToGAxRUYvBk0Mh5p1giWeeYSSCMgGLfvw
         O895c8dY97V8uMIsOO+WIJSpecgyGEWh71c88u5NNLc+sH5UFC4OuMoyr+dRfV3przB0
         ZU/W3S742dJCAxUoPwciWD1OcfXw7YeSFl5FxyA3ulM+R/vjmHCrU55o5PRMvO7693zV
         bpN2PXdpYlxujEGpvyUogBxD8yR72iFGEcFBIB8RCzUPvEKbublR2+FJegpfs4YQ6t1i
         vPIQ==
X-Gm-Message-State: AOAM5318zse2Yifd5xdD2gj4AFDV2trlyp3JO7xV66lzQpiDca0ON7F1
        S38oz0a4dWJdxqMEcgKOuzsA1Tg+mBKYtJQ016amjUqXy7g1D1Re5JF7jUQYGWe1yF7V1/vxpVe
        F0mOQnkq2PmpF/o4n1/RU
X-Received: by 2002:a05:6808:14e:: with SMTP id h14mr586235oie.151.1623187446581;
        Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRUvOvqRt0/CJtj2o0VyI4iVXsRLiR3szXaZyy3Js2xLbhN+wrCnNP4FBaFz2E4YlbUaXjZQ==
X-Received: by 2002:a05:6808:14e:: with SMTP id h14mr586213oie.151.1623187446440;
        Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com,
        corbet@lwn.net, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
        grandmaster@al2klimov.de
Cc:     linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
        linux-staging@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH 02/11] Documentation: fpga: dfl: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:41 -0700
Message-Id: <20210608212350.3029742-4-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 Documentation/fpga/dfl.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
index ccc33f199df2a..ef9eec71f6f3a 100644
--- a/Documentation/fpga/dfl.rst
+++ b/Documentation/fpga/dfl.rst
@@ -57,7 +57,7 @@ FPGA Interface Unit (FIU) represents a standalone functional unit for the
 interface to FPGA, e.g. the FPGA Management Engine (FME) and Port (more
 descriptions on FME and Port in later sections).
 
-Accelerated Function Unit (AFU) represents a FPGA programmable region and
+Accelerated Function Unit (AFU) represents an FPGA programmable region and
 always connects to a FIU (e.g. a Port) as its child as illustrated above.
 
 Private Features represent sub features of the FIU and AFU. They could be
@@ -311,7 +311,7 @@ The driver organization in virtualization case is illustrated below:
              | PCI PF Device |            |          | PCI VF Device |
              +---------------+            |          +---------------+
 
-FPGA PCIe device driver is always loaded first once a FPGA PCIe PF or VF device
+FPGA PCIe device driver is always loaded first once an FPGA PCIe PF or VF device
 is detected. It:
 
 * Finishes enumeration on both FPGA PCIe PF and VF device using common
-- 
2.26.3

