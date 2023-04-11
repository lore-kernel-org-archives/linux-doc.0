Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B904BC7619A
	for <linux-doc@archiver.kernel.org>; Tue, 11 Apr 2023 06:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjDKG7e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Apr 2023 02:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjDKG7d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Apr 2023 02:59:33 -0400
X-Greylist: delayed 406 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 10 Apr 2023 23:59:31 PDT
Received: from ubuntu20 (unknown [193.203.214.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C760D172C;
        Mon, 10 Apr 2023 23:59:31 -0700 (PDT)
Received: by ubuntu20 (Postfix, from userid 1003)
        id C0849E0362; Tue, 11 Apr 2023 06:51:09 +0000 (UTC)
From:   Yang Yang <yang.yang29@zte.com.cn>
To:     akpm@linux-foundation.org
Cc:     a.p.zijlstra@chello.nl, bsingharora@gmail.com, corbet@lwn.net,
        juri.lelli@redhat.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, mingo@redhat.com, yang.yang29@zte.com.cn,
        wang.yong12@zte.com.cn, huang.junhua@zte.com.cn,
        jiang.xuexin@zte.com.cn
Subject: Re: [PATCH linux-next] delayacct: track delays from IRQ/SOFTIRQ
Date:   Tue, 11 Apr 2023 14:51:09 +0800
Message-Id: <20230411065109.172037-1-yang.yang29@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230410213129.1d11261892767a61eacaefba@linux-foundation.org>
References: <20230410213129.1d11261892767a61eacaefba@linux-foundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> We're somewhat double-accounting.  Delays due to, for example, IO will
> already include delays from IRQ activity.  But it's presumably a minor
> thing and I don't see why anyone would care.

Thanks for your reviewing! I also think double-accounting should be OK, some
one who is tunning IO or IRQ could focus on the related delay respectively.
And PSI has the same logic when calculate IRQ or IO pressure. 
