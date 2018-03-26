Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A12D77D0F4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 16:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752584AbeCZQcv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 12:32:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:54948 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752522AbeCZQcu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Mar 2018 12:32:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0358E2C7;
        Mon, 26 Mar 2018 16:32:49 +0000 (UTC)
Date:   Mon, 26 Mar 2018 10:32:49 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Gary R Hook <gary.hook@amd.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/CodingStyle: Add an example for braces
Message-ID: <20180326103249.42789cdb@lwn.net>
In-Reply-To: <724fc548-0e40-11a3-2a9b-3dd0db0de880@amd.com>
References: <152114372879.3142.8833111074324091904.stgit@taos>
        <20180321091701.7d56445d@lwn.net>
        <87woy4iide.fsf@intel.com>
        <724fc548-0e40-11a3-2a9b-3dd0db0de880@amd.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 26 Mar 2018 11:28:03 -0500
Gary R Hook <gary.hook@amd.com> wrote:

> Submitting a v3 because the example could better illuminate the options 
> by using loop construct inside of an if, addressing Jani's point but 
> without opening the door to later criticism.
> 
> I also like the verbage in v2/3 better, but I'll let Jonathan make the call.

As I told you, I was applying the first version; I did that last week.

> BTW which tree should these be developed against? I used torvalds, but 
> I'm not entirely sure that was the proper one?

The MAINTAINERS file will (almost) always answer that question for
you:	

	T:	git git://git.lwn.net/linux.git docs-next

For a patch like this it doesn't matter, since there's is no other work on
the file to conflict with.

THanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
