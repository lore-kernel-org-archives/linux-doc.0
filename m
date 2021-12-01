Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EAEC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Dec 2021 08:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241936AbhLAIYe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Dec 2021 03:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhLAIY3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Dec 2021 03:24:29 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AECCC061574
        for <linux-doc@vger.kernel.org>; Wed,  1 Dec 2021 00:21:09 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id 14so29537928ioe.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Dec 2021 00:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bgLbO61BktE09GlS42/l0ELsuSMwErAiZQRoo5i2L0=;
        b=IWYqJuhUfiE1Eg9clKkD/XbFccklo/xOlYIOV4sjd4xGCzjEo74M6seKHvyTp4EmtW
         wqEmNqqS3zsrVJVKr3OifAFUIhFgppV4a3xb020JfQgZKp2QzYaX8+kZL1ceDfbLB9i5
         Eb85/rZpIHVZgiYeDdFcIykfHR/LwoOuer4yO/uLzteYpV1oO4pmEZdPhR6yHWyeWh8S
         8vHPN8nc3RZcgfBCMw4GAo5+jChig5a/Hxj6DkbGY8cZqlwxfpNw/h++3DzdR1h4zgrl
         GLS8jSxfT7DaoMLSexjzixvX8l6W7ODSYM48FReJw984RFyXcoQrNcCUuEg+dnmv1T/9
         Q/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bgLbO61BktE09GlS42/l0ELsuSMwErAiZQRoo5i2L0=;
        b=z1Vn8jHL7Xzhsps5cK6p54397eaU1T32NlzrnEMCc8pebtxoy/de9B1itSHlHFqhWO
         BSvGJ6QlB2fWAn1KDRYGoy5z29HPZLn9Qgw8TUrVA9hSEewq/By5x79Et3gR4UYxgz9i
         Iz6xOsp6OgEhtZb79bR88kuHSfORJqJ+3DkotNuKqSbdwTLKy2iRjK9X8DeVdUD4PpdR
         r2Tbu+9NccuH9S35rTwx/4/phBeShc3NDwo16mlOKHxPpKABovTpkRjpcjZPjKu3CS/d
         8757xj41qiO6dEnwGL08RJ4dohuIDUhMOhq2W5qoWQ8mKYZAUR0GemSu3IiymFf+YVOo
         GSog==
X-Gm-Message-State: AOAM533gdon1rRubi+3oujyY/V5ntjH+d+gT4zJ5rmpXUVfXCOdeSqdC
        chwWcT+GMpfMxWcaYIxBFD9S/Nf8qJ0x+FTV3fvDn18UtnE=
X-Google-Smtp-Source: ABdhPJyUPUY8OvcvlP0noNT2kW1XQiFg0r9NsXBBBbidow09IUA1J4VMEOla4ozAY1gtCcmXcpy1a1UkdHMPrHGnNjc=
X-Received: by 2002:a05:6638:2402:: with SMTP id z2mr7723441jat.122.1638346868605;
 Wed, 01 Dec 2021 00:21:08 -0800 (PST)
MIME-Version: 1.0
References: <1c883061-e538-757e-d3fe-df8f6d201e1e@huawei.com>
In-Reply-To: <1c883061-e538-757e-d3fe-df8f6d201e1e@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 1 Dec 2021 16:20:32 +0800
Message-ID: <CAJy-AmkLXPw_0EUO_oPXGoD2DqTJZqLJ62Z6Gb6k68Cmy-WgSg@mail.gmail.com>
Subject: Re: [DISCUSSION] Want to participate in Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

hi Tang,

Very glad to see your contribution in kernel document translation!
Just go ahead and feel free for any decision/review in the mailing list.

Enjoy! :)
Alex

On Tue, Nov 30, 2021 at 3:11 PM Tang Yizhou <tangyizhou@huawei.com> wrote:
>
> Hi, I'm glad to see you are contributing to the Chinese translations of the documents.
>
> I have translated scheduler/sched-capacity for a in-company technical talking and I want to contribute it to the community. I'll send the patch soon.
>
> Also, I will take part in the reviewing for the subjects I'm interested in, such as scheduling and CPU power management.
>
> Thanks,
> Tang
