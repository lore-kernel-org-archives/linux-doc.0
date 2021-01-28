Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35817C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 01:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E77FC64DD9
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 01:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhA1BE6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jan 2021 20:04:58 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:57917 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbhA1BCV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jan 2021 20:02:21 -0500
Date:   Thu, 28 Jan 2021 01:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611795682;
        bh=oN3yS61gBPJ9xdHSwY1nQqpqd4e0ESFLymvcdmGZwp0=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=oE963L2Oh2GbfTyYnc+jswD84Z7wFbj1K4D4c5axtEZt1VdZXOV+BYEsrmnT5EUxY
         Dfw85b5AKNIrTAmCFw05l0c2NPf3ZM78H+3LseuTp7qCpTRKj2dckjle5Sha1KI2vy
         Sm6zaX3l1n9+sbGEsf2lq70ZzW69CF8khFpSfoVc=
To:     Jonathan Corbet <corbet@lwn.net>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH 0/2] docs: Add support for relative paths in automarkup
Message-ID: <20210128010028.58541-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As Jon previously noted [1], it would be nice if automarkup supported relat=
ive
paths as well when cross-referencing to other documents. This adds the supp=
ort
for it, and documents it.

Jon, after applying this, 43bc3ed73639 ("docs: dt: Use full path to enable
cross-reference") could be reverted without the link stopping to work.

[1] https://lore.kernel.org/linux-doc/20201130142404.6ef6689e@lwn.net/

N=C3=ADcolas F. R. A. Prado (2):
  docs: Enable usage of relative paths to docs on automarkup
  docs: Document cross-referencing using relative path

 Documentation/doc-guide/sphinx.rst | 30 ++++++++++++++++++++----------
 Documentation/sphinx/automarkup.py |  7 +++++--
 2 files changed, 25 insertions(+), 12 deletions(-)

--=20
2.30.0


