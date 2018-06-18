Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A1BA7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 17:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935299AbeFRRKb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 13:10:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55814 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934880AbeFRRKb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 13:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5SvbcXCqgcJTbD0GY5Xiu6naEacwXIrsAUNSzDPTVzQ=; b=jUeYCaOcegicr/VoQ/nh6fBtU
        qwJItgfOvCEO6cKXaon8YY7X8b98fM37KCLSbo0RdRaLRA1+S8GAzMKULGKikEx1ALKIU/6x1PV6r
        ddiEifXHoCeAMwKyoghSn9sG89xN7ZkkUPFsSHMz3rhh9NLpdsYjg9OeNXB2EB8x1M4iM6/viRR3T
        x747I/kEspZMfF+SDtdoNb/ohHaeHk4cSO0Hiyv5HMoij9fgoJ+Ff4vw1/H+Bu5z9A6Hzzya6xguX
        UZn3tCZyyj5j4dajExlghIKBLUr2Uw/R41k7ojKkn8fk2v0nPQQ41j8nQYociu4ia3n/KEvCvu5jZ
        4Cd6Oy/JA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fUxfg-00056s-LC; Mon, 18 Jun 2018 17:10:28 +0000
Date:   Mon, 18 Jun 2018 10:10:28 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation/sphinx: add "nodocs" directive
Message-ID: <20180618171028.GD28748@bombadil.infradead.org>
References: <1529328996-16247-1-git-send-email-rppt@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529328996-16247-1-git-send-email-rppt@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 18, 2018 at 04:36:34PM +0300, Mike Rapoport wrote:
> Hi,
> 
> These patches allow passing "-no-doc-sections" option to scripts/kernel-doc
> from the sphinx generator.
> 
> This allows to avoid duplicated DOC: sections when "kernel-doc:" directive
> is used without explicit selection of functions or function types. For
> instance, [1] has "IDA description" and "idr synchronization" twice.

Hah, I just found an abandoned patch for this in a disused git tree.
I was wondering whether I needed to resurrect it.  Enthusiastically,

Acked-by: Matthew Wilcox <willy@infradead.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
