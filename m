Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 236397D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Apr 2019 10:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfDLKVo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Apr 2019 06:21:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50734 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfDLKVo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Apr 2019 06:21:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 43B55C049E24;
        Fri, 12 Apr 2019 10:21:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com [10.10.121.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2A03E5C21E;
        Fri, 12 Apr 2019 10:21:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <cover.1554889999.git.mchehab+samsung@kernel.org>
References: <cover.1554889999.git.mchehab+samsung@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     dhowells@redhat.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andrea Parri <andrea.parri@amarulasolutions.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Akira Yokosawa <akiyks@gmail.com>,
        Will Deacon <will.deacon@arm.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>
Subject: Re: [PATCH 0/8] Prepare files under Documentation/*.txt to build with Sphinx
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <18260.1555064496.1@warthog.procyon.org.uk>
Date:   Fri, 12 Apr 2019 11:21:36 +0100
Message-ID: <18261.1555064496@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 12 Apr 2019 10:21:44 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> In the past, we did some efforts to ensure that almost all files under
> Documentation/*.txt could be built with Sphinx.

Would recommend a URL.  Presumably this: http://www.sphinx-doc.org

David
