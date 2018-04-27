Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CACCE7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 19:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758835AbeD0TRL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 15:17:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33599 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758062AbeD0TRI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 15:17:08 -0400
Received: from 2.general.tyhicks.us.vpn ([10.172.64.53] helo=sec.l.tihix.com)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1fC8ri-0004h6-CO; Fri, 27 Apr 2018 19:17:06 +0000
From:   Tyler Hicks <tyhicks@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@redhat.com>,
        Steve Grubb <sgrubb@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-audit@redhat.com,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 0/3] Better integrate seccomp logging and auditing
Date:   Fri, 27 Apr 2018 19:15:59 +0000
Message-Id: <1524856562-22566-1-git-send-email-tyhicks@canonical.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Seccomp received improved logging controls in v4.14. Applications can opt into
logging of "handled" actions (SECCOMP_RET_TRAP, SECCOMP_RET_TRACE,
SECCOMP_RET_ERRNO) using the SECCOMP_FILTER_FLAG_LOG bit when loading filters.
They can also debug filter matching with the new SECCOMP_RET_LOG action.
Administrators can prevent specific actions from being logged using the
kernel.seccomp.actions_logged sysctl.

However, one corner case intentionally wasn't addressed in those v4.14 changes.
When a process is being inspected by the audit subsystem, seccomp's decision
making for logging ignores the new controls and unconditionally logs every
action taken except for SECCOMP_RET_ALLOW. This isn't particularly useful since
many existing applications don't intend to log handled actions due to them
occurring very frequently. This amount of logging fills the audit logs without
providing many benefits now that application authors have fine grained controls
at their disposal.

This patch set aligns the seccomp logging behavior for both audited and
unaudited processes. It also emits an audit record, if auditing is enabled,
when the kernel.seccomp.actions_logged sysctl is written to so that there's a
paper trail when entire actions are quieted.

Tyler

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
