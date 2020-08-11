Return-Path: <SRS0=8DF0=BV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D9CC433DF
	for <linux-doc@archiver.kernel.org>; Tue, 11 Aug 2020 16:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5B14206B5
	for <linux-doc@archiver.kernel.org>; Tue, 11 Aug 2020 16:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="qlZPYSvd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgHKQRY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Aug 2020 12:17:24 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:15084 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728947AbgHKQRY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Aug 2020 12:17:24 -0400
Date:   Tue, 11 Aug 2020 16:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail2; t=1597162641;
        bh=pr3+6/TBe08ZFYYEqT6iFo7DT72zN4Lb8mBnwg780RU=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=qlZPYSvdb8cvudrTjf4kpT2JMEDZ+gIP4LdCn5qGsBkgdwQ4Komabn4bOueSZYy7s
         PMLcinx3HwUEJGi6gCztNs6mWxi6egmwaE1nm3kyZTkGxr6qK0wDXMyW0mKX/Oxjpv
         4w/OI0wAkb4REjE84CdnFGkanyEKNpCMlp7W7HdfddahCYWYIEwt/nMgkmNmvX9NkW
         PgTXF9wTtK3jfChjaTGy4+Pf8D9koxtouaDLxinC3obxI/ocQETXv2lnCzelRZqvIp
         +79D6o6dh7f82w3YXFMyx81dqPqqaA0iekKmFf1SscjkqmuzlaIpg7VnmdJm4pGgCY
         tRZ+GXyvG/QJA==
To:     trivial@kernel.org
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] docs: trace: fix a typo
Message-ID: <87lfili2d8.fsf@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


emumerated -> enumerated

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 Documentation/trace/intel_th.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/intel_th.rst b/Documentation/trace/intel_t=
h.rst
index 70b7126eaeeb..b31818d5f6c5 100644
--- a/Documentation/trace/intel_th.rst
+++ b/Documentation/trace/intel_th.rst
@@ -58,7 +58,7 @@ Bus and Subdevices
=20
 For each Intel TH device in the system a bus of its own is
 created and assigned an id number that reflects the order in which TH
-devices were emumerated. All TH subdevices (devices on intel_th bus)
+devices were enumerated. All TH subdevices (devices on intel_th bus)
 begin with this id: 0-gth, 0-msc0, 0-msc1, 0-pti, 0-sth, which is
 followed by device's name and an optional index.
=20
--=20
2.17.1


