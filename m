Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 96B407DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 20:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751176AbeECUmn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 16:42:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56886 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751103AbeECUmm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 May 2018 16:42:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7255A401DEAB;
        Thu,  3 May 2018 20:42:41 +0000 (UTC)
Received: from x2.localnet (ovpn-124-126.rdu2.redhat.com [10.10.124.126])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C23C02024CA1;
        Thu,  3 May 2018 20:42:40 +0000 (UTC)
From:   Steve Grubb <sgrubb@redhat.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Tyler Hicks <tyhicks@canonical.com>, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Eric Paris <eparis@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-audit@redhat.com,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] seccomp: Audit attempts to modify the actions_logged sysctl
Date:   Thu, 03 May 2018 16:42:40 -0400
Message-ID: <3241732.94y415NZZK@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhS69VD9+L=oN-uLZqvo7BCg+HOvEuT4mnv8Wy7qo2MLMA@mail.gmail.com>
References: <1525276400-7161-1-git-send-email-tyhicks@canonical.com> <2193990.pCRMhOm3SD@x2> <CAHC9VhS69VD9+L=oN-uLZqvo7BCg+HOvEuT4mnv8Wy7qo2MLMA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 03 May 2018 20:42:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 03 May 2018 20:42:41 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'sgrubb@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thursday, May 3, 2018 4:18:26 PM EDT Paul Moore wrote:
> On Wed, May 2, 2018 at 2:18 PM, Steve Grubb <sgrubb@redhat.com> wrote:
> > On Wednesday, May 2, 2018 11:53:19 AM EDT Tyler Hicks wrote:
> >> The decision to log a seccomp action will always be subject to the
> >> value of the kernel.seccomp.actions_logged sysctl, even for processes
> >> that are being inspected via the audit subsystem, in an upcoming patch.
> >> Therefore, we need to emit an audit record on attempts at writing to the
> >> actions_logged sysctl when auditing is enabled.
> >> 
> >> This patch updates the write handler for the actions_logged sysctl to
> >> emit an audit record on attempts to write to the sysctl. Successful
> >> writes to the sysctl will result in a record that includes a normalized
> >> list of logged actions in the "actions" field and a "res" field equal to
> >> 0. Unsuccessful writes to the sysctl will result in a record that
> >> doesn't include the "actions" field and has a "res" field equal to 1.
> >> 
> >> Not all unsuccessful writes to the sysctl are audited. For example, an
> >> audit record will not be emitted if an unprivileged process attempts to
> >> open the sysctl file for reading since that access control check is not
> >> part of the sysctl's write handler.
> >> 
> >> Below are some example audit records when writing various strings to the
> >> actions_logged sysctl.
> >> 
> >> Writing "not-a-real-action", when the kernel.seccomp.actions_logged
> >> sysctl previously was "kill_process kill_thread trap errno trace log",
> >> 
> >> emits this audit record:
> >>  type=CONFIG_CHANGE msg=audit(1525275273.537:130): op=seccomp-logging
> >>  old-actions=kill_process,kill_thread,trap,errno,trace,log res=0
> >> 
> >> If you then write "kill_process kill_thread errno trace log", this audit
> >> 
> >> record is emitted:
> >>  type=CONFIG_CHANGE msg=audit(1525275310.208:136): op=seccomp-logging
> >>  actions=kill_process,kill_thread,errno,trace,log
> >>  old-actions=kill_process,kill_thread,trap,errno,trace,log res=1
> >> 
> >> If you then write the string "log log errno trace kill_process
> >> kill_thread", which is unordered and contains the log action twice,
> >> 
> >> it results in the same actions value as the previous record:
> >>  type=CONFIG_CHANGE msg=audit(1525275325.613:142): op=seccomp-logging
> >>  actions=kill_process,kill_thread,errno,trace,log
> >>  old-actions=kill_process,kill_thread,errno,trace,log res=1
> >> 
> >> No audit records are generated when reading the actions_logged sysctl.
> > 
> > ACK for the format of the records.
> 
> I just wanted to clarify the record format with you Steve ... the
> "actions" and "old-actions" fields may not be included in the record
> in cases where there is an error building the action value string, are
> you okay with that or would you prefer the fields to always be
> included but with a "?" for the value?

A ? would be more in line with how other things are handled.

-Steve



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
