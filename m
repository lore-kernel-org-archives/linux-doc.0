Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C06C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 14:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237690AbiC2OCi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 10:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237686AbiC2OCh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 10:02:37 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816B7257
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 07:00:54 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C3A64537;
        Tue, 29 Mar 2022 14:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C3A64537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1648562453; bh=8os4ebVcjE6IeWWOLoxkjNeVF7hNVlOGN+kiHEabqIc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jYuqQ7fiHcM9tEfZ84hdbydR3oj16opPWi5PKaGEgoLaSx4zKs9rsljNLVLxumlfM
         4bBUorLaOHeCvv9mMfN2Nj5pCRmGEW+tXdM1Fubr2gn8gWIgZr9cNg1IrV0kH7arR0
         jIU/hqOKgYJpN8MI3e7Kd3T/EvwWS2XBShMHhOLRhjci3Z2S//stpkcH/vFahVLYWQ
         HV0ldj5nMQ58l9TuLaA+UyuhwrsgIuPEENyziWZKjmy2W5Whbwa47z9eoKe6/3r3Mk
         Nb2k/JdBEu+zhQGDpWD7nRCEhl+viZvgabM4OrDhzAaoEQrDnTL7u46Wkma4KXfx7K
         g7B37PgKw+Ngg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Akira Yokosawa <akiyks@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
In-Reply-To: <02a00556-d885-7532-64ad-14027a4b5e33@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <02a00556-d885-7532-64ad-14027a4b5e33@gmail.com>
Date:   Tue, 29 Mar 2022 08:00:53 -0600
Message-ID: <87ee2k7t9m.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> On 29/03/22 13.07, Akira Yokosawa wrote:
>> diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
>> index 9a35f50798a6..2c573541ab71 100644
>> --- a/Documentation/sphinx/requirements.txt
>> +++ b/Documentation/sphinx/requirements.txt
>> @@ -1,2 +1,4 @@
>> +# jinja2>=3.1 is not compatible with Sphinx<4.0
>> +jinja2<3.1
>>   sphinx_rtd_theme
>>   Sphinx==2.4.4
>> 
>
> I see that we had already pinned the exact Sphinx version to 2.4.4 (or am
> I read the requirements wrong?), so this only matters when people use Sphinx
> from distribution packages, rather than using virtualenv as recommended.

We have been suggesting 2.4.4 simply because it's much faster than the
later releases, but it's not a requirement.

Thanks,

jon
