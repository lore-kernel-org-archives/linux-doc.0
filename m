Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 189207DFC0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 00:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752770AbeGCA23 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 20:28:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33984 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752769AbeGCA22 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jul 2018 20:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2LYeg2tc17tWzqxQzz6ux7WPAmZOzyOxnKU+jA/qzYQ=; b=oIlRa8XD06YW2YIVvNnb9rHZc
        KM4vUj9z5mpVwe9cLoqBDcUf9HO1bqF4c2zjJwXkKEPNbZyZZAoZshjE+M+h/L78AqDDz+s942Bl+
        2QoKiwiOHUJsfzK0juDKLQcdsG4nLqPCfSgiJi60ZwSHSKlgv1JVgtcq6UiujptOSlpnZERvupZRQ
        oKFuV5yELoTzYZvTMgC+025sZj+QjrkIS2Htio6Mwt1tbu19ddeJ4hlQwZQU0pS71GQOZFRCBGOcH
        4POssDjEWMfjqb7YIDAfzZhrI3Gbsc7WRUz/Jy3vlr+GmLmVBhVyYeBKz7XY49iktJBfnSIE6wnGJ
        NvB93fsTQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fa9BD-0004Ox-7m; Tue, 03 Jul 2018 00:28:27 +0000
Date:   Mon, 2 Jul 2018 17:28:26 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kernel.h: Documentation for roundup() vs round_up()
Message-ID: <20180703002826.GB2438@bombadil.infradead.org>
References: <20180703000907.GA27014@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703000907.GA27014@beast>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 02, 2018 at 05:09:07PM -0700, Kees Cook wrote:
> + * The `const' hereprevents gcc-3.3 from calling __divdi3

missing space
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
