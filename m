Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A81B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 09:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932384AbeD0JIh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 05:08:37 -0400
Received: from www62.your-server.de ([213.133.104.62]:44266 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932282AbeD0JIh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 05:08:37 -0400
Received: from [62.202.221.10] (helo=linux.home)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA:256)
        (Exim 4.85_2)
        (envelope-from <daniel@iogearbox.net>)
        id 1fBzMo-00086B-Mo; Fri, 27 Apr 2018 11:08:34 +0200
Subject: Re: [PATCH bpf-next v4 00/10] bpf: document eBPF helpers and add a
 script to generate man page
To:     Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org
Cc:     netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180425171701.11048-1-quentin.monnet@netronome.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <37a883ea-a714-6a6e-58df-d67fa9aa106c@iogearbox.net>
Date:   Fri, 27 Apr 2018 11:08:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180425171701.11048-1-quentin.monnet@netronome.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.99.3/24517/Fri Apr 27 06:24:46 2018)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/25/2018 07:16 PM, Quentin Monnet wrote:
> eBPF helper functions can be called from within eBPF programs to perform
> a variety of tasks that would be otherwise hard or impossible to do with
> eBPF itself. There is a growing number of such helper functions in the
> kernel, but documentation is scarce. The main user space header file
> does contain a short commented description of most helpers, but it is
> somewhat outdated and not complete. It is more a "cheat sheet" than a
> real documentation accessible to new eBPF developers.
> 
> This commit attempts to improve the situation by replacing the existing
> overview for the helpers with a more developed description. Furthermore,
> a Python script is added to generate a manual page for eBPF helpers. The
> workflow is the following, and requires the rst2man utility:
> 
>     $ ./scripts/bpf_helpers_doc.py \
>             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>     $ man /tmp/bpf-helpers.7
> 
> The objective is to keep all documentation related to the helpers in a
> single place, and to be able to generate from here a manual page that
> could be packaged in the man-pages repository and shipped with most
> distributions.
> 
> Additionally, parsing the prototypes of the helper functions could
> hopefully be reused, with a different Printer object, to generate
> header files needed in some eBPF-related projects.
> 
> Regarding the description of each helper, it comprises several items:
> 
> - The function prototype.
> - A description of the function and of its arguments (except for a
>   couple of cases, when there are no arguments and the return value
>   makes the function usage really obvious).
> - A description of return values (if not void).
> 
> Additional items such as the list of compatible eBPF program and map
> types for each helper, Linux kernel version that introduced the helper,
> GPL-only restriction, and commit hash could be added in the future, but
> it was decided on the mailing list to leave them aside for now.
> 
> For several helpers, descriptions are inspired (at times, nearly copied)
> from the commit logs introducing them in the kernel--Many thanks to
> their respective authors! Some sentences were also adapted from comments
> from the reviews, thanks to the reviewers as well. Descriptions were
> completed as much as possible, the objective being to have something easily
> accessible even for people just starting with eBPF. There is probably a bit
> more work to do in this direction for some helpers.
[...]

Applied yesterday night to bpf-next (and now in net-next), thanks Quentin!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
