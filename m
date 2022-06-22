Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF087C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 09:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbiFVJyD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbiFVJx7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 05:53:59 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA04C26131
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 02:53:53 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id i15so14940965plr.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uG6jvGK7DE4pcxcjqDdu/3T91Yn/8bATqtze3yr2DMY=;
        b=oDJqOieC8QUlDk97MSVHnclNz6NPbxsWjvykjXa8w9We4+e1+5pK6msg8CfnLZcvRg
         HScKCABdeRuXxCksKxlUpBTFaQGU9TBX/QAO6rWrGcB8c8W7yk73P9370mUe4ygrJLnA
         rzPfY+NIzgrgXDZJyUvZaOXXDVEHUDKzWJDwgO/+au1UQpFYI6S1zDSEy6nFqI32ngR4
         Etjhqqnx0dePBNUpJzO3TljrJAD7HAL4cjxJxy4G2Zik/4SaLbCUNp3aW64gGD0HF6Jt
         8P8F54S1GfE5HqWyQ0qdBzb6/tnRUuQGS5A43waMDNKXq1x1TYpfHoSBwdAbQ5VIL1HG
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uG6jvGK7DE4pcxcjqDdu/3T91Yn/8bATqtze3yr2DMY=;
        b=2VbJoSvcIav4GEirGhiL24GEQi0HxZpA+agg7T22LQidrH5+H5gr1D7MrBsj9bOghg
         hOewjd+aLAAB8hOQ4Ovq1BvWRZG+Vqy+Ix6qHfEGg5CMqIQHFlw8tpQOAOHPv4qQN7D1
         VualaPSsRLfeqBPOAJY0Hu3fktjxwxDNwsp8f9ECQD4cdxOsg7SBUg2IiyGVOuqQ3Xhj
         0kn/syk8+mNp1YtMBZ8XavdZ3US60zDlUT6EAwkG5KfaVuMcASYRUTzLdNzwz/AcV1AG
         gGo5FFfy5vYQwN6zNUW0SxT8hFl+nE0jIjdAUDpLib6luq+y+MB34+sIQFjliIhxaEbt
         +3Pg==
X-Gm-Message-State: AJIora/mbt6na8l8moksrNXxIuZLzMbr2rR0Z+fGJsdhyL5M5aWN/MJR
        tN1CQ6TnFgGcbLUjqrdU5NyHvEY+Zks=
X-Google-Smtp-Source: AGRyM1tO/oexz4rxnEoC1WXshADM5iSFW4SCYhHkeEr/SFxaORJ/tdZUc57W8TpSVYhWJt4S9ggzgw==
X-Received: by 2002:a17:90b:794:b0:1ec:c760:5736 with SMTP id l20-20020a17090b079400b001ecc7605736mr2820209pjz.241.1655891632823;
        Wed, 22 Jun 2022 02:53:52 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-91.three.co.id. [180.214.232.91])
        by smtp.gmail.com with ESMTPSA id d26-20020aa7869a000000b0051c4f6d2d95sm7064420pfo.106.2022.06.22.02.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 02:53:52 -0700 (PDT)
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] Documentation: PCI: Documentation fixes for vNTB
Date:   Wed, 22 Jun 2022 16:53:43 +0700
Message-Id: <20220622095345.27121-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220621200235.211b2e32@canb.auug.org.au>
References: <20220621200235.211b2e32@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After merging ntb tree for linux-next integration testing, Stephen
Rothwell reported following htmldocs warnings:

Documentation/PCI/endpoint/pci-vntb-function.rst:82: WARNING: Unexpected indentation.
Documentation/PCI/endpoint/pci-vntb-howto.rst:131: WARNING: Title underline too short.

These warnings are introduced by commit 0c4b285d9636cc ("Documentation: PCI:
Add specification for the PCI vNTB function device").

Fix these two warnings above by:
  1. Using code block for scratchpad diagram ([1/2])
  2. Extending "lspci output" subheading underline syntax ([2/2])

This patchset is based on next-20220622.

Bagas Sanjaya (2):
  Documentation: PCI: Use code-block block for scratchpad registers
    diagram
  Documentation: PCI: extend subheading underline for "lspci output"
    section

 Documentation/PCI/endpoint/pci-vntb-function.rst | 5 ++++-
 Documentation/PCI/endpoint/pci-vntb-howto.rst    | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)


base-commit: ac0ba5454ca85162c08dc429fef1999e077ca976
-- 
An old man doll... just what I always wanted! - Clara

