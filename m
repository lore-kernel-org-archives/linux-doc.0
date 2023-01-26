Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA153C54EAA
	for <linux-doc@archiver.kernel.org>; Thu, 26 Jan 2023 20:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjAZU1X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Jan 2023 15:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjAZU1W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 15:27:22 -0500
Received: from out-63.mta0.migadu.com (out-63.mta0.migadu.com [IPv6:2001:41d0:1004:224b::3f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A419349952
        for <linux-doc@vger.kernel.org>; Thu, 26 Jan 2023 12:27:20 -0800 (PST)
Date:   Thu, 26 Jan 2023 20:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1674764506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HCSsOa0JEOzhu3a9IEBtJokH+VBhBqNS4dXI8GM6BrQ=;
        b=i/OFi55Kk1Tj0Kbnkwfvkt5xhK41K7otXqMXHyW9PC+97eT58SMprP3IyAXkwxD+HzvAfI
        2rOsQDnYp/lYKzNBFcuBYyaUOsEO0DG6HreD7ssgJPJgzzW7fn4Jku/4QAoTmt/QyTNUey
        6xw2MuMloIX00xPGtvtk1Tw91nAIiz0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     Gavin Shan <gshan@redhat.com>
Cc:     kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net,
        maz@kernel.org, will@kernel.org, ricarkol@google.com,
        eric.auger@redhat.com, yuzhe@nfschina.com, renzhengeek@gmail.com,
        reijiw@google.com, ardb@kernel.org, Julia.Lawall@inria.fr,
        yuzenghui@huawei.com, seanjc@google.com, shan.gavin@gmail.com
Subject: Re: [PATCH v2 0/3] Improve dirty ring warning report
Message-ID: <Y9Lg1ESUVJov0WpH@google.com>
References: <20230119234405.349644-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119234405.349644-1-gshan@redhat.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 20, 2023 at 07:44:02AM +0800, Gavin Shan wrote:
> It has been known case where no running VCPU context exists when the
> vgic/its tables are saved. There are other two unknown cases where we
> don't have the running VCPU context: (a) restore vgic3 LPI pending
> status. (b) restoring vgic3 pending tables.
> 
> PATCH[1]     adds unified helper vgic_write_guest_lock()
> PATCH[2 - 3] allows no-running-vcpu context for (a) and (b)

Besides the issue with the first patch, for the series:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver
