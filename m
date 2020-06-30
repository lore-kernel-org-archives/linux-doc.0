Return-Path: <SRS0=QMax=AL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDC4C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 17:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5663B20772
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 17:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A4TWHr2h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730968AbgF3RRV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Jun 2020 13:17:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31889 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgF3RRU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jun 2020 13:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593537439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=18z1oTfW6/6D2G9GMiQYrGSxrdgHa1a8U8kk2US/2Lw=;
        b=A4TWHr2hRwM8R9zsB6nv/SQ0CmLAdTrdOURoWHhaATaSp0rD4HiV4BDEJaXKRV235/MFRs
        a0guioLOwSHc3I4yUJ4RIVUqTKIFwHuDtNKAxiHiSCIZ8oEmtZYvH7Bs4bTINLkspAxzw1
        GP7JFQ147K6hw/taItQD+MnA5xoVxhQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-yVQM8kRLPyOg44IMk0SPFw-1; Tue, 30 Jun 2020 13:17:15 -0400
X-MC-Unique: yVQM8kRLPyOg44IMk0SPFw-1
Received: by mail-qt1-f197.google.com with SMTP id i5so14977624qtw.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2020 10:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=18z1oTfW6/6D2G9GMiQYrGSxrdgHa1a8U8kk2US/2Lw=;
        b=EZ53LEvqEd4RT30kNFg7k2el65AM/QS065GAAakY6Haz9NhRMFjQSzMVi2s2djRChe
         89TE9hir0LnYkwbpHGeo7OfhYXSZ2Oew+1YlG5xbZDdsuYK860jXR5wy2ZkdI0z4sU8u
         Nm/tYq6wcsFfmbm71hmsPsr8EZbqC0DbgsD8spX9pxrkzaWbZZnlbtc279B/B+guRA3Z
         s/54SlE1VsL//vko52xDcLI1TUKnOsftkFq0X/vb/xQynAY0tdzTrbXAKFUSMHvDTRW9
         h3BP2o479vSXU8n5H1vawOhDG+JhSyfVm5jaj8SlGF81/qnx5ESIeNMgom/gH8PzFSxH
         9Gpw==
X-Gm-Message-State: AOAM5308oB1lm9dcNElj6/XB9caI2TE7k0RwJM0Y0maBtnMI0mkCaTsk
        zviQw7pFuA1FMDa6BlgZdYuAnV9dH3lkv87WRiqBkSuRanwIOW2ABUfY/+y2rfNCYSXn7BfKT9m
        rWIT49FH9gO0QHszPdZgY
X-Received: by 2002:ad4:41c1:: with SMTP id a1mr16057964qvq.25.1593537435219;
        Tue, 30 Jun 2020 10:17:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2DSkUrLBgyp7sHt5BFKSklM1kXVf1p88R0WlPlVzruBd3JtL6CyW5QP11XrQjT62wlYI7Wg==
X-Received: by 2002:ad4:41c1:: with SMTP id a1mr16057919qvq.25.1593537434850;
        Tue, 30 Jun 2020 10:17:14 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id w44sm3790774qtb.22.2020.06.30.10.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 10:17:14 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [RFC 0/1] fpga: dfl: RFC PCI config
Date:   Tue, 30 Jun 2020 10:16:55 -0700
Message-Id: <20200630171656.20151-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

This configury shows where I would like the dfl pci cards to go
by introducing future cards as well as the current pac 10 card.

The goal is to fully configure the card in the drivers/fpga
area of the config.  Collecting configury of the fpga/ parts
as well as the subdevices scattered over the tree.

The user is not prevented from manually picking the equivlent.

Some documentation started to track the subdevices needed
that are not in the fpga dir as well as guiding the user to
identify the appropriate top level config.


Tom Rix (1):
  fpga: dfl: RFC PCI config

 Documentation/fpga/dfl.rst | 33 +++++++++++++++++++++++++++++++++
 drivers/fpga/Kconfig       | 28 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

-- 
2.18.1

