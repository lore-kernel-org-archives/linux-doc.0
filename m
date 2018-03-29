Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 23D2C7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 18:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754083AbeC2SPU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 14:15:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:58326 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753544AbeC2SPR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Mar 2018 14:15:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id B69D0B016;
        Thu, 29 Mar 2018 18:15:15 +0000 (UTC)
Date:   Thu, 29 Mar 2018 18:15:15 +0000
From:   "Luis R. Rodriguez" <mcgrof@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH v5 1/9] sysctl: Add flags to support min/max range
 clamping
Message-ID: <20180329181515.GL30543@wotan.suse.de>
References: <1521224030-2185-1-git-send-email-longman@redhat.com>
 <1521224030-2185-2-git-send-email-longman@redhat.com>
 <20180317011021.GB4449@wotan.suse.de>
 <35f54e8f-b80e-aa3b-b008-79ba7ca3bff2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35f54e8f-b80e-aa3b-b008-79ba7ca3bff2@redhat.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 19, 2018 at 11:39:19AM -0400, Waiman Long wrote:
> On 03/16/2018 09:10 PM, Luis R. Rodriguez wrote:
> > On Fri, Mar 16, 2018 at 02:13:42PM -0400, Waiman Long wrote:
> >> When the CTL_FLAGS_CLAMP_RANGE flag is set in the ctl_table
> >> entry, any update from the userspace will be clamped to the given
> >> range without error if either the proc_dointvec_minmax() or the
> >> proc_douintvec_minmax() handlers is used.
> > I don't get it.  Why define a generic range flag when we can be mores specific and
> > you do that in your next patch. What's the point of this flag then?
> >
> >   Luis
> 
> I was thinking about using the signed/unsigned bits as just annotations
> for ranges for future extension. For the purpose of this patchset alone,
> I can merge the three bits into just two.

Only introduce flags which you will actually use in the same patch series.

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
