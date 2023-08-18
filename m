Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF589C3DA6F
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 03:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244068AbjHRDCp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 23:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357418AbjHRDCo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 23:02:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF90F1BB
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 20:02:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4AE5A61607
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 03:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39B4C433C7;
        Fri, 18 Aug 2023 03:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692327761;
        bh=C+qb50i/AzAs7tmX3ps1WN6qoUMah+yzD4vKL0B6vZE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m0rzyzPD5FejdY7HoEQzgw6hi7jQNoPmXKG14VsIV4NxVZAsWdhEm0Hgt4qllW/q7
         t288bqiIDR6A/6VTNAxyriyMfCtta7uEKsm1wqLgRURZdyV9u1EiaPLwPl1pxPxfQ3
         k1Kg6zKnHcbFLiSwHxFVu9C/uUh5hzFhNRvl1rb4HaNRNWz2VmtSPeUlUM4Sc+l46V
         GrSNQD8zpcmZH21hJFMXvQyfClYuv8rS1KtjEe9vROSfsSwzMY0OjJj65DNjvCY5yL
         eIyWbiONH4ysCNHgFNv300cpkWyobvQHBqLGmJQirIxTgXzA5de20nzFiZMV5aDKKn
         jKs3+CKifweOg==
Date:   Thu, 17 Aug 2023 20:02:39 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Tony Nguyen <anthony.l.nguyen@intel.com>
Cc:     davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
        netdev@vger.kernel.org, Joshua Hay <joshua.a.hay@intel.com>,
        pavan.kumar.linga@intel.com, emil.s.tantilov@intel.com,
        jesse.brandeburg@intel.com, sridhar.samudrala@intel.com,
        shiraz.saleem@intel.com, sindhu.devale@intel.com,
        willemb@google.com, decot@google.com, andrew@lunn.ch,
        leon@kernel.org, mst@redhat.com, simon.horman@corigine.com,
        shannon.nelson@amd.com, stephen@networkplumber.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Alan Brady <alan.brady@intel.com>,
        Madhu Chittim <madhu.chittim@intel.com>,
        Phani Burra <phani.r.burra@intel.com>
Subject: Re: [PATCH net-next v5 15/15] idpf: configure SRIOV and add other
 ndo_ops
Message-ID: <20230817200239.7d2643dd@kernel.org>
In-Reply-To: <20230816004305.216136-16-anthony.l.nguyen@intel.com>
References: <20230816004305.216136-1-anthony.l.nguyen@intel.com>
        <20230816004305.216136-16-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Aug 2023 17:43:05 -0700 Tony Nguyen wrote:
> Add PCI callback to configure SRIOV and add the necessary support
> to initialize the requested number of VFs by sending the virtchnl
> message to the device Control Plane.

There is no API here to configure the SRIOV, please drop that from 
the next verison.

Sorry I run out of day. My comments so far are pretty minor, feel 
free to post v6 without waiting the 24h, otherwise I'll take a look 
at 9-14 tomorrow.

Please add my Acked-by on patches 1-7, if you're posting v6.
-- 
pw-bot: cr
