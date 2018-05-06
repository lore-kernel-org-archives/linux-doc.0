Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8384C7DE78
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 May 2018 21:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751871AbeEFVbo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 May 2018 17:31:44 -0400
Received: from mail-lf0-f52.google.com ([209.85.215.52]:43647 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751869AbeEFVbn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 May 2018 17:31:43 -0400
Received: by mail-lf0-f52.google.com with SMTP id g12-v6so37794691lfb.10
        for <linux-doc@vger.kernel.org>; Sun, 06 May 2018 14:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=k9mY/ZBIB6QmoFoLPlnEGiPCF65alw46fi3QoASJNwI=;
        b=RP1Ng1gQARlWgXAeom3jh9O5O9wtYNjA9mPsLbBTGsNVbF5jO3p4HdGjD24g4XHoJN
         Qunbrq1B39ykc7Phe6XPTbklmAIxNysKgQtRCo1R2zJBhgyPJv4406hcYqxvGakcmp8+
         VAtus/VWjoSVB8FDEDmSwyvix2Ef8/Pt5FQEXSavsyUrm3vdUztoYN6M927539qQ90u2
         mF6iaYJiW14lU5+qo60rHnO5QRu+GSfFLpQ578W7ek0SPwAv5jbk4IBuR4dqgGF+vYLp
         cG3fHeAJwD44RUppSk4CL6a+XeuXcyPfDA8ZM+bzCF+Ab7nc8Q1MzlNBl0F76N1rfXiW
         gdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=k9mY/ZBIB6QmoFoLPlnEGiPCF65alw46fi3QoASJNwI=;
        b=JTBsOYEHe5FuVV0XLBVT0YY/NaEIX74SU3W73Pqa8S0onnVMvNxEHiaUaKIEGBRbCv
         nFz/g8BMdt/3JY+U7MyXG/ZZVAwmzJOAOD1JKhUJvPzr+ysJO3e8LFOM8O447JxfE+HO
         oP3pc3D559KTdtXdHCULjeStqCWULHFsY9an5bor1fCo2wv+DJNkuqGwfkpMXxk9zjrD
         dfLMuSQWGjP2wRYiF9J6OrK1dLwHvOSNoDEoTsSIPsuTTb+3ymQ4SiAN87PWDRXtspsn
         1cHE+6NgYzWQ2IQ5otAruf09LvjgQcTug+53cR2hfUjbQ2Od8as454wqxbrXD1ErxbNp
         uqsw==
X-Gm-Message-State: ALQs6tBKjRyeB5FfRFVJklIfhLldcORZk5y3Cm3wGpap3vHGOBBQCDuZ
        TC4FAz6Ifaa+L3/m3vincVOjzGz8/UkCtb0yeXq2
X-Google-Smtp-Source: AB8JxZojsH637OXT/TCXFJXtAJ0eulPZZb9Yob9ys3kawYR26fna2ihNBOZCUPZ95vYTi/T7kUwDbd0ok3btVr/3Wys=
X-Received: by 2002:a19:f505:: with SMTP id j5-v6mr21504512lfb.12.1525642301386;
 Sun, 06 May 2018 14:31:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c78f:0:0:0:0:0 with HTTP; Sun, 6 May 2018 14:31:40 -0700 (PDT)
X-Originating-IP: [108.20.156.165]
In-Reply-To: <1525396095-27737-1-git-send-email-tyhicks@canonical.com>
References: <1525396095-27737-1-git-send-email-tyhicks@canonical.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sun, 6 May 2018 17:31:40 -0400
Message-ID: <CAHC9VhQb46F0q4bbum9NMqi-spuDHaVDG7xSPDmOsWDP0RZ47g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Better integrate seccomp logging and auditing
To:     Tyler Hicks <tyhicks@canonical.com>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
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

On Thu, May 3, 2018 at 9:08 PM, Tyler Hicks <tyhicks@canonical.com> wrote:
> Seccomp received improved logging controls in v4.14. Applications can opt into
> logging of "handled" actions (SECCOMP_RET_TRAP, SECCOMP_RET_TRACE,
> SECCOMP_RET_ERRNO) using the SECCOMP_FILTER_FLAG_LOG bit when loading filters.
> They can also debug filter matching with the new SECCOMP_RET_LOG action.
> Administrators can prevent specific actions from being logged using the
> kernel.seccomp.actions_logged sysctl.
>
> However, one corner case intentionally wasn't addressed in those v4.14 changes.
> When a process is being inspected by the audit subsystem, seccomp's decision
> making for logging ignores the new controls and unconditionally logs every
> action taken except for SECCOMP_RET_ALLOW. This isn't particularly useful since
> many existing applications don't intend to log handled actions due to them
> occurring very frequently. This amount of logging fills the audit logs without
> providing many benefits now that application authors have fine grained controls
> at their disposal.
>
> This patch set aligns the seccomp logging behavior for both audited and
> non-audited processes. It also emits an audit record, if auditing is enabled,
> when the kernel.seccomp.actions_logged sysctl is written to so that there's a
> paper trail when entire actions are quieted.
>
> Changes in v3:
> * Patch 3
>   - Never drop a field when emitting the audit record
>   - Use the value "?" for the actions field when an error occurred while
>     writing to the sysctl
>   - Use the value "?" for the actions and/or old-actions fields when a failure
>     to translate actions to names
>   - Use the value "(none)" for the actions and/or old-actions fields when no
>     actions are specified
>     + This is possible when writing an empty string to the sysctl
>   - Update the commit message to note the new values and give an example of
>     when an empty string is written
> * Patch 4
>   - Adjust the control flow of seccomp_log() to exit early if nothing should be
>     logged
>
> Changes in v2:
> * Patch 2
>   - New patch, allowing for a configurable separator between action names
> * Patch 3
>   - The value of the actions field in the audit record now uses a comma instead
>     of a space
>   - The value of the actions field in the audit record is no longer enclosed in
>     quotes
>   - audit_log_start() is called with the current processes' audit_context in
>     audit_seccomp_actions_logged()
>   - audit_seccomp_actions_logged() no longer records the pid, uid, auid, tty,
>     ses, task context, comm, or executable path
>   - The new and old value of seccomp_actions_logged is recorded in the
>     AUDIT_CONFIG_CHANGE record
>   - The value of the "res" field in the CONFIG_CHANGE audit record is corrected
>     (1 indicates success, 0 failure)
>   - Updated patch 3's commit message to reflect the updated audit record format
>     in the examples
> * Patch 4
>   - A function comment for audit_seccomp() was added to explain, among other
>     things, that event filtering is performed in seccomp_log()

Kees, are you still okay with v3?  Also, are you okay with these
patches going in via the audit tree, or would you prefer to take them
via seccomp?  I've got a slight preference for the audit tree myself,
but as I said before, as long as it hits Linus' tree I'm happy.

-- 
paul moore
www.paul-moore.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
