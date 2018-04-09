Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8816A7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 10:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752024AbeDIKw1 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 06:52:27 -0400
Received: from smtp3-1.goneo.de ([85.220.129.38]:55172 "EHLO smtp3-1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751662AbeDIKw0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 06:52:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 8CB5B23F85D;
        Mon,  9 Apr 2018 12:52:23 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NzuhuiiesMdG; Mon,  9 Apr 2018 12:52:23 +0200 (CEST)
Received: from [192.168.1.112] (unknown [91.248.68.255])
        by smtp3.goneo.de (Postfix) with ESMTPSA id A7F4023F82F;
        Mon,  9 Apr 2018 12:52:22 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
From:   Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <b2fbd09d-7ba2-9884-e18d-eac586af1665@iogearbox.net>
Date:   Mon, 9 Apr 2018 12:52:21 +0200
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-man@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <550CD0C6-10B5-4C8C-9C1E-70AA61ABDC34@darmarit.de>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <AB89F6E2-DE8A-4259-B361-BE96AD32E84E@darmarit.de>
 <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
 <C6491E01-3FC2-4AC4-8190-7B17CFAC01AD@darmarit.de>
 <b2fbd09d-7ba2-9884-e18d-eac586af1665@iogearbox.net>
To:     Daniel Borkmann <daniel@iogearbox.net>
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 09.04.2018 um 12:08 schrieb Daniel Borkmann <daniel@iogearbox.net>:
[...]

>> May I completely misunderstood you, so correct my if I'am wrong:
>> 
>> - ./scripts/bpf_helpers_doc.py : produces reST markup from C-comments
>> - ./scripts/kerne-doc          : produces reST markup from C-comments
>> 
>> IMO: both are doing the same job, so why not using kernel-doc?
> 
> They are not really doing the same job, in bpf_helpers_doc.py case you don't
> want the whole header rendered, but just a fraction of it, that is, the
> single big comment which describes all BPF helper functions that a BPF
> program developer has available to use in user space - aka the entries in
> the __BPF_FUNC_MAPPER() macro;


> I also doubt the latter would actually qualify
> in kdoc context as some sort of a function description.

latter .. ah, OK .. thanks for clarifying. 

-- Markus --

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
