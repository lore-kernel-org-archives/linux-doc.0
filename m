Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AA4C10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:57:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A662221927
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCJR5D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:57:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:44468 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbgCJR5D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 13:57:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A44022E4;
        Tue, 10 Mar 2020 17:57:02 +0000 (UTC)
Date:   Tue, 10 Mar 2020 11:57:01 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Borislav Petkov <bp@suse.de>, Tony Luck <tony.luck@intel.com>,
        Antonio Gomez Iglesias <antonio.gomez.iglesias@intel.com>,
        Waiman Long <longman@redhat.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 9/9] docs: hw-vuln: tsx_async_abort.rst: get rid of an
 unused ref
Message-ID: <20200310115701.15ca3abd@lwn.net>
In-Reply-To: <681c8e2916bf4943ac2277f181668bfbc5fdbc01.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
        <681c8e2916bf4943ac2277f181668bfbc5fdbc01.1583250595.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  3 Mar 2020 16:50:39 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The virt_mechanism reference there points to a section
> called elsewhere (Virtualization mitigation). Also, it is
> not used anywere.
> 
> Besides that, it conflicts with a label with the same name
> inside:
> 
> 	Documentation/admin-guide/hw-vuln/mds.rst
> 
> Perhaps added due to some cut-and-paste?
> 
> Anyway, as this is not used, let's just get rid of it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Applied, thanks.

jon
