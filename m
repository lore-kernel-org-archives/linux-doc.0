Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 71BDF7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Dec 2018 20:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbeLNUQg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Dec 2018 15:16:36 -0500
Received: from mail.linuxfoundation.org ([140.211.169.12]:48478 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730659AbeLNUQg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Dec 2018 15:16:36 -0500
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 799E2EB1;
        Fri, 14 Dec 2018 20:16:35 +0000 (UTC)
Date:   Fri, 14 Dec 2018 12:16:34 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     joe@perches.com, gregkh@linuxfoundation.org,
        himanshujha199640@gmail.com, apw@canonical.com,
        linux-kernel@vger.kernel.org, niklas.cassel@linaro.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] checkpatch: add Co-developed-by to signature tags
Message-Id: <20181214121634.1157f2302c8ba1825fc03ad2@linux-foundation.org>
In-Reply-To: <1544808928-20002-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1544808928-20002-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
        <1544808928-20002-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 14 Dec 2018 18:35:28 +0100 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> As per Documentation/process/submitting-patches, Co-developed-by is a
> valid signature.
> 

I'm with Joe - I find this tag kinda useless and duplicative.  But whatever.

But as the documentation says, Co-developed-by must be accompanied by a
Signed-off-by:.  It would be helpful if checkpatch were to detect a
failure to do this.

