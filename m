Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B949D7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Jul 2019 14:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387822AbfGYOi7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Jul 2019 10:38:59 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46566 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfGYOi5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Jul 2019 10:38:57 -0400
Received: by mail-pf1-f194.google.com with SMTP id c73so22861569pfb.13
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2019 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dM0tavbTao+XHLEjp4zxGd1Wc/gjo0u4n5AfPPLxYxY=;
        b=qW9lqXmWOxkhdiOYGKrIWBHJs6675m6ojicr27ola+XCc/laXgrTsFw66srMTfptKM
         E79JHYUrgD0swB3l5aRCQD23i2Yw2BoCoSowYMi0YrTZ439hPJPdYEpr+IPidFY7bJ6w
         pYFJoxehPvvEcBRzxjNtLlvrWBiePB0+ymsj/T7HaZBy/uLx765/XOGY8lMSK+q1l0vj
         2Tg3XPrMqO++R7wch3UgVTEumv9q1vy/A7yceOCUX3sSgckKX3VdA/enhcH4mOqaTvj5
         3sHr+pvZlJx5Ev1BtEhINmnp3Q8GES5JIb0iUg15mcxR6OZc0CGwqWYCVo6sw3ar6rfF
         lCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dM0tavbTao+XHLEjp4zxGd1Wc/gjo0u4n5AfPPLxYxY=;
        b=snUoFsPSQndqvg6XjgOnP6DdxDVimT00ob5usF2LLf1npr8NwkrErklhPZUsWpndlX
         svJ2iuBUS7AvDH3buuZ23K9wrTVXh+ArDeET+NwSg2luteu68ZTkSgFZ9EwX9f4tzJjH
         ZDY5tlW8hsgTsfvqysRuglOT63xDQU1qaUpUkergZ/UeSvwofzcTZuN7HieOOvISa7zl
         g9dUIWgEEGEmQ7NhADIc3KveEedqItVUS5DMSTyiwbcu0KQztEPy1Ke10pITPTt1ddaN
         IWYoK66EACvfBSnuvuWputThLGqihhvvuht3+pmzRVnAXVeGzQL/abBuUqs/wNDb/9Qd
         LFfQ==
X-Gm-Message-State: APjAAAVIBoxWGsmnxqPk7Q5iH/Q4l44gMSRXP8ZE3eRGk/o41MPuFco6
        c4Q0TpfUvLNIs4n1yMEmRP7tcp78
X-Google-Smtp-Source: APXvYqxbW1kdSdI2g5El3DdDVDtndVrRVVH5xAYU7zqmtvAOT6CVSwyux9F/5Aztl1fxRRkV7d9XhQ==
X-Received: by 2002:a63:c44c:: with SMTP id m12mr48061734pgg.396.1564065536100;
        Thu, 25 Jul 2019 07:38:56 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.googlemail.com with ESMTPSA id z4sm39432142pgp.80.2019.07.25.07.38.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 07:38:55 -0700 (PDT)
Subject: Re: [PATCH v10 5/5] overlayfs: override_creds=off option bypass
 creator_cred
To:     Amir Goldstein <amir73il@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-team@android.com, Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        overlayfs <linux-unionfs@vger.kernel.org>,
        linux-doc@vger.kernel.org
References: <20190724195719.218307-1-salyzyn@android.com>
 <20190724195719.218307-6-salyzyn@android.com>
 <CAOQ4uxim8zZN5YHZs2OJz5A=3B0U10wyf371yadpe2B7hA8pZw@mail.gmail.com>
From:   Mark Salyzyn <salyzyn@android.com>
Message-ID: <9acceab1-86af-758a-ec00-8f6d33f3da87@android.com>
Date:   Thu, 25 Jul 2019 07:38:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxim8zZN5YHZs2OJz5A=3B0U10wyf371yadpe2B7hA8pZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/24/19 11:14 PM, Amir Goldstein wrote:
>> +void ovl_revert_creds(const struct cred *old_cred)
>> +{
>> +       if (old_cred)
>> +               revert_creds(old_cred);
>> +}
>> +
> Mark,
>
> Not sure if you have seen my "shutdown" patches:
> https://lore.kernel.org/linux-fsdevel/20190715133839.9878-4-amir73il@gmail.com/

Good to know!

>
> I am fine with this patch, but would like to request that you add @sb arg
> to the ovl_revert_creds() helper, so it is more useful for other things in the
> future that scope the underlying layers access (like shutdown).

Will respin and retest.

-- Mark

