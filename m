Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 184D97DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 21:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751272AbeEBVCG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 17:02:06 -0400
Received: from namei.org ([65.99.196.166]:59166 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751148AbeEBVCG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 May 2018 17:02:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id w42L1tPV030781;
        Wed, 2 May 2018 21:01:55 GMT
Date:   Thu, 3 May 2018 07:01:55 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Tyler Hicks <tyhicks@canonical.com>
cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@redhat.com>,
        Steve Grubb <sgrubb@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-audit@redhat.com,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] seccomp: Separate read and write code for
 actions_logged sysctl
In-Reply-To: <1525276400-7161-2-git-send-email-tyhicks@canonical.com>
Message-ID: <alpine.LRH.2.21.1805030701220.30206@namei.org>
References: <1525276400-7161-1-git-send-email-tyhicks@canonical.com> <1525276400-7161-2-git-send-email-tyhicks@canonical.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2 May 2018, Tyler Hicks wrote:

> Break the read and write paths of the kernel.seccomp.actions_logged
> sysctl into separate functions to maintain readability. An upcoming
> change will need to audit writes, but not reads, of this sysctl which
> would introduce too many conditional code paths on whether or not the
> 'write' parameter evaluates to true.
> 
> Signed-off-by: Tyler Hicks <tyhicks@canonical.com>

Reviewed-by: James Morris <james.morris@microsoft.com>

-- 
James Morris
<jmorris@namei.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
