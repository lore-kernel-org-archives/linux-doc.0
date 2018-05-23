Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 035987D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 14:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933337AbeEWO0P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 10:26:15 -0400
Received: from mail-oi0-f67.google.com ([209.85.218.67]:46668 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933114AbeEWO0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 10:26:12 -0400
Received: by mail-oi0-f67.google.com with SMTP id y15-v6so19631301oia.13;
        Wed, 23 May 2018 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=42OJcamRyf2Zrvk6FHK0+d1xP/sqTR+lpdUePJOdscA=;
        b=lSh+pzCXDL7Cb+h6LWHAFJ/9jFrI0tL9hhWKHfZww6hJkByxIhqbLCUoZF4iOvrQOW
         2OUvBhIbIhfw3ziFMVucMeQH8HBKAZ3WiKZozpmRQ/46nwei1v5SC1inZqmQbcvEPQe1
         SRRTQ0KLtV6J9/Mz5Csb9GOzqMJA67O+0scz5BY2qQajYCtqR3gpbx+PTVsZa+8h2xku
         8yHJ54HSTMAe/TpszWgC3g7kfPb9/23wJdrB1yAo4f214PJhGfYfJKjDbRoKXejqqisc
         Ld9Czc3C2rq0nCeHm1ykUJK/bjTR/v/TT0zdzemurJIyQilajrHxyr5n2zsSF6bmHnvV
         +5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=42OJcamRyf2Zrvk6FHK0+d1xP/sqTR+lpdUePJOdscA=;
        b=Qt5kliU/HDoxlPJI5QQcZ5T3CVK9E/8nMYkBpDC7fn1EsjoO6xOCK+ll4HKnqX+pbb
         4etoXeETBJYqnBCjMarQOpNNRobrYJ7HBMt20zeAlZwY0R0+6tmMaYMNU0LIFD2Zf/Q9
         gHEmu1RWC9qDscc9Cv/23Ji+wJV5NU1kDDnVR39p3U1jKtYDju0zLbrwnJy6TFTRr672
         S/Kv5nNsQNcEoZrJes2W0g4xudD3LMt3LXXMfNTZo+L2z3Al9Izua9eWDDYraXWYdMTo
         eOr/9HtnNkfVLISvEe5Ucp3sGsHH0CpRyycik7jkbeVlEafW1MoBrsNsyQ1DZ9MGSzOG
         NHeA==
X-Gm-Message-State: ALKqPwdiSm0XD+n/4+fbIMSxW2APDpCRWLnuF7Irw7XjDq+52osQl+1M
        Bk4P2SZOCz2c2p9TL5fa1pc=
X-Google-Smtp-Source: AB8JxZoyn0CbQk8FHtVtK7c/FG05hHBEkZAOwh8Sf8jsf37Zt6g4q1bujBT+Vz0YILk2YSBqMe8yuQ==
X-Received: by 2002:aca:af4e:: with SMTP id y75-v6mr1534042oie.223.1527085570790;
        Wed, 23 May 2018 07:26:10 -0700 (PDT)
Received: from nuclearis2_1.gtech (c-98-201-114-184.hsd1.tx.comcast.net. [98.201.114.184])
        by smtp.gmail.com with ESMTPSA id s9-v6sm10207559otb.41.2018.05.23.07.26.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 May 2018 07:26:10 -0700 (PDT)
Subject: Re: [PATCH 1/5] PCI/AER: Define and allocate aer_stats structure for
 AER capable devices
To:     Jes Sorensen <jsorensen@fb.com>, Rajat Jain <rajatja@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle McMartin <jkkm@fb.com>
Cc:     rajatxjain@gmail.com
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-2-rajatja@google.com>
 <62fae8eb-aaed-65b2-19ad-7c57b3a9bfdc@fb.com>
From:   "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <53789ac0-b571-5d6a-5925-7e83925b5b31@gmail.com>
Date:   Wed, 23 May 2018 09:26:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <62fae8eb-aaed-65b2-19ad-7c57b3a9bfdc@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/23/2018 09:20 AM, Jes Sorensen wrote:
> On 05/22/2018 06:28 PM, Rajat Jain wrote:
>> new file mode 100644
>> index 000000000000..b9f251992209
>> --- /dev/null
>> +++ b/drivers/pci/pcie/aer/aerdrv_stats.c
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: GPL-2.0
> 
> Fix the formatting please - that gross // gibberish doesn't belong there.

Deep breath in. Deep breath out.

git grep SPDX

Although I don't like it, this format is already too common.

Cheers,
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
