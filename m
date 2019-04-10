Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4649B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 09:57:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbfDJJ46 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 05:56:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60556 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730332AbfDJJ4i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 05:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bFt3dgJiaeyMmKj+dRc8MhcGRLNdgWAAHOpymLVKVDU=; b=RbvuoBTYnxgykhUGR44bhCTs8
        ZTcebJ6hgUwnclzpNuDH29XgCoMS/bzcjsPn5XSDjfaLv7apsyQfvN6oKI9uTfOOSh03zRyaARgCC
        YNj0pkY4CDvi+IlgRe4kcmJf7N7wlKWt8zR9MibSxWqMtAQnbZhGRezA1t2+BZ3n7GDeUZjxprnnY
        6xlcPWezVH6omsQ4GNLr6EqBpNxUKUOrajqoahdDRhIP6fjADuDhaSfRxe/onCirCpFhGNm3k3Img
        m/p6C7gOmegdP9bWPjJiiD91OSZnKsVLegcArY7Cp5hiaCsipxElUAlnn2/CqV/THORPP8mvT2bcf
        JtzaJ1NfA==;
Received: from 177.41.129.23.dynamic.adsl.gvt.net.br ([177.41.129.23] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hE9y9-0003Cq-6M; Wed, 10 Apr 2019 09:56:37 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hE9y3-0000nu-MW; Wed, 10 Apr 2019 06:56:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Andrea Parri <andrea.parri@amarulasolutions.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Akira Yokosawa <akiyks@gmail.com>,
        Will Deacon <will.deacon@arm.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>
Subject: [PATCH 0/8] Prepare files under Documentation/*.txt to build with Sphinx
Date:   Wed, 10 Apr 2019 06:56:19 -0300
Message-Id: <cover.1554889999.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the past, we did some efforts to ensure that almost all files under
Documentation/*.txt could be built with Sphinx.

Some regressions happened there (and some new files got added).
Fix those files in order to allow them to be able to build with Sphinx.

The changes on this series are trivial, adding the minimum stuff to allow
building those files with sphinx-build with no warnings and to make the
contents minimally consistent with other documentation files.

Mauro Carvalho Chehab (8):
  docs: DMA-API-HOWTO: add a missing "="
  docs: atomic_bitops.txt: add a title for this document
  docs: clearing-warn-once.txt: add a title for this document
  docs: ntb.txt: use Sphinx notation for the two ascii figures
  docs: unaligned-memory-access.txt: use a lowercase title
  docs: video-output.txt: convert it to ReST format
  docs: ntb.txt: add blank lines to clean up some Sphinx warnings
  docs: speculation.txt: mark example blocks as such

 Documentation/DMA-API-HOWTO.txt           |  2 +-
 Documentation/atomic_bitops.txt           |  6 +--
 Documentation/clearing-warn-once.txt      |  2 +
 Documentation/ntb.txt                     | 14 ++++--
 Documentation/speculation.txt             |  8 ++--
 Documentation/unaligned-memory-access.txt |  2 +-
 Documentation/video-output.txt            | 52 +++++++++++------------
 7 files changed, 47 insertions(+), 39 deletions(-)

-- 
2.20.1


