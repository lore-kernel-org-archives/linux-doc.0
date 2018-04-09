Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 81FAC7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 09:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751929AbeDIJff (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 05:35:35 -0400
Received: from smtp3-1.goneo.de ([85.220.129.38]:42826 "EHLO smtp3-1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751456AbeDIJfd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 05:35:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 86AE223F36D;
        Mon,  9 Apr 2018 11:35:31 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GihysDHAnHeW; Mon,  9 Apr 2018 11:35:26 +0200 (CEST)
Received: from [192.168.1.112] (unknown [91.248.68.255])
        by smtp3.goneo.de (Postfix) with ESMTPSA id C6F0523F006;
        Mon,  9 Apr 2018 11:35:25 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
From:   Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
Date:   Mon, 9 Apr 2018 11:35:25 +0200
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-man@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C6491E01-3FC2-4AC4-8190-7B17CFAC01AD@darmarit.de>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <AB89F6E2-DE8A-4259-B361-BE96AD32E84E@darmarit.de>
 <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
To:     Daniel Borkmann <daniel@iogearbox.net>
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 09.04.2018 um 11:25 schrieb Daniel Borkmann <daniel@iogearbox.net>:
> 
> On 04/09/2018 11:21 AM, Markus Heiser wrote:
> [...]
>> Do we really need another kernel-doc parser?
>> 
>>  ./scripts/kernel-doc include/uapi/linux/bpf.h
>> 
>> should already do the job (producing .rst). For more infos, take a look at
> 
> This has absolutely zero to do with kernel-doc, but rather producing
> a description of BPF helper function that are later assembled into an
> actual man-page that BPF program developers (user space) can use.

May I completely misunderstood you, so correct my if I'am wrong:

- ./scripts/bpf_helpers_doc.py : produces reST markup from C-comments
- ./scripts/kerne-doc          : produces reST markup from C-comments

IMO: both are doing the same job, so why not using kernel-doc?

-- Markus --


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
