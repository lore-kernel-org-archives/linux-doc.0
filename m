Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20B207DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 22:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932453AbeD0W4m (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 18:56:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:55266 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932373AbeD0W4l (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 18:56:41 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2B6264B7;
        Fri, 27 Apr 2018 22:56:41 +0000 (UTC)
Date:   Fri, 27 Apr 2018 16:56:40 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     shuah@kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] doc: dev-tools: kselftest.rst: update contributing
 new tests
Message-ID: <20180427165640.437f3b8e@lwn.net>
In-Reply-To: <20180419102825.2990-1-anders.roxell@linaro.org>
References: <20180417084631.11242-1-anders.roxell@linaro.org>
        <20180419102825.2990-1-anders.roxell@linaro.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 19 Apr 2018 12:28:25 +0200
Anders Roxell <anders.roxell@linaro.org> wrote:

> Add a description that the kernel headers should be used as far as it is
> possible and then the system headers.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
