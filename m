Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCDE67DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Apr 2019 19:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbfDSTBV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Apr 2019 15:01:21 -0400
Received: from ms.lwn.net ([45.79.88.28]:40306 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728871AbfDSTBU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Apr 2019 15:01:20 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 70F922D0;
        Fri, 19 Apr 2019 19:01:20 +0000 (UTC)
Date:   Fri, 19 Apr 2019 13:01:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [GIT PULL] Chinese docs fix for corbet tree docs-next
Message-ID: <20190419130119.72407a98@lwn.net>
In-Reply-To: <6ce502d6-cf62-694d-ae86-f1521714ee75@linux.alibaba.com>
References: <6ce502d6-cf62-694d-ae86-f1521714ee75@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 19 Apr 2019 18:39:51 +0800
Alex Shi <alex.shi@linux.alibaba.com> wrote:

> he following changes since commit 5d2a2c59108a00ee550fd9a51f26de72e209a703:
> 
>   docs: speculation.txt: mark example blocks as such (2019-04-11 12:37:03 -0600)
> 
> are available in the Git repository at:
> 
>   https://github.com/alexshi/linux.git Chinese-docs-next
> 
> for you to fetch changes up to 1e473d10635a7eb1b76329b15c37fc7a3d347f6b:
> 
>   docs/zh_CN: fix typos in 1.Intro.rst file (2019-04-19 18:02:28 +0800)

I've applied these patches manually, thanks.  For now, at least, I would
rather see patches on the list than pull requests for this kind of stuff.

Thanks,

jon
