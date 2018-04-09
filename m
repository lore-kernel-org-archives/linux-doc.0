Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 49AD87DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 09:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751967AbeDIJ1C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 05:27:02 -0400
Received: from smtp2.goneo.de ([85.220.129.33]:44704 "EHLO smtp2.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751844AbeDIJ1B (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 05:27:01 -0400
X-Greylist: delayed 330 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Apr 2018 05:27:01 EDT
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id 528B423F0DC;
        Mon,  9 Apr 2018 11:26:59 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fNLu6HS4FMkv; Mon,  9 Apr 2018 11:26:52 +0200 (CEST)
Received: from [192.168.1.112] (unknown [91.248.68.255])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 5A7A223F6E0;
        Mon,  9 Apr 2018 11:26:52 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
From:   Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
Date:   Mon, 9 Apr 2018 11:26:51 +0200
Cc:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-man@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <762ADA4F-40A3-4640-91A9-2969D5B7C6D2@darmarit.de>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
To:     Daniel Borkmann <daniel@iogearbox.net>,
        Jonathan Corbet <corbet@lwn.net>
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/06/2018 01:11 PM, Quentin Monnet wrote:
>> eBPF helper functions can be called from within eBPF programs to perform
>> a variety of tasks that would be otherwise hard or impossible to do with
>> eBPF itself. There is a growing number of such helper functions in the
>> kernel, but documentation is scarce. The main user space header file
>> does contain a short commented description of most helpers, but it is
>> somewhat outdated and not complete. It is more a "cheat sheet" than a
>> real documentation accessible to new eBPF developers.
>> 
>> This commit attempts to improve the situation by replacing the existing
>> overview for the helpers with a more developed description. Furthermore,
>> a Python script is added to generate a manual page for eBPF helpers. The
>> workflow is the following, and requires the rst2man utility:
>> 
>>    $ ./scripts/bpf_helpers_doc.py \
>>            --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>>    $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>>    $ man /tmp/bpf-helpers.7
>> 
>> The objective is to keep all documentation related to the helpers in a
>> single place,

Do we really need another kernel-doc parser?

  ./scripts/kernel-doc include/uapi/linux/bpf.h

should already do the job (producing .rst). For more infos, take a look at

  https://www.kernel.org/doc/html/latest/doc-guide/index.html

-- Markus --

PS: sorry for re-post, first post was HTML which is not accepted by ML :o
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
