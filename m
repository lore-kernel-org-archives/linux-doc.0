Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 518147D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 15:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752560AbeCUPRD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 11:17:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:50008 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752385AbeCUPRD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Mar 2018 11:17:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DA47A536;
        Wed, 21 Mar 2018 15:17:02 +0000 (UTC)
Date:   Wed, 21 Mar 2018 09:17:01 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Gary R Hook <gary.hook@amd.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] Documentation/CodingStyle: Add an example for braces
Message-ID: <20180321091701.7d56445d@lwn.net>
In-Reply-To: <152114372879.3142.8833111074324091904.stgit@taos>
References: <152114372879.3142.8833111074324091904.stgit@taos>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 15 Mar 2018 15:04:02 -0500
Gary R Hook <gary.hook@amd.com> wrote:

> +Do use braces when a body is more complex than a single simple statement:
> +
> +.. code-block:: c
> +
> +	if (condition) {
> +		if (another_condition)
> +			do_something();
> +	}

Somebody is sure to complain at some point that this should really be:

	if (condition && another_condition)
		do_something();

To head that off, I think I'll apply your first version instead, sorry
Jani.

In general I'm pretty reluctant to apply coding-style patches for the
simple reason that I sure don't want to be the arbitrator of proper kernel
style.  This one seems to fit well within the accepted norms, though.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
