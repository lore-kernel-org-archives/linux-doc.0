Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2DE457D6B1
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 10:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754134AbeCVKpD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 06:45:03 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:56704 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752874AbeCVKpB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Mar 2018 06:45:01 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 4F11611C3;
        Thu, 22 Mar 2018 10:45:00 +0000 (UTC)
Date:   Thu, 22 Mar 2018 11:44:58 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-doc <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonas Oberg <jonas@fsfe.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>
Subject: Re: [PATCH 2/2] COPYING: use the new text with points to the license
 files
Message-ID: <20180322104458.GB4570@kroah.com>
References: <20180322095414.24019-1-mchehab@s-opensource.com>
 <20180322095414.24019-3-mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322095414.24019-3-mchehab@s-opensource.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 22, 2018 at 06:54:14AM -0300, Mauro Carvalho Chehab wrote:
> Now that we have a new COPYING file with points to the
> Linux license files, replace it with the old content.
> 
> This patch does:
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename COPYING.new => COPYING (100%)
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
