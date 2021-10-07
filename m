Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197C6C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 04:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECE4860F51
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 04:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhJGEJt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 00:09:49 -0400
Received: from bee.birch.relay.mailchannels.net ([23.83.209.14]:54792 "EHLO
        bee.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230383AbhJGEJs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 00:09:48 -0400
X-Sender-Id: instrampxe0y3a|x-authsender|calestyo@scientia.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 47D265420D5;
        Thu,  7 Oct 2021 04:01:06 +0000 (UTC)
Received: from mailgw-01.dd24.net (100-96-133-192.trex.outbound.svc.cluster.local [100.96.133.192])
        (Authenticated sender: instrampxe0y3a)
        by relay.mailchannels.net (Postfix) with ESMTPA id 547455421EE;
        Thu,  7 Oct 2021 04:01:05 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authsender|calestyo@scientia.net
Received: from mailgw-01.dd24.net (mailgw-01.dd24.net [193.46.215.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
        by 100.96.133.192 (trex/6.4.3);
        Thu, 07 Oct 2021 04:01:06 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authsender|calestyo@scientia.net
X-MailChannels-Auth-Id: instrampxe0y3a
X-Cooing-Wiry: 13628cd626a513ef_1633579266093_1115000543
X-MC-Loop-Signature: 1633579266093:3691327512
X-MC-Ingress-Time: 1633579266093
Received: from heisenberg.scientia.net (ppp-188-174-65-9.dynamic.mnet-online.de [188.174.65.9])
        (Authenticated sender: calestyo@scientia.net)
        by smtp.dd24.net (Postfix) with ESMTPA id 5D24B5FC32;
        Thu,  7 Oct 2021 04:01:03 +0000 (UTC)
Received: by heisenberg.scientia.net (Postfix, from userid 1000)
        id E2E2616FDBF6; Thu,  7 Oct 2021 06:01:02 +0200 (CEST)
From:   Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
Subject: some minor improvements to the mountinfo description
Date:   Thu,  7 Oct 2021 06:00:00 +0200
Message-Id: <20211007040001.103413-1-mail@christoph.anton.mitterer.name>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey there.

Hope these minor patches help & thanks for considering.

Wasn’t sure about the UTF-8 I'm using, but I've seen that some
of the RST files already used … so I figured it would be okayish.


Cheers,
Chris.
