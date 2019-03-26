Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E49177D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Mar 2019 14:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731471AbfCZOxx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Mar 2019 10:53:53 -0400
Received: from ms.lwn.net ([45.79.88.28]:49514 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729440AbfCZOxw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Mar 2019 10:53:52 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D242D60C;
        Tue, 26 Mar 2019 14:53:51 +0000 (UTC)
Date:   Tue, 26 Mar 2019 08:53:50 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Denis Efremov <efremov@ispras.ru>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Eric Paris <eparis@parisplace.org>,
        John Johansen <john.johansen@canonical.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Paul Moore <paul@paul-moore.com>,
        Kentaro Takeda <takedakn@nttdata.co.jp>,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] LSM documentation update
Message-ID: <20190326085350.4de2c68d@lwn.net>
In-Reply-To: <f89f1335-a76a-b364-d426-b0fe3423ad0a@ispras.ru>
References: <cover.1551213058.git.efremov@ispras.ru>
        <f89f1335-a76a-b364-d426-b0fe3423ad0a@ispras.ru>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 26 Mar 2019 15:38:21 +0100
Denis Efremov <efremov@ispras.ru> wrote:

> Is there something more I could do so that these changes are accepted?
> At least this patchset fixes the documentation format for better html
> generation.

I had assumed that this would go through the security tree, but can
certainly pick it up if that works better.

jon
