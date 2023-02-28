Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D750C64EC7
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 22:13:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjB1WNj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 17:13:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjB1WNi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 17:13:38 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970C612869;
        Tue, 28 Feb 2023 14:13:37 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 091D549B;
        Tue, 28 Feb 2023 22:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 091D549B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1677622417; bh=F1mnOVYGyKe00jPt16PkikjTGm9r2Hcgq7VT9LY82ko=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kGnOQwCTXvgV1hbb+cvcK4q0tWouXcbWyPt8GCuAB0GBVWhl/13zHxL3eIBkkLBOR
         qRAgFg/vFt/5mFD3h+L9hdpNbhSXjKhHpKFWZ/eklT3ljE2bmTyDqFkiXZVzlWOMRs
         B1CLgLBVqinhPJX4YMKA6v7WT+KJAVABPRIsq0ZvnO2TmSuFhBfunIkfE9ITEewjkf
         VN5ofasJ+W46x9AMgls3MEocvbw2Yj5eVQK2gKG+pMTw2kSw3n7bMSQtq/C4Fu0MfP
         3PWrvViMDwmiP05PkebxFJUwZOZmo87bRtcWm+cMJNijMeWTlZEjgczXTP0tDt3jUO
         4WRJu6gmPweUg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Palmer Dabbelt <palmer@rivosinc.com>, suagrfillet@gmail.com
Cc:     alexs@kernel.org, siyanteng@loongson.cn, robh@kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        leyfoon.tan@starfivetech.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        suagrfillet@gmail.com
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
In-Reply-To: <mhng-90a89c61-02e7-4f1a-b18d-189d9b7fff72@palmer-ri-x1c9a>
References: <mhng-90a89c61-02e7-4f1a-b18d-189d9b7fff72@palmer-ri-x1c9a>
Date:   Tue, 28 Feb 2023 15:13:36 -0700
Message-ID: <87wn41wi9b.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Palmer Dabbelt <palmer@rivosinc.com> writes:

> Happy to take this through the RISC-V tree, but I'll hold off for a bit 
> and let the doc folks have a chance to chime in (or just pick it up).  
> I'm planning on sending something later this week either way.

"Doc folks" are fine if you just include this one in the pull you're
doing.

Thanks,

jon
