Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DBFC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 18:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C5E64E00
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 18:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhA2Skh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Jan 2021 13:40:37 -0500
Received: from mail.v3.sk ([167.172.186.51]:56684 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231485AbhA2Skg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 29 Jan 2021 13:40:36 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id A58EBE0B42;
        Fri, 29 Jan 2021 18:35:48 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id TFGthHbzTzyX; Fri, 29 Jan 2021 18:35:48 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 1A3C7E0B4A;
        Fri, 29 Jan 2021 18:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id B9T3QNMhkr_Y; Fri, 29 Jan 2021 18:35:47 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id C3E3AE0B42;
        Fri, 29 Jan 2021 18:35:47 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 5/5] docs: arm: marvell: rename marvel.rst to marvell.rst
Date:   Fri, 29 Jan 2021 19:39:50 +0100
Message-Id: <20210129183950.75405-6-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129183950.75405-1-lkundrak@v3.sk>
References: <20210129183950.75405-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This company is not the superheroes you're looking for.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/arm/{marvel.rst =3D> marvell.rst} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/arm/{marvel.rst =3D> marvell.rst} (100%)

diff --git a/Documentation/arm/marvel.rst b/Documentation/arm/marvell.rst
similarity index 100%
rename from Documentation/arm/marvel.rst
rename to Documentation/arm/marvell.rst
--=20
2.29.2

