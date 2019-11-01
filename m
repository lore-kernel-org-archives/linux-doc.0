Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C9D77D910
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Nov 2019 12:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKAMBn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Nov 2019 08:01:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:59458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbfKAMBn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Nov 2019 08:01:43 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 924D3208E3;
        Fri,  1 Nov 2019 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572609702;
        bh=Y02s4XBi0lk6A1N7UzScz+CDAlHKVvSHuhj747yV4mA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=slvWenIJYVud+fH6YRVyYiYnkiE7BPYHHrjMGI51mvENCJMj221NBEPX5kJY8jbiP
         ElhqKjYDxw19TvJieryADUxCftnq1PCRX1yLhvFY5CzBOJQL/tz153gOrjtZKDkIck
         Fwhy0nOlN96gGFKD3eRfAecMz1allcMvQm2Qm1w0=
Date:   Fri, 1 Nov 2019 12:01:36 +0000
From:   Will Deacon <will@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Doug Berger <opendmb@gmail.com>,
        Hanjun Guo <guohanjun@huawei.com>, Qian Cai <cai@lca.pw>,
        Zhang Lei <zhang.lei@jp.fujitsu.com>,
        Marc Zyngier <maz@kernel.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: Brahma-B53 erratum updates
Message-ID: <20191101120135.GF2392@willie-the-truck>
References: <20191031214725.1491-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031214725.1491-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 31, 2019 at 02:47:22PM -0700, Florian Fainelli wrote:
> This patch series enable the Brahma-B53 CPU to be matched for the
> ARM64_ERRATUM_845719 and ARM64_ERRATUM_843419 and while we are it, also
> whitelists it for SSB and spectre v2.

Cheers, queued as fixes.

Will
