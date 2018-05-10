Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 75BDE7DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 20:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751438AbeEJUCX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 16:02:23 -0400
Received: from ms.lwn.net ([45.79.88.28]:59038 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750876AbeEJUCX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 May 2018 16:02:23 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 394A4318;
        Thu, 10 May 2018 20:02:22 +0000 (UTC)
Date:   Thu, 10 May 2018 14:02:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tejun Heo <tj@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH v2 02/11] docs: admin-guide: add cgroup-v2 documentation
Message-ID: <20180510140219.52faea50@lwn.net>
In-Reply-To: <20180510184018.GS2368884@devbig577.frc2.facebook.com>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
        <1a62d2ec4d1eef268dd2256a1e2673df994bee5e.1525870886.git.mchehab+samsung@kernel.org>
        <20180510184018.GS2368884@devbig577.frc2.facebook.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 May 2018 11:40:18 -0700
Tejun Heo <tj@kernel.org> wrote:

> On Wed, May 09, 2018 at 10:18:45AM -0300, Mauro Carvalho Chehab wrote:
> > The cgroup-v2.txt is already in ReST format. So, move it to the
> > admin-guide, where it belongs.
> > 
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Li Zefan <lizefan@huawei.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Acked-by: Tejun Heo <tj@kernel.org>

Applied to the docs tree, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
