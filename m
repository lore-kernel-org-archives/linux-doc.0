Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED836C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 08:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4A8A20872
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600245643;
	bh=9/jLc6Hh0XM5wA4iwl1MJX6huqDrd9/aFYZ5hSgKcvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KD3Vj35M+vpUDbteNvSVw8HPcCAfrITkQSGle5zxjqAseLB8+oGOtLWp04mldsYVL
	 oUg46rRn0o+MZF81IJD8u3PpZe8TtJz5TMbzQ2Ij1tH8w9q4EGCNhrldZc3/sBopGU
	 R9pth9Qc8uv0BJIJHReIrr/Q9mJq9F27Bv3yROv8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgIPIkl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 04:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:38270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbgIPIkg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Sep 2020 04:40:36 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B33420678;
        Wed, 16 Sep 2020 08:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600245636;
        bh=9/jLc6Hh0XM5wA4iwl1MJX6huqDrd9/aFYZ5hSgKcvg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zq/Qv/EEXjcAVqj4/a627j3LyXIjt1K30xLqRmoZzBvPWUX2sEbIkVUdxoakO2OHp
         a242RwYQ5UgTgJ3uvxP+GZzpUAh342oiH4FvJnfYeuOuXo/BWgf4dnoWOSjmr5Kc1I
         OVwpisTBU3i02rV0E2H28CxRqAVomQ0IJpzhp3gE=
Date:   Wed, 16 Sep 2020 09:40:31 +0100
From:   Will Deacon <will@kernel.org>
To:     Bailu Lin <bailu.lin@vivo.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, wangqing@vivo.com
Subject: Re: [PATCH] doc: zh_CN: index files in arm64 subdirectory
Message-ID: <20200916084030.GE27496@willie-the-truck>
References: <20200916045720.33636-1-bailu.lin@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916045720.33636-1-bailu.lin@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 15, 2020 at 09:57:01PM -0700, Bailu Lin wrote:
> Add filesystems subdirectory into the table of Contents for zh_CN,
> all translations residing on it would be indexed conveniently.

Sorry, I don't understand the reference to "filesystems" here. Is this
a copy-paste of a different commit message, or am I just failing to read
it properly?

Will
