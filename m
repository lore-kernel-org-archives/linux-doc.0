Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66F7D7DE79
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 May 2018 15:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755501AbeEAPS7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 May 2018 11:18:59 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34964 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755236AbeEAPS6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 May 2018 11:18:58 -0400
Received: by mail-lf0-f66.google.com with SMTP id y72-v6so2939191lfd.2
        for <linux-doc@vger.kernel.org>; Tue, 01 May 2018 08:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1CowC9n/ZCdykYQj2xTuwdAXTJs4SMQT+rN5WWz4Mf0=;
        b=NlmwZ5FLzLrJtRtjXao4HsACyn1ru7cXK4/jAp9BSBLkzuaHRsw946pXV0jhCYYBRR
         2d30ekw/xhnQUe4EyTCSRXeW+VxWmcpCTr+9k5WCa5i411Cf2lKX3Px8kUpmMmyNHvlh
         Kc7WcCvtfSXgI9L80RdP7lVO7EO9rpmEgxJv0ayGKEtSXU/1BCf4zd/CS7haK++S+dpD
         Q3kiZP/qwwqzjmx30MUA2JxSnnvnw7KqbEkR0O6f5o9ijCLc3rgRrZic3gFvUkBd8mfV
         +8vHT0RcbtrQQ2MJ11356i5o+VyM+Puhihaqq/0o3F1rv4HU1b+KDk6MlXwoyCJDdLRs
         uAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=1CowC9n/ZCdykYQj2xTuwdAXTJs4SMQT+rN5WWz4Mf0=;
        b=GGJcm22U9Q5zSFgk9EnntxmCm1kMKe36PhEMj+mYu0hreShp1RhpRZHYt5qdQNySMk
         7V3qk25u3qUhOmCXTIatZXpZPnzmpuDGrOLAVqutfdKk+LkFSEJ0LrCYxo3kzRtTL1Fe
         W/EQP9Ew2gUOevzsYuHF9HsKRlkaUGCoZ0tFbq4SxLc4oUN6Ui/gGj32iDGlvY4I4xub
         /I0zYinjmnCMU1dcGGd4oELQTQ90BVQY6OA3+ecW8L5bWk4Qwo0lP0Q/CzRMHfIixIVO
         is+MEcDOshJ4NeLSSmYvuCSc4gKBnOy989zwjI3/c6O4eBF3wz67f0t6D4isI/WWFZsF
         E54Q==
X-Gm-Message-State: ALQs6tAxhMMt2C5R1jomRhNjXF8FjiMbSp0k2uroix/NMc55KUiwNpGd
        0CwMwM3Dp0KXAKPhLUxsKRqJU3Ybo2fn+JdvpKAE
X-Google-Smtp-Source: AB8JxZrnzFM8NFNlkN+uof0y2Mqndiy3CBzvMRy5smOBBubJ8NqxQlZz/hirlykW7xHT5mmuZgD1FpQCvrQPoqT+7as=
X-Received: by 2002:a2e:c41:: with SMTP id o1-v6mr10664564ljd.87.1525187936455;
 Tue, 01 May 2018 08:18:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c78f:0:0:0:0:0 with HTTP; Tue, 1 May 2018 08:18:55 -0700 (PDT)
X-Originating-IP: [108.20.156.165]
In-Reply-To: <1524856562-22566-3-git-send-email-tyhicks@canonical.com>
References: <1524856562-22566-1-git-send-email-tyhicks@canonical.com> <1524856562-22566-3-git-send-email-tyhicks@canonical.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 1 May 2018 11:18:55 -0400
Message-ID: <CAHC9VhTwrKG2hySCrZaVwHgqyekZXDofkJy9_jCa-CxFgCVUGQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] seccomp: Audit attempts to modify the actions_logged sysctl
To:     Tyler Hicks <tyhicks@canonical.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Eric Paris <eparis@redhat.com>,
        Steve Grubb <sgrubb@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-audit@redhat.com,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 27, 2018 at 3:16 PM, Tyler Hicks <tyhicks@canonical.com> wrote:
> The decision to log a seccomp action will always be subject to the
> value of the kernel.seccomp.actions_logged sysctl, even for processes
> that are being inspected via the audit subsystem, in an upcoming patch.
> Therefore, we need to emit an audit record on attempts at writing to the
> actions_logged sysctl when auditing is enabled.
>
> This patch updates the write handler for the actions_logged sysctl to
> emit an audit record on attempts to write to the sysctl. Successful
> writes to the sysctl will result in a record that includes a normalized
> list of logged actions in the "actions" field and a "res" field equal to
> 0. Unsuccessful writes to the sysctl will result in a record that
> doesn't include the "actions" field and has a "res" field equal to 1.
>
> Not all unsuccessful writes to the sysctl are audited. For example, an
> audit record will not be emitted if an unprivileged process attempts to
> open the sysctl file for reading since that access control check is not
> part of the sysctl's write handler.
>
> Below are some example audit records when writing various strings to the
> actions_logged sysctl.
>
> Writing "not-a-real-action" emits:
>
>  type=CONFIG_CHANGE msg=audit(1524600971.363:119): pid=1651 uid=0
>  auid=1000 tty=pts8 ses=1 comm="tee" exe="/usr/bin/tee"
>  op=seccomp-logging res=1
>
> Writing "kill_process kill_thread errno trace log" emits:
>
>  type=CONFIG_CHANGE msg=audit(1524601023.982:131): pid=1658 uid=0
>  auid=1000 tty=pts8 ses=1 comm="tee" exe="/usr/bin/tee"
>  op=seccomp-logging actions="kill_process kill_thread errno trace log"
>  res=0

I've got some additional comments regarding the fields in the code
below, but it would be good to hear Steve comment on the "actions"
field since his userspace tools are extremely picky about what they
will accept.  It looks like you are treating the actions as an
untrusted string, which is good, so I suspect you are okay, but still
...

> Writing the string "log log errno trace kill_process kill_thread", which
> is unordered and contains the log action twice, results in the same
> value as the previous example for the actions field:
>
>  type=CONFIG_CHANGE msg=audit(1524601204.365:152): pid=1704 uid=0
>  auid=1000 tty=pts8 ses=1 comm="tee" exe="/usr/bin/tee"
>  op=seccomp-logging actions="kill_process kill_thread errno trace log"
>  res=0
>
> No audit records are generated when reading the actions_logged sysctl.
>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
> ---
>  include/linux/audit.h |  3 +++
>  kernel/auditsc.c      | 37 +++++++++++++++++++++++++++++++++++++
>  kernel/seccomp.c      | 43 ++++++++++++++++++++++++++++++++++---------
>  3 files changed, 74 insertions(+), 9 deletions(-)

...

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 75d5b03..b311d7d 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -233,6 +233,7 @@ extern void __audit_inode_child(struct inode *parent,
>                                 const struct dentry *dentry,
>                                 const unsigned char type);
>  extern void __audit_seccomp(unsigned long syscall, long signr, int code);
> +extern void audit_seccomp_actions_logged(const char *names, int res);
>  extern void __audit_ptrace(struct task_struct *t);
>
>  static inline bool audit_dummy_context(void)
> @@ -502,6 +503,8 @@ static inline void __audit_seccomp(unsigned long syscall, long signr, int code)
>  { }
>  static inline void audit_seccomp(unsigned long syscall, long signr, int code)
>  { }
> +static inline void audit_seccomp_actions_logged(const char *names, int res)
> +{ }
>  static inline int auditsc_get_stamp(struct audit_context *ctx,
>                               struct timespec64 *t, unsigned int *serial)
>  {
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4e0a4ac..3496238 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2478,6 +2478,43 @@ void __audit_seccomp(unsigned long syscall, long signr, int code)
>         audit_log_end(ab);
>  }
>
> +void audit_seccomp_actions_logged(const char *names, int res)
> +{
> +       struct tty_struct *tty;
> +       const struct cred *cred;
> +       struct audit_buffer *ab;
> +       char comm[sizeof(current->comm)];
> +
> +       if (!audit_enabled)
> +               return;
> +
> +       ab = audit_log_start(NULL, GFP_KERNEL, AUDIT_CONFIG_CHANGE);
> +       if (unlikely(!ab))
> +               return;

Instead of NULL, let's pass current->audit_context to
audit_log_start().  Yes, most of the AUDIT_CONFIG_CHANGE users pass
NULL but all of that is going to need to change because of 1) the
audit container ID work and 2) it makes sense to connect records that
are related.  Let's do it right the first time here :)

> +       cred = current_cred();
> +       tty = audit_get_tty(current);
> +       audit_log_format(ab, "pid=%d uid=%u auid=%u tty=%s ses=%u",
> +                        task_tgid_nr(current),
> +                        from_kuid(&init_user_ns, cred->uid),
> +                        from_kuid(&init_user_ns,
> +                        audit_get_loginuid(current)),
> +                        tty ? tty_name(tty) : "(none)",
> +                        audit_get_sessionid(current));
> +       audit_put_tty(tty);
> +       audit_log_task_context(ab);
> +       audit_log_format(ab, " comm=");
> +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> +       audit_log_d_path_exe(ab, current->mm);
> +       audit_log_format(ab, " op=seccomp-logging");
> +       if (names)
> +               audit_log_format(ab, " actions=\"%s\"", names);
> +
> +       audit_log_format(ab, " res=%d", res);
> +       audit_log_end(ab);

One of the benefits of using current->audit_context is that we get a
lot of this info from the associated SYSCALL record (assuming the
admin isn't filtering that, e.g. Fedora defaults).  We can safely drop
most everything except for the "op" and "actions" fields.

Steve might also want an "old-actions" field, but I'll let him speak to that.

-- 
paul moore
www.paul-moore.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
