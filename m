Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E1357D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 22:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731960AbeGZXn2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 19:43:28 -0400
Received: from ms.lwn.net ([45.79.88.28]:34496 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731610AbeGZXn2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Jul 2018 19:43:28 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7729E2B6;
        Thu, 26 Jul 2018 22:24:37 +0000 (UTC)
Date:   Thu, 26 Jul 2018 16:24:36 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Prashant Dhamdhere <pdhamdhe@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: vm.txt: Adding
 'nr_hugepages_mempolicy' parameter description.
Message-ID: <20180726162436.51ebbdb4@lwn.net>
In-Reply-To: <20180720133500.10475-1-pdhamdhe@redhat.com>
References: <20180720133500.10475-1-pdhamdhe@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 20 Jul 2018 19:05:00 +0530
Prashant Dhamdhere <pdhamdhe@redhat.com> wrote:

> This patch adds 'nr_hugepages_mempolicy' parameter which is currently missing
> in 'vm.txt' file. It also contains a short description of 'nr_hugepages_mempolicy'
> parameter.
> 
> Signed-off-by: Prashant Dhamdhere <pdhamdhe@redhat.com>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
