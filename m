Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D043D7D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 14:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751561AbeFZO7P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 10:59:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:35306 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751491AbeFZO7P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jun 2018 10:59:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7EE672D5;
        Tue, 26 Jun 2018 14:59:14 +0000 (UTC)
Date:   Tue, 26 Jun 2018 08:59:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation/sphinx: allow "functions" with no
 parameters
Message-ID: <20180626085913.6094bdc6@lwn.net>
In-Reply-To: <20180620084911.GB11493@rapoport-lnx>
References: <1529468469-10088-1-git-send-email-rppt@linux.vnet.ibm.com>
        <1529468469-10088-2-git-send-email-rppt@linux.vnet.ibm.com>
        <878t79x6uv.fsf@intel.com>
        <20180620084911.GB11493@rapoport-lnx>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 20 Jun 2018 11:49:12 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> > Looks good to me. Though I do realize now that I overlooked that this
> > applies to not only functions, but also to other non-DOC documentation
> > comments. I guess up to Jon to decide.  
>  
> We can name it "everything-except-doc-sections" ;-)

I suppose it could be :code: or :declarations: or some such.  But I think
I'm inclined to just apply the patches as they are.  The handling of
structs and such has always been a bit bolted onto the side, this doesn't
really change anything.

(Sorry for my absence in general - took some much-needed offline time).

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
