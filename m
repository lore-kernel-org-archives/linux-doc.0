Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78EB37D048
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Jul 2018 22:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754326AbeGIWMu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 18:12:50 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:43626 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751218AbeGIWMu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jul 2018 18:12:50 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.9.92])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 73ED8DDE;
        Mon,  9 Jul 2018 22:12:49 +0000 (UTC)
Date:   Mon, 9 Jul 2018 15:12:48 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     David Rientjes <rientjes@google.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [patch] docs, debugfs: start explicit debugfs documentation
Message-Id: <20180709151248.2e124971e8af515fd95b9319@linux-foundation.org>
In-Reply-To: <alpine.DEB.2.21.1807091459410.118937@chino.kir.corp.google.com>
References: <alpine.DEB.2.21.1807091459410.118937@chino.kir.corp.google.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 9 Jul 2018 15:00:17 -0700 (PDT) David Rientjes <rientjes@google.com> wrote:

> There is no canonical location for debugfs docuemntation, so start one.
> 
> This is primarily motivated to describe the oom_free_timeout_ms interface
> but it is extended for all the debugfs files that I am personally
> interested in.
> 
> Hopefully this can be expanded in the future for better insight into how
> the various interfaces can be used.

(cc Greg)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
