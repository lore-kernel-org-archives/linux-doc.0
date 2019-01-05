Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E5E4A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  5 Jan 2019 22:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfAEWae (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 5 Jan 2019 17:30:34 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:33794 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfAEWae (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jan 2019 17:30:34 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::cf9])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 195BF14C63C81;
        Sat,  5 Jan 2019 14:15:17 -0800 (PST)
Date:   Sat, 05 Jan 2019 14:15:16 -0800 (PST)
Message-Id: <20190105.141516.1525542484975135006.davem@davemloft.net>
To:     ottosabart@seberm.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] doc: networking: update references to files
 describing offloads
From:   David Miller <davem@davemloft.net>
In-Reply-To: <cce5f338791563e31c0b4702cedce35d66959fbc.1546553515.git.ottosabart@seberm.com>
References: <cover.1546553515.git.ottosabart@seberm.com>
        <cce5f338791563e31c0b4702cedce35d66959fbc.1546553515.git.ottosabart@seberm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 05 Jan 2019 14:15:17 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Otto Sabart <ottosabart@seberm.com>
Date: Fri, 4 Jan 2019 11:42:29 +0100

> Update reference to checksum-offloads.rst file which was converted into
> RST.
> 
> Whole kernel code was grepped for references using:
> $ grep -r "\(segmentation\|checksum\)-offloads.txt" .
> 
> There should be no other references
> to {segmentation,checksum}-offloads.txt files.
> 
> Signed-off-by: Otto Sabart <ottosabart@seberm.com>

Probably this should be combined into patch #2.
