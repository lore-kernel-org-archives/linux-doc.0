Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A8B917D57F
	for <lwn-linux-doc@archive.lwn.net>; Sat, 15 Sep 2018 15:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbeIOUb7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 15 Sep 2018 16:31:59 -0400
Received: from einhorn-mail.in-berlin.de ([217.197.80.20]:53883 "EHLO
        einhorn-mail.in-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbeIOUb7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Sep 2018 16:31:59 -0400
X-Greylist: delayed 715 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 Sep 2018 16:31:58 EDT
X-Envelope-From: stefanr@s5r6.in-berlin.de
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id w8FExwgn020614
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 15 Sep 2018 17:00:03 +0200
Date:   Sat, 15 Sep 2018 16:59:58 +0200
From:   Stefan Richter <stefanr@s5r6.in-berlin.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rd.dunlab@gmail.com>,
        linux1394-devel@lists.sourceforge.net,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v3 0/5] FireWire: clean up kernel-doc, add Documentation
 chapter
Message-ID: <20180915165958.3f88a6f8@kant>
In-Reply-To: <20180906094738.0248c67e@lwn.net>
References: <20180905000225.10733-1-rd.dunlab@gmail.com>
        <20180906094738.0248c67e@lwn.net>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sep 06 Jonathan Corbet wrote:
> On Tue,  4 Sep 2018 17:02:20 -0700
> Randy Dunlap <rd.dunlab@gmail.com> wrote:
> > [PATCH v4 1/5] FireWire: clean up firewire-cdev.h kernel-doc
> > [PATCH v4 2/5] FireWire: clean up core-iso.c kernel-doc
> > [PATCH v4 3/5] FireWire: clean up core-transaction.c kernel-doc
> > [PATCH v4 4/5] FireWire: add a Documentation driver-api chapter
> > [PATCH v4 5/5] FireWire: add driver-api Introduction section
[...]
> > I think that Jon is the best choice to merge this series, but
> > someone please do so.  It has already missed 2 merge windows.  
> 
> I think this is the first time I've received this...  Through the
> FireWire maintainer seems like the best path, but it seems that's not
> happening.  The patches look good to me, so I've just applied them.

Thanks for taking care of this.  I only read superficially through the v1
posting and Takashi Sakamoto's initial responses; sorry to all for not
following up on this then.
-- 
Stefan Richter
-======---=- =--= -====
http://arcgraph.de/sr/
