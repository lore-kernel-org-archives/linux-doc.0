Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 96CAF7D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 03:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932992AbeF1DQJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Jun 2018 23:16:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:58637 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932577AbeF1DQJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 27 Jun 2018 23:16:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext-too.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 6488BACC6;
        Thu, 28 Jun 2018 03:16:07 +0000 (UTC)
Date:   Thu, 28 Jun 2018 05:16:06 +0200
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
Subject: Re: [PATCH v8 1/5] ipc: IPCMNI limit check for msgmni and shmmni
Message-ID: <20180628031605.GJ21242@wotan.suse.de>
References: <1529317698-16575-1-git-send-email-longman@redhat.com>
 <1529317698-16575-2-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529317698-16575-2-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 18, 2018 at 06:28:14PM +0800, Waiman Long wrote:
> A user can write arbitrary integer values to msgmni and shmmni sysctl
> parameters without getting error, but the actual limit is really
> IPCMNI (32k). This can mislead users as they think they can get a
> value that is not real.
> 
> The right limits are now set for msgmni and shmmni so that the users
> will become aware if they set a value outside of the acceptable range.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
