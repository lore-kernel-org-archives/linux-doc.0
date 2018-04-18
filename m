Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 43E737E69D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 16:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751256AbeDRQEU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 12:04:20 -0400
Received: from ns391626.ip-176-31-99.eu ([176.31.99.217]:46142 "EHLO
        ns391626.ip-176-31-99.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751232AbeDRQEU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 12:04:20 -0400
Received: by ns391626.ip-176-31-99.eu (Postfix, from userid 1000)
        id E02BB15FBC0; Wed, 18 Apr 2018 18:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigexec.com; s=mail;
        t=1524067944; bh=5a7X13Vb1DkH2f3ohMW2yERtOgkHaG+Xa8YIKCFqUTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=A0a9O9IPfBOtvg1Ldn09WazDtrLWJeHcrm8IGTc5ONPi0sTK2OZHR+fFddOypPtpD
         9NXwywxL6yovBpumZ7/V3V3I1mv/asNJ50WPt3Rr+ZGcG1dXbJKn7dr2BgPE1cLMbN
         yKbSJ6jt6Tyvurkc11xqne35oit0nyoj7hipB8nQ=
Date:   Wed, 18 Apr 2018 18:12:24 +0200
From:   Olivier Gayot <olivier.gayot@sigexec.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Trivial Patch Monkey <trivial@kernel.org>
Subject: Re: [PATCH] docs: ip-sysctl.txt: fix name of some ipv6 variables
Message-ID: <20180418161224.GA19070@sigexec.com>
References: <1524047494-32679-1-git-send-email-olivier.gayot@sigexec.com>
 <20180418074356.01d61108@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180418074356.01d61108@lwn.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

On Wed, Apr 18, 2018 at 07:43:56AM -0600, Jonathan Corbet wrote:
> The patch seems good, but can I suggest resending it to netdev?  Davem
> likes to handle networking docs patches himself.
> 
> Thanks,
> 
> jon

Sure. Thanks for the feedback. I'll resend to netdev.

Olivier
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
