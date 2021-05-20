Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED88C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6455961186
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 06:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhETG4R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 02:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55303 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231236AbhETG4F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 May 2021 02:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621493684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9tEv83ZtFMHbXTaEtn+9i7YCHaEzdnQPBIaLpxqVr78=;
        b=H0dweLnGTy1G1OxNMxlFXvTjLb0IIbRYo5A6OIsElZHo+mrJJ/gMk3rka4QAdiGSdcaZ9Y
        SVBTIG1SYmsIkqkoYqaEPwHZtyS2EH1u2cwI74geChfx5GzNS3aHT0w/OTX5g/tl+kXDjj
        BbwVu7pYy1nbwBROOM+bP5oq20CuO8A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-pCgJtQknOiy3zFgDJ0-Sog-1; Thu, 20 May 2021 02:54:42 -0400
X-MC-Unique: pCgJtQknOiy3zFgDJ0-Sog-1
Received: by mail-ed1-f72.google.com with SMTP id cn20-20020a0564020cb4b029038d0b0e183fso9044677edb.22
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 23:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9tEv83ZtFMHbXTaEtn+9i7YCHaEzdnQPBIaLpxqVr78=;
        b=oWLuQ/r0Tdihcg7enthGz+iIQg3yRCwLksqCh55eVt+PBqGCL0chUndxTrbVHIYbwT
         lodpc6/oJ8C5GHRCkz5rUCEXQuEK82qoCDMZWIASqixfCwXeEpsbfo2URiBP+esOS3S1
         ATa3xkdPd4nB8C0JwyW0XCWZcmPoQAyrHzvj73OGU/ocbOnnw8OAudpJV0RRwIBHAk9L
         53M0ahy6KRWaaCemCTEmvUBN7a3qS1ZIIBtnxMhzym2+VRLEjqEPmdiLKn9/rDhctBBX
         3/+Lq9c6c13y1+EH/a9eIKZ4OcgpZCOtc6KQeF/bfzmdzjZY5j6qghQ9UKE09czvFfVY
         bUNA==
X-Gm-Message-State: AOAM530Xnh5ecYnSC9G7ikXrL02XM31AhJBrpJLn7y14ibZCT2rG595k
        4bUYgciD6wOuyCAHNNhHxIp9fvmUon8HXeI47HXvzqsOt5RVGkKfmk3bDC/dUggSxXbGn1gksTn
        xNw18Y7elKfZ/NFR9yU3Xms+sppBF39I32Bv1zmgUQ7PHYjF0qb/hOg/QBovIwfW2LPval78=
X-Received: by 2002:a17:906:fa93:: with SMTP id lt19mr3200260ejb.14.1621493681192;
        Wed, 19 May 2021 23:54:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf06tuHryELST2SZKhY8gB1gHwWH7k04TmUp1Y+F+oS5yedzBZh3TNtH22ORIqKZW/RO+wHQ==
X-Received: by 2002:a17:906:fa93:: with SMTP id lt19mr3200227ejb.14.1621493680938;
        Wed, 19 May 2021 23:54:40 -0700 (PDT)
Received: from x1.bristot.me (host-87-19-51-73.retail.telecomitalia.it. [87.19.51.73])
        by smtp.gmail.com with ESMTPSA id hz10sm909238ejc.40.2021.05.19.23.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 23:54:40 -0700 (PDT)
Subject: Re: [RFC PATCH 01/16] rv: Add Runtime Verification (RV) interface
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621414942.git.bristot@redhat.com>
 <ad69b06e9e3a5ec9ad2a49d290b719a96dcc471e.1621414942.git.bristot@redhat.com>
 <90c917eb-f0a8-3ef5-b63d-d88c1f6919a1@infradead.org>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <f834d8e7-1027-9573-63ff-eedc49884b78@redhat.com>
Date:   Thu, 20 May 2021 08:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <90c917eb-f0a8-3ef5-b63d-d88c1f6919a1@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/19/21 8:10 PM, Randy Dunlap wrote:
> On 5/19/21 4:36 AM, Daniel Bristot de Oliveira wrote:
>> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
>> new file mode 100644
>> index 000000000000..e8e65cfc7959
>> --- /dev/null
>> +++ b/kernel/trace/rv/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +menuconfig RV
>> +	bool "Runtime Verification"
>> +	depends on TRACING
>> +	default y if DEBUG_KERNEL
> 
> No need for default y. There are other reasons to use DEBUG_KERNEL
> without wanting RV turned on.

yes, you are right, I will remove it.

>> +	help
>> +	  Enable the kernel runtime verification infrastructure. RV is a
>> +	  lightweight (yet rigorous) method that complements classical
>> +	  exhaustive verification techniques (such as model checking and
>> +	  theorem proving). RV works by analyzing the trace of the system's
>> +	  actual execution, comparing it against a formal specification of
>> +	  the system behavior.
> 
> And in the cover/patch 00:
> tlrd:
> should be
> tl;dr:
> or at least
> tldr:
> :)

Ack!

Thanks!
-- Daniel

