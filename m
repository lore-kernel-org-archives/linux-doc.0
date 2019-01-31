Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97E157D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 04:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfAaEGp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 23:06:45 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52407 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726863AbfAaEGp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 23:06:45 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0292422213;
        Wed, 30 Jan 2019 23:06:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 30 Jan 2019 23:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=4SMAuNqI05EPX54llhKRnRB/oU
        cEbuz09R80SllFLa0=; b=NvyzbMT8ckxG7GAbPqvSuM81OYxlPwVGECGikmhUSy
        34EjO+IoF2zC0MkcCndu+7SUZGCsmVjWcizkb6La4fxz2CRnJpBvZuZDK532lZZu
        ++CqUYGpgtCqxrzLulPxs/BSkdpuWUA6r8X+3y/Q9SeHpWCQZIK/dqaKQsdQ9XXX
        HgcjyGqqFpO/8F6sGtspxoufkSrXcJHPDP7xGwMVeanxS7AEHjNQ89dettLqSMqd
        jdxy3WBKJffUf05SjoqdccDB5Wl3MHzkCCsUstkeq4Lj7N96dbId2HTmXg4DEMYd
        R1u+Nw6BZ4OChSVhz6cMskGxqpAHCOxJ9H6+7EFL1wFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4SMAuNqI05EPX54ll
        hKRnRB/oUcEbuz09R80SllFLa0=; b=TpjeHDNU/kEu3toHWiTKOw8ti5+b1qcnU
        gEwaJrJvZBonMbMZ/nVZ61YrV/WiVtLnbdXempoaLjG9NBNAP8Y2GHNcuITdySsB
        /ElDOpxm4jn2B08DsoHiQ4oufAeOwIqjJtKllQB9IsgsyRXc66INuOi9o+uMv+vQ
        xYO8Q41olK8UEYT/saK4qvzAlmZJBu9bXCBkSlaaGmA7ANrVAwtwjaWU/sfUxAon
        MNEcaON1hIT1yOv7J1QSB30ya3rQ7fs9NVAOumdGdhBulJ7cF1yIcvXI6JSfzWSf
        wp9q9KKs6pqkXgocsumwSsqtykn1Zy+tzl95d5lT1Lgl19ZfN7GeQ==
X-ME-Sender: <xms:U3RSXO2ZfND2ffcsNWFNnpxlFbx1NLb_s2nsOikdsHejuj2MhnubiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfedtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhn
    ucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecukfhppeduudekrd
    dvuddurddvudefrdduvddvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthhosghi
    nhdrtggtnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:U3RSXKfDOvUjqhLFQWnk9B3PCz64y9DSZhprpEx6YavwIGAbmP8VFA>
    <xmx:U3RSXPaVwDU_cs2FgJ0dTRPFMWaBFxJdr7mCxKHOgxBmnl7vt25yIQ>
    <xmx:U3RSXPVbu7gxn0F8Z2XG_Zt1kZJQjxE1VKkKnewKH5WzD3z3U_kv6A>
    <xmx:U3RSXBVzusLZcV6A9bP3XxMzb-qJLaz0Nd0OCqiLz-i5wY2-bC-v6g>
Received: from eros.localdomain (ppp118-211-213-122.bras1.syd2.internode.on.net [118.211.213.122])
        by mail.messagingengine.com (Postfix) with ESMTPA id B2D27100BA;
        Wed, 30 Jan 2019 23:06:41 -0500 (EST)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: [PATCH 0/3] docs: vm: Fix typo and build warnings
Date:   Thu, 31 Jan 2019 15:06:20 +1100
Message-Id: <20190131040623.15569-1-me@tobin.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Tobin C. Harding" <tobin@kernel.org>

Hi Jon,

This patchset started as a spelling typo fix to the SLUB docs, while
doing this I noticed a few build warnings for vm/ so build warning fixes
make up the rest of the set.

Patch 3 uses an underscore instead of a hyphen in the label name.  This
clears the warning but I am not 100% sure this is the correct fix.

thanks,
Tobin.


Tobin C. Harding (3):
  docs: Fix SLUB docs typo
  docs: Add missing colon
  docs: Use underscore not hyphen in label

 Documentation/core-api/memory-allocation.rst | 2 +-
 Documentation/vm/index.rst                   | 2 +-
 Documentation/vm/slub.rst                    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.20.1
