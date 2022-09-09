Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16033ECAAD3
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 07:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbiIIHun (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbiIIHuQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 03:50:16 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631EE1395B9;
        Fri,  9 Sep 2022 00:45:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 89B0422918;
        Fri,  9 Sep 2022 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1662709049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WXTY9+MF108rC5N0qRIMHJTyEWfCXxraJ9r3p5CaavA=;
        b=PAsRjY//6ci6tMdc1AbSkVT1/NENOZTJAYbDmM/NGwbPB9Ex8BRJjtAD3qTEQgwNmwS7Sp
        85xLjm5S2Qb4Z+PRXwoYxHh3r/+n8crnkzaGqIGc0GZBNa68JFMKROU+hfksQTD0opQHMq
        YMn/VvNQEOBRlZW1X6lJKPVJc1wShuE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 682F813A93;
        Fri,  9 Sep 2022 07:37:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id bdCnFzntGmO+MwAAMHmgww
        (envelope-from <mhocko@suse.com>); Fri, 09 Sep 2022 07:37:29 +0000
Date:   Fri, 9 Sep 2022 09:37:28 +0200
From:   Michal Hocko <mhocko@suse.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Liu Shixin <liushixin2@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        Muchun Song <songmuchun@bytedance.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, linux-mm@kvack.org,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] mm/memcontrol: use kstrtobool for swapaccount param
 parsing
Message-ID: <YxrtODqHhdEkW2Lx@dhcp22.suse.cz>
References: <20220908083452.2844125-1-liushixin2@huawei.com>
 <20220908150248.85fff32bf275844f0927a856@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908150248.85fff32bf275844f0927a856@linux-foundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu 08-09-22 15:02:48, Andrew Morton wrote:
> On Thu, 8 Sep 2022 16:34:52 +0800 Liu Shixin <liushixin2@huawei.com> wrote:
> 
> > --- a/mm/swap_cgroup.c
> > +++ b/mm/swap_cgroup.c
> > @@ -194,7 +194,7 @@ int swap_cgroup_swapon(int type, unsigned long max_pages)
> >  	return 0;
> >  nomem:
> >  	pr_info("couldn't allocate enough memory for swap_cgroup\n");
> > -	pr_info("swap_cgroup can be disabled by swapaccount=0 boot option\n");
> > +	pr_info("swap_cgroup can be disabled by swapaccount=[oO][Ff]/N/n/0 boot option\n");
> 
> I'm not sure this really needed changing.  "=0" was OK and the message
> now looks rather silly.

Agreed. While swapaccount=0 is clear the extended form, even if correct,
might just confuse some admins.

-- 
Michal Hocko
SUSE Labs
