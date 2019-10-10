Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D743F7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Oct 2019 17:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfJJRhc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 13:37:32 -0400
Received: from ms.lwn.net ([45.79.88.28]:60832 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbfJJRhc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Oct 2019 13:37:32 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D11F82BD;
        Thu, 10 Oct 2019 17:37:31 +0000 (UTC)
Date:   Thu, 10 Oct 2019 11:37:30 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bryan Gurney <bgurney@redhat.com>
Cc:     dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] dm dust: convert documentation to ReST
Message-ID: <20191010113730.3f0da042@lwn.net>
In-Reply-To: <1570469089-31554-1-git-send-email-bgurney@redhat.com>
References: <1570469089-31554-1-git-send-email-bgurney@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  7 Oct 2019 13:24:49 -0400
Bryan Gurney <bgurney@redhat.com> wrote:

> Convert the dm-dust documentation to ReST formatting, using literal
> blocks for all of the shell command, shell output, and log output
> examples.
> 
> Add dm-dust to index.rst.
> 
> Additionally, fix an annotation in the "querying for specific bad
> blocks" section, on the "queryblock ... not found in badblocklist"
> example, to properly state that the message appears when a given
> block is not found.
> 
> Signed-off-by: Bryan Gurney <bgurney@redhat.com>

Applied, thanks.

jon
