Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F15C7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 20:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751161AbeECUSa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 16:18:30 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36116 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750962AbeECUS3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 16:18:29 -0400
Received: by mail-lf0-f66.google.com with SMTP id w8-v6so27864754lfe.3
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ORiQ3ChPfRRIxH5esGvk4EB/87KiDhaQhhP9KRviRd0=;
        b=XfFaBCvE+qk4LQxPaZl4ba9p0lvD3AjpjjhxCNbswtBf6z/kylQ2LjjGrSut634WO7
         rIFiH2oURjMYTNdar/sTbwCopLxHP7WCLWgyYb2nuKIhRmg+E5QDSnP/aTD40+CW+30L
         wpYqinLD59rfnfAOrvElXE1vyObWvbpLx2OeiEsoYoSynrSjqJW8CPprWbruVLFbTKPM
         bi1UJQjT8aZCEO7ylNU3HoFZUh2xSHjR7uFeivh93X2gKipy8Y7aYaGBYJlVq4wS5J1a
         dyq+vJY8LFPy1PSWNQ4F7FEub8oiIZuZm93h4UsUCmyCmftX6W5Ron85cspYVvBzzwtw
         62WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ORiQ3ChPfRRIxH5esGvk4EB/87KiDhaQhhP9KRviRd0=;
        b=RopCJNjjjCNdaneoY0+3SLxR1RG0P0gO0mllBfzYoB4uJiQkHjzH2+Zg9djJcsYI8y
         C9oCPfNe/Z1j6Vkb4RNIq5R5QFYKsDbs70EN9l4bNIT2/Xd6k0pRuXoBY4AYBLQ7Xt2J
         PJPjwDamkt88gIMJyP6GbKA+HfF7OA9f2IysdPZTtKgGEN2P4JJ6zcF9mVmO8NgWyoiJ
         CFS/HM+UPyFyk/6mZR+0en4dMcY/mzNYAg3P/a1ovBqyuerzE+SXUgrGtdMBRpm0g5Vn
         pzvWaWStPs5/zQH+gr7MKrEY9hcxR47FDbNmhR/3FcDufHa471VCi74jalQ+7a9DgnNK
         J8Tw==
X-Gm-Message-State: ALQs6tCVw0cukxntBU88cEJu23egusZi2qXYg9FEjdrsR6sNjYwBRKyn
        gYpKlCVx/BkmT9Vyld0WPG/ycqv9qSvlqMaEt/8C
X-Google-Smtp-Source: AB8JxZo/ifMKU5Pzm+8F9n8lZ41SbRZ8oohEUXs+jk22UYbccGwyvNbG7QLroj5+PR8mtMx6j4b45F9fYshok7dARjw=
X-Received: by 2002:a2e:8518:: with SMTP id j24-v6mr17981451lji.12.1525378707507;
 Thu, 03 May 2018 13:18:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c78f:0:0:0:0:0 with HTTP; Thu, 3 May 2018 13:18:26 -0700 (PDT)
X-Originating-IP: [108.20.156.165]
In-Reply-To: <2193990.pCRMhOm3SD@x2>
References: <1525276400-7161-1-git-send-email-tyhicks@canonical.com>
 <1525276400-7161-4-git-send-email-tyhicks@canonical.com> <2193990.pCRMhOm3SD@x2>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 3 May 2018 16:18:26 -0400
Message-ID: <CAHC9VhS69VD9+L=oN-uLZqvo7BCg+HOvEuT4mnv8Wy7qo2MLMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] seccomp: Audit attempts to modify the
 actions_logged sysctl
To:     Steve Grubb <sgrubb@redhat.com>
Cc:     Tyler Hicks <tyhicks@canonical.com>, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Eric Paris <eparis@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-audit@redhat.com,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 2, 2018 at 2:18 PM, Steve Grubb <sgrubb@redhat.com> wrote:
> On Wednesday, May 2, 2018 11:53:19 AM EDT Tyler Hicks wrote:
>> The decision to log a seccomp action will always be subject to the
>> value of the kernel.seccomp.actions_logged sysctl, even for processes
>> that are being inspected via the audit subsystem, in an upcoming patch.
>> Therefore, we need to emit an audit record on attempts at writing to the
>> actions_logged sysctl when auditing is enabled.
>>
>> This patch updates the write handler for the actions_logged sysctl to
>> emit an audit record on attempts to write to the sysctl. Successful
>> writes to the sysctl will result in a record that includes a normalized
>> list of logged actions in the "actions" field and a "res" field equal to
>> 0. Unsuccessful writes to the sysctl will result in a record that
>> doesn't include the "actions" field and has a "res" field equal to 1.
>>
>> Not all unsuccessful writes to the sysctl are audited. For example, an
>> audit record will not be emitted if an unprivileged process attempts to
>> open the sysctl file for reading since that access control check is not
>> part of the sysctl's write handler.
>>
>> Below are some example audit records when writing various strings to the
>> actions_logged sysctl.
>>
>> Writing "not-a-real-action", when the kernel.seccomp.actions_logged
>> sysctl previously was "kill_process kill_thread trap errno trace log",
>> emits this audit record:
>>
>>  type=CONFIG_CHANGE msg=audit(1525275273.537:130): op=seccomp-logging
>>  old-actions=kill_process,kill_thread,trap,errno,trace,log res=0
>>
>> If you then write "kill_process kill_thread errno trace log", this audit
>> record is emitted:
>>
>>  type=CONFIG_CHANGE msg=audit(1525275310.208:136): op=seccomp-logging
>>  actions=kill_process,kill_thread,errno,trace,log
>>  old-actions=kill_process,kill_thread,trap,errno,trace,log res=1
>>
>> If you then write the string "log log errno trace kill_process
>> kill_thread", which is unordered and contains the log action twice,
>> it results in the same actions value as the previous record:
>>
>>  type=CONFIG_CHANGE msg=audit(1525275325.613:142): op=seccomp-logging
>>  actions=kill_process,kill_thread,errno,trace,log
>>  old-actions=kill_process,kill_thread,errno,trace,log res=1
>>
>> No audit records are generated when reading the actions_logged sysctl.
>
> ACK for the format of the records.

I just wanted to clarify the record format with you Steve ... the
"actions" and "old-actions" fields may not be included in the record
in cases where there is an error building the action value string, are
you okay with that or would you prefer the fields to always be
included but with a "?" for the value?

-- 
paul moore
www.paul-moore.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
