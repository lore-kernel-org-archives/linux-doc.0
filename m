Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5F067DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 17:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755096AbeEHRgx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 13:36:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:46791 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754913AbeEHRgw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 May 2018 13:36:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2FF51AC3E;
        Tue,  8 May 2018 17:36:50 +0000 (UTC)
Date:   Tue, 8 May 2018 17:36:49 +0000
From:   "Luis R. Rodriguez" <mcgrof@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-can@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
        linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-crypto@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 00/18] Fix some build warnings/errors with Sphinx
Message-ID: <20180508173649.GH27853@wotan.suse.de>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <20180508101342.2bde20ea@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180508101342.2bde20ea@lwn.net>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 08, 2018 at 10:13:42AM -0600, Jonathan Corbet wrote:
> On Mon,  7 May 2018 06:35:36 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > I decided to give a try with Sphinx last stable version
> > (1.17.4), and noticed several issues. The worse one was
> > with the networking book: a non-standard footnote there
> > with [*] instead of a number causes it to break PDF building.
> > 
> > So, I took some spare time to address some warnings all over
> > the tree, and moved a few text documents to a book. 
> 
> OK, I've applied the ones that seem to make sense for me to take now.
> There's comments on the firmware one, 

I'll fold in the fixes for the firmware API which do apply to my queue.

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
