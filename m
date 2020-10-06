Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1B8C41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 07:34:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6807E20760
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 07:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgJFHeM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 03:34:12 -0400
Received: from mx.kolabnow.com ([95.128.36.40]:27108 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgJFHeM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 03:34:12 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id ABDEC1361;
        Tue,  6 Oct 2020 09:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1601969649; x=1603784050; bh=NxwsZ1Sln5Icp4Wm9fUHPCVeC11kwxddVFs
        IgcFL0ic=; b=1nbTJ0qoBFZaPhrgwHS+oYQWJzmg17bFED0Pbe+pAV37H0auVrv
        E9gSX925l1z4nav5rRVi9MgNvq9NzoMjHKu9T7bq8H68jCILi5YCNH4857zS+DSO
        mP13ZGOv8Kd+GkqiKfF+AIMm7SSManfVZv9sHGN+er6wvhcru+OEEucfb2Xvm5zs
        Y7fHlXPEWCqCXQIcK3cZi4WyBNedG4IuDL+Vd39prvhRPl1MwNREvHByiOqfNGj4
        JplbiQ2EgvJV3EbliB59irqEoWg87g8OmNQ00E8b2g9ROriSuN6INWOHlJ3HBGd3
        7WoqRtKAh1ZTqq+zeuCdBLHFhBG3Adlh7Pl7dhAVMrxWv/ti/zQw+jzjfS/sHh+h
        vSSbBEJExSVgHkA9LHAuGxkirjkDxR1oimcuoSBctZ5vQWEYEFuWaTh3xNgu+z5B
        I14BobiSwEqTY+IqUIBFIKPWqom1x2KwgtyCVqvWS++xxkwQuxe+afusMeiuhubn
        0kUXkpTJEohjs1q+De+CYyH9w4v37TAG97KGEv64aY6EtbYhfD/yLF8Fh3NMcuMY
        BQcE1dyQa5Zu3NF3YXWikGWx6W+fTeuSZDUHpOi4P5EjdRkay/3CJNGNlRnLtphC
        IYkngpYfydLF2CSvg76dtsqRzh/J5DbyD4xvN32oGdhjAdNTsr23Teb8=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jG-5hB4aOw-R; Tue,  6 Oct 2020 09:34:09 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id CAA47C84;
        Tue,  6 Oct 2020 09:34:07 +0200 (CEST)
Received: from int-subm003.mykolab.com (unknown [10.9.37.3])
        by int-mx003.mykolab.com (Postfix) with ESMTPS id 5DB40AEB;
        Tue,  6 Oct 2020 09:34:07 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 06 Oct 2020 09:34:05 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     =?UTF-8?Q?Ga=C3=ABtan_Harter?= <hartergaetan@gmail.com>,
        linux-doc@vger.kernel.org, harryxiyou@gmail.com
Subject: Re: [PATCH 1/1] docs: fix kernel-driver-statement rendering
In-Reply-To: <20201005093704.32dd98ec@lwn.net>
References: <20201005130213.74624-1-hartergaetan@gmail.com>
 <20201005130213.74624-2-hartergaetan@gmail.com>
 <20201005093704.32dd98ec@lwn.net>
Message-ID: <dd8ed7601ba53e74ec9ffef16cb35759@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Without implementing any hack, can't we put the full name? Or just 
remove "J." :)

On 2020-10-05 17:37, Jonathan Corbet wrote:
> On Mon,  5 Oct 2020 15:02:13 +0200
> Gaëtan Harter <hartergaetan@gmail.com> wrote:
> 
>> Remove the extra newline and indentation after `J. Bruce Fields` in 
>> the
>> rendered html, and extra indentation in the rendered pdf.
>> 
>> The `J.` sequence was interpreted by sphinx as a letter ordered list
>> starting at letter `J`.  It produced a sub ordered list as item of the
>> main item list.
>> 
>>     <li><ol class="first upperalpha" start="10">
>>     <li>Bruce Fields</li>
>>     </ol>
>>     </li>
>> 
>> The escaping is done before the name and not between the `J` and `.` 
>> to
>> keep the name writing intact.
>> 
>> Signed-off-by: Gaëtan Harter <hartergaetan@gmail.com>
>> ---
>>  Documentation/process/kernel-driver-statement.rst               | 2 
>> +-
>>  .../translations/it_IT/process/kernel-driver-statement.rst      | 2 
>> +-
>>  .../translations/zh_CN/process/kernel-driver-statement.rst      | 2 
>> +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/process/kernel-driver-statement.rst 
>> b/Documentation/process/kernel-driver-statement.rst
>> index a849790a68bc..3a89fec1882e 100644
>> --- a/Documentation/process/kernel-driver-statement.rst
>> +++ b/Documentation/process/kernel-driver-statement.rst
>> @@ -67,7 +67,7 @@ today, have in the past, or will in the future.
>>   - Pekka Enberg
>>   - Jan Engelhardt
>>   - Mark Fasheh
>> - - J. Bruce Fields
>> + - \ J. Bruce Fields
>>   - Larry Finger
> 
> Thanks for figuring this out and explaining it so well.  This is a sad
> ambiguity in the RST syntax, I guess.
> 
> In this case, though, I'm not convinced that the cure isn't worse than 
> the
> disease.  We've traded a blank line in the HTML output for some ugly
> markup in the original text; I'm not sure we want to do that.
> 
> For this particular file, perhaps the best solution is just to put the
> list of signatures into a literal block.  The fix for other occurrences
> may be different.
> 
> Thanks,
> 
> jon

-- 
Federico Vaga
http://www.federicovaga.it/
