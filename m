Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB4E97D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 08:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbeIJNCM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 09:02:12 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:52202 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbeIJNCM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 09:02:12 -0400
Received: by mail-wm0-f67.google.com with SMTP id y2-v6so20504226wma.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q07PyOKIk8CQfsWY5q6zv9cHBwK4Th+z1ytvJK8mbpc=;
        b=ImVsISrK4jf3r+H9eNttGAQodbS9ZadOBeHbMCGE+tZP9P43kAw11i4mByPiS0xaw3
         90e+p42BKtlZFfzh1dzIIRod4CIQ6WMuksudj3rz1QXxjHUtwraI60q6tw1+O3FbO2X7
         cD2TsjuZiYUEdcjFE7Q2ZbKUT0baz4UY2Imt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q07PyOKIk8CQfsWY5q6zv9cHBwK4Th+z1ytvJK8mbpc=;
        b=g756bYOyytO/dmfRzP2HJWYdVuyI4c5TjaMKHcNOtBIBL3y2YKgdg8Csa4MjOvIn6q
         qTWEdojl5uY8S5H/76lqw+xf7t687PmzOEzUHT+4v5F/hTyTo3XUFEdAdVOSVhdBDtW2
         Jhl5HVaBdvlGgRSyvpo699hjs2h6gCLO+4QWU7Cc/K66GjfBlhEASDjCQO4RmWNyQMj6
         yFSCxHSPaASWKmRPbA5LeqnvgWXqF/LRYuI5B9+8opGwpZYBmfXhpZtyYblSgOPinktO
         8grq3942/dAkzH9ciBE2aeI/UXxLcS/LLOHdj/lc+8f/Z572L/Kjbid2IuARzYAhxP/w
         pKlg==
X-Gm-Message-State: APzg51D56h71SGYrCgsQCaAvgDDP7i83mrhxQN3iIPY2MgJ2XpL539cE
        XF1hgtKQTCgQbg+rP9wXPYbbeA==
X-Google-Smtp-Source: ANB0Vdaq3//OT89+xbB0cZbdNdD2H3iuo9wQ2hryyd53FnNsa4NOpX3EW0JtBcukkh4AAV9q9P+z1w==
X-Received: by 2002:a1c:9ac9:: with SMTP id c192-v6mr11779934wme.47.1536566962800;
        Mon, 10 Sep 2018 01:09:22 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id o3-v6sm18678891wrn.58.2018.09.10.01.09.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Sep 2018 01:09:22 -0700 (PDT)
Subject: Re: [PATCH v2 01/16] nvmem: remove unused APIs
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180907100750.14564-1-brgl@bgdev.pl>
 <20180907100750.14564-2-brgl@bgdev.pl>
 <c0b0c411-65f6-62f9-6d6d-2884e5a17250@linaro.org>
 <CAMRc=MfO01EQAfY4Uu3UwzzvhVOMF7_BpCOPVz2yVXqDgpb0AA@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7e138142-8161-3646-4daf-619995baf395@linaro.org>
Date:   Mon, 10 Sep 2018 09:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=MfO01EQAfY4Uu3UwzzvhVOMF7_BpCOPVz2yVXqDgpb0AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10/09/18 08:58, Bartosz Golaszewski wrote:
> 2018-09-10 9:32 GMT+02:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
>>
>>
>> On 07/09/18 11:07, Bartosz Golaszewski wrote:
>>>
>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> Remove all APIs dealing with nvmem_cell_info. There are no users and
>>> this part of the subsystem will be reworked.
>>>
>>> This patch temprarily disables support for non-DT users.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>> ---
>>>    drivers/nvmem/core.c           | 212 ++-------------------------------
>>>    include/linux/nvmem-consumer.h |  26 ----
>>>    include/linux/nvmem-provider.h |  13 --
>>>    3 files changed, 12 insertions(+), 239 deletions(-)
>>
>>
>> This looks totally un-necessary, Other patches in this series adds them
>> back.. Consider updating these in those respective patches.!
>>
> 
> While this may not be entirely necessary, it's very useful. There's
Yes, thats exactly what am saying if it not necessary please do not do it.

> almost nothing common between this API and the new one added later in
There is more than 60%-70% of the code reused in new patches, which is 
unnecessary churn to me!

> this series. Later patches are MUCH cleaner thanks to this removal and
> I believe it makes them easier for review.
Am not sure about that, it definitely did not help me!

--srini
> 
> Best regards,
> Bart
> 
