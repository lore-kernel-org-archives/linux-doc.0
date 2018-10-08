Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B7917D082
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Oct 2018 08:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbeJHPcv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Oct 2018 11:32:51 -0400
Received: from www62.your-server.de ([213.133.104.62]:59998 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbeJHPcv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Oct 2018 11:32:51 -0400
Received: from [78.46.172.2] (helo=sslproxy05.your-server.de)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1g9Qns-0007Hn-89; Mon, 08 Oct 2018 10:22:12 +0200
Received: from [62.203.87.61] (helo=linux.home)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <daniel@iogearbox.net>)
        id 1g9Qns-0009hk-1x; Mon, 08 Oct 2018 10:22:12 +0200
Subject: Re: [PATCH] bpf, doc: Document Jump X addressing mode
To:     Arthur Fabre <arthur@arthurfabre.com>,
        Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20181007084519.27445-1-arthur@arthurfabre.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <b4246d37-26c0-36c7-908d-e01b20c23028@iogearbox.net>
Date:   Mon, 8 Oct 2018 10:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20181007084519.27445-1-arthur@arthurfabre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.1/25017/Mon Oct  8 06:49:45 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/07/2018 10:45 AM, Arthur Fabre wrote:
> bpf_asm and the other classic BPF tools support jump conditions
> comparing register A to register X, in addition to comparing register A
> with constant K.
> Only the latter was documented in filter.txt, add two new addressing
> modes that describe the former.
> 
> Signed-off-by: Arthur Fabre <arthur@arthurfabre.com>

Applied to bpf-next, thanks!
