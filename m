Return-Path: <SRS0=SFNS=4G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CAFC34026
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 13:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF66322527
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 13:05:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgBRNFH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Feb 2020 08:05:07 -0500
Received: from 2.mo68.mail-out.ovh.net ([46.105.52.162]:44287 "EHLO
        2.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgBRNFH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Feb 2020 08:05:07 -0500
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Feb 2020 08:05:06 EST
Received: from player779.ha.ovh.net (unknown [10.108.54.97])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id 1718515AA97
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2020 13:59:45 +0100 (CET)
Received: from sk2.org (cre33-1_migr-88-122-126-116.fbx.proxad.net [88.122.126.116])
        (Authenticated sender: steve@sk2.org)
        by player779.ha.ovh.net (Postfix) with ESMTPSA id 0DFEEF77705F;
        Tue, 18 Feb 2020 12:59:40 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 0/8] docs: sysctl/kernel.rst rework
Date:   Tue, 18 Feb 2020 13:59:15 +0100
Message-Id: <20200218125923.685-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16123168143214857605
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpkeekrdduvddvrdduvdeirdduudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

A recent discussion about differences in the "panic" description in
sysctl/kernel.rst led me to look into completing that file, and it
turned out that more work was needed than documenting "panic". This
patch series is the first batch, making the resulting documentation
hopefully nicer and more accurate. It doesn't add fields that are
present in 5.5 but not documented; I've started adding these, but I'd
rather submit them individually once the basic kernel.rst is
committed, to make it easier to request review from the appropriate
maintainers (each patch adding documentation should be mergeable
separately, without needing a patch series).

Regards,

Stephen


Changes in v2:
* in the first patch, drop the first kernel version mention, leave the
  copyright lines alone;
* in the second patch, merge : and ::, drop a smartquote in favour of
  a plain quote;
* in commit messages, give the references used for the documentation;
* add a script to check the documentation against the code;
* drop the rtsig entries which are not relevant now (as revealed by
  the check script).

Stephen Kitt (8):
  docs: pretty up sysctl/kernel.rst
  docs: merge debugging-modules.txt into sysctl/kernel.rst
  docs: drop l2cr from sysctl/kernel.rst
  docs: add missing IPC documentation in sysctl/kernel.rst
  docs: document stop-a in sysctl/kernel.rst
  docs: document panic fully in sysctl/kernel.rst
  docs: add a script to check sysctl docs
  docs: sysctl/kernel: remove rtsig entries

 Documentation/admin-guide/sysctl/kernel.rst | 1029 ++++++++++---------
 Documentation/debugging-modules.txt         |   22 -
 scripts/check-sysctl-docs                   |  181 ++++
 3 files changed, 707 insertions(+), 525 deletions(-)
 delete mode 100644 Documentation/debugging-modules.txt
 create mode 100755 scripts/check-sysctl-docs


base-commit: 359c92c02bfae1a6f1e8e37c298e518fd256642c
-- 
2.20.1

