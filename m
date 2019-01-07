Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ADFA57D8A4
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 15:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbfAGPac (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 10:30:32 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:56938 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729766AbfAGPac (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 10:30:32 -0500
Received: from localhost (unknown [144.121.20.163])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 12D8214C83723;
        Mon,  7 Jan 2019 07:30:31 -0800 (PST)
Date:   Mon, 07 Jan 2019 07:30:29 -0800 (PST)
Message-Id: <20190107.073029.563146149237352062.davem@davemloft.net>
To:     ottosabart@seberm.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] doc: network: integrate offload documents into
 doc tree
From:   David Miller <davem@davemloft.net>
In-Reply-To: <cover.1546730285.git.ottosabart@seberm.com>
References: <cover.1546730285.git.ottosabart@seberm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 07 Jan 2019 07:30:31 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Otto Sabart <ottosabart@seberm.com>
Date: Sun, 6 Jan 2019 00:28:45 +0100

> Changes in v2:
> - Patch #3 and #2 were combined into patch #2.

Jon, do you want to integrate these?  I'm fine with that and I don't anticiapte
any serious conflicts.

Acked-by: David S. Miller <davem@davemloft.net>
