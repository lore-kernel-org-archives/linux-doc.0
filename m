Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 010297D071
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 15:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388098AbeGWQ1Z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 12:27:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:34762 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387922AbeGWQ1Y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Jul 2018 12:27:24 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id ED70430A;
        Mon, 23 Jul 2018 15:25:40 +0000 (UTC)
Date:   Mon, 23 Jul 2018 09:25:39 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Prashant Dhamdhere <pdhamdhe@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: proc.txt: Adding 'HardwareCorrupted'
 field and description.
Message-ID: <20180723092539.177749b8@lwn.net>
In-Reply-To: <20180713172806.17387-1-pdhamdhe@redhat.com>
References: <20180713172806.17387-1-pdhamdhe@redhat.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 13 Jul 2018 22:58:06 +0530
Prashant Dhamdhere <pdhamdhe@redhat.com> wrote:

> This patch talks about the 'HardwareCorrupted' field currently missing from
> the 'meminfo' section of 'proc.txt' file. It also includes short description
> of 'HardwareCorrupted' field.

I've gone ahead and applied this.  Please note, though, that the "this
patch..." style of changelogging strongly irritates some developers;
please use an imperative style in the future.  I rewrote the changelog to:

	Documentation: proc.txt: Adding 'HardwareCorrupted' field and
	description. 
    	
	Fill in missing documentation for the HardwareCorrupted field in
	proc.txt.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
