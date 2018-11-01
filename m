Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0B4B7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Nov 2018 11:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbeKAUP1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Nov 2018 16:15:27 -0400
Received: from o1.31pqt.s2shared.sendgrid.net ([167.89.100.227]:13823 "EHLO
        o1.31pqt.s2shared.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726520AbeKAUP1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Nov 2018 16:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
        h=mime-version:content-type:content-transfer-encoding:from:to:cc:
        subject:in-reply-to:references;
        s=smtpapi; bh=FPVcEplEJf0vkVn2OqvUlR0zFFLlOUyNEfe1mChGIBw=;
        b=IwkzG/tw4ONajJl07vHHvYkopMo5dC3U+iIM8RoZCj1KuRzhnRpHj2nEOLpaLBYCHPNG
        rtkE1nSrlWe6hLFcvKpuzJPDo8md43B3bALWQm+FwiLHG55U8nyZHL0iCkaeX0m1SWT9or
        BXrbgIElUt4isXoSpuLgqv3Z79Cu8VLcQ=
Received: by filter0004p2las1.sendgrid.net with SMTP id filter0004p2las1-26391-5BDADFB7-1F
        2018-11-01 11:12:56.046437308 +0000 UTC m=+42054.540311136
Received: from korte.land (unknown [146.185.150.169])
        by ismtpd0006p1lon1.sendgrid.net (SG) with ESMTP id meCFd9ghR7OKDtuhNTWJXw
        Thu, 01 Nov 2018 11:12:55.560 +0000 (UTC)
Received: from mail.korte.land (localhost [127.0.0.1])
        by korte.land (Postfix) with ESMTP id 37B9F60416;
        Thu,  1 Nov 2018 11:12:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Nov 2018 11:12:56 +0000 (UTC)
From:   Will Korteland <will@korte.land>
To:     Amir Livneh <alivneh@fb.com>
Cc:     corbet@lwn.net, rostedt@goodmis.org, mingo@redhat.com,
        linux-doc@vger.kernel.org, linux-doc-owner@vger.kernel.org
Subject: Re: [PATCH] doc: tracing: Fix a number of typos
In-Reply-To: <20181031141611.75480-1-alivneh@fb.com>
References: <20181031141611.75480-1-alivneh@fb.com>
Message-ID: <763be3409a2edc2606aaa6caed3e6078@korte.land>
X-Sender: will@korte.land
X-SG-EID: =?us-ascii?Q?cUnx5NqAuhUbAHG4iZ9Vx1BO6oMeAW3Kqk+xSEzhkR48c1futjyLp2=2Fwp8OUBt?=
 =?us-ascii?Q?=2F5X+h1tdyY33lVKbOQVGXUFVApdEpOu8HdTqkNE?=
 =?us-ascii?Q?Lo75qqeXXr=2Fu4TlfoPtd8q=2FDiIhGyZTuCA0Ztj1?=
 =?us-ascii?Q?Gfmv0ke1TwC1WKDMv1j3QDJKVbpX0zVdI+l0p8t?=
 =?us-ascii?Q?u7I5METft4KDlI2dIPVbA2oIBFesGbtoaDp7G+9?=
 =?us-ascii?Q?lb5caWzs1nuFH1oDH1kmztHhddy4IFR9dL8Nua?=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2018-10-31 14:16, Amir Livneh wrote:
> @@ -2978,7 +2978,7 @@ The following commands are supported:
>    When the function is hit, it will dump the contents of the ftrace
>    ring buffer to the console. This is useful if you need to debug
>    something, and want to dump the trace when a certain function
> -  is hit. Perhaps its a function that is called before a tripple
> +  is hit. Perhaps it's a function that is called before a tripple
>    fault happens and does not allow you to get a regular dump.
>  
>  - cpudump:

"tripple" -> "triple", while you're at it?

- Will
