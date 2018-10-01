Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C90707D088
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 19:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbeJBCjI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Oct 2018 22:39:08 -0400
Received: from namei.org ([65.99.196.166]:34586 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726238AbeJBCjI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Oct 2018 22:39:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id w91JxWDB015138;
        Mon, 1 Oct 2018 19:59:32 GMT
Date:   Tue, 2 Oct 2018 05:59:32 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Kees Cook <keescook@chromium.org>
cc:     "Serge E. Hallyn" <serge@hallyn.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Paul Moore <paul@paul-moore.com>,
        linux-security-module@vger.kernel.org,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH security-next v3 05/29] LSM: Convert from initcall to
 struct lsm_info
In-Reply-To: <20180925001832.18322-6-keescook@chromium.org>
Message-ID: <alpine.LRH.2.21.1810020559060.14406@namei.org>
References: <20180925001832.18322-1-keescook@chromium.org> <20180925001832.18322-6-keescook@chromium.org>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 24 Sep 2018, Kees Cook wrote:

> In preparation for doing more interesting LSM init probing, this converts
> the existing initcall system into an explicit call into a function pointer
> from a section-collected struct lsm_info array.
> 
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: linux-security-module@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>


Reviewed-by: James Morris <james.morris@microsoft.com>


-- 
James Morris
<jmorris@namei.org>

