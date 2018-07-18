Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DF47C7D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 15:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbeGRPsc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Jul 2018 11:48:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:56146 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729462AbeGRPsc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Jul 2018 11:48:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 72FC0AED2;
        Wed, 18 Jul 2018 15:10:10 +0000 (UTC)
Date:   Wed, 18 Jul 2018 17:10:09 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     David Rientjes <rientjes@google.com>
Cc:     Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: Deprecate kernelcore=nn and movable_core=
Message-ID: <20180718151009.GJ7193@dhcp22.suse.cz>
References: <20180717131837.18411-1-bhe@redhat.com>
 <alpine.DEB.2.21.1807171344320.12251@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1807171344320.12251@chino.kir.corp.google.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue 17-07-18 13:46:43, David Rientjes wrote:
> On Tue, 17 Jul 2018, Baoquan He wrote:
> 
> > We can still use 'kernelcore=mirror' or 'movable_node' for the usage
> > of hotplug and movable zone. If somebody shows up with a valid usecase
> > we can reconsider.
> > 
> 
> We actively use kernelcore=n%, I had recently added support for the option 
> in the first place in 4.17.  It's certainly not deprecated.
> 
> commit a5c6d6509342785bef53bf9508e1842b303f1878
> Author: David Rientjes <rientjes@google.com>
> Date:   Thu Apr 5 16:23:09 2018 -0700
> 
>     mm, page_alloc: extend kernelcore and movablecore for percent

What kind of functionality do you need to not depend on this knob?
I mean it is a gross hack and you are basically working around
fragmentation issues. ZONE_MOVABLE doesn't seem to be a long term
solution here IMHO.
-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
