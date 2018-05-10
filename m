Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9BBE47DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 22:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750714AbeEJW3g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 18:29:36 -0400
Received: from www62.your-server.de ([213.133.104.62]:50827 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbeEJW3e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 18:29:34 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1fGu41-0007jc-Vd; Fri, 11 May 2018 00:29:30 +0200
Subject: Re: [PATCH] bpf, doc: clarification for the meaning of 'id'
To:     Wang YanQing <udknight@gmail.com>, ast@kernel.org, corbet@lwn.net,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180510030921.GA25941@udknight>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <c92bea6f-b182-1fcd-8c6d-5d5dc34567c4@iogearbox.net>
Date:   Fri, 11 May 2018 00:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180510030921.GA25941@udknight>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.99.3/24558/Thu May 10 22:35:32 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/10/2018 05:09 AM, Wang YanQing wrote:
> For me, as a reader whose mother language isn't English, the
> old words bring a little difficulty to catch the meaning, this
> patch rewords the subsection in a more clarificatory way.
> 
> This patch also add blank lines as separator at two places
> to improve readability.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Applied to bpf-next, thanks Wang!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
