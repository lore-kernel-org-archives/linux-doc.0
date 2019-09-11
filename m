Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2C647D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Sep 2019 22:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfIKW1S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Sep 2019 18:27:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33554 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfIKW1S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Sep 2019 18:27:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id A479628D55C
Subject: Re: [PATCH 1/3] docs: block: null_blk: enhance document style
To:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, m@bjorling.me, kernel@collabora.com,
        krisman@collabora.com
References: <20190911144636.226945-1-andrealmeid@collabora.com>
 <2252d8d6-17e6-402b-9136-dc85e3cccbdd@kernel.dk>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <a18e5911-77f4-4721-0c6e-ed410e411eb5@collabora.com>
Date:   Wed, 11 Sep 2019 19:26:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <2252d8d6-17e6-402b-9136-dc85e3cccbdd@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/11/19 7:05 PM, Jens Axboe wrote:
> On 9/11/19 8:46 AM, André Almeida wrote:
>> Use proper ReST syntax for chapters. Add more information to enhance
>> standardization in the file and to make the rendering more homogeneous.
>> Add a SPDX identifier. Mark single-queue mode as deprecated.
> 
> Please use a cover letter for sending block patches if there's more
> than one in the series.
>

Thanks for the feedback, I'll do it for next series.

> I applied these, though rewrote the commit message for patch #3.
> 
