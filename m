Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3972AEB64D0
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 17:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjFMRNH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 13:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237109AbjFMRNG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 13:13:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D9610FE;
        Tue, 13 Jun 2023 10:13:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C893F638AF;
        Tue, 13 Jun 2023 17:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC41C433F0;
        Tue, 13 Jun 2023 17:13:02 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
Cc:     Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64: add kdump.rst into index.rst
Date:   Tue, 13 Jun 2023 18:13:00 +0100
Message-Id: <168667637705.1243746.16301904509352996990.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611230358.13635-1-bhe@redhat.com>
References: <20230611230358.13635-1-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 12 Jun 2023 07:03:58 +0800, Baoquan He wrote:
> Document kdump.rst was added into Documentation/arm64/, but not listed
> in Documentation/arm64/index.rst. That triggers below warning when
> executing "make htmldoc":
> 
> >> Documentation/arm64/kdump.rst: WARNING: document isn't included in any toctree
> 
> Fix it now.
> 
> [...]

Applied to arm64 (for-next/kdump), thanks!

[1/1] arm64: add kdump.rst into index.rst
      https://git.kernel.org/arm64/c/389ce21b622b

-- 
Catalin

