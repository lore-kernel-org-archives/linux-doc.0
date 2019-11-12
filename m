Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9C347DCEA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Nov 2019 16:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKLQqm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Nov 2019 11:46:42 -0500
Received: from ms.lwn.net ([45.79.88.28]:41904 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726896AbfKLQqm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Nov 2019 11:46:42 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EC6867DE;
        Tue, 12 Nov 2019 16:46:40 +0000 (UTC)
Date:   Tue, 12 Nov 2019 09:46:38 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Frank.li@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [RFC PATCH] Documentation: perf: fix kernel-doc warnings in
 imx-ddr.rst
Message-ID: <20191112094638.54459a23@lwn.net>
In-Reply-To: <20191107185755.29586-1-dwlsalmeida@gmail.com>
References: <20191107185755.29586-1-dwlsalmeida@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  7 Nov 2019 15:57:55 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Unexpected indentation errors were reported due to missing blank lines.
> Now fixed. No change in content otherwise.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

So this is in no way your fault, but this particular file has been the
subject of some merge conflicts in linux-next already, so it's probably
best not to mess with it further at the moment.   Could I ask you to
resubmit the patch after the 5.5 merge window?

Thanks,

jon
