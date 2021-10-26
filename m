Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42942C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 00:19:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17B7B61039
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 00:19:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhJZAWN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Oct 2021 20:22:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:43954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234809AbhJZAWM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Oct 2021 20:22:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD1EC60F92;
        Tue, 26 Oct 2021 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635207589;
        bh=ewFMn7F/EMh7/+QcFBbhLnkKLeG/ezHK307YEtzASZE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Re+MAPo4aFCVE6mbCWNhJ61XgeUy4IVohht++U7W451VFSN1dWVT3u+dUIh3lQuWf
         8IMfJpxbNWBNOiQIl1aScgQzm/NUOxTCVFrd89Jnid8EwR3CeWQgrfRvHzBXs+BXuL
         hzHnCrMwq1LhU7Un3XDuiDd1Ts4Epv6KHOtYOX80tQnhCG0KYQZCcmyL+x1iDATd1Y
         W/0ZlUQH7D/rDqtqnbHVc9LmCk4BNrRFnYIkfgzdkQo3PeXjAXA+bJbBbha+dyLUwg
         xd22nc4gWYkgItt/PnPTXz+y4IRFu/NPxQPPl10izxq/6mQjd2Rfuo3D+Bc12XuNEq
         6F7gDyb/a7wDA==
Message-ID: <0f1b32fa-1b2a-5586-9dc1-d50135a166f8@kernel.org>
Date:   Tue, 26 Oct 2021 08:19:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] f2fs: fix f2fs.rst build warning
Content-Language: en-US
To:     Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
        corbet@lwn.net
Cc:     linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org
References: <20211023025833.216030-1-changfengnan@vivo.com>
From:   Chao Yu <chao@kernel.org>
In-Reply-To: <20211023025833.216030-1-changfengnan@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/10/23 10:58, Fengnan Chang wrote:
> fix f2fs.rst build warning.
> 
> Fixes: 151b1982be5d (f2fs: compress: add nocompress extensions support)
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
