Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 454E07DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 09:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751845AbeDIJZZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 05:25:25 -0400
Received: from www62.your-server.de ([213.133.104.62]:49162 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751608AbeDIJZY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 05:25:24 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1f5T3B-0001Oy-6v; Mon, 09 Apr 2018 11:25:21 +0200
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
To:     Markus Heiser <markus.heiser@darmarit.de>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-man@vger.kernel.org
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <AB89F6E2-DE8A-4259-B361-BE96AD32E84E@darmarit.de>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
Date:   Mon, 9 Apr 2018 11:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <AB89F6E2-DE8A-4259-B361-BE96AD32E84E@darmarit.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.99.3/24463/Mon Apr  9 06:21:19 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/09/2018 11:21 AM, Markus Heiser wrote:
[...]
> Do we really need another kernel-doc parser?
> 
>   ./scripts/kernel-doc include/uapi/linux/bpf.h
> 
> should already do the job (producing .rst). For more infos, take a look at

This has absolutely zero to do with kernel-doc, but rather producing
a description of BPF helper function that are later assembled into an
actual man-page that BPF program developers (user space) can use.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
