Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 683B57DE74
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 May 2018 23:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751877AbeEFXgw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 May 2018 19:36:52 -0400
Received: from mail-ua0-f196.google.com ([209.85.217.196]:35365 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751864AbeEFXgu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 May 2018 19:36:50 -0400
Received: by mail-ua0-f196.google.com with SMTP id a2so16825952uak.2
        for <linux-doc@vger.kernel.org>; Sun, 06 May 2018 16:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=3g24nUFfMMJvYWdgTZcKYAZO2lxxIdQtPVBAe3/7A6M=;
        b=X1T8gVA9EDI+kiRf456ZhCxzsgRWn9JO+VIeS69PEDvVvkLvPHpx6KlzwLXGgJmaVx
         gzaDY06GI+kGQfEDSn7IKgWVIHDgS7DdZzURRbovowg1zkLJ9zWuitO97ddCaSOrxV+b
         8siLOnEofV7dkyNlXLSJVo8PPfEI2BLmWtcb04ga0e31k4Y9fxJhEjfxgYvRqVwUBGXF
         Ex1GCNNQ7p8anSm/ibsv60PSEG8dew3gDXjglsqwu8khKC4fFYVb8mwz/hnJqByZGjJ+
         WtUXKcrkRptzl9gWZFUPQz/hwnad9taEqEDMJVEdYOYPFUTNfHwJ06Y0tbl6S5cYx5zD
         DLDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=3g24nUFfMMJvYWdgTZcKYAZO2lxxIdQtPVBAe3/7A6M=;
        b=X+L7yOtAGfmMhVPDx838A3qCVXY/eIqfsrhzci5skOyPpTnuwOlWiSgh0GK7PzwtP5
         kL5dJY1VH10TmcpD6YDybof9dSo9MwQbwCCq9/b6m2qI0qVKAtyfyJRXSyDX1EatjxFv
         IPAc07b94jTXFKAmuCYmcAwF1GGFU7/25x/3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=3g24nUFfMMJvYWdgTZcKYAZO2lxxIdQtPVBAe3/7A6M=;
        b=cRpM45j3uDr/53bKnAAzU+UVkYwWUGnvLVvXACGbJBzAIVR3ncq277WPzK4OfM4Q/e
         HIaj5J7LjCILB/821k3f3Dag9IcJgCK8FS0PrAQz5gUR5aT3mOwdZDvRoQr+e1Fg9I7M
         rjPuVEdXkKF1iJT/yBnXnBkp/1cHdRcXs+JiUvgOL4y1NB8PSKF2k9VXCDBlxLnybzef
         UIuSFJbHKA+lOAvv3iqjW+4fQJVKORDmQo06jRAgpEfX5tH/sgJ6iGH3CFHEYlGtRx/A
         Vj15wBN7EoSPGwnbafCiPAiEvEQCnInp3xQba3Gy6CyaIvY/eFnA9wue2giHohwFyB2l
         JONQ==
X-Gm-Message-State: ALQs6tBTcfSjQk8UkRMjBHy0t8B8qyTNtullEMJ+yGnaUMFirB764lyc
        i09EjiKPx7EXNaM3GkiG8evIgbpZUYNgBmYer+q+Ig==
X-Google-Smtp-Source: AB8JxZrIEUfv3DdVuEYxoBS+EH7R2x4Rfp7WEjjmwYvmXxCTLhWHKxZqTA1KdZFTvUis12uuPXycyKmQ1E6qM2um7/8=
X-Received: by 10.159.40.35 with SMTP id c32mr32102753uac.193.1525649809591;
 Sun, 06 May 2018 16:36:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.11.209 with HTTP; Sun, 6 May 2018 16:36:48 -0700 (PDT)
In-Reply-To: <CAHC9VhQb46F0q4bbum9NMqi-spuDHaVDG7xSPDmOsWDP0RZ47g@mail.gmail.com>
References: <1525396095-27737-1-git-send-email-tyhicks@canonical.com> <CAHC9VhQb46F0q4bbum9NMqi-spuDHaVDG7xSPDmOsWDP0RZ47g@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Sun, 6 May 2018 16:36:48 -0700
X-Google-Sender-Auth: z478aClRDNeZoRkqrdo54EPi8qE
Message-ID: <CAGXu5jLZ5MRrQzg0zOvLbmnq_sJe3EA_VN6S=xwRmzgHLTzCeA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Better integrate seccomp logging and auditing
To:     Paul Moore <paul@paul-moore.com>
Cc:     Tyler Hicks <tyhicks@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Eric Paris <eparis@redhat.com>,
        Steve Grubb <sgrubb@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Audit <linux-audit@redhat.com>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 6, 2018 at 2:31 PM, Paul Moore <paul@paul-moore.com> wrote:
> On Thu, May 3, 2018 at 9:08 PM, Tyler Hicks <tyhicks@canonical.com> wrote:
>> Seccomp received improved logging controls in v4.14. Applications can opt into
>> logging of "handled" actions (SECCOMP_RET_TRAP, SECCOMP_RET_TRACE,
>> SECCOMP_RET_ERRNO) using the SECCOMP_FILTER_FLAG_LOG bit when loading filters.
>> They can also debug filter matching with the new SECCOMP_RET_LOG action.
>> Administrators can prevent specific actions from being logged using the
>> kernel.seccomp.actions_logged sysctl.
>>
>> However, one corner case intentionally wasn't addressed in those v4.14 changes.
>> When a process is being inspected by the audit subsystem, seccomp's decision
>> making for logging ignores the new controls and unconditionally logs every
>> action taken except for SECCOMP_RET_ALLOW. This isn't particularly useful since
>> many existing applications don't intend to log handled actions due to them
>> occurring very frequently. This amount of logging fills the audit logs without
>> providing many benefits now that application authors have fine grained controls
>> at their disposal.
>>
>> This patch set aligns the seccomp logging behavior for both audited and
>> non-audited processes. It also emits an audit record, if auditing is enabled,
>> when the kernel.seccomp.actions_logged sysctl is written to so that there's a
>> paper trail when entire actions are quieted.
>>
>> Changes in v3:
>> * Patch 3
>>   - Never drop a field when emitting the audit record
>>   - Use the value "?" for the actions field when an error occurred while
>>     writing to the sysctl
>>   - Use the value "?" for the actions and/or old-actions fields when a failure
>>     to translate actions to names
>>   - Use the value "(none)" for the actions and/or old-actions fields when no
>>     actions are specified
>>     + This is possible when writing an empty string to the sysctl
>>   - Update the commit message to note the new values and give an example of
>>     when an empty string is written
>> * Patch 4
>>   - Adjust the control flow of seccomp_log() to exit early if nothing should be
>>     logged
>>
>> Changes in v2:
>> * Patch 2
>>   - New patch, allowing for a configurable separator between action names
>> * Patch 3
>>   - The value of the actions field in the audit record now uses a comma instead
>>     of a space
>>   - The value of the actions field in the audit record is no longer enclosed in
>>     quotes
>>   - audit_log_start() is called with the current processes' audit_context in
>>     audit_seccomp_actions_logged()
>>   - audit_seccomp_actions_logged() no longer records the pid, uid, auid, tty,
>>     ses, task context, comm, or executable path
>>   - The new and old value of seccomp_actions_logged is recorded in the
>>     AUDIT_CONFIG_CHANGE record
>>   - The value of the "res" field in the CONFIG_CHANGE audit record is corrected
>>     (1 indicates success, 0 failure)
>>   - Updated patch 3's commit message to reflect the updated audit record format
>>     in the examples
>> * Patch 4
>>   - A function comment for audit_seccomp() was added to explain, among other
>>     things, that event filtering is performed in seccomp_log()
>
> Kees, are you still okay with v3?  Also, are you okay with these
> patches going in via the audit tree, or would you prefer to take them
> via seccomp?  I've got a slight preference for the audit tree myself,
> but as I said before, as long as it hits Linus' tree I'm happy.

Yup, it looks good. I have no tree preference, so you win! :) Please
consider the whole series:

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
