Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 491FD7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Apr 2019 18:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfDSSoj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Apr 2019 14:44:39 -0400
Received: from ms.lwn.net ([45.79.88.28]:40164 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfDSSoj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:44:39 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9F13C2D0;
        Fri, 19 Apr 2019 18:44:38 +0000 (UTC)
Date:   Fri, 19 Apr 2019 12:44:37 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     shuah@kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
Message-ID: <20190419124437.628ec04c@lwn.net>
In-Reply-To: <20190417233403.29854-1-skhan@linuxfoundation.org>
References: <20190417233403.29854-1-skhan@linuxfoundation.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 17 Apr 2019 17:34:03 -0600
Shuah Khan <skhan@linuxfoundation.org> wrote:

> Fix KBUILD_OUTPUT usage instructions. The current documentation is
> incorrect. Update and fix outdated information about summary option.
> Add a reference to kselftest wiki for additional information on the
> framework and tips on writing new tests.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
> Changes since v1:
> -- Fixed the confusing language about output directory
> -- Updated outdated instructions on summary option.
> -- Regenerated patch with current email address.

I've applied this version, thanks.

jon
