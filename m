Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CE0C43331
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 00:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CD1F22D6E
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 00:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390917AbhALA0B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 19:26:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:33044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403981AbhAKXRc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Jan 2021 18:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A3D222D05;
        Mon, 11 Jan 2021 23:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610407011;
        bh=zCl2k19hUTGn9D3gpwp8SYfo14eD4Mpe7by1LER+eBA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VzNeqHxZjL1w916qQHi9lRDDxgXrTfz80MatsZlXaN8lnSdFwOnwhUFviImHYF0MD
         iUdWpUEj44Y1QZY/sUQjbS/+LGaQnZj+VNPzbYWC1fJz9DAG/pYo2jwAstSlwZjTzQ
         NvoeRF4CD2b89NGeq5wIkHDuvMlkgHJa62V3uLxkxt4HiR+ikwX9GI3TP+c5HGbpp6
         E+rS9wG/y/8oh6Vw88ztzk4JLkK+H6ydhnLEllKjrPEB0NKrtbmAIo2FBWtr0Ay5CB
         TrqEUBwmnQfIgHH1aH3AZbAK4tPPpMt2wdOvrxbA1JMa2cZWajX87+5o9fb8hlSAHh
         KVGAeY42iNWPw==
Date:   Mon, 11 Jan 2021 15:16:50 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Praveen Chaudhary <praveen5582@gmail.com>
Cc:     davem@davemloft.net, corbet@lwn.net, kuznet@ms2.inr.ac.ru,
        yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhenggen Xu <zxu@linkedin.com>
Subject: Re: [PATCH v0 net-next 1/1] Allow user to set metric on default
 route learned via Router Advertisement.
Message-ID: <20210111151650.41ac7532@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210111215829.3774-2-pchaudhary@linkedin.com>
References: <20210111215829.3774-1-pchaudhary@linkedin.com>
        <20210111215829.3774-2-pchaudhary@linkedin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 11 Jan 2021 13:58:29 -0800 Praveen Chaudhary wrote:
> For IPv4, default route is learned via DHCPv4 and user is allowed to change
> metric using config etc/network/interfaces. But for IPv6, default route can
> be learned via RA, for which, currently a fixed metric value 1024 is used.
> 
> Ideally, user should be able to configure metric on default route for IPv6
> similar to IPv4. This fix adds sysctl for the same.
> 
> Signed-off-by: Praveen Chaudhary<pchaudhary@linkedin.com>
> Signed-off-by: Zhenggen Xu<zxu@linkedin.com>

Please put a space between the name and '<'.

I haven't looked at the code yet, but I can tell you this patch
triggers a few checkpatch --strict warnings, and breaks allmodconfig
build.
