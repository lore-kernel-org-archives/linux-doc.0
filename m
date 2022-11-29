Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62C0C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Nov 2022 08:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiK2I1t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Nov 2022 03:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiK2I1g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Nov 2022 03:27:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252C2C7E;
        Tue, 29 Nov 2022 00:27:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B391B615C4;
        Tue, 29 Nov 2022 08:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BC7C433C1;
        Tue, 29 Nov 2022 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669710454;
        bh=y/5hESTvCXXt3FFC5hUnZVtYCrTzsXmagMcpdIr/W48=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=J6Sp8yD9Gv/groWHhkCO0GMEtgsXdNCDrbhcfjS5SIyww+HTSJePeqpPNH/Sfv12t
         NVBrvR/ThejYzL3uvVn9L/BMoDvvBiBx41LjT3L78RoVxdAs1sDRVeh0MYL2sk3ZJD
         ONC+pZDT3LjpqI8IvPWIV0ktbmyCZy9LkEL/9l+RaQ8WlB6ga/lKG8YpAJKGFrXRI1
         Yte+pY20Jys6Ag/GM5DuYoNTRZOv8/ToSzBFCT0H6pOi3smXjDT3AWxbTQNY7j3Fcw
         dec+pfE3kaTaswz6oCrW0u9PkmzFlrvw5a+5BuClZOx+HtauvUeMTICel2DPIhTFel
         I7UGTLqsMjZAw==
Message-ID: <f21021f6-3b00-148e-89ad-24d5bb2a8a7f@kernel.org>
Date:   Tue, 29 Nov 2022 09:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V3 2/3] tracing/osnoise: Add preempt/irq disable options
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <cover.1669409262.git.bristot@kernel.org>
 <03d4a8522792fa3a51920c79f8a5074933a2fcb3.1669409262.git.bristot@kernel.org>
 <20221128153919.33c008d1@gandalf.local.home>
Content-Language: en-US
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <20221128153919.33c008d1@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/28/22 21:39, Steven Rostedt wrote:
> On Fri, 25 Nov 2022 22:20:23 +0100
> Daniel Bristot de Oliveira <bristot@kernel.org> wrote:
> 
>> @@ -1308,6 +1315,8 @@ static void notify_new_max_latency(u64 latency)
>>   */
>>  static int run_osnoise(void)
>>  {
>> +	bool preempt_disable = test_bit(OSN_PREEMPT_DISABLE, &osnoise_options);
>> +	bool irq_disable = test_bit(OSN_IRQ_DISABLE, &osnoise_options);
> 	bool irq_disable = test_bit(OSN_IRQ_DISABLE, &osnoise_options);
> 	bool preempt_disable = IS_ENABLED(CONFIG_PREEMPT) &&
> 			!irq_disable && test_bit(OSN_PREEMPT_DISABLE, &osnoise_options);
> 


Ooops, you are right. I will fix this, and the doc as well, in the v4.

Thanks
-- Daniel
