Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD51E7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 14:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753175AbeDROta (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 10:49:30 -0400
Received: from mailout.easymail.ca ([64.68.200.34]:37448 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753158AbeDROt2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 10:49:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by mailout.easymail.ca (Postfix) with ESMTP id 373002150A;
        Wed, 18 Apr 2018 14:49:27 +0000 (UTC)
Received: from mailout.easymail.ca ([127.0.0.1])
        by localhost (emo02-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5Tkers1ZICTe; Wed, 18 Apr 2018 14:49:27 +0000 (UTC)
Received: from [192.168.1.87] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailout.easymail.ca (Postfix) with ESMTPSA id 48549212D9;
        Wed, 18 Apr 2018 14:49:17 +0000 (UTC)
Subject: Re: [PATCH] doc: dev-tools: kselftest.rst: update contributing new
 tests
To:     Anders Roxell <anders.roxell@linaro.org>, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Shuah Khan <shuahkh@osg.samsung.com>
References: <20180417084631.11242-1-anders.roxell@linaro.org>
From:   Shuah Khan <shuah@kernel.org>
Message-ID: <cbea46f8-7d30-8298-b830-c6f2a4453101@kernel.org>
Date:   Wed, 18 Apr 2018 08:48:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180417084631.11242-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/17/2018 02:46 AM, Anders Roxell wrote:
> Add a description that the kernel headers should be used as far as it is
> possible and then the system headers.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  Documentation/dev-tools/kselftest.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index e80850eefe13..27f08d6ba91c 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -151,6 +151,9 @@ Contributing new tests (details)
>     TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
>     test.
>  
> + * First use the headers inside the kernel, and then the system headers. The
> +   internal headers should be the primary focus to be able to find regressions.

Clarifying the location of the headers might be helpful. This description uses
different terminology to describe kernel headers.

"First use the headers inside the kernel sources and/or git reo" would make this
clear. Instead of "internal headers" headers for the kernel release as opposed
to headers installed by the distro on the system would make a clear distinction.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
