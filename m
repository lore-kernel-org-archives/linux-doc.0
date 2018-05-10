Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E3B67E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 08:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756751AbeEJIil (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 04:38:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57250 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934089AbeEJIik (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 04:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=+EmKSLJKqXCvwH9jqO7wL2+a3CqZmi12qQc25Q3mMIo=; b=K5jVEqBuOQRTW4aCkm5hGeV53
        fH0pnUvMc8egTvY6llnsD4WCHUe8Hn2a+AeTOhvYw+GsGfi14rQTkbhE6+R6hJqXKBLuZGQfNQG4m
        WQqdV3oF3QXJnIoKErUe7UgrFoTEdeIW8Ua2ELsNoj/6Fdis6GTmfXhmZW4R/E3v0gICNaJMLfzSS
        PdlLdEf54hm9evuYfoW5ADcMg7ht5rht8fKu8VPGRHZLSFWODThUEIvLQ4XY+8tHyAbiOwQYnPLCz
        KT2Pk2v/dqSgMgtBAYPVyclLwDLNlp8SR9/iJJ0lcifkuFDiuHeyd/vJjmAmXmVChNPSPCS79pnp+
        /9189ECzA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGh5y-00077h-Rx; Thu, 10 May 2018 08:38:38 +0000
Date:   Thu, 10 May 2018 01:38:38 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510083838.GA21846@infradead.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>   * Use either while holding wait_queue_head::lock or when used for wakeups
> - * with an extra smp_mb() like:
> + * with an extra smp_mb() like::

Independent of any philosophical discussion not allowing a setence to
end with a single ':' is completely idiotic.  Please fix the tooling
instead to allow it, as it is very important for being able to just
write understandable comments.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
