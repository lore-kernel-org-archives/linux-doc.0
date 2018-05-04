Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD22F7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 01:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751287AbeEDBKM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 21:10:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52092 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751190AbeEDBKK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 21:10:10 -0400
Received: from 2.general.tyhicks.us.vpn ([10.172.64.53] helo=sec.ubuntu-ci)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <tyhicks@canonical.com>)
        id 1fEPDi-0008Hm-5R; Fri, 04 May 2018 01:09:10 +0000
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
Subject: [PATCH v3 0/4] Better integrate seccomp logging and auditing
Date:   Fri,  4 May 2018 01:08:11 +0000
Message-Id: <1525396095-27737-1-git-send-email-tyhicks@canonical.com>
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
non-audited processes. It also emits an audit record, if auditing is enabled,
when the kernel.seccomp.actions_logged sysctl is written to so that there's a
paper trail when entire actions are quieted.

Changes in v3:
* Patch 3
  - Never drop a field when emitting the audit record
  - Use the value "?" for the actions field when an error occurred while
    writing to the sysctl
  - Use the value "?" for the actions and/or old-actions fields when a failure
    to translate actions to names
  - Use the value "(none)" for the actions and/or old-actions fields when no
    actions are specified
    + This is possible when writing an empty string to the sysctl
  - Update the commit message to note the new values and give an example of
    when an empty string is written
* Patch 4
  - Adjust the control flow of seccomp_log() to exit early if nothing should be
    logged

Changes in v2:
* Patch 2
  - New patch, allowing for a configurable separator between action names
* Patch 3
  - The value of the actions field in the audit record now uses a comma instead
    of a space
  - The value of the actions field in the audit record is no longer enclosed in
    quotes
  - audit_log_start() is called with the current processes' audit_context in
    audit_seccomp_actions_logged()
  - audit_seccomp_actions_logged() no longer records the pid, uid, auid, tty,
    ses, task context, comm, or executable path
  - The new and old value of seccomp_actions_logged is recorded in the
    AUDIT_CONFIG_CHANGE record
  - The value of the "res" field in the CONFIG_CHANGE audit record is corrected
    (1 indicates success, 0 failure)
  - Updated patch 3's commit message to reflect the updated audit record format
    in the examples
* Patch 4
  - A function comment for audit_seccomp() was added to explain, among other
    things, that event filtering is performed in seccomp_log()

Tyler

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
