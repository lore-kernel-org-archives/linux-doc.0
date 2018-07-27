Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A60ED7D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Jul 2018 05:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbeG0GqS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Jul 2018 02:46:18 -0400
Received: from www62.your-server.de ([213.133.104.62]:39576 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbeG0GqR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jul 2018 02:46:17 -0400
Received: from [78.46.172.2] (helo=sslproxy05.your-server.de)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1fivGN-0002mg-Kz; Fri, 27 Jul 2018 07:26:03 +0200
Received: from [99.0.85.34] (helo=localhost.localdomain)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <daniel@iogearbox.net>)
        id 1fivGN-0007Up-AU; Fri, 27 Jul 2018 07:26:03 +0200
Subject: Re: [PATCH v2 0/4] docs: bpf: Fix RST conversion
To:     "Tobin C. Harding" <me@tobin.cc>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Alexei Starovoitov <ast@kernel.org>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180726050305.2147-1-me@tobin.cc>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <4313ac87-420f-529f-4edb-0efa60c28e0b@iogearbox.net>
Date:   Fri, 27 Jul 2018 07:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180726050305.2147-1-me@tobin.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.0/24786/Fri Jul 27 02:41:39 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/26/2018 07:03 AM, Tobin C. Harding wrote:
> Hi Dave,
> 
> I'm sending v2 of this to you instead of to Jon.  Rationale: BPF is to
> do with networking anyways and there is a broken link that requires
> conversion of Documentation/networking/filter.txt to fix and that will
> go to you.  FTR there are no merge conflicts between this set and the
> other set I just sent (either can be applied on top of the other)
> 
>    [PATCH v2 net-next 0/3] docs: net: Convert netdev-FAQ to RST
> 
> 
> Recently BPF docs were converted to RST format.  A couple of things were
> missed.
> 
>  - Use 'index.rst' instead of 'README.rst'.  Although README.rst will
>    work just fine it is more typical to keep the subdirectory indices
>    in a file called 'index.rst'.
> 
>  - Integrate files Documentation/bpf/*.rst into build system using
>    toctree in Documentation/bpf/index.rst
> 
>  - Include bpf/index in top level toctree so bpf is indexed in the main
>    kernel docs.
> 
>  - Make anal change to heading format (inline with rest of Documentation/).
> 
> 
> thanks,
> Tobin.

Applied to bpf-next, thanks Tobin!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
