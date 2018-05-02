Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EAEA17E278
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 02:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750823AbeEBCSr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 May 2018 22:18:47 -0400
Received: from out01.mta.xmission.com ([166.70.13.231]:42923 "EHLO
        out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750766AbeEBCSr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 May 2018 22:18:47 -0400
Received: from in02.mta.xmission.com ([166.70.13.52])
        by out01.mta.xmission.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.87)
        (envelope-from <ebiederm@xmission.com>)
        id 1fDhLc-0005XR-16; Tue, 01 May 2018 20:18:24 -0600
Received: from [97.119.174.25] (helo=x220.xmission.com)
        by in02.mta.xmission.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.87)
        (envelope-from <ebiederm@xmission.com>)
        id 1fDhLa-0007Dr-Th; Tue, 01 May 2018 20:18:23 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>
References: <1524862838-8247-1-git-send-email-longman@redhat.com>
Date:   Tue, 01 May 2018 21:18:17 -0500
In-Reply-To: <1524862838-8247-1-git-send-email-longman@redhat.com> (Waiman
        Long's message of "Fri, 27 Apr 2018 17:00:30 -0400")
Message-ID: <87po2ex0k6.fsf@xmission.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1fDhLa-0007Dr-Th;;;mid=<87po2ex0k6.fsf@xmission.com>;;;hst=in02.mta.xmission.com;;;ip=97.119.174.25;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX194fR8D97k8KGopeMkPAD/2gD+zliWQSiU=
X-SA-Exim-Connect-IP: 97.119.174.25
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH v6 0/8] ipc: Clamp *mni to the real IPCMNI limit & increase that limit
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> The sysctl parameters msgmni, shmmni and semmni have an inherent limit
> of IPC_MNI (32k). However, users may not be aware of that because they
> can write a value much higher than that without getting any error or
> notification. Reading the parameters back will show the newly written
> values which are not real.
>
> Enforcing the limit by failing sysctl parameter write, however, may
> cause regressions if existing user setup scripts set those parameters
> above 32k as those scripts will now fail in this case.

I have a serious problem with this approach.  Have you made any effort
to identify any code that sets these values above 32k?  Have you looked
to see if these applications actually care if you return an error when
a value is set too large?

Right now this seems like a lot of work to avoid breaking applications
and or users that may or may not exist.  If you can find something that
will care sure.  We need to avoid breaking userspace and causing
regressions.  However as this stands it looks you are making maintenance
of the kernel more difficult to avoid having to look to see if there are
monsters under the bed.



Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
