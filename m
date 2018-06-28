Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A97CD7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 22:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936041AbeF1WjL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 18:39:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:43148 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S934984AbeF1WjK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 28 Jun 2018 18:39:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5BE2CAD2D;
        Thu, 28 Jun 2018 22:39:08 +0000 (UTC)
Date:   Fri, 29 Jun 2018 00:39:06 +0200
From:   "Luis R. Rodriguez" <mcgrof@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>
Subject: Re: [PATCH v8 2/5] ipc: IPCMNI limit check for semmni
Message-ID: <20180628223906.GB331@wotan.suse.de>
References: <1529317698-16575-1-git-send-email-longman@redhat.com>
 <1529317698-16575-3-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529317698-16575-3-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 18, 2018 at 06:28:15PM +0800, Waiman Long wrote:
> For SysV semaphores, the semmni value is the last part of the 4-element
> sem number array. To make semmni behave in a similar way to msgmni and
> shmmni, we can't directly use the _minmax handler. Instead, a special
> sem specific handler is added to check the last argument to make sure
> that it is limited to the [0, IPCMNI] range. An error will be returned
> if this is not the case.

Sorry my time has run out, and will be on vacation until July 10th. If
this can wait until then then great, otherwise hopefully Kees can take
a look. It would be wonderful to get Eric's review on this as well.

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
