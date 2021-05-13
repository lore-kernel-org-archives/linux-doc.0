Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD9EC433ED
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 22:06:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A683C6143C
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 22:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhEMWHf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 18:07:35 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:52704 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhEMWHf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 18:07:35 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 6981BE9B;
        Fri, 14 May 2021 00:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        in-reply-to:content-disposition:content-type:content-type
        :mime-version:references:message-id:subject:subject:from:from
        :date:date:received:received:received; s=dkim20160331; t=
        1620943582; x=1622757983; bh=uOVnuyTx76fjc++a6fCp7lDpTCoLRyILUYa
        bEozmYHc=; b=ibN3cezms0qmI6IhgdYkD7OBSdtFAYb40V4c2xyJG/CC8V1uMsF
        GGIms9+i8H83rgvS0QZdS1QLN+txaWi+mXbciHK2FCuUlMfft3/3CDdfdSqcuOE8
        2sphIKb+ISDwOS6xYiomd4rkV43BzyJZ8ASj/vpAt10pRZH1PTDlwSPlhUXiFFf8
        /LqKfhwgJg5MKbnpOm0b8e5EES1GdZd7vaxAYHuVFAWlU98ImOmxGn5iB4ssubUR
        4pdWU8ghtLg8QffdRuX5LXFpmoyJVxsUifgPA/DUx2YhNbT3WHNfe2Ph0E0g6sYU
        7rea3BhzvEnpcrgbendWjSpjMGzXuFqM1Q4SC/pxQE1KDEVRY5PYXFkgJKN/rOq8
        +kwZFDkJElKDz2IKpVQAqURpXnz6x9HVXFWg6dWR5Da4yNQmA96nOuy9GCYXgOCn
        3DXjKxNQLXg+Auqn9roTrjiDRUyVvBPj4To/HwyKMhShIXUmgwktD//Og68w4I8f
        E2Wy7OmFaV18oYp1lRBkDpgmxG69eib7a48FNtuuWxXPcOq1Yzq9lAJ5gVfnjg+5
        182tfCV9/JwNN4FrViqFts6x44Y8dnp5SYnMLNIOLR/rll69FRc1UP1MJObZs59m
        HqnwXJPLWIa8JA3UstAJVNilYLEogJuz2n27DU+MFdpzNlo8Ayyo4TG8=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ahmrRA5mUzWN; Fri, 14 May 2021 00:06:22 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id D4FEDE07;
        Fri, 14 May 2021 00:06:20 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id BFD7F11CF9;
        Fri, 14 May 2021 00:06:18 +0200 (CEST)
Date:   Fri, 14 May 2021 00:06:16 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Sanjeev Gupta <ghane0@gmail.com>, linux-doc@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] Documentation/translations/it_IT: switch some links
 to https
Message-ID: <20210513220615.5a2shg7y65umyqf4@numero86.vaga.pv.it>
References: <cce90d8d.ANEAAKAcMY8AAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgmMlr@mailjet.com>
 <20210512082434.timdb2sxntl6mktl@numero86.vaga.pv.it>
 <87h7j67j95.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87h7j67j95.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 13, 2021 at 09:20:38AM -0600, Jonathan Corbet wrote:
>Federico Vaga <federico.vaga@vaga.pv.it> writes:
>
>> On Mon, May 10, 2021 at 12:58:29PM +0800, Sanjeev Gupta wrote:
>>>Links have been checked to ensure that the old and new URL
>>>return the same page.  This is not true for many links.
>>>
>>>Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
>>
>> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
>
>I'm confused...why are you sending a signed-off-by here?  Did you mean
>acked-by?

I'm sorry, you are right

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

>
>Thanks,
>
>jon
