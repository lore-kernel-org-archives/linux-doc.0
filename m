Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CBA4A7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 17:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbfJ1RfE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 13:35:04 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:45355 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbfJ1RfE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 13:35:04 -0400
Received: by mail-wr1-f45.google.com with SMTP id q13so10777718wrs.12
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4h0j1y2DktN68cOwekrIvX7jwMz9RtEdu7NiWvIBj+I=;
        b=UNycCq4T9++5SpxfhlzKUrQcEJ2MW9XCLYxLXprqK7P78e4Li0WacOJmgUozVa6JZE
         H0CG5nHPGsh2NczLP0vU5vz3E1FNMgsPVd4OHrSshAtmFMiNrwAyvjArsiWR1eN0GwUX
         w4LKnnZWFCcPvNkPt1/EvL4n2Uc5S+vcmibMoL+/fPYFNISlCVqR9/Sc3cgaWu3hRjY+
         YkUUJBYISQJiFK/52/EMRxD8RBUAtXTHKT5CGi2Nkg53foAUdTIP0YwH9ieD93EQzZ3H
         DPnkukaVoMAD5vGpN9LjHvtXa38J82BRdU9hQ+Sz80Il1NpWfphaLh1eaWWPDeupYB6x
         2kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4h0j1y2DktN68cOwekrIvX7jwMz9RtEdu7NiWvIBj+I=;
        b=Q2CdM78siqx4JFpL5mBY4hkK2p6CwtkbktEazXiThBSLUd/kR+I48hW1xTQ9WM+Pfv
         hU8wSNb2b1ZU65ANQTPPAxKMd0KUgHAwhSWczET74yztdl0OQooskhuq/BMKj7JsLMwP
         OL53tAiBRySzhbKqwB2l5wqRj0AzcQohvyYccBhxPOWfunbvIqOsEWacAPpW7pL5+5Zk
         NypKIUG464F2NY1RQt6JV34r5+zqL5thP00cGpfNU19qb9ukNxEO90SG8x6d+3Jli7lT
         WgDRfsF6SNV6V2AOICkZOfBM/OH1hcHZkwQkIiCNPd4L9p41EdiIhfF91/qoJoP9jOoe
         oTVQ==
X-Gm-Message-State: APjAAAV1WT0zLTtBTgmnPENZsP5SwJOPGuitb57EDbvD2rR1mwl2+BUr
        9mNbICna4R72v771uvemsCXGYZUxA4w=
X-Google-Smtp-Source: APXvYqzj0ah01Wc2PstZV4U7mwqqyvoxYeN2HSfBJjs0fAyazqXH9zMDKR/Xrx7HTVPPjFVa+bXexg==
X-Received: by 2002:a5d:4b51:: with SMTP id w17mr3330012wrs.357.1572283771618;
        Mon, 28 Oct 2019 10:29:31 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:a072:1d10:8dba:cbb])
        by smtp.gmail.com with ESMTPSA id r19sm14273295wrr.47.2019.10.28.10.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 10:29:31 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     mathieu.poirier@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 0/4] coresight: etm4x: docs: sysfs API doc updates
Date:   Mon, 28 Oct 2019 17:29:15 +0000
Message-Id: <20191028172919.19662-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Review of ETMV4 sysfs code resulted in a number of minor issues being
discovered. Patchset fixed these and updated docs.

Applies to coresight/next

Changes since v3
  First 8 patches of v3 have been accepted onto coresight/next. The patch
  series is now documents only
  Docs .txt files changed to .rst by unrelated patch. This set reflects
  this change and updates the added docs to match.
  Indexing changed for new coresight docs directory.

Changes since v2 (reviews from Mathieu and Leo):-
  Patch 0002 now adds stable tag. Tested on 4.9, 4.14, 4.19
  Applies to coresight/next (5.4-rc1)
  Documentation changed to .rst format to match recent updates that
  converted other CoreSight .txt files.
  Misc typo / comment changes.

Changes since v1 (from reviews by Mathieu and Leo):-
  Usability patch split into 2 separate functional patches.
  Docs patch split into 3 patches.
  Misc style and comment typo fixes.

Mike Leach (4):
  coresight: etm4x: docs: Update ABI doc for new sysfs name scheme.
  coresight: etm4x: docs: Update ABI doc for new sysfs etm4 attributes
  coresight: docs: Create common sub-directory for coresight trace.
  coresight: etm4x: docs: Adds detailed document for programming etm4x.

 .../testing/sysfs-bus-coresight-devices-etm4x | 183 ++--
 .../{ => coresight}/coresight-cpu-debug.rst   |   0
 .../coresight/coresight-etm4x-reference.rst   | 798 ++++++++++++++++++
 .../trace/{ => coresight}/coresight.rst       |   2 +-
 Documentation/trace/coresight/index.rst       |   9 +
 Documentation/trace/index.rst                 |   3 +-
 MAINTAINERS                                   |   3 +-
 7 files changed, 925 insertions(+), 73 deletions(-)
 rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
 create mode 100644 Documentation/trace/coresight/coresight-etm4x-reference.rst
 rename Documentation/trace/{ => coresight}/coresight.rst (99%)
 create mode 100644 Documentation/trace/coresight/index.rst

-- 
2.17.1

