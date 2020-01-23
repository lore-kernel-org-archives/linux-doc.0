Return-Path: <SRS0=p0eP=3M=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6929AC33CAA
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 22:49:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 308F221D7D
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 22:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O2PMB+Lo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgAWWtR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jan 2020 17:49:17 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54442 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgAWWtR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jan 2020 17:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jORW1DUaM9wjqNR7ZQmUbk+S2AkFwXCDFcxsWj6rhjk=; b=O2PMB+Lon69GynRCnCWj04zNU
        m2bV6WA8lox8N8VraNOOFT/K7rtcpAui7Z5RsQPpGFGn6QHBTx2tpJZqTqqO9Lv7Sj87nBARbbqc2
        Xq3hLNmrvBYsj59vgeYMFjiY4OiskwnIne7IeyJNB1oJpSPXPt1/RaNMSaEC+8l7jZMON9C3MpgYz
        o2FE6zTCo3jTkaMXIbF3gZL4NKLEkKCv2PBtcq+D28yDhbWelzoZdssPwUsMIHroIrXo0TY7wVsiZ
        qTWBtqTj9GSpWFkaZuZDGyZvBsgoBou+w3PXNhS98XC02guVp5uxUj8KmsyNWxrwRBudF91J66iA0
        nXPixZAgA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iulHp-0006Zy-39; Thu, 23 Jan 2020 22:49:17 +0000
Date:   Thu, 23 Jan 2020 14:49:17 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] Add a document on how to contribute to the
 documentation
Message-ID: <20200123224917.GH4675@bombadil.infradead.org>
References: <20200123145409.6893e8bc@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123145409.6893e8bc@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 23, 2020 at 02:54:09PM -0700, Jonathan Corbet wrote:
> +How to help improve kernel documentation
> +========================================
> +
> +Documentation is an important part of any software-development project.
> +Good documentation helps to bring new developers in and helps established
> +developers work more effectively.  Without top-quality documentation, a
> lot +of time is wasted in reverse-engineering the code and making avoidable
> +mistakes.

Your mailer has done something weird to the wrapping there (and throughout).

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
