Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8D9C433DB
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 23:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E537164F64
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 23:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhBCXyF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Feb 2021 18:54:05 -0500
Received: from mail.v3.sk ([167.172.186.51]:51506 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233723AbhBCXyA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Feb 2021 18:54:00 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id B1196DF61E;
        Wed,  3 Feb 2021 23:49:05 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id qCsJZwXITT8D; Wed,  3 Feb 2021 23:49:04 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 46636E0B3D;
        Wed,  3 Feb 2021 23:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id PvUNxx1hkyMa; Wed,  3 Feb 2021 23:49:04 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id F3021E09D2;
        Wed,  3 Feb 2021 23:49:03 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 5/5] docs: arm: marvell: rename marvel.rst to marvell.rst
Date:   Thu,  4 Feb 2021 00:53:05 +0100
Message-Id: <20210203235305.506528-6-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203235305.506528-1-lkundrak@v3.sk>
References: <20210203235305.506528-1-lkundrak@v3.sk>
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

