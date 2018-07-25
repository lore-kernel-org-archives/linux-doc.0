Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF9F17D085
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 02:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbeGYDjV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Jul 2018 23:39:21 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50095 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727504AbeGYDjV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jul 2018 23:39:21 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 1A6F021BF4;
        Tue, 24 Jul 2018 22:29:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 24 Jul 2018 22:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :date:from:message-id:subject:to:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=dOA84+l2nWhkA0ZK1OL1/amKYFnQ1eqQN1IOSAXrC
        qk=; b=Il97gFTRUUNRG2mNfDW/20Q2P4qmA0INhGsFiy3CDBJYPAf/pa5N1FBi0
        SfxIFShj9BUL4rjGnASk1v8iVyS+vhuEsrYpLIdpBjyPlYeMS0b74sABg4w5EANS
        YlM5F/lDbdNWhXPrCnhg/bUOqWSRckM4ZueEn9WRailYVUIaofZFPaBqF9AOlm2k
        hgvVBUqZswWjvqPsGIqx32wMOOfZqY7OTjqe07BEURthROyfjDdv0TxiQBxQLaOH
        gzskTi7HMIDV8yYTfylAyuWYmQ7l+wd+yNKR8q9j1+lcYC/lropSJTqSima8KNzG
        FE7CQNpY/4fzqsa9I7ICRnFZ9xa5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:message-id:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dOA84+l2nWhkA0ZK1
        OL1/amKYFnQ1eqQN1IOSAXrCqk=; b=JGv5ZFE0sSv37vrosCq6g5On+xyfbdt0+
        8IZU8AlEaoFNXAmJ8owMLbtHuCyjxhqToUtB7yxnUZzJdfWOXsUtEHh4xhJOV+iY
        JKF8ZG6wdCbq/S7/9Ibs1c+iOcV5wuNRiHTxFPjG7mTBxdUDqPx34Ik5E+6MwNeT
        jplQWlzIoVTMs+V4Yh91PgPSi4m7WyC4JEp9JF9fv54/wNK3H+BztVOXx4kyuHPw
        PccPQrzJWeXN7zws+XB2ygaW+LgQODTGKF0zjh8m9SzF1Df5KMsei0w179Ws9Pnr
        /Olb38tBVecM9bU2gs84Sg1X3utMDZHVFwT+hSKJCAoAxDEJoIWvQ==
X-ME-Proxy: <xmx:o-BXWwT6noisfWj5U9siIvFYNrejrqPxJCoAKphe_oFYfA1Iw1r38w>
    <xmx:o-BXWzqPBnaXXIE0_agavfrqCrWXiu7ictmuiA3YNWwgS2GPQ5PQXw>
    <xmx:o-BXW5CueZOPxDa6fV1K9sImqX7sCj3rb87rYSlyHUNmSLU6oYWSwA>
    <xmx:o-BXW-E3ekIj_WIewHfW9DyI4iGrAIZPq6rGr-JYm148aFC622rbog>
    <xmx:o-BXWyB6xmQYZtvIUN5byzSffHMsgoxhr3PBCz_lGVXn4pdOy1KPdg>
    <xmx:pOBXWzwVXpw6-D-apaTnS1b2lp0lu39nTPNrNhHJgXgSZwYxi5nUIQ>
X-ME-Sender: <xms:o-BXW7XyCJ6VggG3xrLkoKaJBXp_3zZxAn6JXdorGEEGQ07oXMVKuQ>
Received: from localhost (ppp121-44-239-245.bras2.syd2.internode.on.net [121.44.239.245])
        by mail.messagingengine.com (Postfix) with ESMTPA id BF612E4511;
        Tue, 24 Jul 2018 22:29:54 -0400 (EDT)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <me@tobin.cc>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] docs: bpf: Fix RST conversion
Date:   Wed, 25 Jul 2018 12:29:22 +1000
Message-Id: <20180725022926.8993-1-me@tobin.cc>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recently BPF docs were converted to RST format.  A couple of things were
missed.

 - Use 'index.rst' instead of 'README.rst'.  Although README.rst will
   work just fine it is more typical to keep the subdirectory indices
   in a file called 'index.rst'.

 - Integrate files Documentation/bpf/*.rst into build system using
   toctree in Documentation/bpf/index.rst

 - Include bpf/index in top level toctree so bpf is indexed in the main
   kernel docs.

 - Make anal change to heading format (inline with rest of Documentation/).

thanks,
Tobin.


Tobin C. Harding (4):
  docs: bpf: Rename README.rst to index.rst
  docs: bpf: Add toctree to index
  docs: Add bpf/index to top level index
  docs: bpf: Capitalise document heading

 Documentation/bpf/{README.rst => index.rst} | 10 +++++-----
 Documentation/index.rst                     |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename Documentation/bpf/{README.rst => index.rst} (82%)

-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
