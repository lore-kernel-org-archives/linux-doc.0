Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DFEECAAD3
	for <linux-doc@archiver.kernel.org>; Sun, 11 Sep 2022 16:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiIKQI5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Sep 2022 12:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiIKQI4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Sep 2022 12:08:56 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B342A738;
        Sun, 11 Sep 2022 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=OXqvDfMO3yo4jyLaEpdKmbXpj6kJzDaw7s0LNfWous0=; b=lMrN9+3wyfjxun3GCFnAAivwQ0
        lDnXt4umgwhm0yW4JX+yRLJ1jaM26SZmJZ4XztpXr6hp45ajPs3tD30aHV8Q2g2pH1tdFTBWuJeEl
        KKAshW0GzHEiOecsKR4wyDseSBJCByvXszz7IyevSAdHG+5Z/SJNJZv5mAQVxwAM8i49TNd+ZJwoL
        Qa49blWO8g+OOUSS+ot0tFb9OKg3xZHUv0JLhKW9atYcYEeYqm+k9xzXHLA4XCjWN9vRiO6EIXGbd
        ETJXuIWvzg3F7cEdcioGDE3JtZJg3aqEXT/+n1TcdIGFmqJvSA8PHGdgiVLOwtjhMnyVtMbL47KBy
        lanGTTEA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oXPVq-00FB0o-Kr; Sun, 11 Sep 2022 16:08:50 +0000
Date:   Sun, 11 Sep 2022 17:08:50 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rick.p.edgecombe@intel.com
Subject: Re: [PATCH 2/3] mm/page_table_check: Do WARN_ON instead of BUG_ON by
 default
Message-ID: <Yx4IEvkmAlcTIP6v@casper.infradead.org>
References: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
 <20220911095923.3614387-3-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911095923.3614387-3-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 11, 2022 at 09:59:22AM +0000, Pasha Tatashin wrote:
> Currently, page_table_check when detects errors panics kernel. Instead,
> print a warning, and panic only when specifically requested via kernel
> parameter:
> 
> 	page_table_check=panic

Why are the page table checks so special that they deserve their own
command line parameter?  Why shouldn't this be controlled by the usual
panic_on_warn option?
