Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A6FA7E279
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 19:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752952AbeDXTgB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 15:36:01 -0400
Received: from mailout.easymail.ca ([64.68.200.34]:55167 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752075AbeDXTf5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 15:35:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by mailout.easymail.ca (Postfix) with ESMTP id 2C83B41776;
        Tue, 24 Apr 2018 19:35:56 +0000 (UTC)
Received: from mailout.easymail.ca ([127.0.0.1])
        by localhost (emo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5EpIUlmm-iUE; Tue, 24 Apr 2018 19:35:56 +0000 (UTC)
Received: from [192.168.1.87] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailout.easymail.ca (Postfix) with ESMTPSA id C6F304157F;
        Tue, 24 Apr 2018 19:35:48 +0000 (UTC)
Subject: Re: [PATCH v2] doc: dev-tools: kselftest.rst: update contributing new
 tests
To:     Anders Roxell <anders.roxell@linaro.org>, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>
References: <20180417084631.11242-1-anders.roxell@linaro.org>
 <20180419102825.2990-1-anders.roxell@linaro.org>
From:   Shuah Khan <shuah@kernel.org>
Message-ID: <d65f770f-e871-53e4-828f-4ba94df90ae3@kernel.org>
Date:   Tue, 24 Apr 2018 13:35:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419102825.2990-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/19/2018 04:28 AM, Anders Roxell wrote:
> Add a description that the kernel headers should be used as far as it is
> possible and then the system headers.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  Documentation/dev-tools/kselftest.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index e80850eefe13..3bf371a938d0 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -151,6 +151,11 @@ Contributing new tests (details)
>     TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
>     test.
>  
> + * First use the headers inside the kernel source and/or git repo, and then the
> +   system headers.  Headers for the kernel release as opposed to headers
> +   installed by the distro on the system should be the primary focus to be able
> +   to find regressions.
> +
>  Test Harness
>  ============
>  
> 

Here is my reviewed by for this to go through documentation tree.

Reviewed-by: Shuah Khan (Samsung OSG) <shuah@kernel.org>

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
