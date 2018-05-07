Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FB997DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 12:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752211AbeEGMhz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 08:37:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53646 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752200AbeEGMhy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 08:37:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6DD0C601A8; Mon,  7 May 2018 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1525696673;
        bh=+8TtovteDf16gMpHI1s1PKCf0UP7iQp6yJl/fzCY9ug=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=UlqFjP6ENmM+96cmhAqHnuvmmlBin2e0xZqNQ8An4WVP11j3LStegCmaXIh+TBWtV
         /5yfxFyuIg7Ti/uBbh1R6ZSOpwWBStFUrupylHSir/QT4sHyTr2whAe2WoqFTPiNco
         ZyLWcfB+oFHoyBgXtyvqookks7nZmZXOaSTw4xaw=
Received: from purkki.adurom.net (purkki.adurom.net [80.68.90.206])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20A3760B23;
        Mon,  7 May 2018 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1525696672;
        bh=+8TtovteDf16gMpHI1s1PKCf0UP7iQp6yJl/fzCY9ug=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=TaK565EtucIy6/g4aYkkVFYA1QqtaKJji70eUoHGpSNVOcGqzetMD6fx1EAyAGEDg
         FlaJDbd5wEJKKiRDT4RvcKOPvqmj0J0VQ+4BePGDJHN9XnMmF+a6T4O6DnFbO+woUo
         Yk58usdQmYO/uzw7BOVTw/i6ixb4CD0zlJ9ZDmBQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20A3760B23
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Johannes Berg <johannes@sipsolutions.net>,
        "David S. Miller" <davem@davemloft.net>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 09/18] net: mac80211.h: fix a bad comment line
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <cover.1525684985.git.mchehab+samsung@kernel.org>
        <1b14ef4f63547c86c544e112b74acfff2b41f4af.1525684985.git.mchehab+samsung@kernel.org>
Date:   Mon, 07 May 2018 15:37:48 +0300
In-Reply-To: <1b14ef4f63547c86c544e112b74acfff2b41f4af.1525684985.git.mchehab+samsung@kernel.org>
        (Mauro Carvalho Chehab's message of "Mon, 7 May 2018 06:35:45 -0300")
Message-ID: <87fu334p5v.fsf@purkki.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.4 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:

> Sphinx produces a lot of errors like this:
> 	./include/net/mac80211.h:2083: warning: bad line:  >
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Randy already submitted a similar patch:

https://patchwork.kernel.org/patch/10367275/

But it seems Johannes has not applied that yet.

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
