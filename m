Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C7CA17D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 19:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbeJJChr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 22:37:47 -0400
Received: from namei.org ([65.99.196.166]:33244 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727449AbeJJChr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Oct 2018 22:37:47 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id w99JIvcY010396;
        Tue, 9 Oct 2018 19:18:57 GMT
Date:   Wed, 10 Oct 2018 06:18:57 +1100 (AEDT)
From:   James Morris <jmorris@namei.org>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     LKML <linux-kernel@vger.kernel.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module@vger.kernel.org,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] security: fix LSM description location
In-Reply-To: <c06eb47c-05d3-f51c-625b-9bfdd33a426a@infradead.org>
Message-ID: <alpine.LRH.2.21.1810100618430.9831@namei.org>
References: <c06eb47c-05d3-f51c-625b-9bfdd33a426a@infradead.org>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 8 Oct 2018, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix Documentation location reference for where LSM descriptions should
> be placed.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: linux-security-module@vger.kernel.org

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next-general

-- 
James Morris
<jmorris@namei.org>

