Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FB6C77B72
	for <linux-doc@archiver.kernel.org>; Thu, 20 Apr 2023 16:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjDTQHu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Apr 2023 12:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjDTQHt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Apr 2023 12:07:49 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3882D1A6;
        Thu, 20 Apr 2023 09:07:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B88A32AE;
        Thu, 20 Apr 2023 16:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B88A32AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1682006868; bh=RmhSgmfwbLsDlw+PV+8aziv/ELTqn0omTb/nks3j6vk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Wgp4lVDFhIS81hjPlkFruN9Tp6I6JYtvH+JVH8SG9bIIZy6wFiGNDasgtIfhoVw41
         mLEGuBOcBD+Wbt9dbiF5cGKOKATVDUV93rFal/QK+5eBPq26exOwdqdsvevwrDeDuY
         TjyAvqJMzLSzgmU4lEvyYxec/g3hS60j8V4m8wkOBAdtQ5QjIe+Z8jEd9gFEHrHEie
         JJjd2dW0XDU0xopTS5VyKlm7t1vV1kmgChABg7HQ+axIa9w8PJkW5RUtXyczqaNXqU
         L5Q3n+Br++3LaghdZ1jwE5/FXCSmiFEtXDNMkFlHg5xpfk/CN2WLqn2gQxPojzK8Ok
         o2ZGN0DV9nogg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexey Dobriyan <adobriyan@gmail.com>, akpm@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v3] ELF: document some de-facto PT_* ABI quirks
In-Reply-To: <88d3f1bb-f4e0-4c40-9304-3843513a1262@p183>
References: <2acb586c-08a9-42d9-a41e-7986cc1383ea@p183>
 <e262ea00-a027-9073-812e-7e034d75e718@infradead.org>
 <c4233c97-306c-4db8-9667-34fc31ec4aed@p183> <87edp7jyu4.fsf@meer.lwn.net>
 <88d3f1bb-f4e0-4c40-9304-3843513a1262@p183>
Date:   Thu, 20 Apr 2023 10:07:48 -0600
Message-ID: <87fs8utu3v.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexey Dobriyan <adobriyan@gmail.com> writes:

> Turns out rules about PT_INTERP, PT_GNU_STACK and PT_GNU_PROPERTY
> program headers are slightly different.
>
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>
> 	v3: move to Documentation/userspace-api/
> 	v2: integrate into documentation build system
>
>  Documentation/userspace-api/ELF.rst   |   34 ++++++++++++++++++++++++++++++++++
>  Documentation/userspace-api/index.rst |    1 +
>  2 files changed, 35 insertions(+)

Applied, thanks.

jon
