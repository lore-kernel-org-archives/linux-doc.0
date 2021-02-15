Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1D3C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 22:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8417564DF4
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 22:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhBOWJ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 17:09:26 -0500
Received: from mail.v3.sk ([167.172.186.51]:58182 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229520AbhBOWJ0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Feb 2021 17:09:26 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 12547E0C6A;
        Mon, 15 Feb 2021 22:04:17 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id SU9cI9S1_bgo; Mon, 15 Feb 2021 22:04:15 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 6C534DF8B1;
        Mon, 15 Feb 2021 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id JQVC6PGmp8NX; Mon, 15 Feb 2021 22:04:15 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id EF937DF378;
        Mon, 15 Feb 2021 22:04:14 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] docs: arm: Improvements to Marvell SoC documentation
Date:   Mon, 15 Feb 2021 23:08:36 +0100
Message-Id: <20210215220839.423709-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

please consider applying the patches chained to this message.

The objective is to deal with the a large amount of dead links to
material that often comes handy in marvel.rst; and improve some details
along the way.

Compared to v2, the patches "[PATCH v2 2/5] docs: arm: marvell: fix 38x
functional spec link" and "[PATCH v2 5/5] docs: arm: marvell: rename
marvel.rst to marvell.rst" have been removed, because analogous patches
have already been applied. Also, more dead links have been removed,
reducing the count of links removed in [PATCH v3 1/3] to one.
Detailed changelogs in individual patches.

Thank you
Lubo


