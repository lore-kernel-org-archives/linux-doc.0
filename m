Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A09117DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 12:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752211AbeEGMin (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 08:38:43 -0400
Received: from s3.sipsolutions.net ([144.76.63.242]:35842 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751891AbeEGMim (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 08:38:42 -0400
Received: by sipsolutions.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.91)
        (envelope-from <johannes@sipsolutions.net>)
        id 1fFfPP-00058g-Aa; Mon, 07 May 2018 14:38:27 +0200
Message-ID: <1525696706.6049.7.camel@sipsolutions.net>
Subject: Re: [PATCH 09/18] net: mac80211.h: fix a bad comment line
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Kalle Valo <kvalo@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Date:   Mon, 07 May 2018 14:38:26 +0200
In-Reply-To: <87fu334p5v.fsf@purkki.adurom.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
         <cover.1525684985.git.mchehab+samsung@kernel.org>
         <1b14ef4f63547c86c544e112b74acfff2b41f4af.1525684985.git.mchehab+samsung@kernel.org>
         <87fu334p5v.fsf@purkki.adurom.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2018-05-07 at 15:37 +0300, Kalle Valo wrote:
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:
> 
> > Sphinx produces a lot of errors like this:
> > 	./include/net/mac80211.h:2083: warning: bad line:  >
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> 
> Randy already submitted a similar patch:
> 
> https://patchwork.kernel.org/patch/10367275/
> 
> But it seems Johannes has not applied that yet.

Yeah, I've been super busy preparing for the plugfest.

I'll make a pass over all the patches as soon as I can, hopefully today
or tomorrow.

johannes
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
