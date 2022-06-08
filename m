Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817B1C43334
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 06:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbiFHGyl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 02:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244898AbiFHFzg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 01:55:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1B54272EC;
        Tue,  7 Jun 2022 21:00:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE3AB618C8;
        Wed,  8 Jun 2022 04:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6392C3411D;
        Wed,  8 Jun 2022 04:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654660823;
        bh=CHx2w8CDbdu1UEVfiO99Fd0U2aB18Ou5KXph1hmlutA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HrCaiVWlSgWJ5eqXD2U9W4A/8jagvC3FWBUFoBEIvx/Og1opWtZRoijO31mX6ZcZf
         q0VC6qKNw4ea4YkCjOtyejN/D0JtAfscU9vtCupUURQ34wRpvNrrMyvmsg+pxAYXVm
         yXZPFVr2CNip5paQv84sqw0ZVo4l00Vy8J8EUszLigXziq25drHZaNJLiAGeFn4ja7
         FVQmP+woii/HegK7mdvzz4MYpM9gWk4z4bwsjCL4BqDNxP0N63XigjZcKaOg+R6n4Q
         +j2Xdd68YD8yq6ZeWQahVdHz6mpQVorVBxLUSXKWHUXIjwZONjvq4n6EWlBWDP9ex9
         bVDi6Y0nrm9qw==
Date:   Tue, 7 Jun 2022 21:00:21 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Lorenzo Bianconi <lorenzo@kernel.org>
Cc:     netdev@vger.kernel.org, ilias.apalodimas@linaro.org,
        hawk@kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        jbrouer@redhat.com, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next] Documentation: update
 networking/page_pool.rst with ethtool APIs
Message-ID: <20220607210021.05263978@kernel.org>
In-Reply-To: <8c1f582d286fd5a7406dfff895eea39bb8fedca6.1654546043.git.lorenzo@kernel.org>
References: <8c1f582d286fd5a7406dfff895eea39bb8fedca6.1654546043.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  6 Jun 2022 22:15:45 +0200 Lorenzo Bianconi wrote:
> Update page_pool documentation with page_pool ethtool stats APIs.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes since v1:
> - get rid of literal markup

This is not what Andrew and I meant, I don't think. The suggestion was
to put the information in kdoc of the function, in the source code, and
then render the kdoc here by adding something like:

.. kernel-doc:: whatever/the/source/is.c
   :identifiers: page_pool_ethtool_stats_get_strings page_pool_ethtool_stats_get_count page_pool_ethtool_stats_get

