Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6718B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 06:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754024AbeEHGJi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 02:09:38 -0400
Received: from mail-lf0-f48.google.com ([209.85.215.48]:37148 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753991AbeEHGJg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 02:09:36 -0400
Received: by mail-lf0-f48.google.com with SMTP id r2-v6so7929542lff.4
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 23:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=+4CWQNlIerEJVg4Oghz1CSYPfG4pBIF1JrT3zi3jIQg=;
        b=1Y4xoVL6ZL+YQdnhpFxf8gYaQEiSrTRG9rfc+Y7AtSmcJ1d+SrgnbovjQAaHnoSWQH
         hXv0k/OoXG0SmjuclU2rqnuyiYeIxmcsF/qLSXCcoZM296gGAgSFRHrXTU1eCKNcMG9s
         3fpKZafd9JBKItrQvJr6Hc3MSNRLs6EKpg0uu8eds+9BpfSVUPxd66E/4ly7XZnESffA
         9Uf4d1cIiFHPrEyDltQtOBhiCpKCWwUrUACf1bzUf8sOazCxXjyTuO50ovfC/lGKVwAE
         otoYlyAEr+x88oAW2ZB78d65BlJ31h82ytJ9k5Mb+1u9BxbYad1yR874PEtAv7pOtthM
         HJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=+4CWQNlIerEJVg4Oghz1CSYPfG4pBIF1JrT3zi3jIQg=;
        b=BpnLMvBgd/otSJK764Qice1ktVEFgBeXqY5H0tIsZbLBFxKEz2wr1Nu1QgInppOHUD
         GxC7rmA58xXZYxaT2PkeFXf+s4Rs7lNcLY7Bsn0BmWNfFI5P7puxjfDwh9YXRBRlhhzn
         pWDllFA2/R1xExr9HSh532uFND9gZAdlUV2uNXmKsV66YvACEWTUVrCtYzi2CW4DglCx
         rb5pWWXI2fyNZBm/r+JItNiT6J27tJoIwu8B/GekS+U6bgumTeDcU6JSqzCiflyf0eF2
         O+WOhzECHN/c9Q5D3PlEc/7QRN3UmY5dhcqpVHYmO3QySTC0OE2OjCAMlKpbyiV8yg7k
         KAiw==
X-Gm-Message-State: ALKqPwcWmec9zlvoBa351zOHm+EFt226rFX08h7CEVpnyaKnSoXs56Wo
        cog4U3UTCOo2FIGo1sPvPYRfABB0LBsIQPRiU4hB
X-Google-Smtp-Source: AB8JxZoqPyNro5ia6jfp5vBtml9j8ovaqZg5wM3uA7/85WqtkdSZKivGsKN24xg/e37amLwPQ+do+X96uyeQ4kN+QPM=
X-Received: by 2002:a19:10e1:: with SMTP id 94-v6mr4699508lfq.145.1525759774121;
 Mon, 07 May 2018 23:09:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:a947:0:0:0:0:0 with HTTP; Mon, 7 May 2018 23:09:33 -0700 (PDT)
X-Originating-IP: [172.3.143.147]
In-Reply-To: <CAGXu5jLZ5MRrQzg0zOvLbmnq_sJe3EA_VN6S=xwRmzgHLTzCeA@mail.gmail.com>
References: <1525396095-27737-1-git-send-email-tyhicks@canonical.com>
 <CAHC9VhQb46F0q4bbum9NMqi-spuDHaVDG7xSPDmOsWDP0RZ47g@mail.gmail.com> <CAGXu5jLZ5MRrQzg0zOvLbmnq_sJe3EA_VN6S=xwRmzgHLTzCeA@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 8 May 2018 02:09:33 -0400
Message-ID: <CAHC9VhSijj0TGaR7f_fM1OwpF73fjanJrkBwiF1j4n47DLnrYQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Better integrate seccomp logging and auditing
To:     Kees Cook <keescook@chromium.org>,
        Tyler Hicks <tyhicks@canonical.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
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

On Sun, May 6, 2018 at 7:36 PM, Kees Cook <keescook@chromium.org> wrote:
> On Sun, May 6, 2018 at 2:31 PM, Paul Moore <paul@paul-moore.com> wrote:
>> On Thu, May 3, 2018 at 9:08 PM, Tyler Hicks <tyhicks@canonical.com> wrote:
>>> Seccomp received improved logging controls in v4.14. Applications can opt into
>>> logging of "handled" actions (SECCOMP_RET_TRAP, SECCOMP_RET_TRACE,
>>> SECCOMP_RET_ERRNO) using the SECCOMP_FILTER_FLAG_LOG bit when loading filters.
>>> They can also debug filter matching with the new SECCOMP_RET_LOG action.
>>> Administrators can prevent specific actions from being logged using the
>>> kernel.seccomp.actions_logged sysctl.
>>>
>>> However, one corner case intentionally wasn't addressed in those v4.14 changes.
>>> When a process is being inspected by the audit subsystem, seccomp's decision
>>> making for logging ignores the new controls and unconditionally logs every
>>> action taken except for SECCOMP_RET_ALLOW. This isn't particularly useful since
>>> many existing applications don't intend to log handled actions due to them
>>> occurring very frequently. This amount of logging fills the audit logs without
>>> providing many benefits now that application authors have fine grained controls
>>> at their disposal.
>>>
>>> This patch set aligns the seccomp logging behavior for both audited and
>>> non-audited processes. It also emits an audit record, if auditing is enabled,
>>> when the kernel.seccomp.actions_logged sysctl is written to so that there's a
>>> paper trail when entire actions are quieted.
>>>
>>> Changes in v3:
>>> * Patch 3
>>>   - Never drop a field when emitting the audit record
>>>   - Use the value "?" for the actions field when an error occurred while
>>>     writing to the sysctl
>>>   - Use the value "?" for the actions and/or old-actions fields when a failure
>>>     to translate actions to names
>>>   - Use the value "(none)" for the actions and/or old-actions fields when no
>>>     actions are specified
>>>     + This is possible when writing an empty string to the sysctl
>>>   - Update the commit message to note the new values and give an example of
>>>     when an empty string is written
>>> * Patch 4
>>>   - Adjust the control flow of seccomp_log() to exit early if nothing should be
>>>     logged
>>>
>>> Changes in v2:
>>> * Patch 2
>>>   - New patch, allowing for a configurable separator between action names
>>> * Patch 3
>>>   - The value of the actions field in the audit record now uses a comma instead
>>>     of a space
>>>   - The value of the actions field in the audit record is no longer enclosed in
>>>     quotes
>>>   - audit_log_start() is called with the current processes' audit_context in
>>>     audit_seccomp_actions_logged()
>>>   - audit_seccomp_actions_logged() no longer records the pid, uid, auid, tty,
>>>     ses, task context, comm, or executable path
>>>   - The new and old value of seccomp_actions_logged is recorded in the
>>>     AUDIT_CONFIG_CHANGE record
>>>   - The value of the "res" field in the CONFIG_CHANGE audit record is corrected
>>>     (1 indicates success, 0 failure)
>>>   - Updated patch 3's commit message to reflect the updated audit record format
>>>     in the examples
>>> * Patch 4
>>>   - A function comment for audit_seccomp() was added to explain, among other
>>>     things, that event filtering is performed in seccomp_log()
>>
>> Kees, are you still okay with v3?  Also, are you okay with these
>> patches going in via the audit tree, or would you prefer to take them
>> via seccomp?  I've got a slight preference for the audit tree myself,
>> but as I said before, as long as it hits Linus' tree I'm happy.
>
> Yup, it looks good. I have no tree preference, so you win! :) Please
> consider the whole series:
>
> Acked-by: Kees Cook <keescook@chromium.org>

Merged into audit/next, thanks guys.

-- 
paul moore
www.paul-moore.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
