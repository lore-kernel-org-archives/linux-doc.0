Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B910D7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 13:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730900AbfAKNzZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Jan 2019 08:55:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46360 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729744AbfAKNzZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Jan 2019 08:55:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0E72A80F9F;
        Fri, 11 Jan 2019 13:55:25 +0000 (UTC)
Received: from flask (unknown [10.40.205.161])
        by smtp.corp.redhat.com (Postfix) with SMTP id 22E2260C7F;
        Fri, 11 Jan 2019 13:55:18 +0000 (UTC)
Received: by flask (sSMTP sendmail emulation); Fri, 11 Jan 2019 14:55:18 +0100
Date:   Fri, 11 Jan 2019 14:55:18 +0100
From:   Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
To:     Christophe de Dinechin <dinechin@redhat.com>
Cc:     kvm@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Eric Skultety <eskultet@redhat.com>, trivial@kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/virtual/kvm: Update URL for AMD SEV API
 specification
Message-ID: <20190111135517.GI14852@flask>
References: <20190107175238.3026-1-dinechin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107175238.3026-1-dinechin@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 11 Jan 2019 13:55:25 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2019-01-07 18:52+0100, Christophe de Dinechin:
> The URL of [api-spec] in Documentation/virtual/kvm/amd-memory-encryption.rst
> is no longer valid, replaced space with underscore.
> 
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---

Applied, thanks.
