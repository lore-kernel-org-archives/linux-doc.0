Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD7617D085
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 14:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752096AbeFAOMx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 10:12:53 -0400
Received: from ms.lwn.net ([45.79.88.28]:35318 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751741AbeFAOMv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Jun 2018 10:12:51 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5DAA92E3;
        Fri,  1 Jun 2018 14:12:50 +0000 (UTC)
Date:   Fri, 1 Jun 2018 08:12:48 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/amdgpu: Add documentation for PRIME related
 code
Message-ID: <20180601081248.7b65edb2@lwn.net>
In-Reply-To: <b458561f-b4e5-58bb-eee0-e3451312ae41@daenzer.net>
References: <20180531161708.5894-1-michel@daenzer.net>
        <20180531161708.5894-3-michel@daenzer.net>
        <CADnq5_O5-m_=xqszq41eOAVaLTytHUHmtDaSc1MeEorZML6T5g@mail.gmail.com>
        <b458561f-b4e5-58bb-eee0-e3451312ae41@daenzer.net>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 1 Jun 2018 15:40:44 +0200
Michel Dänzer <michel@daenzer.net> wrote:

> Thanks. Is it okay to merge all of these via the amdgpu tree, or should
> I wait for an ack from Jon and/or core DRM maintainers for that?

I've been assuming they would go through a DRM tree, no need to wait for
me.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
