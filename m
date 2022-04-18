Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F68C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 18 Apr 2022 13:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238749AbiDRN7V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Apr 2022 09:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244620AbiDRN4x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Apr 2022 09:56:53 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4922A70A
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 06:05:20 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id z6-20020a17090a398600b001cb9fca3210so14023142pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rRMg0uEwq5ly8AwZgC4iNLsUPeUJ5pBxYhXyUTZFOC0=;
        b=KsfLh4xDa+ryiHQhngzBdgklClrHXxmla6iZwYPcg+IegcTbX6nYz3V+zVJS56e781
         ieIEQhI1vYRVOdD0MsNwNHaSbV9rj/kpAL+snAT0zx6XnzSI1c2f/KanlGWbpzDpYgLB
         Kh0kPbBy8Mc9ZrWAKTAtA2eni55sfXS6oexgOVRIR44gB/n4k08ebw5DI1ReO9IFbltt
         aBNcOvrkZMCP/ByvNhVBKYy/ueqCGGc7e5XIdE9oes1pItHjB2TesprZ/dzc5ZvKpoLv
         1Rq8xC7ReprKWQ5SmLq+AZ7ebsC+LhCeGLjHl/Je4zrWS7PP8rBXBCeZKWM8Zud9s+jT
         CGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rRMg0uEwq5ly8AwZgC4iNLsUPeUJ5pBxYhXyUTZFOC0=;
        b=qbmsZHDwtlzxZV+8ujnwu0tlnAkwPIdclLfYHvvxXt4/xOZyaEEusq6Ourtf5mmpjs
         PYsK1xI3jUPcx6d7cEW5X89P3K5sc6EWgMxhlO5YIE3Zc5cULpVGsnXw9aKysAOrjg63
         YRQQMkETVWwlGmR3dw+b3x+iGJ4m9GmDODvMhDGn+DQwTXPeHnBkow2d55XSqdv61Xa9
         gr5bSiRK45QlSXB/55AHgHd+Aba/UtQ2bP1WmGGoBEUkhOMrHvAB8bvULsf0Vjxkx6VB
         acNfZ4oCYsD8aNVSaN1h7uoCvbHIw48jDJnydHYAm6OkUfoh9ytnYjlBp1l/sj9jey+6
         igtg==
X-Gm-Message-State: AOAM531TPBoewMxcC2VD7lsCHTPnk5coBWGmqeyhpO58OdYgL7sb+t8l
        keriCcCEP+0BrX46+IU5jgw=
X-Google-Smtp-Source: ABdhPJyJxvZT5nmkZJJ2iAN9pL0xIOZbBP+tMfWSmvYX6kA5Z8+vAmD0sak3Jph4MQ7zrPMXtu9HAg==
X-Received: by 2002:a17:902:768a:b0:159:71e:971e with SMTP id m10-20020a170902768a00b00159071e971emr2110070pll.163.1650287120289;
        Mon, 18 Apr 2022 06:05:20 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-27.three.co.id. [180.214.232.27])
        by smtp.gmail.com with ESMTPSA id a67-20020a621a46000000b005060c73ef43sm12410983pfa.195.2022.04.18.06.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 06:05:19 -0700 (PDT)
Message-ID: <27af39d6-8982-6c87-c488-d5052b9fd03a@gmail.com>
Date:   Mon, 18 Apr 2022 20:05:15 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: docs: IDE removal?
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <16ed554f-0f25-e914-5cb9-dce53d027f1e@infradead.org>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <16ed554f-0f25-e914-5cb9-dce53d027f1e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/18/22 07:06, Randy Dunlap wrote:
> Hi,
> 
> Would someone suggest how much of
> Documentation/ide/ can be removed, given:
> 
> commit b7fb14d3ac63
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Wed Jun 16 15:46:58 2021 +0200
> 
>     ide: remove the legacy ide driver
> 
> 
> 
> ChangeLog.ide-cd.1994-2004
> ChangeLog.ide-floppy.1996-2002
> ChangeLog.ide-tape.1995-2002
> changelogs.rst
> ide.rst
> ide-tape.rst
> index.rst

I'm not the subject-matter expert for this case, but I agree to
remove/nuke Documentation/ide/ at its entirety.

-- 
An old man doll... just what I always wanted! - Clara
