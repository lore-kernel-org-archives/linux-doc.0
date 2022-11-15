Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A3DC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 15 Nov 2022 13:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238535AbiKONw4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238581AbiKONwe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Nov 2022 08:52:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9672B196;
        Tue, 15 Nov 2022 05:51:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF1C3617A5;
        Tue, 15 Nov 2022 13:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E19C433D6;
        Tue, 15 Nov 2022 13:51:48 +0000 (UTC)
Date:   Tue, 15 Nov 2022 13:51:44 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        will@kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Morse <james.morse@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH V2 1/2] arm64: Add Cortex-715 CPU part definition
Message-ID: <Y3OZcJCsTlDAvY+d@arm.com>
References: <20221113012645.190301-1-anshuman.khandual@arm.com>
 <20221113012645.190301-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113012645.190301-2-anshuman.khandual@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Nov 13, 2022 at 06:56:44AM +0530, Anshuman Khandual wrote:
> Add the CPU Partnumbers for the new Arm designs.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
