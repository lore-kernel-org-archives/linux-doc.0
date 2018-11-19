Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 785647D8AA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 22:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbeKTIst (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 03:48:49 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52317 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725722AbeKTIst (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Nov 2018 03:48:49 -0500
Received: by mail-wm1-f66.google.com with SMTP id r11-v6so278656wmb.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 14:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nwrloT6VSEy5ZMu8xnb8cKu3aahHSo2C8BbYfnfkQCk=;
        b=KYooxec6lesfDzTj07cQUI+70Y6ji5Z10EjC7+3vv3FoR/Q1AEew2QzLki1BzdIAkH
         VyYZ+WrxTW4udK5Lu9qP5+tI2ScBEH8v0pNWCbb0cCkT/LRnrdSBuQvrT4o9VkYpqo9y
         IgI9OoPfo2t9R8gcbU5QJs+uRcgD6sFQrelPC+HH58AvQ1gcVucnRpqlF1FQfJ4QcK3E
         ec0rWu2Knb8RVlJ/kqKdYwolZSHmAuqcUmvx3pFSiCtPV6MefPlUx4vXNqfNxv5xLeiz
         Tun1uwYC5zhrzc9SOj6Oc3E0rJUJhxOvOAF5EJdVLfgusKq2V9bNA1qIsnWGvFeIlrqA
         uv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwrloT6VSEy5ZMu8xnb8cKu3aahHSo2C8BbYfnfkQCk=;
        b=CmIbLb6LtMyrXBPQ2SV24b0L6Z1oeHuCyeOxNO9ctvn7iHOH/OZEp5NjxaNNLt7CUc
         GQaRzaJBAoxg0Gbcc+rmq0uAke/0KqpQ11QmQvpzimw7sX8D8hP3/C9jZ2Sz+966zFtG
         bX6pXdfyjDD+k5f1dXTtXTu+EgfheAOknaHspTUvnwlmSKgfz30mFF96/PwlZdEoES3v
         5IoJShmbN5mhkcWHib+YqIMuCwql6Ojb85oBzc+yig+B3lscJNhPhgUNbTw9QiREkR8W
         M4Md9YZVgGVp6qg3+QDViigLYuFIGLXLVJ7JfTY+/dE6/oIbA9vs5a5TkNCMUgFb77f/
         2nqQ==
X-Gm-Message-State: AA+aEWaZG4eoaYmhVwWdAGZf5uUl/s3McnwuwG6xfVKcpW4SDxjQLSx1
        A48oSE/nEayK8VQ719h+RdMWJXsz+T6q7WO4gB2Glg==
X-Google-Smtp-Source: AJdET5dbpspBFP+kyzMnOXlcymzEJJOjXE4vNI1NTk474aqFiiPjwiCr/dJE2bmZgTI873RFk7u+oOAcHNyZFLWabzM=
X-Received: by 2002:a1c:110b:: with SMTP id 11mr5855759wmr.83.1542666181214;
 Mon, 19 Nov 2018 14:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20181119214934.6174-1-yu-cheng.yu@intel.com> <20181119214934.6174-11-yu-cheng.yu@intel.com>
In-Reply-To: <20181119214934.6174-11-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Mon, 19 Nov 2018 14:22:50 -0800
Message-ID: <CALCETrWP20o62m_5mp_yCBFNMQ4YYV-kPKiytHObhvJs_bjFVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 10/11] x86/vsyscall/64: Add ENDBR64 to vsyscall
 entry points
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 1:55 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> From: "H.J. Lu" <hjl.tools@gmail.com>
>
> Add ENDBR64 to vsyscall entry points.
>
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>

Acked-by: Andy Lutomirski <luto@kernel.org>

although the scenarios where this matters will be extremely rare,
given that this code is mapped NX :)  Tools like 'pin' may care.

--Andy
