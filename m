Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C8017DD32
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Apr 2018 20:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750736AbeDEU1b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Apr 2018 16:27:31 -0400
Received: from gum.cmpxchg.org ([85.214.110.215]:50244 "EHLO gum.cmpxchg.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750726AbeDEU1a (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Apr 2018 16:27:30 -0400
X-Greylist: delayed 2469 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Apr 2018 16:27:30 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cmpxchg.org
        ; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ZBVDmx24pWehOly/7pumcXjHi/MGPfvW6fhZhtriMhI=; b=ga91hfp9YLQs57VJa4ylVg28F+
        7VcWJGDQKeD+3ovLFzgDDNnLKJGKB8DBlKvndwZP6EA516lpjxk6KWaxR0usW4xg3GuBO05MN/+Hx
        +5k1Pf3U5vxwqly27tQAlrZm6laDvjnhwoN4h7sfHPO4EmLf0tE1cjA7xP031dhPhE5g=;
Date:   Thu, 5 Apr 2018 15:46:15 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Roman Gushchin <guro@fb.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Tejun Heo <tj@kernel.org>, kernel-team@fb.com,
        cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 4/4] mm/docs: describe memory.low refinements
Message-ID: <20180405194615.GD27918@cmpxchg.org>
References: <20180405185921.4942-1-guro@fb.com>
 <20180405185921.4942-4-guro@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180405185921.4942-4-guro@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 05, 2018 at 07:59:21PM +0100, Roman Gushchin wrote:
> Refine cgroup v2 docs after latest memory.low changes.
> 
> Signed-off-by: Roman Gushchin <guro@fb.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Vladimir Davydov <vdavydov.dev@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: kernel-team@fb.com
> Cc: linux-mm@kvack.org
> Cc: cgroups@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-doc@vger.kernel.org

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
