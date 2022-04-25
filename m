Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24B8C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 01:34:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240171AbiDYBh1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Apr 2022 21:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbiDYBhX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 21:37:23 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7FDECCFF
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650850461; x=1682386461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=koJDTDMLq54JWd9HeD7XD8paBg1Poz/+wyi8yWF470w=;
  b=XyBkROXG7eeSt5RriEO9RHZvhQSVIb82ibKqPq2TiIJzr1hlZEEKNNfk
   1l5KSiQSp2jR93pMmUgAJzzY/i/G/DDXKOLun0KFwTKKJMva1UXD777X9
   khWoe8mgGPdWANS8PBwmDUyKNzuTSPDgCJiJsM6cRuPfzf1y3zFNgdKmX
   hkYJkfe/7JSZlU0T/Wp8FpYhmc9wAhJz04087vkAMXb16xu80IvpeY8Wi
   P/cCzmEfFztAxwdcDy7JaQTRH4iGhZU1vkRh3sf21lx0KNk02YPIJWoGO
   1HZm0zzCeE+ADuw0Z3focrGO1KWTJbOTQ28An/1EzmR6k6Ie1EZJ0XIhG
   A==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="197558807"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 09:34:20 +0800
IronPort-SDR: +U/oA1dtAmjZwxwk9nOITZXX+x0yq9uuG5rO/PtmS1+kgSHjxj9QMP/2YgcUVq/FNb1I/nipXs
 zsWT2SJmkabcf6fTZxkQozaEu47Fp+hclG4zz8ZTmPkLj+ar7odTcFVoPaFzhTk5EYN/5g5oV4
 JciK9Oum5Gjj4Wm4CeM8QzpwLGXhuJeJV6Y3tim4bIoLXkFkW9jOKC3wMD/RlfGTewM1vKU8Br
 0UYY2GtYQRy8BS5b/h1LYkLGMXRGnJ+N/VEBRKf30xZc9IirCmH2J0trW1cAHor2OfU3lkL9gs
 BLQ+wJnoswI3Vp0lPdeX9qQZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:04:33 -0700
IronPort-SDR: jzUaay76o80HdHLO7uwC2048jAoNEaACbmhFMRI14e4v+YoE1E7lroZYwl0wekpLn7u/vF3oQF
 8DGSqtT+F99tWO+ubkB+qKKNECMT9Q9fwMq97N4XFk6seBzEDGYT4M1y62RkhJDDIdcIyt7+Hh
 P4E+ax3qeafqEJ/ppHHSLVvBvwx0NjZKl3D3jadkbUgbw5j4J0t5Scs9rhljh3+7FB7xo1YktD
 +uoPYyQ/K2pR9VmQZLF7juPk6NimhlmBRBKIEyp6RnTfW6mi5BXHlM0KlOVlcMSh+cJBlFox3w
 B6M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:34:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KmncD450gz1SVny
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :x-mailer:message-id:date:subject:to:from; s=dkim; t=1650850460;
         x=1653442461; bh=koJDTDMLq54JWd9HeD7XD8paBg1Poz/+wyi8yWF470w=; b=
        LjiiMFJPQXszUP2UCl5q7KIJhBBrSh0RV1S8meF82USut/SwpeDHjUxYNt0ifqG5
        COfO5PHCzxxIesOZL2D+e1NVu+mLqEZndR4Nfccz66qP/hIgDph0hYzqdJDHZ8LR
        4UpaDEawjqGp/vzNTjhRQ+og9ZwgvJh5TGVirlpuXxJWM1dShHglwu0e/8U/LmPB
        sSLZsp0gJ5D6iWtxlSYTtXYlLJsVvTa6WPRV71HioGy1DTa5FWBfG45BIZxMR9fD
        LSFCxHYI36gQRAerZWuhuTyNBjvgWa4Ya691v/BP4jW6fyu5y9YRVB+W+n++YEvm
        210zyCRgE0amQ2tsJ05h2w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5fwk-oP3MJ_Z for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 18:34:20 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KmncC2KVrz1Rvlx;
        Sun, 24 Apr 2022 18:34:19 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2 0/5] libata.force improvements
Date:   Mon, 25 Apr 2022 10:34:12 +0900
Message-Id: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series improves the usefulness of the libata.force kernel
boot parameters to facilitate field debugging of ata drives and adapter
issues by extending the range of horkage flags and link flags that can
be controlled.

The first patch is a simple cleanup of the drive blacklist array.
Patch 2 refactors the declaration of the force_tbl array defining the
possible values that libata.force can take. Patch 3 and 4 extend this
array adding most horkage flags and one link flag. Finally, patch 5
updates the kernel documentation reflecting these changes.

Changes from v1:
* Changed force_lflag_on() macro name to force_lflag() in patch 2.
  Patch 3 introduce the on & onoff naming of the macro.
* Updated the commit message of patch 2 and 3.
* Removed underscores in the onoff horkage option names in patch 4.
* Added review tags.

Damien Le Moal (5):
  ata: libata-core: cleanup ata_device_blacklist
  ata: libata-core: Refactor force_tbl definition
  ata: libata-core: Improve link flags forced settings
  ata: libata-core: Allow forcing most horkage flags
  doc: admin-guide: Update libata kernel parameters

 .../admin-guide/kernel-parameters.txt         |  71 +++--
 drivers/ata/libata-core.c                     | 271 +++++++++++-------
 2 files changed, 217 insertions(+), 125 deletions(-)

--=20
2.35.1

