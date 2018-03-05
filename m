Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 379687E281
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 12:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933336AbeCEMLp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 07:11:45 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41538 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932911AbeCEMLp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 07:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1ezV+SsEy2luLvcQHb/4B5Tmb5q9CUPmslmdU5NtZ6Q=; b=TJo8Ir7CfTw8IVcO2teGwej2K
        lAX55WSlIH5aYxC1iJoF4ndDfGZ2LxTOFgtO5uVAlivVbVkeRy2RzUHUaegOz7qRGgLcIuTz0ABX6
        yu5bh4ceJUpwUjsRCbhGNVTRmYwaFLtkk+BnNhA2Ll/4WvaAW8EBdrtL6o+rc9RoPD8TdEGpuUnsB
        4i3KLRScFdtylMx1XVFWf3Z3+ZsWt2Zir/wHt4h/dapREa+4hIePrXpFWcbyOrXo8F6gpZ4499dwo
        tIT01g2IAZdT9wJO5nghjNfw4TTzLeiqfgm47C7HKIECbZHcuSsZ8iJu4OsHx/8VeRjuNTsP7EEEL
        hWajP8cxg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.89 #1 (Red Hat Linux))
        id 1esoxr-0005WL-De; Mon, 05 Mar 2018 12:11:35 +0000
Date:   Mon, 5 Mar 2018 04:11:35 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: add Co-Developed-by docs
Message-ID: <20180305121135.GA15079@bombadil.infradead.org>
References: <1520222301-11874-1-git-send-email-me@tobin.cc>
 <1520222301-11874-3-git-send-email-me@tobin.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520222301-11874-3-git-send-email-me@tobin.cc>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 05, 2018 at 02:58:21PM +1100, Tobin C. Harding wrote:
> -12) When to use Acked-by: and Cc:
> ----------------------------------
> +12) When to use Acked-by: and Cc:, and Co-Developed-by:
> +-------------------------------------------------------

+12) When to use Acked-by:, Cc:, and Co-Developed-by:
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
