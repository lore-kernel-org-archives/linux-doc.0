Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B358C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 18:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50CFB613DF
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 18:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbhDTS7M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 14:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbhDTS7L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 14:59:11 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3359C06174A;
        Tue, 20 Apr 2021 11:58:39 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0e5200ad6c103155f7ad28.dip0.t-ipconnect.de [IPv6:2003:ec:2f0e:5200:ad6c:1031:55f7:ad28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9897B1EC0322;
        Tue, 20 Apr 2021 20:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1618945117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=eITA0Gyu+0MY4Tcql3Xys6zbYoe0FiwXlEaeC94pd0E=;
        b=q3TEz+tJ5nVL0PJ7LXhwVWdJOLVHH0xVK6YdjNdOaEwFw0yaZGPi5T8EwIE+4CAXJ4BOcd
        pKGkyl+edENBA/GMu+yTJswrhLy9+J7bKyZiU1A6ifvGNm/PJP+4CJKi7/N6YkpYHszRKX
        zuUWJ+lkwJ9Y1bsJczvUHgdaTxFsS2k=
Date:   Tue, 20 Apr 2021 20:58:40 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Steven Zhou <lullaby2005@gmail.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, x86@kernel.org,
        hpa@zytor.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Liang Zhou <zhoul110@chinatelecom.cn>
Subject: Re: [PATCH] docs: fix the invalid vt-d spec location
Message-ID: <20210420185840.GJ5029@zn.tnic>
References: <1618763386-29562-1-git-send-email-zhoul110@chinatelecom.cn>
 <20210418165953.GA1206@zn.tnic>
 <CAEtkB+7CsTJYHNTEYotrJ4qEXSBTU4S8OJ+0zc5F0cMy1sk51w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEtkB+7CsTJYHNTEYotrJ4qEXSBTU4S8OJ+0zc5F0cMy1sk51w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 04:05:12PM +0800, Steven Zhou wrote:
> Do you have any other suggestion about the link location please ?

Yeah, I'm working on it. We need to come up with a proper solution for
all those docs but it'll take time...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
