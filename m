Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DF5547D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 20:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbfGVUph (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 16:45:37 -0400
Received: from ms.lwn.net ([45.79.88.28]:43262 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727164AbfGVUph (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Jul 2019 16:45:37 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E81172C9;
        Mon, 22 Jul 2019 20:45:36 +0000 (UTC)
Date:   Mon, 22 Jul 2019 14:45:36 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jeremy Cline <jcline@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/vm: transhuge: fix typo in madvise reference
Message-ID: <20190722144536.59337ac4@lwn.net>
In-Reply-To: <20190716144908.25843-1-jcline@redhat.com>
References: <20190716144908.25843-1-jcline@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 16 Jul 2019 10:49:08 -0400
Jeremy Cline <jcline@redhat.com> wrote:

> Fix an off-by-one typo in the transparent huge pages admin
> documentation.
> 
> Signed-off-by: Jeremy Cline <jcline@redhat.com>

Applied, thanks.

jon
